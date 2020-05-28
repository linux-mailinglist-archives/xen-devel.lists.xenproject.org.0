Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 563291E68A4
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 19:26:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeMIZ-0005TN-8g; Thu, 28 May 2020 17:26:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gT1p=7K=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jeMIX-0005TI-Rb
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 17:26:29 +0000
X-Inumbo-ID: 5d526a28-a108-11ea-a814-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d526a28-a108-11ea-a814-12813bfff9fa;
 Thu, 28 May 2020 17:26:29 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:54226
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jeMIT-000rLv-MP (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Thu, 28 May 2020 18:26:26 +0100
Subject: Re: [PATCH v2 02/14] x86/traps: Factor out extable_fixup() and make
 printing consistent
To: Jan Beulich <jbeulich@suse.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-3-andrew.cooper3@citrix.com>
 <9cb12ae3-ef09-3b81-caef-0b1d61426a42@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2d550f5d-6330-6adc-2865-f8421845957f@citrix.com>
Date: Thu, 28 May 2020 18:26:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9cb12ae3-ef09-3b81-caef-0b1d61426a42@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/05/2020 10:50, Jan Beulich wrote:
> On 27.05.2020 21:18, Andrew Cooper wrote:
>> UD faults never had any diagnostics printed, and the others were inconsistent.
>>
>> Don't use dprintk() because identifying traps.c is actively unhelpful in the
>> message, as it is the location of the fixup, not the fault.  Use the new
>> vec_name() infrastructure, rather than leaving raw numbers for the log.
>>
>>   (XEN) Running stub recovery selftests...
>>   (XEN) Fixup #UD[0000]: ffff82d07fffd040 [ffff82d07fffd040] -> ffff82d0403ac9d6
>>   (XEN) Fixup #GP[0000]: ffff82d07fffd041 [ffff82d07fffd041] -> ffff82d0403ac9d6
>>   (XEN) Fixup #SS[0000]: ffff82d07fffd040 [ffff82d07fffd040] -> ffff82d0403ac9d6
>>   (XEN) Fixup #BP[0000]: ffff82d07fffd041 [ffff82d07fffd041] -> ffff82d0403ac9d6
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> As before
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> albeit I realize I have one more suggestion:
>
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -772,10 +772,31 @@ static void do_reserved_trap(struct cpu_user_regs *regs)
>>            trapnr, vec_name(trapnr), regs->error_code);
>>  }
>>  
>> +static bool extable_fixup(struct cpu_user_regs *regs, bool print)
>> +{
>> +    unsigned long fixup = search_exception_table(regs);
>> +
>> +    if ( unlikely(fixup == 0) )
>> +        return false;
>> +
>> +    /*
>> +     * Don't use dprintk() because the __FILE__ reference is unhelpful.
>> +     * Can currently be triggered by guests.  Make sure we ratelimit.
>> +     */
>> +    if ( IS_ENABLED(CONFIG_DEBUG) && print )
> How about pulling the IS_ENABLED(CONFIG_DEBUG) into the call sites
> currently passing "true"?

That is an obfuscation, not an improvement, in code legibility.

It is however a transformation that the compiler does (as part of
dropping the print parameter entirely).

~Andrew


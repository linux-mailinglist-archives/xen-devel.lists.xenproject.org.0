Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4981B23CC20
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 18:26:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3MEw-0007KB-5P; Wed, 05 Aug 2020 16:26:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBnt=BP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k3MEu-0007K6-8e
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 16:26:04 +0000
X-Inumbo-ID: 75ac753c-4178-44db-b230-d12dbf8976e7
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75ac753c-4178-44db-b230-d12dbf8976e7;
 Wed, 05 Aug 2020 16:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596644763;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=xkJq30v5eX12PpbKZRUkUdv8sNBcmHMawcoz0s6EJgw=;
 b=QbIerY7wrQOhOqeFRcDHA8WWwrzkpc+hAFiUOwrpxDDl4+M25L5m7UW3
 hDjcQzVR4wMS6UvnYpW41E/celkle/ffxMGcOxnDefEbBGQ1w27zWFWOw
 b87szOJqRfhJtL38fmd0pxFQPkClwKpMhKtpPwMIFZB38hzSy04m8l/el k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ihCZq3+s5E+k/RSlmw/D4lYQLfyL2F0oK3snFL+sAjyEwpvXucv/VXs1V5HHqEBelmclWZHEWk
 cNDTPVQUrsYJ4CZq/xHGh99wjzvEAjIvQ1L9uiW2VcedMrVJDTNLCDeDAbBdRqmLtqzYDHtxed
 ezSSwPl5/QcBW0tshn9c+fb4wQWl72TDYgutY3cfEcCs5EzlrzkRiSzaPhgGJn/l6Gz3wb3Mjr
 4f2BLo68cDF2u/FsPVEPVfYk4JJK+TanQaWjpTRlwF5f3+OXG6gfh94XnEze/B12ic8/u9LkGV
 kjA=
X-SBRS: 3.7
X-MesageID: 23961699
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,438,1589256000"; d="scan'208";a="23961699"
Subject: Re: [PATCH] x86/tsc: Fix diagnostics for TSC frequency
To: Jan Beulich <jbeulich@suse.com>
References: <20200805141804.2585-1-andrew.cooper3@citrix.com>
 <3123eedc-252d-7e9e-a4af-6f8bfae82f41@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a94f7aac-3368-945d-118c-964600862076@citrix.com>
Date: Wed, 5 Aug 2020 17:25:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3123eedc-252d-7e9e-a4af-6f8bfae82f41@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On 05/08/2020 15:54, Jan Beulich wrote:
> On 05.08.2020 16:18, Andrew Cooper wrote:
>> A Gemini Lake platform prints:
>>
>>   (XEN) CPU0: TSC: 19200000MHz * 279 / 3 = 1785600000MHz
>>   (XEN) CPU0: 800..1800 MHz
>>
>> during boot.  The units on the first line are Hz, not MHz, so correct that and
>> add a space for clarity.
>>
>> Also, for the min/max line, use three dots instead of two and add more spaces
>> so that the line can't be mistaken for being a double decimal point typo.
>>
>> Boot now reads:
>>
>>   (XEN) CPU0: TSC: 19200000 Hz * 279 / 3 = 1785600000 Hz
>>   (XEN) CPU0: 800 ... 1800 MHz
>>
>> Extend these changes to the other TSC diagnostics.
> I'm happy to see the unit mistake fixed, but the choice of
> formatting was pretty deliberate when the code was introduced:
> As dense as possible without making things unreadable or
> ambiguous. (Considering "a double decimal point typo" looks
> like a joke to me, really.)

I literally thought it was a typo until I read the code.  So no - I'm
very much not joking.

Decimal points are extremely commonly seen with frequencies, and nothing
else in the log line gives any hint that it is range.

Despite being deliberate, it is overly dense and ambiguous as a consequence.

>> --- a/xen/arch/x86/cpu/intel.c
>> +++ b/xen/arch/x86/cpu/intel.c
>> @@ -396,14 +396,14 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
>>  
>>              val *= ebx;
>>              do_div(val, eax);
>> -            printk("CPU%u: TSC: %uMHz * %u / %u = %LuMHz\n",
>> +            printk("CPU%u: TSC: %u Hz * %u / %u = %Lu Hz\n",
>>                     smp_processor_id(), ecx, ebx, eax, val);
> For this one I wonder whether ecx wouldn't better be scaled down to
> kHz, and val down to MHz.

That depends on whether we will lose precision in the process.

In principle we can, given ecx's unit of Hz, so I'd be tempted to leave
it as is.

>
>>          }
>>          else if ( ecx | eax | ebx )
>>          {
>>              printk("CPU%u: TSC:", smp_processor_id());
>>              if ( ecx )
>> -                printk(" core: %uMHz", ecx);
>> +                printk(" core: %u MHz", ecx);
> This one now clearly wants to say Hz too, or (as above) scaling
> down to kHz.

Oops.  Will fix.

> With at least this last issue addressed
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

~Andrew


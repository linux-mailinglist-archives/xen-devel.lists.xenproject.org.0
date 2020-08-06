Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A629523D6C3
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 08:23:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3ZHs-0001jp-Pa; Thu, 06 Aug 2020 06:22:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3ZHr-0001jj-6R
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 06:21:59 +0000
X-Inumbo-ID: b8cecaba-46ce-4961-9d87-2d44d936eeea
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8cecaba-46ce-4961-9d87-2d44d936eeea;
 Thu, 06 Aug 2020 06:21:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C39F6ACB8;
 Thu,  6 Aug 2020 06:22:14 +0000 (UTC)
Subject: Re: [PATCH] x86/tsc: Fix diagnostics for TSC frequency
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200805141804.2585-1-andrew.cooper3@citrix.com>
 <3123eedc-252d-7e9e-a4af-6f8bfae82f41@suse.com>
 <a94f7aac-3368-945d-118c-964600862076@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a4e9db8-6a04-54b3-c73c-aca64a9a70e5@suse.com>
Date: Thu, 6 Aug 2020 08:21:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <a94f7aac-3368-945d-118c-964600862076@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 05.08.2020 18:25, Andrew Cooper wrote:
> On 05/08/2020 15:54, Jan Beulich wrote:
>> On 05.08.2020 16:18, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/cpu/intel.c
>>> +++ b/xen/arch/x86/cpu/intel.c
>>> @@ -396,14 +396,14 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
>>>  
>>>              val *= ebx;
>>>              do_div(val, eax);
>>> -            printk("CPU%u: TSC: %uMHz * %u / %u = %LuMHz\n",
>>> +            printk("CPU%u: TSC: %u Hz * %u / %u = %Lu Hz\n",
>>>                     smp_processor_id(), ecx, ebx, eax, val);
>> For this one I wonder whether ecx wouldn't better be scaled down to
>> kHz, and val down to MHz.
> 
> That depends on whether we will lose precision in the process.

I don't think losing the last three digits for the base clock and
the last six ones of the calculated value would do any harm at all.
All it would do (imo) is to make the numbers better readable (due
less counting, and hence less possible counting mistakes).

> In principle we can, given ecx's unit of Hz, so I'd be tempted to leave
> it as is.

Well, okay.

Jan


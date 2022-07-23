Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9F757EEDE
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jul 2022 12:48:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373681.605934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFCev-0005O3-QT; Sat, 23 Jul 2022 10:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373681.605934; Sat, 23 Jul 2022 10:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFCev-0005MB-My; Sat, 23 Jul 2022 10:46:57 +0000
Received: by outflank-mailman (input) for mailman id 373681;
 Sat, 23 Jul 2022 10:46:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0xKN=X4=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oFCet-0005M5-Gr
 for xen-devel@lists.xenproject.org; Sat, 23 Jul 2022 10:46:55 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c21ce76e-0a74-11ed-bd2d-47488cf2e6aa;
 Sat, 23 Jul 2022 12:46:52 +0200 (CEST)
Received: from [10.10.1.164] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 165857320800738.906841468846665;
 Sat, 23 Jul 2022 03:46:48 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c21ce76e-0a74-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1658573209; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LaSJkBUNQnBBBQEiDzs74O6YSCx2nKaNHd63Nv+hLFB8BEPIlNj58vooOp1BUDGjoTvgjIXiDSIgB1clTCSfwJnlU1wi8BQdPSJmDs8RFl1eVCO6mtD394XaaUK11YIHFo2u+l2l4wy5yh+5+TvijSwhUeTldu36OaxXD0jzCmI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1658573209; h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=DfnQwF38VcjhRW+hMYNYYelq1crc075oByVEd8ukSPc=; 
	b=QTJieFrk0RbKhRGO3FBFkWO3rwFdZieh+rKg7FMQsQB8znKes5UXBIqeLkhqemITS1pCQjGMy3dqMIU468EV0fV0xxAKaXq2qha2CDorN4fAwjAer0FxqSUXCCw3bMjx1MWo3G7OEuniENsPZXwpO2k4LxEkWAaobc4P/lUUXbE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658573209;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=DfnQwF38VcjhRW+hMYNYYelq1crc075oByVEd8ukSPc=;
	b=GwViLYnVsBROgzqOhgTTTq7uBH9CJocBSzVeCvwib9IECUq4qBkf+ltPAnCADZK0
	GrKcD68RBdzahx7Q3MLtBduRNIUazz0FJgP/P0JkCl34mY6+afywzgWkAPcyXbA/JY/
	o8QPEZK2EbESy2yZIZXRIrgmxhVsuVwW5mCFQeeg=
Message-ID: <83f6facb-8cfe-67f6-32d4-e32e3976fd1f@apertussolutions.com>
Date: Sat, 23 Jul 2022 06:45:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 10/18] x86: introduce the domain builder
Content-Language: en-US
To: "Smith, Jackson" <rsmith@RiversideResearch.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-11-dpsmith@apertussolutions.com>
 <BN0P110MB16425760D6D6991942DEE6DCCF8C9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <96cc29cf-5b31-eabd-3cca-eeaa7d7c58db@apertussolutions.com>
 <BN0P110MB1642483783653FB7A1D63547CF909@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <BN0P110MB1642483783653FB7A1D63547CF909@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/22/22 16:33, Smith, Jackson wrote:
>> -----Original Message-----
>> From: Daniel P. Smith <dpsmith@apertussolutions.com>
>>
>> On 7/18/22 09:59, Smith, Jackson wrote:
>>> Hi Daniel,
>>>
>>>> -----Original Message-----
>>>> Subject: [PATCH v1 10/18] x86: introduce the domain builder
>>>>
>>>> This commit introduces the domain builder configuration FDT parser
>>>> along with the domain builder core for domain creation. To enable
>>>> domain builder to be a cross architecture internal API, a new arch
>>>> domain creation call
>>> is
>>>> introduced for use by the domain builder.
>>>
>>>> diff --git a/xen/common/domain-builder/core.c
>>>
>>>> +void __init builder_init(struct boot_info *info) {
>>>> +    struct boot_domain *d = NULL;
>>>> +
>>>> +    info->builder = &builder;
>>>> +
>>>> +    if ( IS_ENABLED(CONFIG_BUILDER_FDT) )
>>>> +    {
>>>
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * No FDT config support or an FDT wasn't present, do an initial
>>>> +     * domain construction
>>>> +     */
>>>> +    printk("Domain Builder: falling back to initial domain build\n");
>>>> +    info->builder->nr_doms = 1;
>>>> +    d = &info->builder->domains[0];
>>>> +
>>>> +    d->mode = opt_dom0_pvh ? 0 : BUILD_MODE_PARAVIRTUALIZED;
>>>> +
>>>> +    d->kernel = &info->mods[0];
>>>> +    d->kernel->kind = BOOTMOD_KERNEL;
>>>> +
>>>> +    d->permissions = BUILD_PERMISSION_CONTROL |
>>>> BUILD_PERMISSION_HARDWARE;
>>>> +    d->functions = BUILD_FUNCTION_CONSOLE |
>>>> BUILD_FUNCTION_XENSTORE |
>>>> +                     BUILD_FUNCTION_INITIAL_DOM;
>>>> +
>>>> +    d->kernel->arch->headroom = bzimage_headroom(bootstrap_map(d-
>>>>> kernel),
>>>> +                                                   d->kernel->size);
>>>> +    bootstrap_map(NULL);
>>>> +
>>>> +    if ( d->kernel->string.len )
>>>> +        d->kernel->string.kind = BOOTSTR_CMDLINE; }
>>>
>>> Forgive me if I'm incorrect, but I believe there is an issue with this
>>> fallback logic for the case where no FDT was provided.
>>
>> IIUC, the issue at hand has to deal with patch #15.
>>
>>> If dom0_mem is not supplied to the xen cmd line, then d->meminfo is
>>> never initialized. (See dom0_compute_nr_pages/dom0_build.c:335)
>>> This was giving me trouble because bd->meminfo.mem_max.nr_pages was
>>> left at 0, effectivity clamping dom0 to 0 pages of ram.
>>>
> 
> I realize I never shared the exact panic message I was experiencing. Sorry about that.
> It's "Domain 0 allocation is too small for kernel image" on xen/arch/x86/pv/domain_builder.c:534

Yep, I ran into this one before and thought I had it addressed.

> I think you should be able to consistently reproduce what I'm seeing as long as these two conditions are met:
> - the dom0_mem cmdline option is _not_ set
> - no domain builder device tree is passed to xen (the fallback case I identified above)

Ack

>>> I'm not sure what the best solution is but one (easy) possibility is
>>> just initializing meminfo to the dom0 defaults near the end of this function:
>>>          d->meminfo.mem_size = dom0_size;
>>>          d->meminfo.mem_min = dom0_min_size;
>>>          d->meminfo.mem_max = dom0_max_size;
>>
>> I believe the correct fix is to this hunk,
>>
>> @@ -416,7 +379,12 @@ unsigned long __init dom0_compute_nr_pages(
>>           }
>>       }
>>
>> -    d->max_pages = min_t(unsigned long, max_pages, UINT_MAX);
>> +    /* Clamp according to min/max limits and available memory (final). */
>> +    nr_pages = max(nr_pages, min_pages);
>> +    nr_pages = min(nr_pages, max_pages);
>> +    nr_pages = min(nr_pages, avail);
>> +
>> +    bd->domain->max_pages = min_t(unsigned long, max_pages, UINT_MAX);
>>
>> Before that last line, there should be a clamp up of max_pages, e.g.
>>
>>      nr_pages = max(nr_pages, min_pages);
>>      nr_pages = min(nr_pages, max_pages);
>>      nr_pages = min(nr_pages, avail);
>>
>>      max_pages = max(nr_pages, max_pages);
>>
>>      bd->domain->max_pages = min_t(unsigned long, max_pages, UINT_MAX);
>>
>> v/r,
>> dps
> 
> I don't believe this resolves my issue.
> 
> If max_pages is 0 before these 5 lines, then the second line will still clamp nr_pages to 0 and the panic on line 534 will be hit.
> 
> Before patch 15, this max limit came directly from dom0_max_size, which has a default value of { .nr_pages = LONG_MAX }, so no clamping will occur unless overridden by the cmd line.
> 
> After patch 15, bd->meminfo.mem_max is used as the max limit. (unless overridden by the cmdline)
> I'm assuming it will eventually be specified in the device tree, but for now, the max limit just set to equal to the size (xen/common/domain-builder/fdt.c:155) so no down-clamping will occur.
> 
> The only exception is the initial domain construction fallback. In this case, there is no device tree and bd->meminfo is never initialized.
> If bd->meminfo.mem_size is zero, the code will try to compute a reasonable default for nr_pages, but there is no such logic max_pages. It remains 0, and clamps nr_pages to zero.
> 
> Does this help clarify?
> The core issue is that without a device tree or command line option to specify the max limit, the max limit is left uninitialized, which clamps dom0's memory to 0. I think it should be initialized to LONG_MAX in that case, like it was before this patch set.

You are correct, my apologies. Thank you!

> Thanks,
> Jackson


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9EC2AD0CE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 09:05:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23079.49644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcOe9-0005ha-G7; Tue, 10 Nov 2020 08:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23079.49644; Tue, 10 Nov 2020 08:04:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcOe9-0005hB-CM; Tue, 10 Nov 2020 08:04:57 +0000
Received: by outflank-mailman (input) for mailman id 23079;
 Tue, 10 Nov 2020 08:04:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcOe8-0005h6-5t
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 08:04:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa950df0-5faf-4e20-9204-d3c35737d64c;
 Tue, 10 Nov 2020 08:04:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2DFCEADEE;
 Tue, 10 Nov 2020 08:04:54 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcOe8-0005h6-5t
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 08:04:56 +0000
X-Inumbo-ID: fa950df0-5faf-4e20-9204-d3c35737d64c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id fa950df0-5faf-4e20-9204-d3c35737d64c;
	Tue, 10 Nov 2020 08:04:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604995494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+pRUw8/CTl2vkEDDB9rqxMOasKAKUGMRrmlIbJgMFI=;
	b=kuRaT9xAfUBFaH64EUC1FX5xRKyMeGnWHe0ArDO29bH5wnPWlHXUonaL4VOOPQeEnlaw22
	9IfEHFTQIJSU4QLrJOAESjXte6KdkSllmnA50ZXqEgPDhj2SK4ZmsvwUn6mKFpmxZnH76Y
	btOUgBvBtHlKYJohDwFECT6mDCkaPRk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2DFCEADEE;
	Tue, 10 Nov 2020 08:04:54 +0000 (UTC)
Subject: Re: [PATCH v2] x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL}
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20201109173819.7817-1-andrew.cooper3@citrix.com>
 <20201109183102.mrqklmpqyka5u6bt@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d76806b4-2302-bee9-d977-ecfe29089fd7@suse.com>
Date: Tue, 10 Nov 2020 09:04:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201109183102.mrqklmpqyka5u6bt@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09.11.2020 19:31, Roger Pau Monné wrote:
> On Mon, Nov 09, 2020 at 05:38:19PM +0000, Andrew Cooper wrote:
>> From: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Currently a PV hardware domain can also be given control over the CPU
>> frequency, and such guest is allowed to write to MSR_IA32_PERF_CTL.
>> However since commit 322ec7c89f6 the default behavior has been changed
>> to reject accesses to not explicitly handled MSRs, preventing PV
>> guests that manage CPU frequency from reading
>> MSR_IA32_PERF_{STATUS/CTL}.
>>
>> Additionally some HVM guests (Windows at least) will attempt to read
>> MSR_IA32_PERF_CTL and will panic if given back a #GP fault:
>>
>>   vmx.c:3035:d8v0 RDMSR 0x00000199 unimplemented
>>   d8v0 VIRIDIAN CRASH: 3b c0000096 fffff806871c1651 ffffda0253683720 0
>>
>> Move the handling of MSR_IA32_PERF_{STATUS/CTL} to the common MSR
>> handling shared between HVM and PV guests, and add an explicit case
>> for reads to MSR_IA32_PERF_{STATUS/CTL}.
>>
>> Restore previous behavior and allow PV guests with the required
>> permissions to read the contents of the mentioned MSRs. Non privileged
>> guests will get 0 when trying to read those registers, as writes to
>> MSR_IA32_PERF_CTL by such guest will already be silently dropped.
>>
>> Fixes: 322ec7c89f6 ('x86/pv: disallow access to unknown MSRs')
>> Fixes: 84e848fd7a1 ('x86/hvm: disallow access to unknown MSRs')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> v2:
>>  * fix is_cpufreq_controller() to exclude PVH dom0, and collapse to nothing in
>>    !CONFIG_PV builds
>>  * Drop the cross-vendor checks.  It isn't possible to configure dom0 as
>>    cross-vendor, and anyone using is_cpufreq_controller() without an exact
>>    model match has far bigger problems.

This already answers ...

>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -1069,6 +1069,23 @@ extern enum cpufreq_controller {
>>      FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
>>  } cpufreq_controller;
>>  
>> +static always_inline bool is_cpufreq_controller(const struct domain *d)
>> +{
>> +    /*
>> +     * A PV dom0 can be nominated as the cpufreq controller, instead of using
>> +     * Xen's cpufreq driver, at which point dom0 gets direct access to certain
>> +     * MSRs.
>> +     *
>> +     * This interface only works when dom0 is identity pinned and has the same
>> +     * number of vCPUs as pCPUs on the system.
>> +     *
>> +     * It would be far better to paravirtualise the interface.
>> +     */
> 
> Would it be useful to add an assert here that the domain cpuid vendor
> and the BSP cpuid vendor match?
> 
> Is it even possible to fake a different cpuid vendor for dom0?

... your question here.

Jan


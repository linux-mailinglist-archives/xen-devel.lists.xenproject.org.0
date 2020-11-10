Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EC32AD3D7
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 11:33:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23226.49869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcQxL-0003Gf-K5; Tue, 10 Nov 2020 10:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23226.49869; Tue, 10 Nov 2020 10:32:55 +0000
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
	id 1kcQxL-0003GG-Gl; Tue, 10 Nov 2020 10:32:55 +0000
Received: by outflank-mailman (input) for mailman id 23226;
 Tue, 10 Nov 2020 10:32:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=psMK=EQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kcQxJ-0003GA-IQ
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 10:32:53 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5b84ab0-4272-4ae2-ac2e-18ac3ac5404a;
 Tue, 10 Nov 2020 10:32:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=psMK=EQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kcQxJ-0003GA-IQ
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 10:32:53 +0000
X-Inumbo-ID: e5b84ab0-4272-4ae2-ac2e-18ac3ac5404a
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e5b84ab0-4272-4ae2-ac2e-18ac3ac5404a;
	Tue, 10 Nov 2020 10:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605004372;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=uhQye2TkyUFDzIYdrR0IO5dPfzS+NBxOun3In7QlsxU=;
  b=U3ABf+9ognqk7hVistdX76H016abFt0btpIOSjn9fHZB3xRLDo0sby06
   x7ZKNAeN4YCWDBg4D0Mf+XLkaCZKHSy+vq2GrQVVy9sRYbV0bcIkgRa2y
   PUZVjFaadedshxpnbGbViyLlFr+lltKWqBXd2gbwWHkblB4qT5KqgDhTp
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Z002tLpBFVgr1ecjQPdNc6X2+/6drGo5e2c7bBMwRImT5DA2vPkn4y3/1U5/zWutdXJlAafe+g
 UIuG6b9nuxC4zY768T+Ft3g3DPeSW1sbgV66rLZOkAqUkq5lmXWwtne+xqUtAPVSuLFd3fRz4r
 XgQWgaxcq5SKnKRo+g1EdpUYUH8Osiw2MahvNFIbhD7qfcibeHYLZI6hu26Yo2wvImJz+ODang
 UZKpDuOgeT1uJW/3IeLDM8N5+w5Umz9frewLD0agA2OyEI6R7EPKaQOHKvGFJ7fd+HzeV5ly6w
 o38=
X-SBRS: None
X-MesageID: 31174526
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,466,1596513600"; 
   d="scan'208";a="31174526"
Subject: Re: [PATCH v2] x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL}
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201109173819.7817-1-andrew.cooper3@citrix.com>
 <681e03f5-86fd-43bb-5347-c526def9ffcb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <083f46c0-07fb-7b22-4e49-d2a0df87164c@citrix.com>
Date: Tue, 10 Nov 2020 10:32:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <681e03f5-86fd-43bb-5347-c526def9ffcb@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 10/11/2020 08:03, Jan Beulich wrote:
> On 09.11.2020 18:38, Andrew Cooper wrote:
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
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

> with a nit, a minor adjustment request, and a question:
>
>> @@ -448,6 +467,21 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>>              goto gp_fault;
>>          break;
>>  
>> +        /*
>> +         * This MSR are not enumerated in CPUID.  It has been around since the
> s/are/is/

Oops, yes.

>
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
>> +    return (IS_ENABLED(CONFIG_PV) &&
>> +            (cpufreq_controller == FREQCTL_dom0_kernel) &&
>> +            is_pv_domain(d) && is_hardware_domain(d));
>> +}
> IS_ENABLED(CONFIG_PV) is already part of is_pv_domain() and hence
> imo shouldn't be used explicitly here.

Ah yes.  Will drop.

> Also, this being an x86 concept, is it really a good idea to put
> in xen/sched.h? I guess this builds on Arm just because of DCE
> from the IS_ENABLED(CONFIG_PV) (where afaict the one in
> is_pv_domain() will still do). (But yes, I do realize that
> cpufreq_controller itself gets declared in this file, so maybe
> better to do some subsequent cleanup.)

I can't spot anywhere obviously better for it to live.  We don't have a
common cpufreq.h, and I'm not sure that cpuidle.h is an appropriate
place to live either.

Thanks,

~Andrew


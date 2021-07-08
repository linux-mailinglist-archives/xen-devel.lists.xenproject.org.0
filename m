Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AC23BF725
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 10:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152945.282544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Png-0008Ln-K1; Thu, 08 Jul 2021 08:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152945.282544; Thu, 08 Jul 2021 08:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Png-0008Jb-Gy; Thu, 08 Jul 2021 08:54:28 +0000
Received: by outflank-mailman (input) for mailman id 152945;
 Thu, 08 Jul 2021 08:53:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sueo=MA=linux.intel.com=lingshan.zhu@srs-us1.protection.inumbo.net>)
 id 1m1Pmu-0008IE-EC
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 08:53:40 +0000
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc20511f-dfc9-11eb-855d-12813bfff9fa;
 Thu, 08 Jul 2021 08:53:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 01:53:36 -0700
Received: from lingshan-mobl5.ccr.corp.intel.com (HELO [10.249.171.108])
 ([10.249.171.108])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 01:53:28 -0700
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
X-Inumbo-ID: fc20511f-dfc9-11eb-855d-12813bfff9fa
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="231224873"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; 
   d="scan'208";a="231224873"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; 
   d="scan'208";a="487473996"
Subject: Re: [PATCH V7 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
To: Peter Zijlstra <peterz@infradead.org>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Cc: pbonzini@redhat.com, bp@alien8.de, seanjc@google.com,
 vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com,
 joro@8bytes.org, weijiang.yang@intel.com, kan.liang@linux.intel.com,
 ak@linux.intel.com, wei.w.wang@intel.com, eranian@google.com,
 liuxiangdong5@huawei.com, linux-kernel@vger.kernel.org, x86@kernel.org,
 kvm@vger.kernel.org, like.xu.linux@gmail.com,
 Like Xu <like.xu@linux.intel.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 xen-devel@lists.xenproject.org
References: <20210622094306.8336-1-lingshan.zhu@intel.com>
 <20210622094306.8336-2-lingshan.zhu@intel.com>
 <YN722HIrzc6Z2+oD@hirez.programming.kicks-ass.net>
From: Zhu Lingshan <lingshan.zhu@linux.intel.com>
Message-ID: <82ae3758-6b99-dc43-9515-fabb2b036f3b@linux.intel.com>
Date: Thu, 8 Jul 2021 16:53:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YN722HIrzc6Z2+oD@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/2/2021 7:22 PM, Peter Zijlstra wrote:
> On Tue, Jun 22, 2021 at 05:42:49PM +0800, Zhu Lingshan wrote:
>> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
>> index 8f71dd72ef95..c71af4cfba9b 100644
>> --- a/arch/x86/events/core.c
>> +++ b/arch/x86/events/core.c
>> @@ -90,6 +90,27 @@ DEFINE_STATIC_CALL_NULL(x86_pmu_pebs_aliases, *x86_pmu.pebs_aliases);
>>    */
>>   DEFINE_STATIC_CALL_RET0(x86_pmu_guest_get_msrs, *x86_pmu.guest_get_msrs);
>>   
>> +DEFINE_STATIC_CALL_RET0(x86_guest_state, *(perf_guest_cbs->state));
>> +DEFINE_STATIC_CALL_RET0(x86_guest_get_ip, *(perf_guest_cbs->get_ip));
>> +DEFINE_STATIC_CALL_RET0(x86_guest_handle_intel_pt_intr, *(perf_guest_cbs->handle_intel_pt_intr));
>> +
>> +void arch_perf_update_guest_cbs(void)
>> +{
>> +	static_call_update(x86_guest_state, (void *)&__static_call_return0);
>> +	static_call_update(x86_guest_get_ip, (void *)&__static_call_return0);
>> +	static_call_update(x86_guest_handle_intel_pt_intr, (void *)&__static_call_return0);
>> +
>> +	if (perf_guest_cbs && perf_guest_cbs->state)
>> +		static_call_update(x86_guest_state, perf_guest_cbs->state);
>> +
>> +	if (perf_guest_cbs && perf_guest_cbs->get_ip)
>> +		static_call_update(x86_guest_get_ip, perf_guest_cbs->get_ip);
>> +
>> +	if (perf_guest_cbs && perf_guest_cbs->handle_intel_pt_intr)
>> +		static_call_update(x86_guest_handle_intel_pt_intr,
>> +				   perf_guest_cbs->handle_intel_pt_intr);
>> +}
> Coding style wants { } on that last if().
will fix these coding style issues in V8

Thanks!


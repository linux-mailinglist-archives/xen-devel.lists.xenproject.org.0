Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F7F3B1674
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jun 2021 11:07:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146172.268910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvyqO-0000ZQ-Jm; Wed, 23 Jun 2021 09:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146172.268910; Wed, 23 Jun 2021 09:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvyqO-0000XT-EW; Wed, 23 Jun 2021 09:06:48 +0000
Received: by outflank-mailman (input) for mailman id 146172;
 Wed, 23 Jun 2021 09:06:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VPk1=LR=intel.com=lingshan.zhu@srs-us1.protection.inumbo.net>)
 id 1lvyqN-0000XN-6b
 for xen-devel@lists.xenproject.org; Wed, 23 Jun 2021 09:06:47 +0000
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 890be39e-298b-4775-aebd-080efc68c078;
 Wed, 23 Jun 2021 09:06:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 02:06:43 -0700
Received: from lingshan-mobl5.ccr.corp.intel.com (HELO [10.255.30.127])
 ([10.255.30.127])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 02:06:38 -0700
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
X-Inumbo-ID: 890be39e-298b-4775-aebd-080efc68c078
IronPort-SDR: rP8uekMS6K6bv8j+KZX8YdnQ7UWdg1QfG6KloBMeZFiWjHEp+U6iLhZw7vXOQZJFg5EpLLIapF
 lN3ojr528o1g==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="204217864"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; 
   d="scan'208";a="204217864"
IronPort-SDR: g2eO6eKo7NA4GY19a7CouO+5j1o7GAnTSLroawrK3+rYpOJrEVfMjr60J7q5kjcIpvJfXcjBDr
 3E4HH0+4OM1A==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; 
   d="scan'208";a="487232734"
Subject: Re: [PATCH V7 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, pbonzini@redhat.com
Cc: Like Xu <like.xu@linux.intel.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 xen-devel@lists.xenproject.org, Peter Zijlstra <peterz@infradead.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, bp@alien8.de,
 kan.liang@linux.intel.com
References: <20210622093823.8215-1-lingshan.zhu@intel.com>
 <20210622093823.8215-2-lingshan.zhu@intel.com>
 <92fdf981-68ef-92a2-b1ae-0c5f347ae460@oracle.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Message-ID: <43f6bb94-616c-f0c9-edc6-a72ea1244f59@intel.com>
Date: Wed, 23 Jun 2021 17:06:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <92fdf981-68ef-92a2-b1ae-0c5f347ae460@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Thanks Boris, I will fix this in V8

On 6/23/2021 1:31 AM, Boris Ostrovsky wrote:
>
> On 6/22/21 5:38 AM, Zhu Lingshan wrote:
>
>> -static int xen_is_user_mode(void)
>> -{
>> -	const struct xen_pmu_data *xenpmu_data = get_xenpmu_data();
>> +	state |= PERF_GUEST_ACTIVE;
>>   
>> -	if (!xenpmu_data) {
>> -		pr_warn_once("%s: pmudata not initialized\n", __func__);
>> -		return 0;
>> +	if (xenpmu_data->pmu.pmu_flags & PMU_SAMPLE_PV) {
>> +		if (xenpmu_data->pmu.pmu_flags & PMU_SAMPLE_USER)
>> +			state |= PERF_GUEST_USER;
>> +	} else {
>> +		if (!!(xenpmu_data->pmu.r.regs.cpl & 3))
>> +			state |= PERF_GUEST_USER;
>
>
> Please drop "!!", it's not needed here. And use "else if".
>
>
> With that, for Xen bits:
>
> Reviewed-by: Boris Ostrovsky <boris.ostrvsky@oracle.com>
>
> -boris
>



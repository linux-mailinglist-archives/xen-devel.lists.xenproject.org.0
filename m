Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD093D1C31
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jul 2021 05:04:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159618.293562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6P0F-0003Gy-5H; Thu, 22 Jul 2021 03:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159618.293562; Thu, 22 Jul 2021 03:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6P0F-0003F9-28; Thu, 22 Jul 2021 03:04:03 +0000
Received: by outflank-mailman (input) for mailman id 159618;
 Thu, 22 Jul 2021 03:04:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q664=MO=intel.com=lingshan.zhu@srs-us1.protection.inumbo.net>)
 id 1m6P0D-0003F3-R0
 for xen-devel@lists.xenproject.org; Thu, 22 Jul 2021 03:04:01 +0000
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec130193-8a15-4215-98f6-464897621f39;
 Thu, 22 Jul 2021 03:03:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 20:03:54 -0700
Received: from lingshan-mobl5.ccr.corp.intel.com (HELO [10.255.29.38])
 ([10.255.29.38])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 20:03:46 -0700
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
X-Inumbo-ID: ec130193-8a15-4215-98f6-464897621f39
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="198827128"
X-IronPort-AV: E=Sophos;i="5.84,259,1620716400"; 
   d="scan'208";a="198827128"
X-IronPort-AV: E=Sophos;i="5.84,259,1620716400"; 
   d="scan'208";a="512019825"
Subject: Re: [PATCH V8 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
To: Like Xu <like.xu.linux@gmail.com>
Cc: bp@alien8.de, seanjc@google.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 kan.liang@linux.intel.com, ak@linux.intel.com, wei.w.wang@intel.com,
 eranian@google.com, liuxiangdong5@huawei.com, linux-kernel@vger.kernel.org,
 x86@kernel.org, kvm@vger.kernel.org, boris.ostrvsky@oracle.com,
 Like Xu <like.xu@linux.intel.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 xen-devel@lists.xenproject.org, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210716085325.10300-1-lingshan.zhu@intel.com>
 <20210716085325.10300-2-lingshan.zhu@intel.com>
 <fd117e37-8063-63a4-43cd-7cb555e5bab5@gmail.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Message-ID: <e8a7de91-fe48-c570-3cea-a296278a7c8a@intel.com>
Date: Thu, 22 Jul 2021 11:03:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <fd117e37-8063-63a4-43cd-7cb555e5bab5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 7/21/2021 7:57 PM, Like Xu wrote:
> On 16/7/2021 4:53 pm, Zhu Lingshan wrote:
>> +    } else if (xenpmu_data->pmu.r.regs.cpl & 3)
>
> Lingshan, serious for this version ?
>
> arch/x86/xen/pmu.c:438:9: error: expected identifier or ‘(’ before 
> ‘return’
>   438 |         return state;
>       |         ^~~~~~
> arch/x86/xen/pmu.c:439:1: error: expected identifier or ‘(’ before ‘}’ 
> token
>   439 | }
>       | ^
> arch/x86/xen/pmu.c: In function ‘xen_guest_state’:
> arch/x86/xen/pmu.c:436:9: error: control reaches end of non-void 
> function [-Werror=return-type]
>   436 |         }
>       |         ^
> cc1: some warnings being treated as errors
>
>> +            state |= PERF_GUEST_USER;
>>       }
forgot to enable XEN build in .config, V9 fixes this will come soon


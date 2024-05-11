Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28EE8C3054
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 11:17:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720260.1123359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5irC-0003TU-Fp; Sat, 11 May 2024 09:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720260.1123359; Sat, 11 May 2024 09:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5irC-0003Ry-Cg; Sat, 11 May 2024 09:17:30 +0000
Received: by outflank-mailman (input) for mailman id 720260;
 Sat, 11 May 2024 09:17:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s5irA-0003Rs-TG
 for xen-devel@lists.xenproject.org; Sat, 11 May 2024 09:17:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5irA-0004Zh-Bi; Sat, 11 May 2024 09:17:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5irA-0007KW-3z; Sat, 11 May 2024 09:17:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=hCwP4b4DAVi72fRcSDnZAzkDAx2URX7FOKYLm+be2gg=; b=lExUW1Taky0DUW8YR6Z4Wakh3w
	84CdvvWnDaBIB8YzjqtxkWZSNJrfP7buJ6LvkdFtmR2g4lFPSCpu37BIXmWHOW2GjT78y0gyFmJ/A
	p3yuMv9PBVEwCaPgHd0UiYMjlRnSPdmbdW77fxuhMJkRczLiXeqg1lsgxKurXAMVe/hE=;
Message-ID: <e84a2ac3-f09b-40a0-848b-4d2932a61fe7@xen.org>
Date: Sat, 11 May 2024 10:17:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen/arm: Add new HVM_PARAM_HV_RSRV_{BASE_PFN,SIZE}
 keys in HVMOP
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>
References: <20240511005611.83125-1-xin.wang2@amd.com>
 <20240511005611.83125-3-xin.wang2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240511005611.83125-3-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 11/05/2024 01:56, Henry Wang wrote:
> For use cases such as Dom0less PV drivers, a mechanism to communicate
> Dom0less DomU's static data with the runtime control plane (Dom0) is
> needed. Since on Arm HVMOP is already the existing approach to address
> such use cases (for example the allocation of HVM_PARAM_CALLBACK_IRQ),
> add new HVMOP keys HVM_PARAM_HV_RSRV_{BASE_PFN,SIZE} for storing the
> hypervisor reserved pages region base PFN and size.
> 
> Currently, the hypervisor reserved pages region is used as the Arm
> Dom0less DomU guest magic pages region. Therefore protect the HVMOP
> keys with "#if defined(__arm__) || defined(__aarch64__)". The values
> will be set at Dom0less DomU construction time after Dom0less DomU's
> magic pages region has been allocated.
> 
> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
> v2:
> - Rename the HVMOP keys to HVM_PARAM_HV_RSRV_{BASE_PFN,SIZE}. (Daniel)
> - Add comment on top of HVM_PARAM_HV_RSRV_{BASE_PFN,SIZE} to describe
>    its usage. Protect them with #ifdef. (Daniel, Jan)
> ---
>   xen/arch/arm/dom0less-build.c   |  3 +++
>   xen/arch/arm/hvm.c              |  2 ++
>   xen/include/public/hvm/params.h | 11 ++++++++++-
>   3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 4b96ddd9ce..5bb53ebb47 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -764,6 +764,9 @@ static int __init alloc_magic_pages(struct domain *d)
>           return rc;
>       }
>   
> +    d->arch.hvm.params[HVM_PARAM_HV_RSRV_BASE_PFN] = gfn_x(gfn);
> +    d->arch.hvm.params[HVM_PARAM_HV_RSRV_SIZE] = NR_MAGIC_PAGES;
> +
>       return 0;
>   }
>   
> diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
> index 0989309fea..949d804f8b 100644
> --- a/xen/arch/arm/hvm.c
> +++ b/xen/arch/arm/hvm.c
> @@ -55,6 +55,8 @@ static int hvm_allow_get_param(const struct domain *d, unsigned int param)
>       case HVM_PARAM_STORE_EVTCHN:
>       case HVM_PARAM_CONSOLE_PFN:
>       case HVM_PARAM_CONSOLE_EVTCHN:
> +    case HVM_PARAM_HV_RSRV_BASE_PFN:
> +    case HVM_PARAM_HV_RSRV_SIZE:

We should not allow the guest to read HVM_PARAM_HV_*. So this would need 
to be handled like HVM_PARAM_HV_*.

But I have some reservation with using HVM params. It means we are 
setting in stone how we communicate/allocate the reserved pages.

I can see a few issues that may bite back in the future.

We always pre-allocate the reserved pages. But most of the feature may 
not be used which ends up to be a waste of memory. For instance, you 
only seem to one page for dom0less, but allocate 4. I understand that 
libxenguest is doing the same today, however we have the flexibility to 
change it by just not allocating the page.

Similarly, we expect the hypervisor to provide enough reserved pages for 
the toolstack to work. Yet, I believe some of the features (e.g. 
memaccess) doesn't need to be known in advance.

The number of pages are tiny at the moment (4) on Xen. But given the 
name, I could see someone asking for setting aside more reserved spaces 
and a single range may start to be a problem for direct mapped domain 
(unless we don't need to map the magic pages 1:1).

Overall, if we want to make it part of the stable ABI. Then it would be 
better to provide a (large) reserved space that will be allocated on 
demand (IOW there is no associated physical memory). If it doesn't work 
for direct mapped domain, then another solution is to have a toolstack 
hypercall to allocate a GFN (they don't need to be contiguous) and the 
backing memory.

Cheers,

-- 
Julien Grall


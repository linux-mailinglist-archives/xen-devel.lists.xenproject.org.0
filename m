Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C54327AAF
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 10:26:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91380.172739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGeoe-0007bc-BL; Mon, 01 Mar 2021 09:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91380.172739; Mon, 01 Mar 2021 09:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGeoe-0007bG-8D; Mon, 01 Mar 2021 09:26:12 +0000
Received: by outflank-mailman (input) for mailman id 91380;
 Mon, 01 Mar 2021 09:26:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lGeod-0007bB-6T
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 09:26:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lGeoa-0004m7-Sk; Mon, 01 Mar 2021 09:26:08 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lGeoa-0002id-K0; Mon, 01 Mar 2021 09:26:08 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=e8IoOGOS2VNvbulO6qebbGkyehu9GJHO/7V9fcrscjE=; b=JjHSzgK91a/zDWE29K5b6zKWFv
	RgfqAxg59DpMgBh3DPuxfs8hnX+DpQZSKWiVDD77hXFfXVMX+L69M7iUZDelejeiv98d0dsJ9kaop
	yKPy4Gj33mRCQm/aq+cM3NcPpafJp0TzQQiTwpB4G2GIZfZs5lQ6OL7d3G10xlv9nVWY=;
Subject: Re: [PATCH v2] xen: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>, jbeulich@suse.com,
 andrew.cooper3@citrix.com
References: <20210226225217.2137-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <2517d743-c91f-e47c-29c8-41355724252d@xen.org>
Date: Mon, 1 Mar 2021 09:26:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226225217.2137-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 26/02/2021 22:52, Stefano Stabellini wrote:
> Introduce two feature flags to tell the domain whether it is
> direct-mapped or not. It allows the guest kernel to make informed
> decisions on things such as swiotlb-xen enablement.
> 
> The introduction of both flags (XENFEAT_direct_mapped and
> XENFEAT_not_direct_mapped) allows the guest kernel to avoid any
> guesswork if one of the two is present, or fallback to the current
> checks if neither of them is present.
> 
> XENFEAT_direct_mapped is always set for not auto-translated guests.
> 
> For auto-translated guests, only Dom0 on ARM is direct-mapped. Also,
> see is_domain_direct_mapped() which refers to auto-translated guests:
> xen/include/asm-arm/domain.h:is_domain_direct_mapped
> xen/include/asm-x86/domain.h:is_domain_direct_mapped
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: jbeulich@suse.com
> CC: andrew.cooper3@citrix.com
> CC: julien@xen.org
> ---
> Changes in v2:
> - code style improvements
> - better comments
> - better commit message
> - not auto_translated domains are direct_mapped
> ---
>   xen/common/kernel.c           |  4 ++++
>   xen/include/public/features.h | 12 ++++++++++++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index 7a345ae45e..431447326c 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -560,6 +560,10 @@ DO(xen_version)(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>                                (1U << XENFEAT_hvm_callback_vector) |
>                                (has_pirq(d) ? (1U << XENFEAT_hvm_pirqs) : 0);
>   #endif
> +            if ( is_domain_direct_mapped(d) || !paging_mode_translate(d) )
> +                fi.submap |= (1U << XENFEAT_direct_mapped);
> +            else
> +                fi.submap |= (1U << XENFEAT_not_direct_mapped);
>               break;
>           default:
>               return -EINVAL;
> diff --git a/xen/include/public/features.h b/xen/include/public/features.h
> index 1613b2aab8..4aebfd359a 100644
> --- a/xen/include/public/features.h
> +++ b/xen/include/public/features.h
> @@ -114,6 +114,18 @@
>    */
>   #define XENFEAT_linux_rsdp_unrestricted   15
>   
> +/*
> + * A direct-mapped (or 1:1 mapped) domain is a domain for which its
> + * local pages have gfn == mfn. If a domain is direct-mapped,
> + * XENFEAT_direct_mapped is set; otherwise XENFEAT_not_direct_mapped
> + * is set.

An OS developper may interpret it as there will always be one of the two 
flags set. However, this will not be the case for existing Xen release.

In addion to that, in the past, we removed support for some XENFEAT_* 
because they were broken. Although, it is unlikely the case here.

Therefore, I think we want to explain that it may be possible to have 
neither of the two flags set and what to do.

Cheers,

-- 
Julien Grall


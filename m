Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0967671D0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 18:28:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571515.895551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPQJZ-000672-K3; Fri, 28 Jul 2023 16:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571515.895551; Fri, 28 Jul 2023 16:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPQJZ-000657-GE; Fri, 28 Jul 2023 16:27:41 +0000
Received: by outflank-mailman (input) for mailman id 571515;
 Fri, 28 Jul 2023 16:27:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qPQJY-000651-Me
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 16:27:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPQJX-0003Pv-Il; Fri, 28 Jul 2023 16:27:39 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qPQJX-0000ud-Ch; Fri, 28 Jul 2023 16:27:39 +0000
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
	bh=egzUNnIhpIGdlpU7kTCEI0Z2WQztzharoJZnhDbdh7E=; b=iWfrAdZINeuEa11aHK1IfQhbsX
	3caKBo7Mc9E2rHrOQ14rNGEYGVbc4snA+LXA/PyzJK4BkJXJFq1A2plNmUTq2PbOfrPIqyN37e2vR
	yr6IMiiUgDj2q9FdCrQoy1f8S6qKHz1xJsDhRlVi99wt5qn44sih6iIXL0a4mL7Ad3zM=;
Message-ID: <5a43061c-3777-c1db-8084-f3b8f911a5c8@xen.org>
Date: Fri, 28 Jul 2023 17:27:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] pdx: Add CONFIG_HAS_PDX_COMPRESSION as a common
 Kconfig option
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-6-alejandro.vallejo@cloud.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230728075903.7838-6-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/07/2023 08:59, Alejandro Vallejo wrote:
> diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
> index 5a82b6bde2..dfb475c8dc 100644
> --- a/xen/include/xen/pdx.h
> +++ b/xen/include/xen/pdx.h
> @@ -67,8 +67,6 @@
>    * region involved.
>    */
>   
> -#ifdef CONFIG_HAS_PDX
> -
>   extern unsigned long max_pdx;
>   
>   #define PDX_GROUP_COUNT ((1 << PDX_GROUP_SHIFT) / \
> @@ -100,6 +98,8 @@ bool __mfn_valid(unsigned long mfn);
>   #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
>   #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
>   
> +#ifdef CONFIG_PDX_COMPRESSION
> +
>   extern unsigned long pfn_pdx_bottom_mask, ma_va_bottom_mask;
>   extern unsigned int pfn_pdx_hole_shift;
>   extern unsigned long pfn_hole_mask;
> @@ -205,8 +205,39 @@ static inline uint64_t directmapoff_to_maddr(unsigned long offset)
>    *             position marks a potentially compressible bit.
>    */
>   void pfn_pdx_hole_setup(unsigned long mask);
> +#else /* CONFIG_PDX_COMPRESSION */

Looking at other places, we tend to put the reason the #else be 
executed. In this case, it is !CONFIG_PDX_COMPRESSION.

Other than that, the changes looks good to me:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


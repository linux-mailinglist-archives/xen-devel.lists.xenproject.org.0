Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36589AC7B58
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 11:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999875.1380400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKZpZ-0006l7-A0; Thu, 29 May 2025 09:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999875.1380400; Thu, 29 May 2025 09:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKZpZ-0006it-5S; Thu, 29 May 2025 09:45:45 +0000
Received: by outflank-mailman (input) for mailman id 999875;
 Thu, 29 May 2025 09:45:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uKZpY-0006in-9u
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 09:45:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uKZpX-008I6a-2c;
 Thu, 29 May 2025 09:45:43 +0000
Received: from [15.248.2.29] (helo=[10.24.66.169])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uKZpX-00DLvz-38;
 Thu, 29 May 2025 09:45:43 +0000
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
	bh=bu0EMmDw62rpTw0T0X24ByG0s+PYpG0rA6O8AB6YMec=; b=pPsf6HDromaCv99r2nW57Ntwxw
	JsXICGI/+9DwWrJGpvBsGYdYYWafM3Zp3kBDHICM/aG7IPDZVuXBOu8ztEIwC7OoF5z0AM8V48rUy
	kZwhwEs0juhFj7WZ8l7i/rfZZyBxem0oRvvsEHX8x5tUP/2lELehbW9MtBPU5gVLxcjk=;
Message-ID: <bcd974cd-8513-4069-82de-c553da3175f5@xen.org>
Date: Thu, 29 May 2025 10:45:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] arm/mpu: Provide and populate MPU C data
 structures
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250523065406.3795420-1-luca.fancellu@arm.com>
 <20250523065406.3795420-4-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250523065406.3795420-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 23/05/2025 07:54, Luca Fancellu wrote:
>   /*
>    * Macro to prepare and set a EL2 MPU memory region.
>    * We will also create an according MPU memory region entry, which
> @@ -59,6 +79,24 @@
>       dsb   sy
>       isb
>   
> +    /* Load pair into xen_mpumap and invalidate cache */

AFAICT, you don't invalidate the cache below. What did I miss?

The rest of the patch LGTM.

> +    adr_l \base, xen_mpumap
> +    add   \base, \base, \sel, LSL #XEN_MPUMAP_ENTRY_SHIFT
> +    store_pair \prbar, \prlar, \base
> +
> +    /* Set/clear xen_mpumap_mask bitmap */
> +    tst   \prlar, #PRLAR_ELx_EN
> +    bne   2f
> +    /* Region is disabled, clear the bit in the bitmap */
> +    bitmap_clear_bit xen_mpumap_mask, \sel, \base, \limit, \prbar, \prlar
> +    b     3f
> +
> +2:
> +    /* Region is enabled, set the bit in the bitmap */
> +    bitmap_set_bit xen_mpumap_mask, \sel, \base, \limit, \prbar, \prlar
> +
> +3:
> +
>       add   \sel, \sel, #1

Cheers,

-- 
Julien Grall



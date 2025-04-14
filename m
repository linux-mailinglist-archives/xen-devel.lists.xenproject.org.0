Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17069A87F94
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949936.1346386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IJE-0004sk-TC; Mon, 14 Apr 2025 11:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949936.1346386; Mon, 14 Apr 2025 11:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4IJE-0004sG-Pr; Mon, 14 Apr 2025 11:49:04 +0000
Received: by outflank-mailman (input) for mailman id 949936;
 Mon, 14 Apr 2025 11:49:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u4IJD-0004s8-Ik
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:49:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4IJD-00EpLf-0O;
 Mon, 14 Apr 2025 11:49:03 +0000
Received: from [143.198.24.140] (helo=[100.81.22.8])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4IJC-00DDfg-1u;
 Mon, 14 Apr 2025 11:49:03 +0000
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
	bh=4AX8NSQXOqg2Aqkf23+AI9cD0KspmvnAGYYNcjD0A/8=; b=IzCPBiM2EjOup7ehPZ5yX0m8pz
	GR45ulPCjHDf6pueFA31xyBhm3JAJPeBzgN/i/qnIsWW/xGxDCmzzJTw7wHDNg5sUE1lOQPf+t2Jf
	pgNTxV9dHafY7cZLpHHqN/4hQ6vliU3GQcjCgEsdGVUXWHwvZ+EdMiCYUHi7ZIX0tpDk=;
Message-ID: <64f32855-e33d-4d89-9066-e63f0f1cce94@xen.org>
Date: Mon, 14 Apr 2025 20:48:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] arm/mpu: Introduce MPU memory mapping flags
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-6-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250411145655.140667-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 11/04/2025 23:56, Luca Fancellu wrote:
> Introduce the MPU memory mapping flags in asm/page.h.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/include/asm/page.h | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
> index 69f817d1e68a..22f7d2c6cb30 100644
> --- a/xen/arch/arm/include/asm/page.h
> +++ b/xen/arch/arm/include/asm/page.h
> @@ -62,6 +62,7 @@
>   
>   #define MAIRVAL (MAIR1VAL << 32 | MAIR0VAL)
>   
> +#ifdef CONFIG_MMU
>   /*
>    * Layout of the flags used for updating the hypervisor page tables
>    *
> @@ -90,6 +91,30 @@
>   #define _PAGE_CONTIG_BIT    8
>   #define _PAGE_CONTIG        (1U << _PAGE_CONTIG_BIT)
>   
> +#else /* !CONFIG_MMU */
> +
> +/*
> + * Layout of the flags used for updating MPU memory region attributes
> + * [0:2] Memory attribute Index
> + * [3:4] Execute Never
> + * [5:6] Access Permission

I am rather confused why we are splitting Execute Never from the Access 
Permission. I guess you tried to match the HW, but it also means we need 
to duplicate a lot of define between the MMU and MPU code.

Instead, I would rather try to re-use the existing ones and ignore the 
ones we don't need (e.g. BLOCK_BIT and CONTIG).

Cheers,

-- 
Julien Grall



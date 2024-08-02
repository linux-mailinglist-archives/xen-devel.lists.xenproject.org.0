Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF661945E69
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 15:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771158.1181729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZs5L-0001mn-5d; Fri, 02 Aug 2024 13:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771158.1181729; Fri, 02 Aug 2024 13:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZs5L-0001kA-2l; Fri, 02 Aug 2024 13:12:43 +0000
Received: by outflank-mailman (input) for mailman id 771158;
 Fri, 02 Aug 2024 13:12:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sZs5J-0001k4-IK
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 13:12:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sZs5E-0005jD-Ao; Fri, 02 Aug 2024 13:12:36 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sZs5E-00036G-2g; Fri, 02 Aug 2024 13:12:36 +0000
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
	bh=JupsZZ+Diqhv/xf89O+5VVu+c/Z5WfGq1+1dwyo21PE=; b=EptXq9PrF7SsddQJMKUEq6/mEY
	G7lXscW48vnzV6mI/G2XAS1xgpQcJjiu0BxIGVjwgSHY8yCPKQqB36Tt0m1ckmSrFPNtpURP8dxcn
	f5DYD8ThxKLi+/d5rDTxuq1qmdcw+loLfbirZV86EAvvO8ed7f3lHFHNMaj/mO5fo9sc=;
Message-ID: <1e6049c6-9474-40a4-a560-03294f945898@xen.org>
Date: Fri, 2 Aug 2024 14:12:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] xen: arm: Add an empty stub for
 update_identity_mapping()
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com
Cc: xen-devel@lists.xenproject.org
References: <20240802121443.1531693-1-ayan.kumar.halder@amd.com>
 <20240802121443.1531693-2-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240802121443.1531693-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 02/08/2024 13:14, Ayan Kumar Halder wrote:
> This is in continuation to commit
> f661a20aa880: "Extract MMU-specific MM code".
> 
> update_identity_mapping() is defined for MMU specific logic.
> It is invoked from smpboot.c. Thus, we add an empty stub to avoid
> if-defery.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/include/asm/arm64/mm.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
> index e0bd23a6ed..f595205fa3 100644
> --- a/xen/arch/arm/include/asm/arm64/mm.h
> +++ b/xen/arch/arm/include/asm/arm64/mm.h
> @@ -14,6 +14,7 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>   
>   void arch_setup_page_tables(void);
>   
> +#ifdef CONFIG_MMU
>   /*
>    * Enable/disable the identity mapping in the live page-tables (i.e.
>    * the one pointed by TTBR_EL2).
> @@ -22,6 +23,11 @@ void arch_setup_page_tables(void);
>    * supported.
>    */
>   void update_identity_mapping(bool enable);
> +#else /* CONFIG_MMU */
> +static inline void update_identity_mapping(bool enable)
> +{
> +}
> +#endif /* CONFIG_MMU */

The name of the function reads a bit odd in the context of the MPU. How 
about providing a new helper called update_boot_mapping()? For MPU, it 
would still be empty (assuming this is the right approach) whereas for 
the MMU it would call update_identity_mapping().

Cheers,

-- 
Julien Grall



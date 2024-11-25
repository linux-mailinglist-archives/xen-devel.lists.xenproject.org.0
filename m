Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEB79D8D64
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 21:28:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843150.1258797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFfh8-00021y-27; Mon, 25 Nov 2024 20:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843150.1258797; Mon, 25 Nov 2024 20:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFfh7-0001zp-Vc; Mon, 25 Nov 2024 20:28:29 +0000
Received: by outflank-mailman (input) for mailman id 843150;
 Mon, 25 Nov 2024 20:28:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tFfh7-0001zj-0S
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 20:28:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tFfh6-0053hx-11;
 Mon, 25 Nov 2024 20:28:28 +0000
Received: from [2a02:8012:3a1:0:29f6:ead8:34fc:5066]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tFfh6-005rcl-1Q;
 Mon, 25 Nov 2024 20:28:28 +0000
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
	bh=bOm+C/tBt+jBD83jAEjbj7V9PJAYOkSlFfPfPL1FVXU=; b=dWhAr9b1ovs4T67gGy5Z4ALeNJ
	fMCAmC1o3jgzQF8IyJiA/obmlQKoA27zTIraZw9hLJN/K4bAOHMUmnfa/SZ9kuelmDuA8onvhOl1q
	RLFotd/LSJoqWhLF3/GEjsUI/F8pGaJADJjGuccZeT1ZFpDOEuBfbeLOcUy0BvuawFmg=;
Message-ID: <9acc6647-17a2-4a0d-97c7-85e8e9543e5d@xen.org>
Date: Mon, 25 Nov 2024 20:28:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] Arm32: use new-style entry annotations in head.S
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
 <01eb936e-71f4-43b3-b753-5b8a6ecf5d66@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <01eb936e-71f4-43b3-b753-5b8a6ecf5d66@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 01/10/2024 16:17, Jan Beulich wrote:
> Locally override SYM_PUSH_SECTION() to retain the intended section
> association.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v7: New.
> 
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -48,13 +48,20 @@
>   
>           .section .text.header, "ax", %progbits
>           .arm
> +/*
> + * Code below wants to all live in the section established above.  Annotations
> + * from xen/linkage.h therefore may not switch sections (honoring
> + * CONFIG_CC_SPLIT_SECTIONS).  Override the respective macro.
> + */
> +#undef SYM_PUSH_SECTION
> +#define SYM_PUSH_SECTION(name, attr)

Are you suggesting the code in arch/*/head.S has a latent bug?

The rest lgtm to me pending the clarification.

Cheers,

-- 
Julien Grall


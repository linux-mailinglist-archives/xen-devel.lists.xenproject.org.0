Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4591B64192F
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 22:17:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452828.710624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1ZsD-0002Fn-Rg; Sat, 03 Dec 2022 21:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452828.710624; Sat, 03 Dec 2022 21:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1ZsD-0002Ca-Oo; Sat, 03 Dec 2022 21:16:37 +0000
Received: by outflank-mailman (input) for mailman id 452828;
 Sat, 03 Dec 2022 21:16:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p1ZsB-0002CU-Nk
 for xen-devel@lists.xenproject.org; Sat, 03 Dec 2022 21:16:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1ZsB-00041W-Es; Sat, 03 Dec 2022 21:16:35 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1ZsB-0004QM-9B; Sat, 03 Dec 2022 21:16:35 +0000
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
	bh=EYx8bGDzt1coCaZQbihsHFNcb2EfV7Gsmac0+VjzYa4=; b=haKQ1WwadDsCjqxl7D6YJw1xS2
	/lRulJCRf1fRLXcsUgHNZtguNhogcz/SQNf5FY2gXhUg9UkidTrjpMrUKZHIfHq4vHWDgwRQz++EG
	BAPFv8lSTBgymZzI1HDNq1etFoLocnIBj+FvYYvhJpeUaxawRWRnlcqARx2G1eFUkitY=;
Message-ID: <1479c5e5-2073-aa58-7078-581d73f493f6@xen.org>
Date: Sat, 3 Dec 2022 21:16:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 08/21] xen/arm: vsmmuv3: Add support for registers
 emulation
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <89018b50b5b0c2c4a406c5a8779b7fd33d59d1e4.1669888522.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <89018b50b5b0c2c4a406c5a8779b7fd33d59d1e4.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

I have only skimmed through the patch so far.

On 01/12/2022 16:02, Rahul Singh wrote:
>   static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>                                 register_t r, void *priv)
>   {
> +    struct virt_smmu *smmu = priv;
> +    uint64_t reg;
> +    uint32_t reg32;
> +
> +    switch ( info->gpa & 0xffff )
> +    {
> +    case VREG32(ARM_SMMU_CR0):


Shouldn't this code (and all the other register emulations) be protected 
for concurrent access in some way?


> +        reg32 = smmu->cr[0];
> +        vreg_reg32_update(&reg32, r, info);
> +        smmu->cr[0] = reg32;
> +        smmu->cr0ack = reg32 & ~CR0_RESERVED;

Looking at the use. I think it doesn't look necessary to have a copy of 
cr0 with just the reserved bit(s) unset. Instead, it would be better to 
clear the bit(s) when reading it.

Cheers,

-- 
Julien Grall


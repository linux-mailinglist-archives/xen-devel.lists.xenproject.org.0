Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B12607ADF56
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 20:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608082.946364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkqlu-0008Ca-DH; Mon, 25 Sep 2023 18:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608082.946364; Mon, 25 Sep 2023 18:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkqlu-00089O-9w; Mon, 25 Sep 2023 18:57:30 +0000
Received: by outflank-mailman (input) for mailman id 608082;
 Mon, 25 Sep 2023 18:57:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qkqls-00089E-QF
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 18:57:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qkqls-0007VB-Hx; Mon, 25 Sep 2023 18:57:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qkqls-0002pK-B4; Mon, 25 Sep 2023 18:57:28 +0000
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
	bh=VGVrASqdKrV1vbkKsT2pHMhZ3iZHRCtaOcauvZ/RjBc=; b=QDMt5Vd+hINkcSP/44Am/L+iV3
	kgXp79GOVr2ZBWR2r+OzDs6qps6hWWPZInORHfLByyUAmfMqkYVRyjGoJkjZAn14P9stGGLdIBX5F
	QqS7LMlX+XnMwPgV/W2dbIYi2aEQtvI4nB0pTPTjPVriZNTbFLt6pejisDHH5EELyQXQ=;
Message-ID: <48bb2e22-ba78-4f45-9783-d9e5f83e75d8@xen.org>
Date: Mon, 25 Sep 2023 19:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/13] xen/arm: Split page table related code to
 mmu/pt.c
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-7-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230828013224.669433-7-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

I haven't checked that the code movement is just a code movement. For 
now, I am mainly looking at the split.

On 28/08/2023 02:32, Henry Wang wrote:
> The extraction of MMU related code is the basis of MPU support.
> This commit starts this work by firstly splitting the page table
> related code to mmu/pt.c, so that we will not end up with again
> massive mm.c files.
> 
> Introduce a mmu specific directory and setup the Makefiles for it.
> Move the page table related functions and macros from arch/arm/mm.c
> to arch/arm/mmu/pt.c. Expose the previously static global variable
> "phys_offset".

I don't much like the idea to expose phys_offset everywhere. Looking at 
the code there are two users:
   * pte_of_xenaddr(): I realize you suggested to add it in pt.c and I 
agreed. However, looking at the split, this function is exclusively used 
for boot (and you confirmed below). So I think it would be preferable to 
move it in mmu/setup.c.
   * prepare_secondary_mm(): I think we could switch to virt_to_mfn().

I can understand if you don't want to make the second change. So I would 
at least request to ...

> 
> While moving, mark pte_of_xenaddr() as __init to make clear that
> this helper is only intended to be used during early boot.
> 
> Take the opportunity to fix the in-code comment coding styles when
> possible, and drop the unnecessary #include headers in the original
> arch/arm/mm.c.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v6:
> - Rework the original patch "[v5,07/13] xen/arm: Extract MMU-specific
>    code", only split the page table related code out in this patch.
> ---
>   xen/arch/arm/Makefile         |   1 +
>   xen/arch/arm/include/asm/mm.h |   2 +

... declare phys_offset in asm/mmu/mm.h because this variable doesn't 
make a lot of sense when the MPU is used (it will always be equal to 0).

The rest of the split looks good to me.


[...]

> -lpae_t pte_of_xenaddr(vaddr_t va)
> -{
> -    paddr_t ma = va + phys_offset;
> -
> -    return mfn_to_xen_entry(maddr_to_mfn(ma), MT_NORMAL);
> -}
> -

See above. I think this should stay here for now and the be moved to 
setup.c in a follow-up patch.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79587E2A66
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 17:54:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628218.979428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r02rH-0004PD-M1; Mon, 06 Nov 2023 16:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628218.979428; Mon, 06 Nov 2023 16:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r02rH-0004Mu-JI; Mon, 06 Nov 2023 16:53:51 +0000
Received: by outflank-mailman (input) for mailman id 628218;
 Mon, 06 Nov 2023 16:53:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r02rG-0004Mo-5c
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 16:53:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r02rF-0006oe-M4; Mon, 06 Nov 2023 16:53:49 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[192.168.14.214]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r02rF-0007o7-FH; Mon, 06 Nov 2023 16:53:49 +0000
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
	bh=btsdVK4i3azk38huuzg8H8AnqlWbJMY+Yd36RmWSKvQ=; b=6b4nlT7KpjDVzyEB9yZlSKcskF
	l5qxUPmIrCl2BHN/StTNLpALz3M+bnX1E8EDmRR4PIIwwpdd8K0tF3c9/ArSgzYqxS5Xx8jmi6Cjq
	1H7I9pDFlYAmOV++s/h9y8yx1i1DJwv1mNu2AE7Va87N5iJSyOnY1jWENM2YburX/ZNI=;
Message-ID: <fc503d74-7b08-4802-8b23-4809369a4ddb@xen.org>
Date: Mon, 6 Nov 2023 16:53:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <20231023021345.1731436-1-Henry.Wang@arm.com>
 <20231023021345.1731436-9-Henry.Wang@arm.com>
 <fcc12d0f-5529-4f2a-a721-f6f92410e5b7@xen.org>
 <EA7BFF62-76A3-494B-B3EF-67E0664F98E8@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <EA7BFF62-76A3-494B-B3EF-67E0664F98E8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 02/11/2023 00:35, Henry Wang wrote:
> Hi Julien,

Hi,

>> On Nov 2, 2023, at 02:34, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Henry,
>>
>> On 23/10/2023 03:13, Henry Wang wrote:
>>> From: Penny Zheng <penny.zheng@arm.com>
>>> Current P2M implementation is designed for MMU system only.
>>> We move the MMU-specific codes into mmu/p2m.c, and only keep generic
>>> codes in p2m.c, like VMID allocator, etc. We also move MMU-specific
>>> definitions and declarations to mmu/p2m.h, such as p2m_tlb_flush_sync().
>>> Also expose previously static functions p2m_vmid_allocator_init(),
>>> p2m_alloc_vmid() for further MPU usage. Since with the code movement
>>> p2m_free_vmid() is now used in two files, also expose p2m_free_vmid().
>>> With the code movement, global variable max_vmid is used in multiple
>>> files instead of a single file (and will be used in MPU P2M
>>> implementation), declare it in the header and remove the "static" of
>>> this variable.
>>> Also, since p2m_invalidate_root() should be MMU only and after the
>>> code movement the only caller of p2m_invalidate_root() outside of
>>> mmu/p2m.c is arch_domain_creation_finished(), creating a new function
>>> named p2m_domain_creation_finished() in mmu/p2m.c for the original
>>> code in arch_domain_creation_finished(), and marking
>>> p2m_invalidate_root() as static.
>>> Take the opportunity to fix the incorrect coding style when possible.
>>> When there is bit shift in macros, take the opportunity to add the
>>> missing 'U' as a compliance of MISRA.
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Thanks!
> 
>>
>> I think the series is now fully acked. But I will wait for 4.18 to be released before merging this series.
> 
> I think the third patch "xen/arm: Fold mmu_init_secondary_cpu() to head.S” will need the
> double check from your side :)

Oh yes :).

> 
> Here is what I have locally, to save time I will just show the content here for you to check,
> and I will push it in the next few days:
> 
> commit ba72d6dc17fd7ce9a863b9e00b06b33c069c7641
> Author: Henry Wang <Henry.Wang@arm.com>
> Date:   Wed Aug 23 17:59:50 2023 +0800
> 
>      xen/arm: Fold mmu_init_secondary_cpu() to head.S
> 
>      Currently mmu_init_secondary_cpu() only enforces the page table
>      should not contain mapping that are both Writable and eXecutables
>      after boot. To ease the arch/arm/mm.c split work, fold this function
>      to head.S.
> 
>      For arm32, the WXN bit cannot be set early because at the point when
>      the MMU is enabled, the page-tables may still contain mapping which
>      are writable and executable. Therefore, introduce an assembly macro
>      pt_enforce_wxn. The macro is called before secondary CPUs jumping
>      into the C world.
> 
>      For arm64, set the SCTLR_Axx_ELx_WXN flag right when the MMU is
>      enabled. This would avoid the extra TLB flush and SCTLR dance.
> 
>      Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>      Co-authored-by: Julien Grall <jgrall@amazon.com>
>      Signed-off-by: Julien Grall <jgrall@amazon.com>
>      Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

The commit message is clearer. Thanks! Feel free to add my tag for the 
next version:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


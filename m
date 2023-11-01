Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83707DE606
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 19:34:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626602.976985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyG2m-0002P7-26; Wed, 01 Nov 2023 18:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626602.976985; Wed, 01 Nov 2023 18:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyG2l-0002NY-Vd; Wed, 01 Nov 2023 18:34:19 +0000
Received: by outflank-mailman (input) for mailman id 626602;
 Wed, 01 Nov 2023 18:34:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qyG2k-0002NS-KX
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 18:34:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyG2k-00015F-6T; Wed, 01 Nov 2023 18:34:18 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[10.95.171.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyG2k-0001tC-10; Wed, 01 Nov 2023 18:34:18 +0000
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
	bh=2Adt2NmpNNgjOCwWSF7+q/eS2YQ4pS0NCKJxjFBT638=; b=wgtzeJ/ioPiI9qaYAIDFXYlClJ
	5BnTAPeUw2REM9kAL2uNsBZjM4et0Nsz/voRiI2M2rXZg36ic0mD01YLjy5G3qYMjVbnqRhcM/Hrb
	gd7NjVHJuVb7NoCM9GoJll2hF6OHAYCDBAAXoj6K+b7JQHHRfj3RtK+Lfw1sHhXyxOvc=;
Message-ID: <fcc12d0f-5529-4f2a-a721-f6f92410e5b7@xen.org>
Date: Wed, 1 Nov 2023 18:34:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <penny.zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20231023021345.1731436-1-Henry.Wang@arm.com>
 <20231023021345.1731436-9-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231023021345.1731436-9-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 23/10/2023 03:13, Henry Wang wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> Current P2M implementation is designed for MMU system only.
> We move the MMU-specific codes into mmu/p2m.c, and only keep generic
> codes in p2m.c, like VMID allocator, etc. We also move MMU-specific
> definitions and declarations to mmu/p2m.h, such as p2m_tlb_flush_sync().
> Also expose previously static functions p2m_vmid_allocator_init(),
> p2m_alloc_vmid() for further MPU usage. Since with the code movement
> p2m_free_vmid() is now used in two files, also expose p2m_free_vmid().
> 
> With the code movement, global variable max_vmid is used in multiple
> files instead of a single file (and will be used in MPU P2M
> implementation), declare it in the header and remove the "static" of
> this variable.
> 
> Also, since p2m_invalidate_root() should be MMU only and after the
> code movement the only caller of p2m_invalidate_root() outside of
> mmu/p2m.c is arch_domain_creation_finished(), creating a new function
> named p2m_domain_creation_finished() in mmu/p2m.c for the original
> code in arch_domain_creation_finished(), and marking
> p2m_invalidate_root() as static.
> 
> Take the opportunity to fix the incorrect coding style when possible.
> When there is bit shift in macros, take the opportunity to add the
> missing 'U' as a compliance of MISRA.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

I think the series is now fully acked. But I will wait for 4.18 to be 
released before merging this series.

Please remind me in a couple of weeks time if I forgot to merge it.

Cheers,

-- 
Julien Grall


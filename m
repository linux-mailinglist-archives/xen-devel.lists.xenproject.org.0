Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 250B9784910
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 20:02:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588639.920193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYVh4-0002KU-7n; Tue, 22 Aug 2023 18:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588639.920193; Tue, 22 Aug 2023 18:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYVh4-0002Ik-4v; Tue, 22 Aug 2023 18:01:30 +0000
Received: by outflank-mailman (input) for mailman id 588639;
 Tue, 22 Aug 2023 18:01:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYVh2-0002Ie-8l
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 18:01:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYVgl-0002ag-UV; Tue, 22 Aug 2023 18:01:11 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYVgl-0008Sm-Pz; Tue, 22 Aug 2023 18:01:11 +0000
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
	bh=2nZN30c0T8+kEB6r3uJXpTg0wzd12OJ4cIiiJX07xSM=; b=w2/d/ES8thZJcaYYXwtVv1j8qO
	FJcGO4bzqfFQ94xYWZhIezkwdvrNNp8zQGNzqnqpMQ9ZmlCSyK76TGwVstidBdSlojF+tb34YmYXx
	DnAy/GATuoZLbS+KZ8tdh72dzIYo1gOKSKqOb1v92yWmfB1qI5xY3C18yWGqXBGosT7U=;
Message-ID: <5356f905-4b14-46b4-b5b4-c236989e1ec8@xen.org>
Date: Tue, 22 Aug 2023 19:01:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/13] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <penny.zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-12-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814042536.878720-12-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 14/08/2023 05:25, Henry Wang wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> Current P2M implementation is designed for MMU system only.
> We move the MMU-specific codes into mmu/p2m.c, and only keep generic
> codes in p2m.c, like VMID allocator, etc. We also move MMU-specific
> definitions and declarations to mmu/p2m.h, such as p2m_tlb_flush_sync().
> Also expose previously static functions p2m_vmid_allocator_init(),
> p2m_alloc_vmid(), __p2m_set_entry() and setup_virt_paging_one()

Looking at the code, it seemsm that you need to keep expose 
__p2m_set_entry() because of p2m_relinquish_mapping(). However, it is 
not clear how this code is supposed to work for the MPU. So should we 
instead from p2m_relinquish_mapping() to mmu/p2m.c?

Other functions which doesn't seem to make sense in p2m.c are:
   * p2m_clear_root_pages(): AFAIU there is no concept of root in the 
MPU. This also means that we possibly want to move out anything specific 
to the MMU from 'struct p2m'. This could be done separately.
   * p2m_flush_vm(): This is built with MMU in mind as we can use the 
page-table to track access pages. You don't have that fine granularity 
in the MPU.

> for futher MPU usage.

typo: futher/further/

> 
> With the code movement, global variable max_vmid is used in multiple
> files instead of a single file (and will be used in MPU P2M
> implementation), declare it in the header and remove the "static" of
> this variable.
> 
> Add #ifdef CONFIG_HAS_MMU to p2m_write_unlock() since future MPU
> work does not need p2m_tlb_flush_sync().

And there are no specific barrier required? Overall, I am not sure I 
like the #ifdef rather than providing a stub helper.

If the other like the idea of the #ifdef. I think a comment on top would 
be necessary to explain why there is nothing to do in the context of the 
MPU.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF543BA9B2
	for <lists+xen-devel@lfdr.de>; Sat,  3 Jul 2021 19:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149549.276623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzjBW-000184-Dm; Sat, 03 Jul 2021 17:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149549.276623; Sat, 03 Jul 2021 17:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzjBW-00014n-9d; Sat, 03 Jul 2021 17:12:06 +0000
Received: by outflank-mailman (input) for mailman id 149549;
 Sat, 03 Jul 2021 17:12:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lzjBU-0000oO-Ne
 for xen-devel@lists.xenproject.org; Sat, 03 Jul 2021 17:12:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzjBU-0007cA-Fg; Sat, 03 Jul 2021 17:12:04 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzjBU-0005vs-7I; Sat, 03 Jul 2021 17:12:04 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=FR0yQDCD2iJpaV70AOOT+E3zRKLyD/84/EMXzs8PXvw=; b=zZ9vO3J39ZF/biDQHuJOiEOO7
	4ShvOFdqg6iNCoF7G/1vB3Zbg+oEe4b8sh2XDSLlkE9CdpFbfo1c8aTAAzK0eRUrxcm7IIrQG2557
	eTV9edB03YJBc5W8D8aZ/alX34kzdIOMlRt6xwND8xrjoLgnMKLYrukvjO6xAZdzpKz20=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 3/4] xen: arm: Remove mfn_to_gfn() macro
Date: Sat,  3 Jul 2021 18:11:51 +0100
Message-Id: <20210703171152.15874-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210703171152.15874-1-julien@xen.org>
References: <20210703171152.15874-1-julien@xen.org>

From: Julien Grall <julien.grall@arm.com>

The current implementation of mfn_to_gfn() is completely bogus and
there are no plan to implement an M2P on Arm. As there are no more
users, drop the helper.

At the same time rework a comment in Arm code that does not make sense.

Signed-off-by: Julien Grall <julien.grall@arm.com>

---
    Changes in v5:
        - Rebase to the latest Xen
        - The patch is now arm only because mfn_to_gmfn() has
        been dropped on x86 and the arm helper was renamed to
        mfn_to_gfn().

    Changes in v4:
        - Remove acks as the patch is old

    Changes in v2:
        - Add Jan's and Stefano's acked-by
---
 xen/include/asm-arm/mm.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index ded74d29da0c..07c24654a0b6 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -326,9 +326,8 @@ struct page_info *get_page_from_gva(struct vcpu *v, vaddr_t va,
 #define SHARED_M2P_ENTRY         (~0UL - 1UL)
 #define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
 
-/* Xen always owns P2M on ARM */
+/* We don't have a M2P on Arm */
 #define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
-#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
 
 /* Arch-specific portion of memory_op hypercall. */
 long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
-- 
2.17.1



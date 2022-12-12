Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B4C649BE1
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 11:17:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459398.717155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fsS-0007B1-TL; Mon, 12 Dec 2022 10:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459398.717155; Mon, 12 Dec 2022 10:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fsS-0006y9-Jl; Mon, 12 Dec 2022 10:17:40 +0000
Received: by outflank-mailman (input) for mailman id 459398;
 Mon, 12 Dec 2022 10:17:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fsP-0006gD-SB
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 10:17:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fsP-0002CR-HH; Mon, 12 Dec 2022 10:17:37 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fXG-0001lz-DC; Mon, 12 Dec 2022 09:55:46 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=ZGTi1zThIp+VUQ8tJlSSisRwmVvWp4XI48eN8oXi4Tw=; b=rjswrnAAF5OgLzMbILYUIK2t3H
	b1pKNrtbdntqdjM7uEKICfQjeEr9PPRKa6JP3QKoNBBVrEFbBJvsh71haoQ0sBSZgvHnCsuZNQ/2Z
	kjY7UKti19XwLs0ypiGUqn0OOTduUfDhNbJR5V2u+FJpAWpN029f7ol/A+ckVsXv7TYE=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Luca.Fancellu@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 17/18] xen/arm: linker: The identitymap check should cover the whole .text.header
Date: Mon, 12 Dec 2022 09:55:22 +0000
Message-Id: <20221212095523.52683-18-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212095523.52683-1-julien@xen.org>
References: <20221212095523.52683-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, we are only checking that only some part of .text.header
is part of the identity mapping. However, this doesn't take into account
the litteral pool which will be located at the end of the section.

While we could try to avoid using a literal pool, in the near future we
will also want to use an identity mapping for switch_ttbr().

Not everything in .text.header requires to be part of the identity
mapping. But it is below a page size (i.e. 4KB) so take a shortcut and
check that .text.header is smaller than a page size.

With that _end_boot can be removed as it is now unused. Take the
pportunity to avoid assuming that a page size is always 4KB in the
error message and comment.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---

    Changes in v3:
        - Patch added
---
 xen/arch/arm/arm32/head.S |  2 --
 xen/arch/arm/arm64/head.S |  2 --
 xen/arch/arm/xen.lds.S    | 10 +++++++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 2658625bc775..e47f90f15b3d 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -730,8 +730,6 @@ fail:   PRINT("- Boot failed -\r\n")
         b     1b
 ENDPROC(fail)
 
-GLOBAL(_end_boot)
-
 /*
  * Switch TTBR
  * r1:r0       ttbr
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 23c2c7491db2..663f5813b12e 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -812,8 +812,6 @@ fail:   PRINT("- Boot failed -\r\n")
         b     1b
 ENDPROC(fail)
 
-GLOBAL(_end_boot)
-
 /*
  * Switch TTBR
  *
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index ae8c3b4c6c5f..3f7ebd19f3ed 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -32,7 +32,9 @@ SECTIONS
   _start = .;
   .text : {
        _stext = .;             /* Text section */
+       _idmap_start = .;
        *(.text.header)
+       _idmap_end = .;
 
        *(.text.cold)
        *(.text.unlikely .text.*_unlikely .text.unlikely.*)
@@ -225,10 +227,12 @@ SECTIONS
 }
 
 /*
- * We require that Xen is loaded at a 4K boundary, so this ensures that any
- * code running on the boot time identity map cannot cross a section boundary.
+ * We require that Xen is loaded at a page boundary, so this ensures that any
+ * code running on the identity map cannot cross a section boundary.
  */
-ASSERT( _end_boot - start <= PAGE_SIZE, "Boot code is larger than 4K")
+ASSERT(IS_ALIGNED(_idmap_start, PAGE_SIZE), "_idmap_start should be page-aligned")
+ASSERT(_idmap_end - _idmap_start <= PAGE_SIZE, "Identity mapped code is larger than a page size")
+
 /*
  * __init_[begin|end] MUST be at word size boundary otherwise we cannot
  * write fault instructions in the space properly.
-- 
2.38.1



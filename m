Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 387AC73D433
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jun 2023 22:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554877.866346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfl-0004Fr-HB; Sun, 25 Jun 2023 20:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554877.866346; Sun, 25 Jun 2023 20:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfl-0004By-Dq; Sun, 25 Jun 2023 20:49:25 +0000
Received: by outflank-mailman (input) for mailman id 554877;
 Sun, 25 Jun 2023 20:49:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDWfj-0003s5-H5
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 20:49:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWfj-0003NJ-85; Sun, 25 Jun 2023 20:49:23 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWfj-00021M-0W; Sun, 25 Jun 2023 20:49:23 +0000
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
	bh=gXqnczAjb+wnpPlcEiazaR11OD9Idwd3JlF3anBSmFw=; b=M75UERkVFu8wYlEek+C2JfO+dv
	TQuIiQ7/8/x6ybcfQg6nQUAkWVJ+j7FiLj8nuoFsM5pOfYZ/hvJMuduIaPYsNytfkCids2kQ/Uzta
	z+2wjsPjKPTvP1KjE9MPrrAPtqiY3pt06ytqG6cXmWFvwN8CEMhOzXT69U5JKf/cfgxk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 6/9] xen/arm64: entry: Don't jump outside of an alternative
Date: Sun, 25 Jun 2023 21:49:04 +0100
Message-Id: <20230625204907.57291-7-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230625204907.57291-1-julien@xen.org>
References: <20230625204907.57291-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The instruction CBNZ can only jump to a pc-relative that is in the
range +/- 1MB.

Alternative instructions replacement are living in a separate
subsection of the init section. This is usually placed towards
the end of the linker. Whereas text is towards the beginning.

While today Xen is quite small (~1MB), it could grow up to
2MB in the current setup. So there is no guarantee that the
target address in the text section will be within the range +/-
1MB of the CBNZ in alternative section.

The easiest solution is to have the target address within the
same section of the alternative. This means that we need to
duplicate a couple of instructions.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

I couldn't come up with a solution that would not change the number
of instructions executed in the entry path.
---
 xen/arch/arm/arm64/entry.S | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
index 95f1a9268419..492591fdef54 100644
--- a/xen/arch/arm/arm64/entry.S
+++ b/xen/arch/arm/arm64/entry.S
@@ -242,13 +242,24 @@
         msr     daifclr, \iflags
         bl      enter_hypervisor_from_guest
 
+        /*
+         * CBNZ can only address an offset of +/- 1MB. This means, it is
+         * not possible to jump outside of an alternative because
+         * the .text section and .altinstr_replacement may be further
+         * appart. The easiest way is to duplicate the few instructions
+         * that need to be skipped.
+         */
         alternative_if SKIP_SYNCHRONIZE_SERROR_ENTRY_EXIT
-        cbnz    x19, 1f
-        alternative_else_nop_endif
-
-        mov     x0, sp
-        bl      do_trap_\trap
+        cbnz      x19, 1f
+        mov       x0, sp
+        bl        do_trap_\trap
 1:
+        alternative_else
+        nop
+        mov       x0, sp
+        bl        do_trap_\trap
+        alternative_endif
+
         exit    hyp=0, compat=\compat
         .endm
 
-- 
2.40.1



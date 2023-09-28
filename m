Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79957B28B3
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 01:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610075.949318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm0IL-0002v5-2S; Thu, 28 Sep 2023 23:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610075.949318; Thu, 28 Sep 2023 23:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm0IK-0002sX-VU; Thu, 28 Sep 2023 23:19:44 +0000
Received: by outflank-mailman (input) for mailman id 610075;
 Thu, 28 Sep 2023 23:19:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pu57=FM=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qm0IK-0002sR-DA
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 23:19:44 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80e37062-5e55-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 01:19:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B139D82856BA;
 Thu, 28 Sep 2023 18:19:41 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id kpdzDgLxv7cd; Thu, 28 Sep 2023 18:19:39 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0B06B82856A3;
 Thu, 28 Sep 2023 18:19:39 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id aFswkOKDHXrZ; Thu, 28 Sep 2023 18:19:38 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 6651D8284D90;
 Thu, 28 Sep 2023 18:19:38 -0500 (CDT)
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
X-Inumbo-ID: 80e37062-5e55-11ee-878b-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0B06B82856A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695943179; bh=WMnR/C+eSXX7X3ub66zwiAaYNV2V3FLjeRwKCWkfcKI=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=dHYb9QEidfv4o3XuTsIdia8HCBvDOUo1Rm9h2eMv2nFnWi/LVzI7x/9BTm74awf3y
	 ABxH4u/8ZHSiRiLEd72Q+qaGCa+ueJXuIKPMV7lm949p7iG6WCECGdQd+/dfyuEiue
	 qGMb03rzWjV/71/Tftxl67vS0B32CGhc54urHpco=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 2/3] xen/ppc: Add .text.exceptions section for exception vectors
Date: Thu, 28 Sep 2023 18:19:28 -0500
Message-Id: <de5b99d79671a7fe11c5720797aaa6e3207661d1.1695942864.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1695942864.git.sanastasio@raptorengineering.com>
References: <cover.1695942864.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Power, the exception vectors must lie at a fixed address, depending
on the state of the Alternate Interrupt Location (AIL) field of the
Logical Partition Control Register (LPCR). Create a .text.exceptions
section in the linker script at an address suitable for AIL=3 plus an
accompanying assertion to pave the way for implementing exception
support.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/include/asm/config.h | 3 +++
 xen/arch/ppc/xen.lds.S            | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/xen/arch/ppc/include/asm/config.h b/xen/arch/ppc/include/asm/config.h
index a11a09c570..e012b75beb 100644
--- a/xen/arch/ppc/include/asm/config.h
+++ b/xen/arch/ppc/include/asm/config.h
@@ -42,6 +42,9 @@
 
 #define XEN_VIRT_START _AC(0xc000000000000000, UL)
 
+/* Fixed address for start of the section containing exception vectors */
+#define EXCEPTION_VECTORS_START _AC(0xc000000000000100, UL)
+
 #define VMAP_VIRT_START (XEN_VIRT_START + GB(1))
 #define VMAP_VIRT_SIZE  GB(1)
 
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 9e46035155..9e888d7383 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -24,6 +24,10 @@ SECTIONS
         _stext = .;            /* Text section */
         *(.text.header)
 
+        . = ALIGN(256);
+        _stext_exceptions = .;
+        *(.text.exceptions)
+
         *(.text.cold)
         *(.text.unlikely .text.*_unlikely .text.unlikely.*)
 
@@ -184,3 +188,6 @@ ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
 
 ASSERT(!SIZEOF(.got),      ".got non-empty")
 ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
+
+ASSERT(_stext_exceptions == EXCEPTION_VECTORS_START, \
+       ".text.exceptions not at expected location -- .text.header too big?");
-- 
2.30.2



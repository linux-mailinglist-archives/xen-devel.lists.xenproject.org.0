Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB717D7821
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 00:41:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623371.971194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvmZ8-0008Ul-Gu; Wed, 25 Oct 2023 22:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623371.971194; Wed, 25 Oct 2023 22:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvmZ8-0008Nk-C4; Wed, 25 Oct 2023 22:41:30 +0000
Received: by outflank-mailman (input) for mailman id 623371;
 Wed, 25 Oct 2023 22:41:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm7K=GH=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qvmZ6-0008LH-Rl
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 22:41:28 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0fb7bf5-7387-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 00:41:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id EFF8382858BE;
 Wed, 25 Oct 2023 17:41:24 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Yf4w_PtXPaho; Wed, 25 Oct 2023 17:41:24 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2A89782857E5;
 Wed, 25 Oct 2023 17:41:24 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id uTmIplDbMA0u; Wed, 25 Oct 2023 17:41:24 -0500 (CDT)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id B828482858AF;
 Wed, 25 Oct 2023 17:41:23 -0500 (CDT)
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
X-Inumbo-ID: a0fb7bf5-7387-11ee-9b0e-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 2A89782857E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1698273684; bh=zKC200HDJpwlBO1CM8epP2u5TjCJL8NmxYMqlWHuHog=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=A+d63t6KEThf3iZbRrX0ZfEWpuW8hbYxXWjduU0Aeu3/5vyjzR3qjrQULQssItZMY
	 XZdfr7fNv+5G6ybar4tbcs/Ajru/q1MDjv7CluDCauhR6l/J7ftFnQVJR7p8h51+SX
	 plmY9s4W6nbNS1TXvoNbZMqVIXQaBsom5wDgp4t4=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 1/2] xen/ppc: Add .text.exceptions section for exception vectors
Date: Wed, 25 Oct 2023 17:41:03 -0500
Message-Id: <b2cdb7bd3bc14723af3d0e67bb1d97f32321e93f.1698273423.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1698273423.git.sanastasio@raptorengineering.com>
References: <cover.1698273423.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Power, the exception vectors must lie at a fixed address, depending
on the state of the Alternate Interrupt Location (AIL) field of the
Logical Partition Control Register (LPCR). Create a .text.exceptions
section in the linker script at an address suitable for AIL=3 plus an
accompanying assertion to pave the way for implementing exception
support.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
index 9e46035155..3697d656f4 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -24,6 +24,10 @@ SECTIONS
         _stext = .;            /* Text section */
         *(.text.header)
 
+        . = ALIGN(256);
+        HIDDEN(_stext_exceptions = .);
+        *(.text.exceptions)
+
         *(.text.cold)
         *(.text.unlikely .text.*_unlikely .text.unlikely.*)
 
@@ -184,3 +188,6 @@ ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
 
 ASSERT(!SIZEOF(.got),      ".got non-empty")
 ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
+
+ASSERT(_stext_exceptions == EXCEPTION_VECTORS_START,
+       ".text.exceptions not at expected location -- .text.header too big?");
-- 
2.30.2



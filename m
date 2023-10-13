Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F36227C8CEA
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 20:14:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616852.959159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMfm-0006sd-N9; Fri, 13 Oct 2023 18:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616852.959159; Fri, 13 Oct 2023 18:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMfm-0006ps-K8; Fri, 13 Oct 2023 18:14:06 +0000
Received: by outflank-mailman (input) for mailman id 616852;
 Fri, 13 Oct 2023 18:14:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m8jO=F3=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qrMfk-0006SD-Jv
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 18:14:04 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49464093-69f4-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 20:14:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 064578285879;
 Fri, 13 Oct 2023 13:14:01 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ujKDjrMCklCW; Fri, 13 Oct 2023 13:13:59 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 64D6182859E9;
 Fri, 13 Oct 2023 13:13:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LR7Q48rUtgVq; Fri, 13 Oct 2023 13:13:59 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 0B1DF8285942;
 Fri, 13 Oct 2023 13:13:59 -0500 (CDT)
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
X-Inumbo-ID: 49464093-69f4-11ee-9b0e-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 64D6182859E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1697220839; bh=x6jA8BhTGfzEg5hk7ueBZFqYcBPdz+Oto5ItjZfyC9c=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=EVczAvbcskwkYH1swRWD/MFi6RXjl5qFTCF81QVYVrQ1pBKR+6Yoeui/UosaLCoeQ
	 Zg3N4hIOjlWC86CWAAXxiINcPNsL17PBgeEcwW0q0wf/0gRY1Dw6ShNE3QgroQgyd5
	 3psex3aKuOC2GPUE9u3lEoPNX1AAt+fa2q1BFiTc=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 1/2] xen/ppc: Add .text.exceptions section for exception vectors
Date: Fri, 13 Oct 2023 13:13:47 -0500
Message-Id: <f06ee2e5d836a64277bed6d9c6c1367dc0627dc8.1697220184.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1697220184.git.sanastasio@raptorengineering.com>
References: <cover.1697220184.git.sanastasio@raptorengineering.com>
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
v2:
  - Wrap _stext_exceptions definition with HIDDEN()
  - Drop unnecessary line-continuing backslash in ASSERT

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
index 9e46035155..1479ec9f9f 100644
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA455333A71
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 11:44:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95959.181232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwJf-00034c-H9; Wed, 10 Mar 2021 10:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95959.181232; Wed, 10 Mar 2021 10:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwJf-00034D-Ds; Wed, 10 Mar 2021 10:43:47 +0000
Received: by outflank-mailman (input) for mailman id 95959;
 Wed, 10 Mar 2021 10:43:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iqsa=II=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lJwJe-000348-0R
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 10:43:46 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cd3f677c-babd-48ef-b53d-6dc2017b9d0b;
 Wed, 10 Mar 2021 10:43:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE6171FB;
 Wed, 10 Mar 2021 02:43:43 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.15.227])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0907B3F85F;
 Wed, 10 Mar 2021 02:43:42 -0800 (PST)
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
X-Inumbo-ID: cd3f677c-babd-48ef-b53d-6dc2017b9d0b
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	andrew.cooper3@citrix.com,
	amc96@cam.ac.uk
Subject: [XTF 1/4] xtf: Perform misc code cleanup
Date: Wed, 10 Mar 2021 11:43:32 +0100
Message-Id: <20210310104335.14855-2-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210310104335.14855-1-michal.orzel@arm.com>
References: <20210310104335.14855-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

-define macro ALIGN to set alignment:
Header file asm_macros.h should not contain
architecture specific code. Replace hardcoded
alignment value with a call to macro ALIGN.

-move declaration of shared_info into xtf/traps.h:
Declaration of shared_info structure should be
placed in xtf/traps.h as it is a common declaration
for all the possible architectures.

-do not protect including <arch/barrier.h>
We should always include <arch/barrier.h> and rely
on the compiler to throw an error. This would avoid
increasing #if protection each time we would add
a new architecture.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 arch/x86/include/arch/asm_macros.h | 2 ++
 arch/x86/include/arch/traps.h      | 1 -
 include/xtf/asm_macros.h           | 2 +-
 include/xtf/barrier.h              | 4 ----
 include/xtf/traps.h                | 2 ++
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/arch/asm_macros.h b/arch/x86/include/arch/asm_macros.h
index e12e1ba..1aabed5 100644
--- a/arch/x86/include/arch/asm_macros.h
+++ b/arch/x86/include/arch/asm_macros.h
@@ -15,6 +15,8 @@
 # define __ASM_CODE_RAW(x) #x
 #endif
 
+#define ALIGN .align 16
+
 /* Select between two variations based on compat or long mode. */
 #ifdef __i386__
 # define __ASM_SEL(c, l)     __ASM_CODE(c)
diff --git a/arch/x86/include/arch/traps.h b/arch/x86/include/arch/traps.h
index 0c6888b..60fc3a4 100644
--- a/arch/x86/include/arch/traps.h
+++ b/arch/x86/include/arch/traps.h
@@ -57,7 +57,6 @@ extern uint8_t user_stack[PAGE_SIZE];
 
 extern xen_pv_start_info_t *pv_start_info;
 extern xen_pvh_start_info_t *pvh_start_info;
-extern shared_info_t shared_info;
 
 /*
  * Parameters for fine tuning the exec_user_*() behaviour.
diff --git a/include/xtf/asm_macros.h b/include/xtf/asm_macros.h
index 5484f7c..c531355 100644
--- a/include/xtf/asm_macros.h
+++ b/include/xtf/asm_macros.h
@@ -25,7 +25,7 @@
  * @param name Function name.
  */
 #define ENTRY(name)                             \
-    .align 16;                                  \
+    ALIGN;                                      \
     GLOBAL(name)
 
 /**
diff --git a/include/xtf/barrier.h b/include/xtf/barrier.h
index b526fe1..3b02d49 100644
--- a/include/xtf/barrier.h
+++ b/include/xtf/barrier.h
@@ -1,11 +1,7 @@
 #ifndef XTF_BARRIER_H
 #define XTF_BARRIER_H
 
-#if defined(__x86_64__) || defined (__i386__)
 # include <arch/barrier.h>
-#else
-# error Bad architecture
-#endif
 
 #endif /* XTF_BARRIER_H */
 
diff --git a/include/xtf/traps.h b/include/xtf/traps.h
index 8fc66af..4081db6 100644
--- a/include/xtf/traps.h
+++ b/include/xtf/traps.h
@@ -6,6 +6,8 @@
 
 #include <arch/traps.h>
 
+extern shared_info_t shared_info;
+
 /**
  * May be implemented by a guest to provide custom exception handling.
  */
-- 
2.29.0



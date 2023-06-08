Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E43F772820A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 16:00:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545300.851654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7GAk-0001ac-AU; Thu, 08 Jun 2023 13:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545300.851654; Thu, 08 Jun 2023 13:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7GAk-0001YO-6d; Thu, 08 Jun 2023 13:59:30 +0000
Received: by outflank-mailman (input) for mailman id 545300;
 Thu, 08 Jun 2023 13:59:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pjZV=B4=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1q7GAi-0001YD-2k
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 13:59:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ac27c465-0604-11ee-8611-37d641c3527e;
 Thu, 08 Jun 2023 15:59:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DE77AB6;
 Thu,  8 Jun 2023 07:00:08 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5A413F6C4;
 Thu,  8 Jun 2023 06:59:21 -0700 (PDT)
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
X-Inumbo-ID: ac27c465-0604-11ee-8611-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/2] tools: Fix ifdef for aarch64 that should include also arm
Date: Thu,  8 Jun 2023 14:59:12 +0100
Message-Id: <20230608135913.560413-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 56a7aaa16bfe introduced some SVE related code that is protected by
'#if defined(__aarch64__)', the issue is that this doesn't take into
consideration when the toolstack is compiled for an arm32 Dom0 running on
an arm64 platform, it should be able to create SVE enabled guests but with
the current code it's not.

So fix the issue by compiling the code when the toolstack is compiled for
both arm32 and arm64.

Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling for Arm")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 tools/include/xen-tools/arm-arch-capabilities.h | 2 +-
 tools/python/xen/lowlevel/xc/xc.c               | 2 +-
 tools/xl/xl_info.c                              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/include/xen-tools/arm-arch-capabilities.h b/tools/include/xen-tools/arm-arch-capabilities.h
index 3849e897925d..4aa4c6c34a99 100644
--- a/tools/include/xen-tools/arm-arch-capabilities.h
+++ b/tools/include/xen-tools/arm-arch-capabilities.h
@@ -14,7 +14,7 @@
 static inline
 unsigned int arch_capabilities_arm_sve(unsigned int arch_capabilities)
 {
-#if defined(__aarch64__)
+#if defined(__arm__) || defined(__aarch64__)
     unsigned int sve_vl = MASK_EXTR(arch_capabilities,
                                     XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
 
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index 491e88977fd3..e14e223ec903 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -911,7 +911,7 @@ static PyObject *pyxc_physinfo(XcObject *self)
                            "hw_caps",          cpu_cap,
                            "virt_caps",        virt_caps);
 
-#if defined(__aarch64__)
+#if defined(__arm__) || defined(__aarch64__)
     if ( objret ) {
         unsigned int sve_vl_bits;
         PyObject *py_arm_sve_vl;
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index ddc42f96b979..72e87eac46d1 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -226,7 +226,7 @@ static void output_physinfo(void)
         );
 
     /* Print arm SVE vector length only on ARM platforms */
-#if defined(__aarch64__)
+#if defined(__arm__) || defined(__aarch64__)
     maybe_printf("arm_sve_vector_length  : %u\n",
          arch_capabilities_arm_sve(info.arch_capabilities)
         );
-- 
2.34.1



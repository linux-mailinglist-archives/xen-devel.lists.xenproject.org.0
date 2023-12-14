Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A69E7812F0C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 12:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654488.1021418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDk8Y-0001RR-Kr; Thu, 14 Dec 2023 11:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654488.1021418; Thu, 14 Dec 2023 11:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDk8Y-0001Os-BK; Thu, 14 Dec 2023 11:44:18 +0000
Received: by outflank-mailman (input) for mailman id 654488;
 Thu, 14 Dec 2023 11:44:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=57RS=HZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rDk8W-00016v-Ma
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 11:44:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ad1456f-9a76-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 12:44:14 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 913AC4EE0743;
 Thu, 14 Dec 2023 12:44:13 +0100 (CET)
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
X-Inumbo-ID: 1ad1456f-9a76-11ee-9b0f-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 1/5] xen/hvm: use NULL as a null pointer constant
Date: Thu, 14 Dec 2023 12:44:06 +0100
Message-Id: <7c52d4b78785a56aee1ffc3661503bdd145595d9.1702553835.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702553835.git.nicola.vetrini@bugseng.com>
References: <cover.1702553835.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/include/asm/hvm/irq.h | 2 +-
 xen/include/public/hvm/save.h      | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/irq.h b/xen/arch/x86/include/asm/hvm/irq.h
index 1817ca6e2d22..87e89993a44f 100644
--- a/xen/arch/x86/include/asm/hvm/irq.h
+++ b/xen/arch/x86/include/asm/hvm/irq.h
@@ -136,7 +136,7 @@ struct hvm_girq_dpci_mapping {
 
 #define NR_ISAIRQS  16
 #define NR_LINK     4
-#define NR_HVM_DOMU_IRQS ARRAY_SIZE(((struct hvm_hw_vioapic *)0)->redirtbl)
+#define NR_HVM_DOMU_IRQS ARRAY_SIZE(((struct hvm_hw_vioapic *)NULL)->redirtbl)
 
 /* Protected by domain's event_lock */
 struct hvm_irq_dpci {
diff --git a/xen/include/public/hvm/save.h b/xen/include/public/hvm/save.h
index 2cf4238daaa1..42e8ff55b5b9 100644
--- a/xen/include/public/hvm/save.h
+++ b/xen/include/public/hvm/save.h
@@ -65,15 +65,15 @@ struct hvm_save_descriptor {
     struct __HVM_SAVE_TYPE_##_x { _type t; char c[_code]; char cpt[1];}
 #endif
 
-#define HVM_SAVE_TYPE(_x) __typeof__ (((struct __HVM_SAVE_TYPE_##_x *)(0))->t)
+#define HVM_SAVE_TYPE(_x) __typeof__ (((struct __HVM_SAVE_TYPE_##_x *)(NULL))->t)
 #define HVM_SAVE_LENGTH(_x) (sizeof (HVM_SAVE_TYPE(_x)))
-#define HVM_SAVE_CODE(_x) (sizeof (((struct __HVM_SAVE_TYPE_##_x *)(0))->c))
+#define HVM_SAVE_CODE(_x) (sizeof (((struct __HVM_SAVE_TYPE_##_x *)(NULL))->c))
 
 #ifdef __XEN__
-# define HVM_SAVE_TYPE_COMPAT(_x) __typeof__ (((struct __HVM_SAVE_TYPE_COMPAT_##_x *)(0))->t)
+# define HVM_SAVE_TYPE_COMPAT(_x) __typeof__ (((struct __HVM_SAVE_TYPE_COMPAT_##_x *)(NULL))->t)
 # define HVM_SAVE_LENGTH_COMPAT(_x) (sizeof (HVM_SAVE_TYPE_COMPAT(_x)))
 
-# define HVM_SAVE_HAS_COMPAT(_x) (sizeof (((struct __HVM_SAVE_TYPE_##_x *)(0))->cpt)-1)
+# define HVM_SAVE_HAS_COMPAT(_x) (sizeof (((struct __HVM_SAVE_TYPE_##_x *)(NULL))->cpt)-1)
 # define HVM_SAVE_FIX_COMPAT(_x, _dst, _size) __HVM_SAVE_FIX_COMPAT_##_x(_dst, _size)
 #endif
 
-- 
2.34.1



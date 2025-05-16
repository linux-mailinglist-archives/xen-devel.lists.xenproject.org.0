Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A7EAB98E0
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 11:32:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986617.1372150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrPu-0007wS-MN; Fri, 16 May 2025 09:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986617.1372150; Fri, 16 May 2025 09:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrPu-0007vD-J6; Fri, 16 May 2025 09:31:46 +0000
Received: by outflank-mailman (input) for mailman id 986617;
 Fri, 16 May 2025 09:31:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3cFQ=YA=bounce.vates.tech=bounce-md_30504962.682705f9.v1-ff315deb4bd344d39271417cf5ae7a76@srs-se1.protection.inumbo.net>)
 id 1uFrPt-0007iv-MZ
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 09:31:45 +0000
Received: from mail133-28.atl131.mandrillapp.com
 (mail133-28.atl131.mandrillapp.com [198.2.133.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94541256-3238-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 11:31:44 +0200 (CEST)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-28.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4ZzMKP3MYszMQxXQJ
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 09:31:37 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ff315deb4bd344d39271417cf5ae7a76; Fri, 16 May 2025 09:31:37 +0000
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
X-Inumbo-ID: 94541256-3238-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747387897; x=1747657897;
	bh=Bm3fwAmp4WAbuBybmOkVHtGEJRz6Fv9FQEpbNnQjujk=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1Gc0hXi6YayeadhiAlCyKeJLWh2XbM+glWXIDDxBW9wVcyWvL7PzQBZzvVO1XZwpd
	 FL23g+zTG72IuyzKi8Woo8O1nKuCvU/569B2ne9CJaoKd75adM2kAMXckw0OMaHpo9
	 cdePv1QaI5fgDYBnnj/KS+iy6C9S2vBROGvDxb2KCNKSJUVk8FwgOE94GzYxy8k9x+
	 MVFFVtycWnh3vxtbDMZp0G7v9OIYPV0L7BPr9poymPmlcLMizOlV4pd5Y2SMxEFVnJ
	 nT49qfa4s7LgtWqp4WVPM8n1IYePT5SP4egvikS0J7omD7vp8rIO9DFuaZ4wo8EDrT
	 gSH+7y+Gl9+ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747387897; x=1747648397; i=teddy.astie@vates.tech;
	bh=Bm3fwAmp4WAbuBybmOkVHtGEJRz6Fv9FQEpbNnQjujk=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RAw6lC0xk7AIzin+hubuQg5zDWFx+wP+WCFQi4xWdPN9wQVQgm3Pi5aSY789FCQTz
	 /G32elnJqJapnDKel/6uItODiq6PRgRv2QIHnubIHrNzTprARNqoSnAfrX04goK7ZZ
	 cQIwOULtIFKg3W16iyu4eAcpulgde5EPTCNaRyZN4MnptBl/e2mXUnAQGkDX0D3ddK
	 LogKQYkqX3Y5Am9LANp8l8OZEy7DsOWix+x7S5+pRzZdEjfymglXhD5zThAWpfbp1O
	 JlX1E024o8OV8Bx+HVoO88Eh+Fd5X9Hr+1LlsDSECAntyLf6hUxoERFM7ftxjCJRNZ
	 5sUfV0+wO7VRQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=2002/16]=20x86/svm:=20Move=20svm=5Fdomain=20structure=20to=20svm.h?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747387896340
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <ed6f03900e75a3b0fe620096ac01f067e7085521.1747312394.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1747312394.git.teddy.astie@vates.tech>
References: <cover.1747312394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ff315deb4bd344d39271417cf5ae7a76?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 09:31:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

struct svm_domain was in vmcb.h which is meant for VMCB specific
operations and values, move it to svm.h where it belongs.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/include/asm/hvm/domain.h   |  1 +
 xen/arch/x86/include/asm/hvm/svm/svm.h  | 11 +++++++++++
 xen/arch/x86/include/asm/hvm/svm/vmcb.h | 11 -----------
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 333501d5f2..2608bcfad2 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -16,6 +16,7 @@
 #include <asm/hvm/io.h>
 #include <asm/hvm/vmx/vmcs.h>
 #include <asm/hvm/svm/vmcb.h>
+#include <asm/hvm/svm/svm.h>
 
 #ifdef CONFIG_MEM_SHARING
 struct mem_sharing_domain
diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
index 4eeeb25da9..32f6e48e30 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -21,6 +21,17 @@ bool svm_load_segs(unsigned int ldt_ents, unsigned long ldt_base,
                    unsigned long fs_base, unsigned long gs_base,
                    unsigned long gs_shadow);
 
+struct svm_domain {
+    /* OSVW MSRs */
+    union {
+        uint64_t raw[2];
+        struct {
+            uint64_t length;
+            uint64_t status;
+        };
+    } osvw;
+};
+
 extern u32 svm_feature_flags;
 
 #define SVM_FEATURE_NPT            0 /* Nested page table support */
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index 28f715e376..3d871b6135 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -548,17 +548,6 @@ struct vmcb_struct {
     u64 res18[291];
 };
 
-struct svm_domain {
-    /* OSVW MSRs */
-    union {
-        uint64_t raw[2];
-        struct {
-            uint64_t length;
-            uint64_t status;
-        };
-    } osvw;
-};
-
 /*
  * VMRUN doesn't switch fs/gs/tr/ldtr and SHADOWGS/SYSCALL/SYSENTER state.
  * Therefore, guest state is in the hardware registers when servicing a
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C860AC8A37
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 10:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000599.1380828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKvUm-0006wm-UA; Fri, 30 May 2025 08:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000599.1380828; Fri, 30 May 2025 08:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKvUm-0006uy-RV; Fri, 30 May 2025 08:53:44 +0000
Received: by outflank-mailman (input) for mailman id 1000599;
 Fri, 30 May 2025 08:53:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Zpg=YO=bounce.vates.tech=bounce-md_30504962.68397214.v1-c7effae4a453497d94d501d7ca116e40@srs-se1.protection.inumbo.net>)
 id 1uKvUl-0006uq-KI
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 08:53:44 +0000
Received: from mail145-2.atl61.mandrillapp.com
 (mail145-2.atl61.mandrillapp.com [198.2.145.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95e4fc80-3d33-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 10:53:42 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-2.atl61.mandrillapp.com (Mailchimp) with ESMTP id 4b7xq901nGzQXk4xS
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 08:53:41 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c7effae4a453497d94d501d7ca116e40; Fri, 30 May 2025 08:53:40 +0000
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
X-Inumbo-ID: 95e4fc80-3d33-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1748595221; x=1748865221;
	bh=sAnn1vNOxgAZHvWSPOmwAF0lrB3bmqpJkYpIh4BgxHg=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=aa55YgKyKTuO9b/1CN0y7Ty/VtKBY6jN6aXmoHp+sLYeWOEZYGnXUPq9E94hIzdNE
	 KEDSK+vuu0uQizsjKAVbVBUOLOO4lBNKnriKeP8G73qlpgt5izf7AgxqkmNrtGYRks
	 mSPoxoj0y+f8Uob6/dKygBdOPpclFNLXPEpkhNiaya0MdhgksaZ2tXbEYbm3TwA3SN
	 lwq1BT99Yh5sBhMqaNe3RdM8OGdCTIISRJ4FdAD0rliBoZu6NhIk/2wRCBti4AS0sQ
	 FFVKVeZpD6DxJLZjCMdwh5RueqlsnsizXQclWR4uNEwmtlrEa4tG/1uUlWtS7+BI/j
	 JuBUPz6a6ptLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1748595221; x=1748855721; i=teddy.astie@vates.tech;
	bh=sAnn1vNOxgAZHvWSPOmwAF0lrB3bmqpJkYpIh4BgxHg=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=f04HdV0wylu7YsOZzrHbXhnP6Wa4+Ov7V8WBThRG5tQ1Yq3t15FKPM3TEUAfG5YJe
	 h73lcqnl4/Q+dxw4FXVH3NBtRh7gGF78ujyHP62xUWbAfvvSD3TBPjJkH0xLZvSvoT
	 NjpFU/9yTYU2oN2n+Nd4DemaHB2Vpm8C6n1fjAJQdBQtEvWwz3WYHq647W1KVXllvu
	 VG7QoywdF55vk8Ws9Sgl+p6cna/pBZ5/L0YeJ+qoctPJDtsXLzntxuQ6zCMKlkYira
	 KTrTeFnvMf04P0V8FZQPA++VYLxal5oP0C7nTLJABvzK8t5RhWJRBw/a17LIN9yEnB
	 Kec17nTvJNDlw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20x86/svm:=20Move=20svm=5Fdomain=20structure=20to=20svm.h?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1748595219846
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <f55cf69b228e77b736fe1969515cf561e3967d46.1748595000.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c7effae4a453497d94d501d7ca116e40?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250530:md
Date: Fri, 30 May 2025 08:53:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

struct svm_domain was in vmcb.h which is meant for VMCB specific operations and
constants, move it to svm.h where it belongs.

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



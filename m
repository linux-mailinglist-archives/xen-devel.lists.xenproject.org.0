Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F7C8A6445
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 08:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706661.1103957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwca5-0003Ln-PR; Tue, 16 Apr 2024 06:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706661.1103957; Tue, 16 Apr 2024 06:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwca5-0003K2-MV; Tue, 16 Apr 2024 06:46:13 +0000
Received: by outflank-mailman (input) for mailman id 706661;
 Tue, 16 Apr 2024 06:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uDI1=LV=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1rwca4-0003Jw-5T
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 06:46:12 +0000
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01f140a4-fbbd-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 08:46:10 +0200 (CEST)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 37F031D0A31;
 Tue, 16 Apr 2024 02:46:09 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 2FD301D0A30;
 Tue, 16 Apr 2024 02:46:09 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 495981D0A2F;
 Tue, 16 Apr 2024 02:46:08 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 01f140a4-fbbd-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=KaEzanhccZjO7IvRYu+AvlrfcyDTCZszIXSID2e2aqc=; b=o1Yd
	N2xvtIDjh0Zts+MV4iuAFUTOxCRn6dUcNNwWVWW8c8dWjRdQx01jkhWWiRhkK8W0
	CaYvUjgqYrH7AtrjCKeEp9WpRGdl6hJbxQPK5okWuo54ocaZB8+lmrX4hYg5XITN
	hQFa1IGPx5GGe6GHeGLjlWZzBtCAwfZDbp0lwL8=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [XEN PATCH v1 13/15] x86: wire cpu_has_{svm/vmx}_* to false when svm/vmx not enabled
Date: Tue, 16 Apr 2024 09:46:06 +0300
Message-Id: <20240416064606.3470052-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 013B9CD2-FBBD-11EE-8A6E-78DCEB2EC81B-90055647!pb-smtp1.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Xenia Ragiadakou <burzalodowa@gmail.com>

To be able to use cpu_has_{svm/vmx}_* macros in common code without enclo=
sing
them inside #ifdef guards when the respective virtualization technology i=
s
not enabled, define corresponding helper routines as false when not appli=
cable.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/include/asm/hvm/svm/svm.h  | 8 ++++++++
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/includ=
e/asm/hvm/svm/svm.h
index 4eeeb25da9..7e8cdb4a27 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -38,10 +38,18 @@ extern u32 svm_feature_flags;
 #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
 #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
=20
+#ifdef CONFIG_SVM
 static inline bool cpu_has_svm_feature(unsigned int feat)
 {
     return svm_feature_flags & (1u << feat);
 }
+#else
+static inline bool cpu_has_svm_feature(unsigned int feat)
+{
+    return false;
+}
+#endif
+
 #define cpu_has_svm_npt       cpu_has_svm_feature(SVM_FEATURE_NPT)
 #define cpu_has_svm_lbrv      cpu_has_svm_feature(SVM_FEATURE_LBRV)
 #define cpu_has_svm_svml      cpu_has_svm_feature(SVM_FEATURE_SVML)
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/inclu=
de/asm/hvm/vmx/vmcs.h
index fd197e2603..2d927d3100 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -287,10 +287,17 @@ extern uint64_t vmx_tertiary_exec_control;
 #define VMX_VPID_INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL 0x80000000000UL=
L
 extern u64 vmx_ept_vpid_cap;
=20
+#ifdef CONFIG_VMX
 static inline bool vmx_ctrl_has_feature(uint64_t control, unsigned long =
feature)
 {
     return control & feature;
 }
+#else
+static inline bool vmx_ctrl_has_feature(uint64_t control, unsigned long =
feature)
+{
+    return false;
+}
+#endif
=20
 #define VMX_MISC_ACTIVITY_MASK                  0x000001c0
 #define VMX_MISC_PROC_TRACE                     0x00004000
--=20
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E2998DF14
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 17:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808906.1221040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1GV-0001Hh-7L; Wed, 02 Oct 2024 15:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808906.1221040; Wed, 02 Oct 2024 15:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1GU-00018O-W1; Wed, 02 Oct 2024 15:27:46 +0000
Received: by outflank-mailman (input) for mailman id 808906;
 Wed, 02 Oct 2024 15:27:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VgkK=Q6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sw1GS-00070n-G8
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 15:27:44 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id deb2ef59-80d2-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 17:27:44 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso187271366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 08:27:44 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c299ac8esm880024566b.222.2024.10.02.08.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 08:27:41 -0700 (PDT)
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
X-Inumbo-ID: deb2ef59-80d2-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727882863; x=1728487663; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUmCjdSTNNz/bYZNosiPwxy4sAkcSDlDvTaqnGpBKLQ=;
        b=SwZhQ+6WsrrkThYLfUhF3ZhBf8FNy1hE+2faWX3m0EMLqLW9B7Hqr+oar23AjEF9iw
         r9XJisJBpLM56SvmCiI4blgEfi+7vubVrAemYaQfMA7LUdr3mdv1A4o2FKb+LjSL7o9s
         1bwTmds51XIq55tobkeJwhbTUD0HINeLit00o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727882863; x=1728487663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUmCjdSTNNz/bYZNosiPwxy4sAkcSDlDvTaqnGpBKLQ=;
        b=iyW51Zk88pbF4VzDjsD0cBk6XxPjSxBbJVgoWif/vGGZWWXI0nq/cdbiey7rd1QRZO
         HM4Ug/bRNe40NzfHtbIrLZRI/YDfTH7rBPkoiTnSo2eQTa/IiBtxqsqVXP6MYuIWqkvL
         PFSoUN0ov+reeGcCNvqhe2MuP2rkMNk7EZrlzPqw5Z0gB2M9+PvzyyJ1flFpdj/Qs1ig
         wyG/OzmdwdIbVPK2Xft/Cd1im9/zTZr9uhMPP9cQbx2XMfPr+hCNHqzCgcH5/+W4eu1I
         2nietFMwv5u0P78hnIwUj2itKQ+MOQUjiSuyr6zRPvzd8wuUP4J48CmgbpUl511PBNAz
         lQrg==
X-Gm-Message-State: AOJu0YwFk3y8smbOb1yUTGvVA0PDxw75o6rdtib9WAqubdTmag5h5lqJ
	+KaOs42EfGPHqmQsK9pZE1KyK3i3HL/23STlqgLj94oSP4WY+XhZYGbSfYKUr3tmJ5nifVydWgL
	aP/I=
X-Google-Smtp-Source: AGHT+IGpegr0xxYsCZ+z9qYO4dCzrS7LRSj3afqU4XsleDv+WYP+JIFC1n1LDhSpV8GKeuZQvfoQzg==
X-Received: by 2002:a17:906:c107:b0:a90:3494:2aa9 with SMTP id a640c23a62f3a-a990a03470emr1993866b.2.1727882863066;
        Wed, 02 Oct 2024 08:27:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 7/7] x86/spec-ctrl: Introduce and use DO_COND_BHB_SEQ
Date: Wed,  2 Oct 2024 16:27:25 +0100
Message-Id: <20241002152725.1841575-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
References: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that alternatives can fix up call displacements even when they're not the
first instruction of the replacement, move the SCF_entry_bhb conditional
inside the replacement block.

This removes a conditional branch from the fastpaths of BHI-unaffected
hardware.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vmx/entry.S             | 12 +++----
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 43 +++++++++++++-----------
 2 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index 6aaeb28a5b96..e901a41f252a 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -62,12 +62,12 @@ FUNC(vmx_asm_vmexit_handler)
          * Clear the BHB to mitigate BHI.  Used on eIBRS parts, and uses RETs
          * itself so must be after we've perfomed all the RET-safety we can.
          */
-        testb $SCF_entry_bhb, CPUINFO_scf(%rsp)
-        jz .L_skip_bhb
-        ALTERNATIVE_2 "",                                    \
-            "call clear_bhb_loops", X86_SPEC_BHB_LOOPS,      \
-            "call clear_bhb_tsx", X86_SPEC_BHB_TSX
-.L_skip_bhb:
+        .macro VMX_BHB_SEQ fn:req
+            DO_COND_BHB_SEQ \fn scf=CPUINFO_scf(%rsp)
+        .endm
+        ALTERNATIVE_2 "",                                         \
+            "VMX_BHB_SEQ fn=clear_bhb_loops", X86_SPEC_BHB_LOOPS, \
+            "VMX_BHB_SEQ fn=clear_bhb_tsx",   X86_SPEC_BHB_TSX
 
         ALTERNATIVE "lfence", "", X86_SPEC_NO_LFENCE_ENTRY_VMX
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index 729a830411eb..559dad88f967 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -92,6 +92,21 @@
 .L\@_skip:
 .endm
 
+.macro DO_COND_BHB_SEQ fn:req, scf=%bl
+/*
+ * Requires SCF (defaults to %rbx), fn=clear_bhb_{loops,tsx}
+ * Clobbers %rax, %rcx
+ *
+ * Conditionally use a BHB clearing software sequence.
+ */
+    testb  $SCF_entry_bhb, \scf
+    jz     .L\@_skip_bhb
+
+    call   \fn
+
+.L\@_skip_bhb:
+.endm
+
 .macro DO_OVERWRITE_RSB tmp=rax, xu
 /*
  * Requires nothing
@@ -277,12 +292,9 @@
      * Clear the BHB to mitigate BHI.  Used on eIBRS parts, and uses RETs
      * itself so must be after we've perfomed all the RET-safety we can.
      */
-    testb $SCF_entry_bhb, %bl
-    jz .L\@_skip_bhb
-    ALTERNATIVE_2 "",                                    \
-        "call clear_bhb_loops", X86_SPEC_BHB_LOOPS,      \
-        "call clear_bhb_tsx", X86_SPEC_BHB_TSX
-.L\@_skip_bhb:
+    ALTERNATIVE_2 "",                                          \
+        "DO_COND_BHB_SEQ clear_bhb_loops", X86_SPEC_BHB_LOOPS, \
+        "DO_COND_BHB_SEQ clear_bhb_tsx",   X86_SPEC_BHB_TSX
 
     ALTERNATIVE "lfence", "", X86_SPEC_NO_LFENCE_ENTRY_PV
 .endm
@@ -322,12 +334,9 @@
     ALTERNATIVE "", __stringify(DO_SPEC_CTRL_ENTRY maybexen=1),         \
         X86_FEATURE_SC_MSR_PV
 
-    testb $SCF_entry_bhb, %bl
-    jz .L\@_skip_bhb
-    ALTERNATIVE_2 "",                                    \
-        "call clear_bhb_loops", X86_SPEC_BHB_LOOPS,      \
-        "call clear_bhb_tsx", X86_SPEC_BHB_TSX
-.L\@_skip_bhb:
+    ALTERNATIVE_2 "",                                          \
+        "DO_COND_BHB_SEQ clear_bhb_loops", X86_SPEC_BHB_LOOPS, \
+        "DO_COND_BHB_SEQ clear_bhb_tsx",   X86_SPEC_BHB_TSX
 
     ALTERNATIVE "lfence", "", X86_SPEC_NO_LFENCE_ENTRY_INTR
 .endm
@@ -433,13 +442,9 @@
      * Clear the BHB to mitigate BHI.  Used on eIBRS parts, and uses RETs
      * itself so must be after we've perfomed all the RET-safety we can.
      */
-    testb $SCF_entry_bhb, %bl
-    jz .L\@_skip_bhb
-
-    ALTERNATIVE_2 "",                                    \
-        "call clear_bhb_loops", X86_SPEC_BHB_LOOPS,      \
-        "call clear_bhb_tsx", X86_SPEC_BHB_TSX
-.L\@_skip_bhb:
+    ALTERNATIVE_2 "",                                          \
+        "DO_COND_BHB_SEQ clear_bhb_loops", X86_SPEC_BHB_LOOPS, \
+        "DO_COND_BHB_SEQ clear_bhb_tsx",   X86_SPEC_BHB_TSX
 
     lfence
 .endm
-- 
2.39.5



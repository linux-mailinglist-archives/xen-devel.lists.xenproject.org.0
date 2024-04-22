Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D8C8AD3B4
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 20:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710196.1109349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryyBi-0001jk-6V; Mon, 22 Apr 2024 18:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710196.1109349; Mon, 22 Apr 2024 18:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryyBi-0001cX-1T; Mon, 22 Apr 2024 18:14:46 +0000
Received: by outflank-mailman (input) for mailman id 710196;
 Mon, 22 Apr 2024 18:14:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/m7Q=L3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ryyBf-0000IX-OD
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 18:14:43 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 313ada63-00d4-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 20:14:43 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a559b919303so249730966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 11:14:43 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z15-20020a170906668f00b00a51d073da7esm5994224ejo.82.2024.04.22.11.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 11:14:41 -0700 (PDT)
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
X-Inumbo-ID: 313ada63-00d4-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713809682; x=1714414482; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dB+pEYt/xsRXM0pv02BxjDs01ExeTPOKtKLGLzOzv0s=;
        b=m/YD7PW9Cinj9EGqD1JjCAgTChK87yX6Uvl6xvYJxsOl35BZPNaiEJAng9P1i57KOa
         gaZh+J2Ef3hUfcbgW6d01L0UpVYiLgX6baUO0KnTnZV0wgYOPAjIB24VwRZgo9BcaeWq
         yxIeEpAGtfYCnaOsSKNN+8W0Dz0CMi9L08mkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713809682; x=1714414482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dB+pEYt/xsRXM0pv02BxjDs01ExeTPOKtKLGLzOzv0s=;
        b=O+hyWgCzHxiPtOv9ZnkfVqlvje80IYYtmlIrBUYejy1k/r9pT863FXu2zyg2yCUZMa
         xBPB0qkNFwNilMIPRqe9+Mpb2TdhyaasY8t4X0JtIjt5SpEVZcRgjDuXXJizAZWYlgcg
         rKTjPPp56IGaMnavArrNOBaBY2HcHeKGglXG+bwFvSYkKbLxi1vOx0wXiF33aRmjdV1E
         0wQSsdXVJpS62DC99mSByl7YWUQvIauVkfWwqEZddeTmdwD2X/nEy864f5OL8BTMdPWc
         SycWpd8lSfwbSfaGZ1+tgicvQ3OGsWBX2lIXtQHqeCshXQfmfrf0Urx/HhvjJuHaL+77
         VPwQ==
X-Gm-Message-State: AOJu0YwF6/8QhXhe7xBsz9KWpSctht05QZKdoNoQ4z5ebrq8EoztWUyb
	YSJKbDLXXMWiEl795QtbxRwFMeYe2/z19+bDdyBCnWd8c7TurCsBn0Zkh/fHc9/9HHJoEcM+tzO
	sfQU=
X-Google-Smtp-Source: AGHT+IGqd/HqMIOYUnziS1lqHwIAw5CNOJQ9KnM2G4JVD+h+CP14AE9vAz3vT5t6yXjZ6d/aUx+h6Q==
X-Received: by 2002:a17:906:b092:b0:a55:387b:ef07 with SMTP id x18-20020a170906b09200b00a55387bef07mr7177532ejy.13.1713809682179;
        Mon, 22 Apr 2024 11:14:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 6/6] x86/spec-ctrl: Introduce and use DO_COND_BHB_SEQ
Date: Mon, 22 Apr 2024 19:14:34 +0100
Message-Id: <20240422181434.3463252-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
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
index 7233e771d88a..77bf9ea564ea 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -62,12 +62,12 @@ ENTRY(vmx_asm_vmexit_handler)
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
2.30.2



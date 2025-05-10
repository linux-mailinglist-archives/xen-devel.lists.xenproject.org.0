Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5876DAB2078
	for <lists+xen-devel@lfdr.de>; Sat, 10 May 2025 02:19:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980556.1367096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDXvb-0005l1-NG; Sat, 10 May 2025 00:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980556.1367096; Sat, 10 May 2025 00:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDXvb-0005ia-Ki; Sat, 10 May 2025 00:18:55 +0000
Received: by outflank-mailman (input) for mailman id 980556;
 Sat, 10 May 2025 00:18:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Vxe=X2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uDXva-0005iU-Dp
 for xen-devel@lists.xenproject.org; Sat, 10 May 2025 00:18:54 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a68d50f-2d34-11f0-9eb5-5ba50f476ded;
 Sat, 10 May 2025 02:18:52 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a1d8c0966fso1331966f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 17:18:52 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f33b5sm4815178f8f.54.2025.05.09.17.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 17:18:50 -0700 (PDT)
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
X-Inumbo-ID: 5a68d50f-2d34-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746836332; x=1747441132; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WpsUSj92KqDrKgsNySV/kwZnYdiagcD3GXuPXffrzeA=;
        b=UiufKp+DdsTKa+VGCp2iBAPr79VzQ7gHAnzRKtaAGiezwWAq0oAUK4OjQYD4yTAyHJ
         z/IQJSmXtrORDhVPL70JVaWobcDMkiqQRGh1QK340RDgm/uPTPBcG+ivyOSr3a1dex31
         5G/+116P+H9EscLyseWux8Qm3j7FqdBdF0wtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746836332; x=1747441132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WpsUSj92KqDrKgsNySV/kwZnYdiagcD3GXuPXffrzeA=;
        b=pXZ/iNzOJn4NvAvmJOkt4k/MCQ92MGxlduAczJYG+QgB9wiphzvJX370r+KgqLECCS
         8DyXRuvDPtkZsfAL0YPF7LJ1cD8uSrpqnj+0RcUgNoMYWZaDcIesiXkfhuwzDWUpBZwV
         GwUb8MIAcgHbHroqZYh1wjqCw7dYkkPdTg/NECMk13gR7E57G7bPujfUgHplRNIOkitr
         xOJ0nB0q3qxJ2UQEY01TuOSvE9P7RO0RjrK5xAaWKj/RzNXMqRxXbU/twfdZqumyCNOa
         10AbyETL8BWsyH82k/LlVXW7NoZqKd6mtEyhowkor3/nK87dLrSQJfOpS2lM8sEQad0k
         n2SQ==
X-Gm-Message-State: AOJu0YzSAyHOnGNqjRVF06MwA8Twb2Wp0ZQe1PN6u86NqB7914Nz8Jyw
	qZSXxTEUQS12rqNf2kE0CF9SbFY315IVUv0HQXIqpB0UmwzHSIoqoJmNFn1Pl/64FYsNkI/Yfnf
	S
X-Gm-Gg: ASbGncvmV+iuM0QLp693+nDnZpxfxDAxLBE4LQuL+Srwu8kec7dytT+qz67GvXcW+u5
	q6IYl4GLrrVyDaREm/a5HTyJ+htczthL5op78QuGitm1O3NLPkrlEnjbyX8FUSQxylaxz+7bAog
	TznmY40wun8a6ebxUHL+IKMp7ameO/OLWQaeWN2FMkxeJrUnWohTtLuhw+TPDMS5bBA43EYDXyc
	Q4A0JpRGi2c9zLthfpWstdF7F5/WpkAeaZ5qO+/bTtZAyBb0irXhl0wrtjMCOpB+TbV5zfGwUuL
	sCh0XJCazrR7f7akO8omYMsIxblONK46q61g8yOuLd7SPPBDAY8rxejemdxMFRCbCO2z9Nq6yES
	Cp01Cg9gzZliphuOsgizerllz
X-Google-Smtp-Source: AGHT+IHWB7vCxOxRF+vH9VPWcZs/ZlaJZU2ELk53LgETMksHk2Ux/CQSUJCmcGuO/aBH/aY5tp13eQ==
X-Received: by 2002:a05:6000:4007:b0:3a0:9f4c:ca85 with SMTP id ffacd0b85a97d-3a0b99078a9mr8014264f8f.10.1746836332012;
        Fri, 09 May 2025 17:18:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] x86/emul: Work around MISRA R13.2 complaint
Date: Sat, 10 May 2025 01:18:48 +0100
Message-Id: <20250510001848.2993380-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 13.2 states: "The value of an expression and its persistent side effects
shall be the same under all permitted evaluation orders".

Eclair complains about a Rule 13.2 violations because validate_far_branch()
assigns to rc, and the entirety of commit_far_branch() is also assigned to rc.

I'm unsure that the complaint is accurate, but rewriting commit_far_branch()
to use the comma operator seems to make Eclair happy.

Reported-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 8e14ebb35b0e..6ee64cb85987 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -333,12 +333,14 @@ do {                                                                    \
                               : (ip) > (cs)->limit, X86_EXC_GP, 0);     \
 })
 
-#define commit_far_branch(cs, newip) ({                                 \
-    validate_far_branch(cs, newip);                                     \
-    _regs.r(ip) = (newip);                                              \
-    singlestep = _regs.eflags & X86_EFLAGS_TF;                          \
-    ops->write_segment(x86_seg_cs, cs, ctxt);                           \
-})
+#define commit_far_branch(cs, newip) (                                  \
+        ({                                                              \
+            validate_far_branch(cs, newip);                             \
+            _regs.r(ip) = (newip);                                      \
+            singlestep = _regs.eflags & X86_EFLAGS_TF;                  \
+        }),                                                             \
+        ops->write_segment(x86_seg_cs, cs, ctxt)                        \
+    )
 
 int x86emul_get_fpu(
     enum x86_emulate_fpu_type type,

base-commit: 9b3a02e66f058ebd77db6628e3144352857bdf2b
-- 
2.39.5



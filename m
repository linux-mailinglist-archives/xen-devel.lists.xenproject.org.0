Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1D7712908
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 17:01:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540130.841664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Yw1-0001XC-Ok; Fri, 26 May 2023 15:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540130.841664; Fri, 26 May 2023 15:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Yw1-0001Tu-L3; Fri, 26 May 2023 15:00:53 +0000
Received: by outflank-mailman (input) for mailman id 540130;
 Fri, 26 May 2023 15:00:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EF2/=BP=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q2Yvz-0000zw-NR
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 15:00:51 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a4891ba-fbd6-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 17:00:50 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-309550d4f73so1702708f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 May 2023 08:00:50 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y9-20020a5d4709000000b00307d58b3da9sm5360033wrq.25.2023.05.26.08.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 08:00:49 -0700 (PDT)
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
X-Inumbo-ID: 1a4891ba-fbd6-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685113249; x=1687705249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quS4cTSFGRVakDp9QHbKiL2cvkdUMIvwadA2xaR3dOE=;
        b=Q4Q946ylMHUyvYrwPgiKBe5i3wcohM3WYhaSRXDR8DGJIBq3WGAullplwSgyZNiJEb
         cJRzHyCxqr0TmEQhpN9SRYNztmV2e0F9/GuRldBJB+osDeIWnUI243Y4YYBEpGxm++2B
         AztWewjWlY0WnWRTxTWSmAL7BPUE+BJPEbRkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685113249; x=1687705249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quS4cTSFGRVakDp9QHbKiL2cvkdUMIvwadA2xaR3dOE=;
        b=WTGP6x9TBAOyWhgVgI2cdeH8F/aLiMNnPMiH+8WbJMYIEuAgHCvHDSl4ovelPgTg80
         Qdh6qpXZXioe2kZml9B3UPQ6do6YcrS1SGZnH+C1IN60bKeZGrbPqWFW5AWyUT8cjpKd
         ZrAUuR/D11MT8COYo6+c8expYfyS5elUQRip5PeqqhAf9wyhm4Ge35lLG+Z7ORBjIhLD
         Bc9qCJXQlfzYSp/7Edch8KsfeZLNdDbGTO7OY0WrBbxzpbR1qS3//FpuuN1iwijW6PEy
         JPLZSGobBoJst2tjBnylQvdOQ535pQDMO3b4xT2I6gvYBhbnswrQcNdnDM8XPtqnScKg
         sOoQ==
X-Gm-Message-State: AC+VfDznHIT2bOUuI3r8RGi9MU43vzvsqCISszQ7sTq9zSFd8U7FaM9m
	y4Je3r+6O0DqadsJG1+hAtk1ZfzC8v/jojaBvGk=
X-Google-Smtp-Source: ACHHUZ4ReO3uxjh5k5rw9APzBLZv58Icukc7CnHI7cJZNUVC14W3TZanYNZO2aqb9V/L/dppIWKiyw==
X-Received: by 2002:a5d:45cf:0:b0:306:2ff1:5227 with SMTP id b15-20020a5d45cf000000b003062ff15227mr1680848wrs.23.1685113249664;
        Fri, 26 May 2023 08:00:49 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] x86: Expose Automatic IBRS to guests
Date: Fri, 26 May 2023 16:00:44 +0100
Message-Id: <20230526150044.31553-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526150044.31553-1-alejandro.vallejo@cloud.com>
References: <20230526150044.31553-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose AutoIBRS to HVM guests, because they can just use it. Make sure
writes to EFER:AIBRSE are gated on the feature being exposed. Also hide
EFER:AIBRSE from PV guests as they have no say in the matter.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/hvm/hvm.c                      | 3 +++
 xen/arch/x86/include/asm/msr-index.h        | 3 ++-
 xen/arch/x86/pv/emul-priv-op.c              | 4 ++--
 xen/include/public/arch-x86/cpufeatureset.h | 2 +-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index d7d31b5393..07f39d5e61 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -936,6 +936,9 @@ const char *hvm_efer_valid(const struct vcpu *v, uint64_t value,
     if ( (value & EFER_FFXSE) && !p->extd.ffxsr )
         return "FFXSE without feature";
 
+    if ( (value & EFER_AIBRSE) && !p->extd.automatic_ibrs )
+        return "AutoIBRS without feature";
+
     return NULL;
 }
 
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 73d0af2615..49cb334c61 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -178,7 +178,8 @@
 #define  EFER_AIBRSE                        (_AC(1, ULL) << 21) /* Automatic IBRS Enable */
 
 #define EFER_KNOWN_MASK \
-    (EFER_SCE | EFER_LME | EFER_LMA | EFER_NXE | EFER_SVME | EFER_FFXSE)
+    (EFER_SCE | EFER_LME | EFER_LMA | EFER_NXE | EFER_SVME | EFER_FFXSE | \
+     EFER_AIBRSE)
 
 #define MSR_STAR                            0xc0000081 /* legacy mode SYSCALL target */
 #define MSR_LSTAR                           0xc0000082 /* long mode SYSCALL target */
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 8a4ef9c35e..142bc4818c 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -853,8 +853,8 @@ static uint64_t guest_efer(const struct domain *d)
 {
     uint64_t val;
 
-    /* Hide unknown bits, and unconditionally hide SVME from guests. */
-    val = read_efer() & EFER_KNOWN_MASK & ~EFER_SVME;
+    /* Hide unknown bits, and unconditionally hide SVME and AIBRSE from guests. */
+    val = read_efer() & EFER_KNOWN_MASK & ~(EFER_SVME | EFER_AIBRSE);
     /*
      * Hide the 64-bit features from 32-bit guests.  SCE has
      * vendor-dependent behaviour.
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index e3952f62bc..42401e9452 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -287,7 +287,7 @@ XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
 XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and limit too) */
-XEN_CPUFEATURE(AUTOMATIC_IBRS,     11*32+ 8) /*   HW can handle IBRS on its own */
+XEN_CPUFEATURE(AUTOMATIC_IBRS,     11*32+ 8) /*S  HW can handle IBRS on its own */
 XEN_CPUFEATURE(CPUID_USER_DIS,     11*32+17) /*   CPUID disable for CPL > 0 software */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
-- 
2.34.1



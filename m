Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5757162D9
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 15:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541186.843661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3zsM-0003km-I8; Tue, 30 May 2023 13:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541186.843661; Tue, 30 May 2023 13:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3zsM-0003fD-C5; Tue, 30 May 2023 13:59:02 +0000
Received: by outflank-mailman (input) for mailman id 541186;
 Tue, 30 May 2023 13:59:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Ox2=BT=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q3zsK-0003cy-Hy
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 13:59:00 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 203d026d-fef2-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 15:58:59 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30af20f5f67so1344955f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 May 2023 06:58:59 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h4-20020adfe984000000b002fe96f0b3acsm3442008wrm.63.2023.05.30.06.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 06:58:58 -0700 (PDT)
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
X-Inumbo-ID: 203d026d-fef2-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685455139; x=1688047139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+3vkI4p6cM/yuJFR9Dw+d2BZ3eFpBG5vfoWYBc257k=;
        b=XAX5oLbWeB08OGGVUKQA/OqHl3GCtzdYwuzG5DhRgKq1ZK8QFakw/On0iKpOwdXyyn
         GM8I8UebPdrlPTnAg0BPs0N3YXJFkfD6iBlOPXc+HZi05r6dwo48KPx8LJ+nBTOr7Hdb
         Xb7o29pqxMxtsoWI298VECIGfMc8Uyzv4cJO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685455139; x=1688047139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+3vkI4p6cM/yuJFR9Dw+d2BZ3eFpBG5vfoWYBc257k=;
        b=FOoqQ7IpoFrWw0vZlqDBCjjOOXVOdZF1QJ7vZZhh6snRV5PjjNtPA+xK9DF+5NByV/
         6W8SapUAqvP15lZbVpX1Z/SWmPGqZmUerhmw0nBdOZ5mZptoZboMvbsY53t7wZtYDcDV
         KsXiP0zlfsAhG+dTLMpyRlijeUFlre+XrUQh6Qtj39PvTCXUkwYGV/oiKWZSIPXS4ZVu
         H31fGZnqw+LPwHIJxzIVcemf9yn4ymslbCMcB70iRAJEmDo5mPnZ3SBz7W6DHCTUc8SM
         VMBHrB/Ozmst/jczeaoUuwvRKnAu4Nx0rRqu0/pp2HD2WImhJ7so2zkZoP9yxNFZXGLD
         h08A==
X-Gm-Message-State: AC+VfDxz1GMEqx+YCl+cSENpp0zB8ED+MI5RT6E8pnuNOOgQ9x1ukFZM
	BCtWNo4f1FLawSGTKyTNEJs9pYrVhTF6WNyqwY0=
X-Google-Smtp-Source: ACHHUZ4p5v9mjGo4XP3kEDBslkn3SYPYr1hSA6w6YDtJng12OutHtp199Lqqy1ag4faBnO6cDbSFuA==
X-Received: by 2002:a5d:678f:0:b0:307:34d4:7ec8 with SMTP id v15-20020a5d678f000000b0030734d47ec8mr1690001wru.34.1685455138922;
        Tue, 30 May 2023 06:58:58 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/3] x86: Expose Automatic IBRS to guests
Date: Tue, 30 May 2023 14:58:53 +0100
Message-Id: <20230530135854.1517-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530135854.1517-1-alejandro.vallejo@cloud.com>
References: <20230530135854.1517-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose AutoIBRS to HVM guests. EFER is swapped by VMRUN, so Xen only has to
make sure writes to EFER.AIBRSE are gated on the feature being exposed.

Also hide EFER.AIBRSE from PV guests as they have no say in the matter.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2:
  * Moved to patch2 from v1/patch3
---
 xen/arch/x86/hvm/hvm.c                      | 3 +++
 xen/arch/x86/include/asm/msr-index.h        | 3 ++-
 xen/arch/x86/pv/emul-priv-op.c              | 4 ++--
 xen/include/public/arch-x86/cpufeatureset.h | 2 +-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index d7d31b5393..2d6e4bb9c6 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -936,6 +936,9 @@ const char *hvm_efer_valid(const struct vcpu *v, uint64_t value,
     if ( (value & EFER_FFXSE) && !p->extd.ffxsr )
         return "FFXSE without feature";
 
+    if ( (value & EFER_AIBRSE) && !p->extd.auto_ibrs )
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
index 3ac144100e..51d737a125 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -287,7 +287,7 @@ XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
 XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and limit too) */
-XEN_CPUFEATURE(AUTO_IBRS,          11*32+ 8) /*   HW can handle IBRS on its own */
+XEN_CPUFEATURE(AUTO_IBRS,          11*32+ 8) /*S  HW can handle IBRS on its own */
 XEN_CPUFEATURE(CPUID_USER_DIS,     11*32+17) /*   CPUID disable for CPL > 0 software */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
-- 
2.34.1



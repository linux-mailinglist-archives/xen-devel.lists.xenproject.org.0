Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AADCC4756
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:56:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188150.1509456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYL4-0008Tz-GU; Tue, 16 Dec 2025 16:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188150.1509456; Tue, 16 Dec 2025 16:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYL4-0008NO-73; Tue, 16 Dec 2025 16:55:54 +0000
Received: by outflank-mailman (input) for mailman id 1188150;
 Tue, 16 Dec 2025 16:55:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcum=6W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVYL2-0006gk-CH
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:55:52 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 138e8c20-daa0-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 17:55:50 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b7277324204so777704766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:55:50 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8003cb349csm63169766b.68.2025.12.16.08.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:55:49 -0800 (PST)
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
X-Inumbo-ID: 138e8c20-daa0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904150; x=1766508950; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJaP82YXbAm6Gna23C7iOt4nvGxE/DjDYnXLamz0z1w=;
        b=iGAOMvPwW/FEfSjJ5QI8HQU2pZxSrQIBmXKvu8YPWXJvV/nmEXtwP82HXg+9PeYGEf
         xnJhWhBGBAoyu+m5w1liTlFwzJRC0Oov02fykHe/LwGVgnj/mcMFEJJxYVUnxreSyLuM
         KnRzId0yXi+ZUPilLTJT0Q5CCnFoZkds6Kn4Tcmsy22w1lMrpOHpEo2HUumBv9boEfdC
         FFXRtwJrGpTfvmsWWfe1pBOR2guLE0BIR8UbFPXz6FeyattGchr+y9qZL+QDUE4TBMmm
         X2xWoHXjUsrTX00zqb5+PgsBYJvAFzclNQtFUVcVVnzHvwD9iKUVPyIJqLCc4Ap2FSvu
         CMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904150; x=1766508950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DJaP82YXbAm6Gna23C7iOt4nvGxE/DjDYnXLamz0z1w=;
        b=LVCWM/+fjPhISxAhp1KRUJHeQsPaMmA2PheezbrksuomCOdMCVpa87v1O0dNMbsFwf
         6wZ74waGYwlU+EJ3QghU5upxP6d56beHeOBLdwH8vQW3GVT3dyS0fHSLvgCo2r3k5mog
         h6rKIt95ET2T77vpa6Rwaj7IQho77ASwHJJh1FXE39dmkfwVW8JL0RHi0BuMZd74l5Am
         9BGdEoeZjEP54yI75lWOaxGNEmWJ0SaaFDAMoraxtXNbHY3dFbe+93L1qru5GZCoxOCe
         PDuHrXYCNvG68xFvQc7wJ2DTJFHt5rr+s6iHieqk3CACSsvEHPRXWyzZGt8YIa1jpRLS
         SUnA==
X-Gm-Message-State: AOJu0Yz7Z3HfEEw0mQZpuT2ZSS334TVgTv2pYmt2TI0OSi+1RxR9zjah
	7oWV6Vjai2Wl6Bqo0b5yT9n4umM6YOmndq8P85oSVnKKOKhT6EO7L35vF6Z5Cg==
X-Gm-Gg: AY/fxX5tEwg/tXrEFLXgLIxKWIdisGSM26lU+CzXO9KaS+CHr3Ef4jYPbidC32wegz1
	fQsKB/sctsyidFLgy9fgCtWqhQXqxm3gaI+2R7URraEoJOMAFNOGBvgwS39TNBB4xWgPwfnv5f2
	srR7r+fFPBritDaoAyDRSE6sVizshXISEGDWigwX0e09mJqBPPaJSTDXxefrdqQRQNlH3qpII/R
	YekeqOtvb44fixNfBqHz16nVMm9fMi89YHa6usrvdX6gRekdSUmVb5LAh8ZJhSq9W/fQLk9cejf
	HciA4tOkkv034v1m0rmSyYjE9qxDHXKH3fTjCiRhPVM7aSBombAvMMQB9thY4LN2yStwZaNr04o
	QBQMc6U+smExzbpo5NqIqXruZninK/D5CeUxrj751p7PeJlfzlhveKqbkWhuKKpqjGKDQkg50GN
	FwVmwrbzD086aoKfa+L7ke3svVH9niTZij9V4LJJk9h7qDaYbOoAomluY=
X-Google-Smtp-Source: AGHT+IERqQ619rupjyiILfHzAEhBYssN1RPY2a8lhUnskqNnoWloUleTYFYahg+LdATDiO58k7uSuA==
X-Received: by 2002:a17:907:60d0:b0:b73:2aa1:f9fb with SMTP id a640c23a62f3a-b7d23ad6631mr1777211366b.32.1765904149737;
        Tue, 16 Dec 2025 08:55:49 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7 08/19] xen/dom0less: abstract Arm-specific p2m type name for device MMIO mappings
Date: Tue, 16 Dec 2025 17:55:18 +0100
Message-ID: <912db2169ad1ba5e021fc58972fd92aabc213c5f.1765879052.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765879052.git.oleksii.kurochko@gmail.com>
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce arch_dt_passthrough_p2m_type() and use it instead of
`p2m_mmio_direct_dev` to avoid leaking Arm-specific naming into
common Xen code, such as dom0less passthrough property handling.

This helps reduce platform-specific terminology in shared logic and
improves clarity for future non-Arm ports (e.g. RISC-V or PowerPC).

No functional changes — the definition is preserved via a static inline
function for Arm.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5-7:
 - Nothing changed. Only rebase.
---
Changes in V4:
 - Introduce arch_dt_passthrough_p2m_type() instead of re-defining of
   p2m_mmio_direct.
---
Changes in V3:
 - New patch.
---
 xen/arch/arm/include/asm/p2m.h          | 5 +++++
 xen/common/device-tree/dom0less-build.c | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index ef98bc5f4d..010ce8c9eb 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -137,6 +137,11 @@ typedef enum {
     p2m_max_real_type,  /* Types after this won't be store in the p2m */
 } p2m_type_t;
 
+static inline p2m_type_t arch_dt_passthrough_p2m_type(void)
+{
+    return p2m_mmio_direct_dev;
+}
+
 /* We use bitmaps and mask to handle groups of types */
 #define p2m_to_mask(_t) (1UL << (_t))
 
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 2600350a3c..495ef7b16a 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -185,7 +185,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
                                gaddr_to_gfn(gstart),
                                PFN_DOWN(size),
                                maddr_to_mfn(mstart),
-                               p2m_mmio_direct_dev);
+                               arch_dt_passthrough_p2m_type());
         if ( res < 0 )
         {
             printk(XENLOG_ERR
-- 
2.52.0



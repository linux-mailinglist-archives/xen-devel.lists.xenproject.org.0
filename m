Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B3265079A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 07:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465759.724583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p79kH-0004CE-19; Mon, 19 Dec 2022 06:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465759.724583; Mon, 19 Dec 2022 06:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p79kG-00046W-U1; Mon, 19 Dec 2022 06:35:28 +0000
Received: by outflank-mailman (input) for mailman id 465759;
 Mon, 19 Dec 2022 06:35:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4Hg=4R=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p79kE-000383-NZ
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 06:35:26 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5279adf6-7f67-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 07:35:26 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id n20so19253809ejh.0
 for <xen-devel@lists.xenproject.org>; Sun, 18 Dec 2022 22:35:26 -0800 (PST)
Received: from uni.router.wind (adsl-211.109.242.226.tellas.gr.
 [109.242.226.211]) by smtp.googlemail.com with ESMTPSA id
 q14-20020a17090676ce00b008302732f569sm77062ejn.78.2022.12.18.22.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 22:35:25 -0800 (PST)
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
X-Inumbo-ID: 5279adf6-7f67-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hz6FjXGAr1BW2zW8+8ubXkVLUxQBru6jBVid1iAt+4Y=;
        b=WnPUpU31tyKyu2mpU+g9qT6bVaV1EyK7U1Z4E7qK8G5RdEjVy9bY91qdGaKJMK7vBw
         KxHnDUgIbC6Gv+CzwZ5D4BzIatxhUjsfKM77HUI/pPSudBepnHvpfakHNVjh+UF7yEsk
         canNx4uwc08BaDoIuL1x6aYugWExozjtcroREW+g8OaBpbZ4xiMdFCoF80FjDg2R3BkM
         BzCVm+fcl+9RdbMlZ7w56x0njm9C+X5kGIPxtVD+0fbT6B2R04uVzLPycwPEJIaqiIu6
         3li/eese5o2xY3hIEU/wdkZ8Zu8wWkBNqPme4CQ2wSCcoDLjnX8EL8bjluZ8nwvWHn5v
         U73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hz6FjXGAr1BW2zW8+8ubXkVLUxQBru6jBVid1iAt+4Y=;
        b=VxPqV2gq8KQ9PawGF3ovkZc4JJtOKmhDL51BQfW/aLAiXP5e2cotqGBsb+yuP4BAIK
         Qb669DWlAMdsulVrNK3+G3dwsQhjih1xJ5lPV+CKaixYrvH35CNrbieYfnZItMdg/HN7
         3PRgJ+YCcsTA358tRedBT4ruBuzYM5iGnMqpiqmwG2Urw0fc24tZ+tdQFposhYDIfOj8
         e9Vz/xlZypB82073tuiGDNPU2l41b4ExwO510FhkvMsFuaLPwe79KjgL6JuTIKDOH1Hg
         GkQTGoo9wNZ20v0j9jAOIFxPaYwzeDkwxwrz3vp/QGKo7PXxvgup09oYfA6XAcuyj9MO
         HQKA==
X-Gm-Message-State: ANoB5pmqmLdZsqK5NtjGddS228jkvNWK3fI9ykLzCQj1CUtBuErDbquM
	81DxeDgWTPXv4aLSFGTSNDpk3qwjMko=
X-Google-Smtp-Source: AA0mqf7VJiC5mzrg3SfScK5+c+ET7ex4QMswiUfB28YApmHzHpbuaN/BUrPUXFIJ76mx4KKc0ah2/g==
X-Received: by 2002:a17:907:1dc8:b0:7c0:dd4e:b383 with SMTP id og8-20020a1709071dc800b007c0dd4eb383mr38803215ejc.3.1671431725606;
        Sun, 18 Dec 2022 22:35:25 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC 4/7] x86/acpi: separate AMD-Vi and VT-d specific functions
Date: Mon, 19 Dec 2022 08:34:53 +0200
Message-Id: <20221219063456.2017996-5-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221219063456.2017996-1-burzalodowa@gmail.com>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions acpi_dmar_init() and acpi_dmar_zap/reinstate() are
VT-d specific while the function acpi_ivrs_init() is AMD-Vi specific.
To eliminate dead code, they need to be guarded under CONFIG_INTEL_VTD
and CONFIG_AMD_IOMMU, respectively.

Instead of adding #ifdef guards around the function calls, implement them
as empty static inline functions.

Take the opportunity to move the declarations of acpi_dmar_zap/reinstate() to
the arch specific header.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/include/asm/acpi.h | 14 ++++++++++++++
 xen/include/xen/acpi.h          |  3 ---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index c453450a74..06461fedcd 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -140,8 +140,22 @@ extern u32 pmtmr_ioport;
 extern unsigned int pmtmr_width;
 
 void acpi_iommu_init(void);
+
+#ifdef CONFIG_INTEL_VTD
 int acpi_dmar_init(void);
+void acpi_dmar_zap(void);
+void acpi_dmar_reinstate(void);
+#else
+static inline int acpi_dmar_init(void) { return -ENODEV; }
+static inline void acpi_dmar_zap(void) {}
+static inline void acpi_dmar_reinstate(void) {}
+#endif
+
+#ifdef CONFIG_AMD_IOMMU
 int acpi_ivrs_init(void);
+#else
+static inline int acpi_ivrs_init(void) { return -ENODEV; }
+#endif
 
 void acpi_mmcfg_init(void);
 
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 1b9c75e68f..82b24a5ef0 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -206,9 +206,6 @@ static inline int acpi_get_pxm(acpi_handle handle)
 
 void acpi_reboot(void);
 
-void acpi_dmar_zap(void);
-void acpi_dmar_reinstate(void);
-
 #endif /* __ASSEMBLY__ */
 
 #endif /*_LINUX_ACPI_H*/
-- 
2.37.2



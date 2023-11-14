Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B20B27EB336
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:14:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632770.987179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2v6y-0008Et-Np; Tue, 14 Nov 2023 15:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632770.987179; Tue, 14 Nov 2023 15:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2v6y-0008Br-K6; Tue, 14 Nov 2023 15:13:56 +0000
Received: by outflank-mailman (input) for mailman id 632770;
 Tue, 14 Nov 2023 15:13:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJWh=G3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r2v6w-0008AQ-I7
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:13:54 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c487ea4-8300-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 16:13:53 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-507cd62472dso7380661e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 07:13:53 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 f18-20020a05651232d200b00507987edd22sm1348822lfg.156.2023.11.14.07.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 07:13:51 -0800 (PST)
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
X-Inumbo-ID: 6c487ea4-8300-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699974832; x=1700579632; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eni2uQcHzPa3p0BXkZBXBU2/wAC0HDdu58dG92X4l7M=;
        b=Z+wy+1JBsk7MlZpZytGLbrHPQWSsV2MYyUW/RZ642njxYGQaliAoTTP2lsvNYAqWqt
         MYLA6mw2ERwc1wf6Na4n8JnJTSvQB+kvM8zehF7QYr+ji7AAyDNAtAdCDxwbC8H2el/B
         DSuP5QyfI5oY4yeyCQNZBY75O+mPgW3wMTNOd17UDG2s6TFRI9QmklBqxTwhy6EQA3JS
         xMLCusODhqWtmEAJi8OVTLLd9OYk2OMBb2VUuZQR1nXRhRr50hA9WKgg7bvdKZrJxYIu
         NXm8cKEjSW0eW5Kv4g1ZlVR7NOxWWfKc/6Kd5M7ESiLHFg8Ot2pMiqwJmlcd8zFuGgKO
         lWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699974832; x=1700579632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eni2uQcHzPa3p0BXkZBXBU2/wAC0HDdu58dG92X4l7M=;
        b=DGKZFYGwHgV0rcpliKqTtz7xygaJrqin3jRK8B0JY4RQ9O2HMc+gsizJWrt6grIwwZ
         iWfr0RzVGNLDSbrIbIIUMaNFewS5ihTY+SRH2321PgaceIahRnK4g7HF339cP3n0t5v8
         P9ON+x+T1m9iaaiUjSuhpATceUsyOD/6skN/cVSijKYRdu99egTUraOCYc95mkhvKSmX
         RnWMPCAFNYWLZR9scozNcZbK4YgYX8sM65TBfRkTnvTDVvqD3nIOXsa0XvBbOgnfhfOC
         vJKdzok5OzmGsn/mzQ6eSFS6JPijs/HoYdYTPhaprIBJHCdDfq9yuucpH8BJ3l740IJs
         CvLw==
X-Gm-Message-State: AOJu0Yw00rRfwWzT1x16Ail0QTh+FaxeYrNeyT02iblnUTb49KUBkBgN
	MHolKldhIXNKaRP88qf+YDJU92zx8+k=
X-Google-Smtp-Source: AGHT+IEzcpy18UDDhhnN+a+RNf+F0kB/z2W2MF5MLcjpqSpUTxrMDiRTRF7evh7oap6bN8DHUtnA5g==
X-Received: by 2002:a05:6512:3d1b:b0:500:acae:30c5 with SMTP id d27-20020a0565123d1b00b00500acae30c5mr1275757lfv.15.1699974832143;
        Tue, 14 Nov 2023 07:13:52 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
Date: Tue, 14 Nov 2023 17:13:49 +0200
Message-ID: <371c5dd29fa974ca27db1f720f17fb0ffdd667a0.1699974488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ifdefing inclusion of <asm/mem_access.h> in <xen/mem_access.h>
allows to avoid generation of empty <asm/mem_access.h> header
for the case when !CONFIG_MEM_ACCESS.

For Arm it was explicitly added inclusion of <asm/mem_access.h> for p2m.c
and traps.c because they require some functions from <asm/mem_access.h> which
aren't available in case of !CONFIG_MEM_ACCESS.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

---
This patch was part of patch series:
https://lore.kernel.org/xen-devel/cover.1699633310.git.oleksii.kurochko@gmail.com/

The patch series hasn't been reviewed all yet so send this path
separately.
---
 xen/arch/arm/p2m.c           | 6 ++++++
 xen/arch/arm/traps.c         | 6 ++++++
 xen/include/xen/mem_access.h | 2 ++
 3 files changed, 14 insertions(+)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index de32a2d638..9050c72acf 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -11,6 +11,12 @@
 #include <asm/event.h>
 #include <asm/flushtlb.h>
 #include <asm/guest_walk.h>
+/*
+ * Inclusion of <asm/mem_acces.h> in <xen/mem_access.h> is #ifdef-ed with
+ * CONFIG_MEM_ACCESS so in case of !CONFIG_MEM_ACCESS will cause a compilation
+ * issue "implicit declaration of functions 'p2m_mem_access*'.
+ */
+#include <asm/mem_access.h>
 #include <asm/page.h>
 #include <asm/traps.h>
 
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index ce89f16404..5e39b26272 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -35,6 +35,12 @@
 #include <asm/cpufeature.h>
 #include <asm/event.h>
 #include <asm/hsr.h>
+/*
+ * Inclusion of <asm/mem_acces.h> in <xen/mem_access.h> is #ifdef-ed with
+ * CONFIG_MEM_ACCESS so in case of !CONFIG_MEM_ACCESS will cause a compilation
+ * issue "implicit declaration of functions 'p2m_mem_access*.
+ */
+#include <asm/mem_access.h>
 #include <asm/mmio.h>
 #include <asm/regs.h>
 #include <asm/smccc.h>
diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
index 4e4811680d..87d93b31f6 100644
--- a/xen/include/xen/mem_access.h
+++ b/xen/include/xen/mem_access.h
@@ -33,7 +33,9 @@
  */
 struct vm_event_st;
 
+#ifdef CONFIG_MEM_ACCESS
 #include <asm/mem_access.h>
+#endif
 
 /*
  * Additional access types, which are used to further restrict
-- 
2.41.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D213CB216CF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 22:51:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078034.1439064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZU3-0004GP-60; Mon, 11 Aug 2025 20:51:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078034.1439064; Mon, 11 Aug 2025 20:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZU3-000495-23; Mon, 11 Aug 2025 20:51:07 +0000
Received: by outflank-mailman (input) for mailman id 1078034;
 Mon, 11 Aug 2025 20:51:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21ui=2X=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ulZSC-00063z-2W
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 20:49:12 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0ebe8ef-76f4-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 22:49:09 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-af96fba3b37so901496666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 13:49:09 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.Dlink ([77.52.179.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3bd2sm2065710466b.54.2025.08.11.13.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 13:49:07 -0700 (PDT)
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
X-Inumbo-ID: a0ebe8ef-76f4-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754945348; x=1755550148; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIP/M+K6/8Gg84x9uEVu6zbj0BNJ3eSed4CBkvQHa9c=;
        b=VWcGAPZBpERMBeTvivvo/Idm/+fmaWcFlyjDHpZlWGzmURa/1uYPnEXB4uOztAdOKu
         xgt2A3dxWzuQu9sPdim1ptnWfjwwzE1YdJQRHSpJQ99L5wZrtayhbW3pfZfr9r3TsS9H
         Nnf/hFXUxdVTU/3FrCd98Itolan6xi4pf8wCceQ5aPmSJQkbaBfBDcHBEkNdW9ZdwjvK
         IwNUs3la0eOxKwhcaDalIwZl8gsuavq3wBvd4DLLS4OHSxvQz3GA4Oow3udUAmgcpqiQ
         4ZSzMYjtKRc1ogxveEvfiMkXQ6JLkKad6ZRmh/8XacsEDwgiMkXeKTAFOeteNq3kI260
         MRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754945348; x=1755550148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIP/M+K6/8Gg84x9uEVu6zbj0BNJ3eSed4CBkvQHa9c=;
        b=WJHhhjUX8Q9BKXdr9BAKU0fo6PM0CenhJgRNycezTXMVMWhDCELPsia3TMlX22TUW1
         am0dGXhblYypHIwHYC6PoKQmR137onITbkM6wa0WR79onsei3muWAYMM0Gk7JD9qPXe3
         tm11xqohfLBsJCuN3EjCQuZoMJ7ANu0yD0XPkpGl+xORRxCJmWPAeRa7I/YqcrULJMEa
         DNiyAPQO5Rtzlyv9MOmiUlH2WMyvQmCiVNev43BtK5KzlTOYZhmkzp5VZajicZCCzMX7
         JWYlLdB03+zOxiohI5xKLGuX1wBI9gD7Z2Af4VwiJha7xAQG4k8HKWqdmCZwR51WVld3
         FuKA==
X-Gm-Message-State: AOJu0YxClLPgAUf0qe6eqeWdmKZ8f/VbRW2I1PAKnMumpvlt46Iln6nz
	M/H9MrwC+dmtctK0yPK5+rq50HkzrgKTNcGdMKnpeUO1q2P2vAoERb6Ky4W6Dw==
X-Gm-Gg: ASbGncsGho4WsvChTsQRg6FwKnQl8QSbo2UhhrlzeltcmZVpxIx2lpTTg+raTHndCmJ
	7+OJv4hK9hO4HN1GggYUwvOy/aKtkVeG2MhOg040mpFWCXr1/JVT7RW2vtDMq/MZSmykybHhAuM
	IhB65pXKXAitIKJZFc57bT+k6SL1cPRR+c8GxXP/Xq+91t++OR6t42p8vppYlPlKakO3wkK8cj9
	f5V98NDTFXqHSOD1Tu3g6cWW3vmAygGPn0PzV3xmohyg35LmyHH/HEktn5gh4+RVu+e2RiOFXtK
	dur5MALwICrehLr9yHTbqd0tcWSzz6jFxaLet/N8Y1Tq92YhGSRIWEY4M31/0/HtIRLOsuqFVEe
	oChyBTTUX20oz7HF20jYAT9Zn7+HjP3tamoE9qPRNAvB1VSDyAGz3b9XudaKJam505yM=
X-Google-Smtp-Source: AGHT+IEJtWYk61Cx5sHSdxBIm2ViHlPQLCpjRbplQ6lagreygGR+Aj8C787BawE2mZ9+xtZbssyL4A==
X-Received: by 2002:a17:907:9811:b0:ad8:a04e:dbd9 with SMTP id a640c23a62f3a-afa1e12c984mr75823566b.31.1754945348421;
        Mon, 11 Aug 2025 13:49:08 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mykola Kvach <mykola_kvach@epam.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v5 12/12] xen/arm: Suspend/resume IOMMU on Xen suspend/resume
Date: Mon, 11 Aug 2025 23:48:08 +0300
Message-ID: <821e0762f64c8b33260a59c672eabf1da5fb4dd4.1754943875.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1754943874.git.mykola_kvach@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is done using generic iommu_suspend/resume functions that cause
IOMMU driver specific suspend/resume handlers to be called for enabled
IOMMU (if one has suspend/resume driver handlers implemented).

These handlers work only when IPMMU-VMSA is used; otherwise,
we return an error during system suspend requests.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Tested-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/arch/arm/suspend.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index b5398e5ca6..cb86426ebd 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -4,6 +4,7 @@
 #include <asm/suspend.h>
 #include <xen/console.h>
 #include <xen/cpu.h>
+#include <xen/iommu.h>
 #include <xen/llc-coloring.h>
 #include <xen/sched.h>
 
@@ -49,6 +50,13 @@ static long system_suspend(void *data)
 
     time_suspend();
 
+    status = iommu_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_time;
+    }
+
     local_irq_save(flags);
     status = gic_suspend();
     if ( status )
@@ -105,6 +113,10 @@ static long system_suspend(void *data)
 
  resume_irqs:
     local_irq_restore(flags);
+
+    iommu_resume();
+
+ resume_time:
     time_resume();
 
  resume_nonboot_cpus:
@@ -140,6 +152,15 @@ int host_system_suspend(void)
         return -ENOSYS;
     }
 
+    /* TODO: drop check once suspend/resume support for SMMU is implemented */
+#ifndef CONFIG_IPMMU_VMSA
+    if ( iommu_enabled )
+    {
+        dprintk(XENLOG_ERR, "IOMMU is enabled, suspend not supported yet\n");
+        return -ENOSYS;
+    }
+#endif
+
     /*
      * system_suspend should be called when Dom0 finalizes the suspend
      * procedure from its boot core (VCPU#0). However, Dom0's VCPU#0 could
-- 
2.48.1



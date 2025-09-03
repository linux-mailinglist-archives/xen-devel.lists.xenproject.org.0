Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD653B4129F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 04:56:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107723.1458000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utdea-0008Ii-Bf; Wed, 03 Sep 2025 02:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107723.1458000; Wed, 03 Sep 2025 02:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utdea-0008GV-8F; Wed, 03 Sep 2025 02:55:20 +0000
Received: by outflank-mailman (input) for mailman id 1107723;
 Wed, 03 Sep 2025 02:55:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JIR0=3O=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utdeY-0008GO-K7
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 02:55:18 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c087ea0-8871-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 04:55:17 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5607c2f1598so2418112e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 19:55:17 -0700 (PDT)
Received: from alina-IdeaPad-Gaming-3-15ARH05.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad4cd5dsm198602e87.145.2025.09.02.19.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 19:55:15 -0700 (PDT)
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
X-Inumbo-ID: 6c087ea0-8871-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756868117; x=1757472917; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=48Bo/x1uHirQgD6UhpfUYjtWJgtRNUdUXngg1z/5/NE=;
        b=g16NiQbxyUQI/xZTrEbqHbm7dZaiN7SMge8anRGgESj53Y+lvo93FyOY1q9dUTo+cF
         EgDFM4pXBAqwYzTZAyArlBw01IJy3v6vqiGefglCWXlRBV/5DMSBgcMPl9KqojzQlYOz
         +z0ULzCkHiv0Hka6rKl6hHEwM+zeqzAt6He1paxQXlzwNCFdSxBPVvT20MyFmtWDK4gV
         kOftEMQvowLwRyumLBzwX8li/T+8mdrK7vdSfw8XxH6Cpt6274qUKQqa0E3l5LEYnDAP
         AqD9cD4WkU+djy355ljEF+2pBd8n72gg2sM0/oMYBgj/+Z5gths46ZlOhPNN5G8+BqvD
         b69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756868117; x=1757472917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48Bo/x1uHirQgD6UhpfUYjtWJgtRNUdUXngg1z/5/NE=;
        b=wrae93cVkHcR+mdtgSyxN4cvdBk+m0kX5sLKlUEIWHfQhE9/WiJkSwK3TJ2UQfjAwk
         Rlzlo2Jf2FX7Sv0hSbVgtq+nVxZ8NlRYFeL6Ma1fJBraiEQQfW/jFR0W29vElcL/C8pZ
         UWRMKBq6e3EwvnpE2qG4GIWFV9/ezDhpLfax+2kiRx2SGGxJve3+jv09ON3EJq/xpRfM
         VmZOrY/x4Eu7jx3hEdA/DCoBoyQ8OtQb1koJdY6uy0RcvUz2gJ6feA5MWGxkDGKB4Zsz
         +5rstoeHHIXxbKHezSUWef/TVxinLaJWGoLXrPcrhAQ4u5gF0FWWGVWozqXGRE1WSXuq
         iiCg==
X-Gm-Message-State: AOJu0YxID3F9sZGgwK3UuaHdJwymDN/wjQDH52XhNatEVerSzedbz/IJ
	7e2ou1PVYFjmMaQBhbPt8T9hIoPzpW2OWPe/uR0RkvFCKAe6ivb/rRWaOCXoSu68
X-Gm-Gg: ASbGncv0Mwf32vdtffXx+cVbUlBhS9kxIUsKWp7azw9WylhjJbxVdF/PCCSVnfztOKk
	EvGvW8cWOaMVkfPHkksljYEmOUvOvvPQ30M7uNBbCgIh5U+OnSLjsmTQSfFx+JqbL9kZMZCM+qC
	ecxLjtG2xb6XCDMBX21s4KKMzAOikmZlB6+4YBzUtplWO6Al8ebJz5pQ6zg/WXpvdDE/PjUYn9V
	L7MORPn7MfiSXAc8PLFlM8N18n9Rh8xcB0Aq3YM4m3d+D9SoNav8kf8o5qTnZ2f6EoK6d3XO3W4
	o9Mf2Dn/D+mi77EJSoTeSkp8SfSuV9xWkyWPD4DjqtP0V3n/fFGAm6xAM87tOicYxiFv7XrerAk
	kWecPy9X0cxWNLwbzV+ldK+jxVV+nrAV7UaV0UzZ1tyRR82O60bu0T2hpNIPXWw==
X-Google-Smtp-Source: AGHT+IEHTE5ME7OvU7zU/shNh04Cn5W+Xaptf8HRwQT38ptQ6z9RqgHPWvTPteFJyjCMF7DW0BDLIw==
X-Received: by 2002:a05:6512:639a:20b0:560:8b56:5dc6 with SMTP id 2adb3069b0e04-5608b565f03mr140729e87.19.1756868116396;
        Tue, 02 Sep 2025 19:55:16 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: irq: Use appropriate priority for SGIs in setup_irq()
Date: Wed,  3 Sep 2025 05:55:13 +0300
Message-ID: <f7475c0083bf4995f2ec4afa3aaf44b9676fd1ab.1756867760.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Use GIC_PRI_IPI priority for SGI interrupts instead of the generic
GIC_PRI_IRQ priority in setup_irq().

This change ensures that SGIs get the correct priority level when
being set up for Xen's use, maintaining proper interrupt precedence
in the system.

The priority assignment now follows ARM GIC best practices:
- SGIs (0-15): GIC_PRI_IPI (higher priority)
- PPIs/SPIs (16+): GIC_PRI_IRQ (standard priority)

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/irq.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 02ca82c089..17c7ac92b5 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -397,7 +397,13 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
     /* First time the IRQ is setup */
     if ( disabled )
     {
-        gic_route_irq_to_xen(desc, GIC_PRI_IRQ);
+        unsigned int prio = GIC_PRI_IRQ;
+
+        /* Use appropriate priority based on interrupt type */
+        if (desc->irq < NR_GIC_SGI)
+            prio = GIC_PRI_IPI;
+
+        gic_route_irq_to_xen(desc, prio);
         /* It's fine to use smp_processor_id() because:
          * For SGI and PPI: irq_desc is banked
          * For SPI: we don't care for now which CPU will receive the
-- 
2.43.0



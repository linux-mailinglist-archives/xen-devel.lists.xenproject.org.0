Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AFACD6B0F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 17:40:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192198.1511550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXixT-0004sl-0v; Mon, 22 Dec 2025 16:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192198.1511550; Mon, 22 Dec 2025 16:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXixS-0004mc-Sh; Mon, 22 Dec 2025 16:40:30 +0000
Received: by outflank-mailman (input) for mailman id 1192198;
 Mon, 22 Dec 2025 16:40:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACBk=64=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vXixR-0004kh-6w
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 16:40:29 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eba00fb9-df54-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 17:40:27 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b7a6e56193cso695590166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 08:40:27 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f3e271sm1137038366b.60.2025.12.22.08.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 08:40:26 -0800 (PST)
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
X-Inumbo-ID: eba00fb9-df54-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766421626; x=1767026426; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Uw503SKx0GgyGrebm3SW5jx5cutNlixWzT0/a43dm0=;
        b=QHUvu/DCaS8rIq73wqnlo/4Qf4c1/6DKsOp3fNXhmDN/FVQpmrxYQUa50Xq6V2vSjp
         jYyiie+DsOOVD019HvZGGlPvekxPdiXKIdribS2+9TJ/Tx0qCVEaAtC0DqG3WqGMeTt+
         Ixkbh4A6ASxyJFADLhb/KOj05tQQe48fztdI/oQ1J/wLkkglDoQdxPt4YvyGcQb7NdZD
         QFwOzlgzbHAv27MLDYDPsWr/Z+z1xpcRk2SPMAdp0u1tsYRc0ArfFBBx2EDI0C0618Ej
         Oemrg4BTY9kn4UH8CVmswgBdO2ieACXCPyTaeDt/K1jLFOGzkbM35i0nhPKWunBeVHNt
         yZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421626; x=1767026426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Uw503SKx0GgyGrebm3SW5jx5cutNlixWzT0/a43dm0=;
        b=bBwEpT7GY/tqUISHp3i/Cku774PPHawYAkpAFVUX/R4SJin49xmgOG4zMQawg+WYsl
         7ZLPr59aO8iFCImqIkrGx2ykk8lb8Vduqdzl4GzF1uvJjUJMMS9Ge0YGWpQWzJZ9yreH
         WaBRjLnMRKnPOnECm86pMO0YN+zZZDmibJZ6qErCkDVvPiTsNSAbcjrvlb0tEaOBz2el
         3abL4ZG5sfUDtL/Jbob2OUqNo5qPy7AkTM/AzocbR/WCB/5zQxRXJJp+9sKbosDBQt7v
         QuhBEBMAfxnIhbJ825rO6buiMBF6x2ZnH3yvyfegl2BLeMqKx+AuiGUNdTaqAoeWV0h6
         Pv3Q==
X-Gm-Message-State: AOJu0YzIhypUYFA5NlNk6fvep09e0xbW6be93iJg5TfkhvlORADOxggz
	ITxzB+gCZRRv/m2unlaxO3AmKPCBVMZ2IPoQYRj9se+kqPt01GS6ZVN0bSHz0w==
X-Gm-Gg: AY/fxX7eVUYoabiLWfsu+jHnaHDuACLfpSc0Vg/tZFMtytJFI8nWr5vti8EN2r54Mep
	LR/HputqAP9B15OIJEcXs5625E3SC4H2dNuqjbJPc6MYwE2Ev9wcagwKIWvg2+9s96/jTaa5HPm
	zm8yuQpUtL7phZ8Jdj0r6RF/EX/ivE8xXcvGme2TlEc9PBOr6n4Ep8rwH5c1K1uM/mrBXFDMnCy
	MrnDanP7I3tCiEk6obJpiqynZQqTahkpGEOYhILoPrvAxBRwWkHO7A7L3D8S2lxACoz57+atx3L
	3opFfT6BfLfTx44kFD62FriZBCy8vG81EvOTbUa3vJWCcEtTun30GORb4t2OfJdGIiRo0vvwlnP
	yY8pppWUKQQHXbw8HsA8OGhH7NXlVWiTl6Vq7Gg3lQDTo+fFpMhQFdDRrWyTCgM/v+2UHBEfAqG
	5SU1Wqcs4Y/gHHuLHmpqRVXh5jXY/m/axXMJujLhVXxfCDCqU2RhVy8LU=
X-Google-Smtp-Source: AGHT+IFEnHW9OAYQ2/mOFIgK9/TTsAUnC/JliLxNXdFrAoRjE/ApHK5mBIfb4XfU5V8HIvPJmkoSlA==
X-Received: by 2002:a17:907:97c2:b0:b73:4b22:19c5 with SMTP id a640c23a62f3a-b803722a7f4mr1126204666b.44.1766421626416;
        Mon, 22 Dec 2025 08:40:26 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 1/4] xen/arm: vcpu_vgic_free() updates
Date: Mon, 22 Dec 2025 17:40:11 +0100
Message-ID: <17d04a2ba8211408cd188891a301bc521cac3bd5.1766404618.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766404618.git.oleksii.kurochko@gmail.com>
References: <cover.1766404618.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use XFREE() instead of xfree() so that vcpu_vgic_free() can be idempotent.
With XFREE(), vgic_vcpu->private_irqs is set to NULL, so calling
vcpu_vgic_free() a second time is not an issue.

Update the prototype of vcpu_vgic_free() to return void to satisfy MISRA
Rule 17.7, since the return value of vcpu_vgic_free() is not used by any
callers.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Change in v3:
 - New patch.
---
 xen/arch/arm/include/asm/vgic.h | 2 +-
 xen/arch/arm/vgic.c             | 5 ++---
 xen/arch/arm/vgic/vgic-init.c   | 4 +---
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
index 31b3d3e5ec5d..6f9ab1c98c1c 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -418,7 +418,7 @@ int domain_vgic_register(struct domain *d, unsigned int *mmio_count);
 int domain_vgic_init(struct domain *d, unsigned int nr_spis);
 void domain_vgic_free(struct domain *d);
 int vcpu_vgic_init(struct vcpu *v);
-int vcpu_vgic_free(struct vcpu *v);
+void vcpu_vgic_free(struct vcpu *v);
 
 void vgic_inject_irq(struct domain *d, struct vcpu *v, unsigned int virq,
                      bool level);
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 3ebdf9953f07..6647071ad4d7 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -390,10 +390,9 @@ int vcpu_vgic_init(struct vcpu *v)
     return 0;
 }
 
-int vcpu_vgic_free(struct vcpu *v)
+void vcpu_vgic_free(struct vcpu *v)
 {
-    xfree(v->arch.vgic.private_irqs);
-    return 0;
+    XFREE(v->arch.vgic.private_irqs);
 }
 
 struct vcpu *vgic_get_target_vcpu(struct vcpu *v, unsigned int virq)
diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
index f8d7d3a226d0..aef526f2e717 100644
--- a/xen/arch/arm/vgic/vgic-init.c
+++ b/xen/arch/arm/vgic/vgic-init.c
@@ -239,13 +239,11 @@ void domain_vgic_free(struct domain *d)
     dist->nr_spis = 0;
 }
 
-int vcpu_vgic_free(struct vcpu *v)
+void vcpu_vgic_free(struct vcpu *v)
 {
     struct vgic_cpu *vgic_cpu = &v->arch.vgic;
 
     INIT_LIST_HEAD(&vgic_cpu->ap_list_head);
-
-    return 0;
 }
 
 /*
-- 
2.52.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A79BCDA055
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 18:02:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192706.1511842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY5m0-00015P-Sq; Tue, 23 Dec 2025 17:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192706.1511842; Tue, 23 Dec 2025 17:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY5m0-0000wu-NY; Tue, 23 Dec 2025 17:02:12 +0000
Received: by outflank-mailman (input) for mailman id 1192706;
 Tue, 23 Dec 2025 17:02:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtgv=65=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vY5ly-0000rG-Uu
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 17:02:10 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1deb8b92-e021-11f0-9cce-f158ae23cfc8;
 Tue, 23 Dec 2025 18:02:09 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b7a72874af1so895079966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Dec 2025 09:02:09 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b80464e01d9sm1306260566b.42.2025.12.23.09.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 09:02:07 -0800 (PST)
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
X-Inumbo-ID: 1deb8b92-e021-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766509328; x=1767114128; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+aOZqII5wc7BowuwzDWz84yJZJIh5yD9oqK8sJIWHU=;
        b=U34azGk/kIgqoN9JkWzmgzoKsBiDc7dEhAqgDq3eLJ0XGidpV0OPA/KZw4EEFpY1c2
         ZJh3OPdv7NDREITZiHsPwBEuv+7RfU9+lO8QPCavWAl99wIMZXDOzjHMrj7VwTIbw2rA
         aCP5ynArzqbMqVH0g7SmErqfRZU8aPGuNyWVL72hyypTaOqik1w5UX+B7ukjEsyJyZbv
         t7HfpPemI8ZWxTE3XWwZE6RdHpNMO1PHYODBniL+ABATBE9li63Dxo2rvfLpahftRVi4
         V6B0PWpHuJphxFr3LJNMOCxJxkTyjfBFM7pPLJBjghfjICCHQZsi6wR5DmUI9UxSVxF4
         8RMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509328; x=1767114128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j+aOZqII5wc7BowuwzDWz84yJZJIh5yD9oqK8sJIWHU=;
        b=wCiuPX3+9LK+g0v7dDHAhXfhS0ecS9bZm7kuSsVQiYhIPuulkc8DaYwFTUh9M71F25
         ZTBuQ8cnad092Tc2mhojs99RR4SavZPs6OslqmJSAFtzTUIHEgTgXpEMZDL2Gz6HWtxN
         m+NCKdU+vXj1AQG8xdDeXTWRE71z7J91eWy46DLOpTf/0yK26+cd3l9yDNP6rN6UDLsB
         29I1QCjU5suH0gzhDvLrP477HeOzCDyTaMFd5UapRTChGSJZk3ZfD5ba8B4DOcYuKV7L
         yylWHhM+CCX63QpT8brxPcnG15bKXZa0f4uVsncKvbHGqaAizk9OFqGEmXtK0ZeKIrvX
         Beog==
X-Gm-Message-State: AOJu0YzymtpaxbfcRT9v2EKKAKUX5VP3NuCbzLUjXD9LODGMysyEfxG0
	zsMslP+6YYhPd0VwCZH4QDGqEgojp4n4LMClolxpzsKc38oldM7UoiLcJDnGBA==
X-Gm-Gg: AY/fxX6tu9i0Pw6KJ32Ayq7N+qOt+Rj/ZTmSEjxD73GspyFoLA8INtID9K9zzB0NF+B
	UWHfeg1OW/bTzn8gw3EilCIG8TM/2UguAVIer/SR4aK/rztLXmlrNpzV/P+M9H++H6wR2PB1hoU
	BDxJK8i2hi0bkEGQCWbOBQvkH5WpD+p3uVFpOTKZP8R8QdU28HzxOTBLNvihu6Dcta+TGt8ntcl
	do+G1w00wHFY505xGBoh5GaNx+XyxNsWSPIL0E++mjtkCkFbnG8ghS1GxPDxnA0A3ATqOhzlxLT
	eL1omuHrMJpzBDm5koElykmpWBiwoyF1QVF/JxxXvFHsk3s21bIn3AHI3ROmDEfs0LYcJBYdoJQ
	1pj6NqnLLxIvqYQsuweU8L+TPMJnf6Ce/CcVZB8ChF8hdGjiPff2vaQkt9UJd21Rl2hhiSBRPKk
	xDIVrMS6rHxCGK7ZLKTj8rBBfjL+/XQJvAaqpcYlRZ/SLstDbMLdde1w5unfjawnNXbA==
X-Google-Smtp-Source: AGHT+IFdBau6LYw66LiszAsIrMwHExSX3yPph04NnwJrpcy0HJbAmKM1EnTblHaCRBYBx5YCL/+Qzg==
X-Received: by 2002:a17:907:1b0f:b0:b76:d4d0:68da with SMTP id a640c23a62f3a-b8036ebaaf1mr1435816066b.6.1766509328037;
        Tue, 23 Dec 2025 09:02:08 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v4 1/4] xen/arm: vcpu_vgic_free() updates
Date: Tue, 23 Dec 2025 18:01:55 +0100
Message-ID: <ca86bf36375d19555961225f214b9d23557b0d3a.1766504313.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766504313.git.oleksii.kurochko@gmail.com>
References: <cover.1766504313.git.oleksii.kurochko@gmail.com>
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
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Change in v4:
 - Add Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>.
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



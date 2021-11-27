Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E25564600C1
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 18:52:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234025.406260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1ro-0006Hn-Gk; Sat, 27 Nov 2021 17:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234025.406260; Sat, 27 Nov 2021 17:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mr1rn-0005vN-Pu; Sat, 27 Nov 2021 17:52:03 +0000
Received: by outflank-mailman (input) for mailman id 234025;
 Sat, 27 Nov 2021 17:52:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BaOL=QO=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mr1rj-0004Ig-OI
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 17:51:59 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7db9b79-4faa-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 18:51:59 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id l22so32523574lfg.7
 for <xen-devel@lists.xenproject.org>; Sat, 27 Nov 2021 09:51:59 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f18sm827075ljc.104.2021.11.27.09.51.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Nov 2021 09:51:58 -0800 (PST)
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
X-Inumbo-ID: b7db9b79-4faa-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2J9/qwJjzL1vy0hvabGaR4en8taUbQNdDtr6iBACZRU=;
        b=BtBsFq74Y6vVV5z3EGw5Q8X/k/ZggHQUkBWk3YD2BpquPPvebfxJ7V2SodyTff6/ad
         nxbAG+IPeEB8DhtvtHNcDI0tDtjLDafxSokUPzfemqzDBRXPMdBtVJCsfor09UYIMgZ9
         a39ejS2BlunDOIIGofTcxjhwb9kUfpIurujLkJVGfgENP3xvV/4W4hCSnNVnVkJ9M/7P
         oRuP092PAvNZJEKcd/pyKlyzil1rzsOzonrkPjM+Q4A04tWs3wLJFHzyz8X4AfoPB0Jt
         G2m8GbPBrJf6+fbl6L6Rc1waGSMJ957VSRo1lPVyM1q6E8meJYHzo63Bpn0pFEeto1O8
         XLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2J9/qwJjzL1vy0hvabGaR4en8taUbQNdDtr6iBACZRU=;
        b=jwQ9nSbT9AboHeJp6AzmRAfZVfmbcHdisY/302VhJdczjyjgyBZ54URl4WvmBu0XrD
         SFRgVDqjd27fLFRQGSFPeQ4Yw5C8FolC7Rnv7lrYp+gdmgWMKyc+LLWJN91QkXy+916n
         r0LOCZpTTyfttGELjv1LBdiktl71UgtXSvGKZ7VxM3SczsKMKr290ljUToZb79LSuiUF
         LQtj0cYCPNWbg9SkltoakZ7Zm3xNTtkrGvoFGDTgfnnE2TVAlyCR4Z1M1TtrKYLc2efI
         xERl+0VsO6ojIXo5fPiozVKsECaHyOxgPXb5agy0SPhxJgPBHPUwch/OenVh8QHPDZHY
         iOYQ==
X-Gm-Message-State: AOAM530oxSJD0xQH9j7D3CwWottf2KEhyBkr3UlpZVORcjZDJLRlyA4B
	F+NF4tAYOoMGZ3EvwaacQgn5O/Sy44s=
X-Google-Smtp-Source: ABdhPJzRAgmVvEZRPEQsyvpTeU07E/9l7RI9tG/ffWq//vqNRNWFQk9exo+DCDQM70ASOm68dF3Q5g==
X-Received: by 2002:a05:6512:2255:: with SMTP id i21mr37246692lfu.438.1638035518550;
        Sat, 27 Nov 2021 09:51:58 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 09/10] iommu/ipmmu-vmsa: Use refcount for the micro-TLBs
Date: Sat, 27 Nov 2021 19:51:44 +0200
Message-Id: <1638035505-16931-10-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reference-count the micro-TLBs as several bus masters can be
connected to the same micro-TLB (and drop TODO comment).
This wasn't an issue so far, since the platform devices
(this driver deals with) get assigned/deassigned together during
domain creation/destruction. But, in order to support PCI devices
(which are hot-pluggable) in the near future we will need to
take care of.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 22dd84e..32609f8 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -134,6 +134,7 @@ struct ipmmu_vmsa_device {
     spinlock_t lock;    /* Protects ctx and domains[] */
     DECLARE_BITMAP(ctx, IPMMU_CTX_MAX);
     struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
+    unsigned int utlb_refcount[IPMMU_UTLB_MAX];
     const struct ipmmu_features *features;
 };
 
@@ -477,13 +478,12 @@ static int ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
         }
     }
 
-    /*
-     * TODO: Reference-count the micro-TLB as several bus masters can be
-     * connected to the same micro-TLB.
-     */
-    ipmmu_imuasid_write(mmu, utlb, 0);
-    ipmmu_imuctr_write(mmu, utlb, imuctr |
-                       IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_MMUEN);
+    if ( mmu->utlb_refcount[utlb]++ == 0 )
+    {
+        ipmmu_imuasid_write(mmu, utlb, 0);
+        ipmmu_imuctr_write(mmu, utlb, imuctr |
+                           IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_MMUEN);
+    }
 
     return 0;
 }
@@ -494,7 +494,8 @@ static void ipmmu_utlb_disable(struct ipmmu_vmsa_domain *domain,
 {
     struct ipmmu_vmsa_device *mmu = domain->mmu;
 
-    ipmmu_imuctr_write(mmu, utlb, 0);
+    if ( --mmu->utlb_refcount[utlb] == 0 )
+        ipmmu_imuctr_write(mmu, utlb, 0);
 }
 
 /* Domain/Context Management */
-- 
2.7.4



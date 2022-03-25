Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D865A4E74EA
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 15:19:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294777.501379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkm0-0000iB-CN; Fri, 25 Mar 2022 14:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294777.501379; Fri, 25 Mar 2022 14:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkm0-0000f6-9M; Fri, 25 Mar 2022 14:18:40 +0000
Received: by outflank-mailman (input) for mailman id 294777;
 Fri, 25 Mar 2022 14:18:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EIhH=UE=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nXkly-0000f0-Pe
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 14:18:38 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75fb6bb1-ac46-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 15:18:37 +0100 (CET)
Received: by mail-qk1-x729.google.com with SMTP id h196so6040212qke.12
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 07:18:37 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a05620a2a0a00b00680bac9108dsm441080qkp.22.2022.03.25.07.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 07:18:35 -0700 (PDT)
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
X-Inumbo-ID: 75fb6bb1-ac46-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xmogf3PlJaQyDoPI6ivORvJ+dMlL49hduRZTAifaIbU=;
        b=J0pe8xDNenHuH/0qgcxvWErwWAEXv773WOs6A6WCNuTjBW9xZhfQ1/+wNE93IHkP8+
         b3BP4mKdHumDXB95AEp22muflEjjljVBCKvsatf0uNJVQlkP05WHxoswqR6MXIVywIr4
         JxurH7ZURKHYknsm+A9QBOqWqAIEStIef7dacZ6CFyfU5WIVNiqhgP722s7J1cxE3tgj
         s7PyHWRJoHaAXADHZ4Xl27mLjDxvjr40aXnIIozhF24sti9lyM/4eKdhWdMZZhJs1vbV
         T/FNBu7IhQne2B+CPPIydO7VSeL70hTYU/iilvLN+NXt0WzyqG2ndSMk65eaXrXDNRaT
         xhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xmogf3PlJaQyDoPI6ivORvJ+dMlL49hduRZTAifaIbU=;
        b=JsnwnILCzLftSEWNMPXFVpf9Wv2x3GNKXSfjNDEnioQWTIJluXh9X07qZ+RWV5xr/N
         +ug7QN/M+Ec9VRvjW+RWX8xUkjNfOPr4HTlV+4KNd3HGUeA6f1idH6d6TF3HJy3PXjH1
         Bp7hHm+apZo98b3RwMuOdgCXtEDbK92amUPaIkOaHRPnYn8i0Iuy/YvZOLFhT1adVCC7
         yZxXy0WdyqEkbpFofpFb/m6/ExunFVZGeOImYTKark74efHKFNdziXRP/Sqfw6fHnlgo
         rQG0GtiKmVi7q4XkwUmr/27jBDzoVx8KmmZgJqUZhcbIBS6HApCOam2q2c4FTkLX3Igh
         4A/A==
X-Gm-Message-State: AOAM5318eXveiVYdT/NzdWFLJHso8l6GvT8LnNN0OsNst6I9hnlSuP5k
	RoFINX4MgYtmHyWWJytUgIK68XshzBA=
X-Google-Smtp-Source: ABdhPJxZHAJHtrRZ52Y26q+n5aY/aHPZQ3MJxiPDaIuQJDVPq7UHIQ0+hHCo/HFX+lV2cJmAZfzheQ==
X-Received: by 2002:a05:620a:1432:b0:67d:36cd:1f16 with SMTP id k18-20020a05620a143200b0067d36cd1f16mr6726869qkj.166.1648217916029;
        Fri, 25 Mar 2022 07:18:36 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	"Daniel P. Smith" <dpsmith.dev@gmail.com>
Subject: [PATCH] x86/physdev: Call xsm_unmap_domain_irq earlier
Date: Fri, 25 Mar 2022 10:18:26 -0400
Message-Id: <20220325141826.16245-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pull the XSM check up out of unmap_domain_pirq into physdev_map_pirq.

xsm_unmap_domain_irq was seen denying unmap_domain_pirq when called from
complete_domain_destroy as an RCU callback.  The source context was an
unexpected, random domain.  Since this is a xen-internal operation,
going through the XSM hook is inapproriate.

Move the XSM hook up into physdev_unmap_pirq, which is the
guest-accessible path.  This requires moving some of the sanity check
upwards as well since the hook needs the additional data to make its
decision.  Since complete_domain_destroy still calls unmap_domain_pirq,
replace the moved runtime checking with assert.  Only valid pirqs should
make their way into unmap_domain_pirq from complete_domain_destroy.

This is mostly code movement, but one style change is to pull `irq =
info->arch.irq` out of the if condition.

Label done is now unused and removed.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
unmap_domain_pirq is also called in vioapic_hwdom_map_gsi and
vpci_msi_disable.  vioapic_hwdom_map_gsi is a cleanup path after going
through map_domain_pirq, and I don't think the vpci code is directly
guest-accessible.  So I think those are okay, but I not familiar with
that code.  Hence, I am highlighting it.

 xen/arch/x86/irq.c     | 31 +++++++-----------------------
 xen/arch/x86/physdev.c | 43 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 49 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 285ac399fb..ddd3194fba 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2310,41 +2310,25 @@ int unmap_domain_pirq(struct domain *d, int pirq)
     struct pirq *info;
     struct msi_desc *msi_desc = NULL;
 
-    if ( (pirq < 0) || (pirq >= d->nr_pirqs) )
-        return -EINVAL;
-
+    ASSERT(pirq >= 0);
+    ASSERT(pirq < d->nr_pirqs);
     ASSERT(pcidevs_locked());
     ASSERT(spin_is_locked(&d->event_lock));
 
     info = pirq_info(d, pirq);
-    if ( !info || (irq = info->arch.irq) <= 0 )
-    {
-        dprintk(XENLOG_G_ERR, "dom%d: pirq %d not mapped\n",
-                d->domain_id, pirq);
-        ret = -EINVAL;
-        goto done;
-    }
+    ASSERT(info);
+
+    irq = info->arch.irq;
+    ASSERT(irq > 0);
 
     desc = irq_to_desc(irq);
     msi_desc = desc->msi_desc;
     if ( msi_desc && msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
     {
-        if ( msi_desc->msi_attrib.entry_nr )
-        {
-            printk(XENLOG_G_ERR
-                   "dom%d: trying to unmap secondary MSI pirq %d\n",
-                   d->domain_id, pirq);
-            ret = -EBUSY;
-            goto done;
-        }
+        ASSERT(msi_desc->msi_attrib.entry_nr == 0);
         nr = msi_desc->msi.nvec;
     }
 
-    ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
-                               msi_desc ? msi_desc->dev : NULL);
-    if ( ret )
-        goto done;
-
     forced_unbind = pirq_guest_force_unbind(d, info);
     if ( forced_unbind )
         dprintk(XENLOG_G_WARNING, "dom%d: forcing unbind of pirq %d\n",
@@ -2405,7 +2389,6 @@ int unmap_domain_pirq(struct domain *d, int pirq)
     if (msi_desc)
         msi_free_irq(msi_desc);
 
- done:
     return ret;
 }
 
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 2ddcf44f33..a5ed257dca 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -140,8 +140,11 @@ int physdev_map_pirq(domid_t domid, int type, int *index, int *pirq_p,
 
 int physdev_unmap_pirq(domid_t domid, int pirq)
 {
+    struct msi_desc *msi_desc;
+    struct irq_desc *desc;
+    struct pirq *info;
     struct domain *d;
-    int ret = 0;
+    int irq, ret = 0;
 
     d = rcu_lock_domain_by_any_id(domid);
     if ( d == NULL )
@@ -162,9 +165,47 @@ int physdev_unmap_pirq(domid_t domid, int pirq)
             goto free_domain;
     }
 
+    if ( (pirq < 0) || (pirq >= d->nr_pirqs) ) {
+        ret = -EINVAL;
+        goto free_domain;
+    }
+
     pcidevs_lock();
     spin_lock(&d->event_lock);
+
+    info = pirq_info(d, pirq);
+    irq = info ? info->arch.irq : 0;
+    if ( !info || irq <= 0 )
+    {
+        dprintk(XENLOG_G_ERR, "dom%d: pirq %d not mapped\n",
+                d->domain_id, pirq);
+        ret = -EINVAL;
+        goto unlock;
+    }
+
+    desc = irq_to_desc(irq);
+    msi_desc = desc->msi_desc;
+    if ( msi_desc && msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
+    {
+        if ( msi_desc->msi_attrib.entry_nr )
+        {
+            printk(XENLOG_G_ERR
+                   "dom%d: trying to unmap secondary MSI pirq %d\n",
+                   d->domain_id, pirq);
+            ret = -EBUSY;
+            goto unlock;
+        }
+    }
+
+    ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
+                               msi_desc ? msi_desc->dev : NULL);
+    if ( ret )
+        goto unlock;
+
     ret = unmap_domain_pirq(d, pirq);
+
+ unlock:
+
     spin_unlock(&d->event_lock);
     pcidevs_unlock();
 
-- 
2.35.1



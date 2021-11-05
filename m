Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADF2445FB6
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222021.384031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1misnA-0001U5-2W; Fri, 05 Nov 2021 06:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222021.384031; Fri, 05 Nov 2021 06:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1misn9-0001RT-T6; Fri, 05 Nov 2021 06:33:35 +0000
Received: by outflank-mailman (input) for mailman id 222021;
 Fri, 05 Nov 2021 06:33:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1misn8-0001ER-6k
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:33:34 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c03c8fa-3e02-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 07:33:33 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id g10so29445595edj.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:33:32 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id e12sm3599870ejs.86.2021.11.04.23.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:33:31 -0700 (PDT)
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
X-Inumbo-ID: 4c03c8fa-3e02-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OlgpjgahBsbrNbkfAB2Gqbx6wbNdhBt0yFjmP2Yi1zg=;
        b=NjwUjpR5HC2Bg0akPdE1AxsQePsbsjfXZYA7sDRBtsedkkOWlwLQPkdkz+x9kboXGy
         M5YFcQfs8nVUDz5uQYw7zAaySt4XLq+bd3hiPlT9x79OrufwJDT/nSZsHalyDN4syhvf
         icawSkNQD5UiHo78v+auxuFt51ODnNJ+plgo+pjcfX/KIBRAtPLkKYEvHkWnTQaHtMFg
         bar38eAT+zlAqhs9DCmZLpY+VTfCsjv1tYAwj9HpuAwppp86NNhixVu+1GE9Zz2guVm0
         N91ReZaZrdmUYH6nqZPk02tpBGslt3yJWvTCCgaqceTsc6kOaaTnWzyhFMthCltsuZ2U
         tunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OlgpjgahBsbrNbkfAB2Gqbx6wbNdhBt0yFjmP2Yi1zg=;
        b=SCmFJdWIPacI6cbNn6N8n4bwZYAVuw4cyrTGl+Ghhzdj/ufkpt9ESvUtjgqGTPW3QC
         S66gFy5WWdbTU+qqVaQkjobWXUA4alhfjLiiw79zXypb4PtXwzgzK8jdskHpq/KnPEyF
         h4uqCMInPI9tcJ+6WorkaRafCUE1pAsMBDcTZhlI3DiQNGk4IH1lVwdQB914hS1VE1lo
         0NMlyH3KfiwQ+pPXJjlnqEWdsJ5WtuBvncjDf6sincg1kqnyrItkDKzi55a5jmntJAZh
         nKzpzamnRtfJlsA0b1jjWU2cc157mHBWfxkecf8k/qLdc93SEZE3O8BGW1oo9dlXLyQK
         0p2g==
X-Gm-Message-State: AOAM532rxyIfjyhyMvPEpPNhf07YEOGJVTx19MVkJfIAKYaUjH5d4RKw
	0UHVtywT+pANtrdEYp3nfD4/RJTCujKLDA==
X-Google-Smtp-Source: ABdhPJwtG+PaF+XhSApDY2g23/Yp/gjYGWQ5/anjKkWg4HqvSYC2pJy8ySF6kDMl2A3dJIRSpL48Tw==
X-Received: by 2002:a17:906:2cd5:: with SMTP id r21mr71140062ejr.435.1636094012280;
        Thu, 04 Nov 2021 23:33:32 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v6 2/7] xen/arm: add pci-domain for disabled devices
Date: Fri,  5 Nov 2021 08:33:21 +0200
Message-Id: <20211105063326.939843-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105063326.939843-1-andr2000@gmail.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

If a PCI host bridge device is present in the device tree, but is
disabled, then its PCI host bridge driver was not instantiated.
This results in the failure of the pci_get_host_bridge_segment()
and the following panic during Xen start:

(XEN) Device tree generation failed (-22).
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Could not set up DOM0 guest OS
(XEN) ****************************************

Fix this by adding "linux,pci-domain" property for all device tree nodes
which have "pci" device type, so we know which segments will be used by
the guest for which bridges.

Fixes: 4cfab4425d39 ("xen/arm: Add linux,pci-domain property for hwdom if not available.")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
New in v6
---
 xen/arch/arm/domain_build.c        | 15 ++++++++++++++-
 xen/arch/arm/pci/pci-host-common.c |  2 +-
 xen/include/asm-arm/pci.h          |  8 ++++++++
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 491f5e2c316e..f7fcb1400c19 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -753,9 +753,22 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
         {
             uint16_t segment;
 
+            /*
+             * The node doesn't have "linux,pci-domain" property and it is
+             * possible that:
+             *  - Xen only has drivers for a part of the host bridges
+             *  - some host bridges are disabled
+             * Make sure we insert the correct "linux,pci-domain" property
+             * in any case, so we know which segments will be used
+             * by Linux for which bridges.
+             */
             res = pci_get_host_bridge_segment(node, &segment);
             if ( res < 0 )
-                return res;
+            {
+                segment = pci_get_new_domain_nr();
+                printk(XENLOG_DEBUG "Assigned segment %d to %s\n",
+                       segment, node->full_name);
+            }
 
             res = fdt_property_cell(kinfo->fdt, "linux,pci-domain", segment);
             if ( res )
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index d8cbaaaba654..47104b22b221 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -137,7 +137,7 @@ void pci_add_host_bridge(struct pci_host_bridge *bridge)
     list_add_tail(&bridge->node, &pci_host_bridges);
 }
 
-static int pci_get_new_domain_nr(void)
+int pci_get_new_domain_nr(void)
 {
     return atomic_inc_return(&domain_nr);
 }
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 81273e0d87ac..c20eba643d86 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -108,6 +108,8 @@ static always_inline bool is_pci_passthrough_enabled(void)
 
 void arch_pci_init_pdev(struct pci_dev *pdev);
 
+int pci_get_new_domain_nr(void);
+
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
@@ -128,5 +130,11 @@ static inline int pci_get_host_bridge_segment(const struct dt_device_node *node,
     return -EINVAL;
 }
 
+static inline int pci_get_new_domain_nr(void)
+{
+    ASSERT_UNREACHABLE();
+    return -1;
+}
+
 #endif  /*!CONFIG_HAS_PCI*/
 #endif /* __ARM_PCI_H__ */
-- 
2.25.1



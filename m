Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A02C23FFC36
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 10:41:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177903.323668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4la-00061x-RZ; Fri, 03 Sep 2021 08:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177903.323668; Fri, 03 Sep 2021 08:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4la-0005z1-NF; Fri, 03 Sep 2021 08:41:42 +0000
Received: by outflank-mailman (input) for mailman id 177903;
 Fri, 03 Sep 2021 08:41:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM4en-0006kQ-E9
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 08:34:41 +0000
Received: from mail-ed1-x531.google.com (unknown [2a00:1450:4864:20::531])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cbf0903-612d-4e40-aaea-917bad9342ef;
 Fri, 03 Sep 2021 08:34:01 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id v5so1613984edc.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 01:34:01 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id i7sm2311932ejx.73.2021.09.03.01.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 01:34:00 -0700 (PDT)
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
X-Inumbo-ID: 3cbf0903-612d-4e40-aaea-917bad9342ef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RKj8rEW+uLzxBa1xS9FCgER2pVUMxy97v84H9BueJo8=;
        b=Cc7VjnWxryLAC/tqYxNfb0Vqq0sB/g3r4rmDDY0lS2y4ND5fCxj+3AtTH0jMf3UD7I
         lArRxEur0IpiP8IRmM5bMXAd2tDTqstoOHd1vrOJQB+pAYbF+caMEs1aDP0y6JUJoUAC
         xEaHLm1ca7cVFaDLT1hlicqg/QeFfEAaQY7S1SpqIHJhYw6d6GtxExLoUnpq0E0zuH+m
         4NCp+Ya/PMN9z0TzuqE1T/2/rlEnc8XJFLpeu56yU2FZu5xlOk5bPOVjQrgrStQv7HvU
         TwhRciy77N17AemdAXrbaCnjfawSj07zHK5ot06VaJwpM/HtZHOSN1AfqKhUFuuc/1HO
         ob5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RKj8rEW+uLzxBa1xS9FCgER2pVUMxy97v84H9BueJo8=;
        b=oBLpbapiCNQnIjv9Mo/sSyhL3oVakBxi1XwL1Wi7m4raUtBsNmjtGeWCoq7dTXXeTC
         KhocmQ1iynUJWKyuksEXh1BgFK/jRTRPbFN9qbQGg3QpeHcER3uNfb0r1fulY1GJFamB
         62zgQyF5dXtDweUZgg+/rJfYhR1agFpdUJtTWRgPVyZ8E3dkOV4MxOj72N2h1gVKp5b9
         vw15weokEfFftha6EM7IAETNzYpDgpzrZhG6Te4CYpQzeWncKy3llziRgqTWuOUkSF5w
         +q8Ng9ouUhGTopIjWQh/VhFVLNkp8wFO1HvkvKKBqNBPjPXhP9sPPQc9MbI4DGh/0pTk
         Kzfg==
X-Gm-Message-State: AOAM533uKOsAif0Gr5pPehfRtIiQNwbwfBJWC0recNqto4ZX7hQfZS3k
	Xjt3APquPw91Bq5Rgk6LA7LYf07qXZs=
X-Google-Smtp-Source: ABdhPJwyyY+X4Ff7jtwDvNQrMZN78ZPm6ovgltm1mRQGeZ/mmH2TfThaCYtmDMf1K+WgzeKR4mkDAg==
X-Received: by 2002:aa7:c9d6:: with SMTP id i22mr605692edt.307.1630658040780;
        Fri, 03 Sep 2021 01:34:00 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's p2m
Date: Fri,  3 Sep 2021 11:33:46 +0300
Message-Id: <20210903083347.131786-11-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903083347.131786-1-andr2000@gmail.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Host bridge controller's ECAM space is mapped into Domain-0's p2m,
thus it is not possible to trap the same for vPCI via MMIO handlers.
For this to work we need to not map those while constructing the domain.

Note, that during Domain-0 creation there is no pci_dev yet allocated for
host bridges, thus we cannot match PCI host and its associated
bridge by SBDF. Use dt_device_node field for checks instead.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/arch/arm/domain_build.c        |  3 +++
 xen/arch/arm/pci/ecam.c            | 17 +++++++++++++++++
 xen/arch/arm/pci/pci-host-common.c | 22 ++++++++++++++++++++++
 xen/include/asm-arm/pci.h          | 12 ++++++++++++
 4 files changed, 54 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index da427f399711..76f5b513280c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1257,6 +1257,9 @@ static int __init map_range_to_domain(const struct dt_device_node *dev,
         }
     }
 
+    if ( need_mapping && (device_get_class(dev) == DEVICE_PCI) )
+        need_mapping = pci_host_bridge_need_p2m_mapping(d, dev, addr, len);
+
     if ( need_mapping )
     {
         res = map_regions_p2mt(d,
diff --git a/xen/arch/arm/pci/ecam.c b/xen/arch/arm/pci/ecam.c
index 92ecb2e0762b..d32efb7fcbd0 100644
--- a/xen/arch/arm/pci/ecam.c
+++ b/xen/arch/arm/pci/ecam.c
@@ -52,6 +52,22 @@ static int pci_ecam_register_mmio_handler(struct domain *d,
     return 0;
 }
 
+static int pci_ecam_need_p2m_mapping(struct domain *d,
+                                     struct pci_host_bridge *bridge,
+                                     uint64_t addr, uint64_t len)
+{
+    struct pci_config_window *cfg = bridge->sysdata;
+
+    if ( !is_hardware_domain(d) )
+        return true;
+
+    /*
+     * We do not want ECAM address space to be mapped in domain's p2m,
+     * so we can trap access to it.
+     */
+    return cfg->phys_addr != addr;
+}
+
 /* ECAM ops */
 const struct pci_ecam_ops pci_generic_ecam_ops = {
     .bus_shift  = 20,
@@ -60,6 +76,7 @@ const struct pci_ecam_ops pci_generic_ecam_ops = {
         .read                   = pci_generic_config_read,
         .write                  = pci_generic_config_write,
         .register_mmio_handler  = pci_ecam_register_mmio_handler,
+        .need_p2m_mapping       = pci_ecam_need_p2m_mapping,
     }
 };
 
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index a89112bfbb7c..c04be636452d 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -334,6 +334,28 @@ int pci_host_iterate_bridges(struct domain *d,
     }
     return 0;
 }
+
+bool pci_host_bridge_need_p2m_mapping(struct domain *d,
+                                      const struct dt_device_node *node,
+                                      uint64_t addr, uint64_t len)
+{
+    struct pci_host_bridge *bridge;
+
+    list_for_each_entry( bridge, &pci_host_bridges, node )
+    {
+        if ( bridge->dt_node != node )
+            continue;
+
+        if ( !bridge->ops->need_p2m_mapping )
+            return true;
+
+        return bridge->ops->need_p2m_mapping(d, bridge, addr, len);
+    }
+    printk(XENLOG_ERR "Unable to find PCI bridge for %s segment %d, addr %lx\n",
+           node->full_name, bridge->segment, addr);
+    return true;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 2c7c7649e00f..9c28a4bdc4b7 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -82,6 +82,8 @@ struct pci_ops {
     int (*register_mmio_handler)(struct domain *d,
                                  struct pci_host_bridge *bridge,
                                  const struct mmio_handler_ops *ops);
+    int (*need_p2m_mapping)(struct domain *d, struct pci_host_bridge *bridge,
+                            uint64_t addr, uint64_t len);
 };
 
 /*
@@ -115,9 +117,19 @@ struct dt_device_node *pci_find_host_bridge_node(struct device *dev);
 int pci_host_iterate_bridges(struct domain *d,
                              int (*clb)(struct domain *d,
                                         struct pci_host_bridge *bridge));
+bool pci_host_bridge_need_p2m_mapping(struct domain *d,
+                                      const struct dt_device_node *node,
+                                      uint64_t addr, uint64_t len);
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
 
+static inline bool
+pci_host_bridge_need_p2m_mapping(struct domain *d,
+                                 const struct dt_device_node *node,
+                                 uint64_t addr, uint64_t len)
+{
+    return true;
+}
 #endif  /*!CONFIG_HAS_PCI*/
 #endif /* __ARM_PCI_H__ */
-- 
2.25.1



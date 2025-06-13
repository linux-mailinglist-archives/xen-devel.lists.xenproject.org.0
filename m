Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A037AD8904
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 12:14:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014180.1392412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ1Pf-0001be-Ln; Fri, 13 Jun 2025 10:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014180.1392412; Fri, 13 Jun 2025 10:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ1Pf-0001ZZ-Ih; Fri, 13 Jun 2025 10:13:31 +0000
Received: by outflank-mailman (input) for mailman id 1014180;
 Fri, 13 Jun 2025 10:13:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkHq=Y4=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uQ1Pe-0001ZT-93
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 10:13:30 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c922ef3-483f-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 12:13:28 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so1566294f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 03:13:28 -0700 (PDT)
Received: from localhost.localdomain (188.226.6.51.dyn.plus.net.
 [51.6.226.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532dea1b1asm49041305e9.14.2025.06.13.03.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 03:13:26 -0700 (PDT)
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
X-Inumbo-ID: 0c922ef3-483f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1749809607; x=1750414407; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bbQvKXfode3vKp2lM3/5KLgpJtUXhAU0zX5262RfasI=;
        b=bxWJJIcb/21NjHIkoaC34ot/KnYqIsAhw6uA8xW0rpEf2ljIG0V084CfZ3a5sWVqIL
         qrMi6XktdchLZ05nUsa2Q5wSVvY6Zaiyo09cGK1LnXwe8Vs3+RqE94TlpFhtRN8oHNoO
         pa4iaJN+fxp3vNl+dqP9pUlp5RH6mF8ZdtZIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749809607; x=1750414407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbQvKXfode3vKp2lM3/5KLgpJtUXhAU0zX5262RfasI=;
        b=LjoVw/eyYWoY2myOFRKyIXosk/URJ6jRVf8rQHz05+aJ74qq9L0hTGAi4MaoNl8qhl
         Dq4+n8K+El+JjhisRPF/7dhY+BMsm6F3D+a0p5Y7as4s64vXPa5qui22LeTIqARDpkfO
         T0U0EpjXxyTMOmbL/5KIiVFXoB5AQZDSx88XpCsDNAPN+OXpk32ud+C2vhY0yZoeZ7NB
         7SWzfnt6o2Wfi4GNl/1kdPOYGlZ9/EypZ0AWSDqLIDU9q9+QBEZBhPMnGdG28u7Tp0mN
         16ABH19GTtd/OHTWd79q76Jq/oiu01wA2cxHbFV7vfEYFltsMIiYSM1638d5slG7Pp6e
         TLGA==
X-Gm-Message-State: AOJu0YwOaI0QTDwN0cR5tc4SU+ZaT42knLwKaFYNVA1fKumDwNEwri1+
	WKxqqjG2Hh2hTdhbMzU0ThsbwuJVEEnivyOWsKnTMb5KgYJYGl/iOoUuGROiqNA/s0zVocBCiay
	eqUDKPPs=
X-Gm-Gg: ASbGncsyBSy0WyHYVahmd+qEVVqv+On3nyVRcZ8x/SqkQxaGbXDTO4rNyJGSGjE490/
	GarwInyzML2c34BowbqIxdjPrmkRfzskeDMCNgV/pJYsfGvMplQXkHZj7ql9Lg1GU1PH+nEXjf6
	8dEAqpnNZEYb4Kt0Ol3/ZVsU6HnWpgeNgUxJvxkBeR8dVKvabnxaI7D8oPsuR9QuPYJcEEOqKbi
	KD8r1Y1RLNPDZhIKSaCz1TB6FEsdZEB56JH5q3r+oaXg+jhLyqtkCOmN4/usnFi3RzfYe8gnM6j
	KEJJPYr6ho+orcmMw+smtBl6FySDc7CkQU4wTN069sW+67JM7Ezsenplp3kRkssHENjQomVBtiS
	zvoLUNs1mXQZzu8myICbi+UhFuqtqHThxDS4XxSdz
X-Google-Smtp-Source: AGHT+IHy/GyYYHuUrofCqs4FhNEwDFUe6d146z9qWDc9ZNTHuGWO4e5tOZd4O9USbOmp5dMqgBtmqQ==
X-Received: by 2002:a05:6000:420c:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3a56879428cmr2232805f8f.52.1749809607190;
        Fri, 13 Jun 2025 03:13:27 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] x86/pci: Use C99 style types for fixed integrals
Date: Fri, 13 Jun 2025 11:12:47 +0100
Message-ID: <20250613101249.164199-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just code style change.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/include/xen/pci.h | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index ef60196653..f22bbc2776 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -89,8 +89,8 @@ struct pci_dev_info {
     bool is_extfn;
     bool is_virtfn;
     struct {
-        u8 bus;
-        u8 devfn;
+        uint8_t bus;
+        uint8_t devfn;
     } physfn;
 };
 
@@ -209,26 +209,26 @@ static always_inline bool pcidevs_trylock(void)
 #define ASSERT_PDEV_LIST_IS_READ_LOCKED(d) ((void)(d))
 #endif
 
-bool pci_known_segment(u16 seg);
-bool pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func);
+bool pci_known_segment(uint16_t seg);
+bool pci_device_detect(uint16_t seg, uint8_t bus, uint8_t dev, uint8_t func);
 int scan_pci_devices(void);
-enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn);
-int find_upstream_bridge(u16 seg, u8 *bus, u8 *devfn, u8 *secbus);
+enum pdev_type pdev_type(uint16_t seg, uint8_t bus, uint8_t devfn);
+int find_upstream_bridge(uint16_t seg, uint8_t *bus, uint8_t *devfn, uint8_t *secbus);
 
 void setup_hwdom_pci_devices(struct domain *d,
                              int (*handler)(uint8_t devfn,
                                             struct pci_dev *pdev));
 int pci_release_devices(struct domain *d);
-int pci_add_segment(u16 seg);
-const unsigned long *pci_get_ro_map(u16 seg);
-int pci_add_device(u16 seg, u8 bus, u8 devfn,
+int pci_add_segment(uint16_t seg);
+const unsigned long *pci_get_ro_map(uint16_t seg);
+int pci_add_device(uint16_t seg, uint8_t bus, uint8_t devfn,
                    const struct pci_dev_info *info, nodeid_t node);
-int pci_remove_device(u16 seg, u8 bus, u8 devfn);
+int pci_remove_device(uint16_t seg, uint8_t bus, uint8_t devfn);
 int pci_ro_device(int seg, int bus, int devfn);
 int pci_hide_device(unsigned int seg, unsigned int bus, unsigned int devfn);
 struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf);
 struct pci_dev *pci_get_real_pdev(pci_sbdf_t sbdf);
-void pci_check_disable_device(u16 seg, u8 bus, u8 devfn);
+void pci_check_disable_device(uint16_t seg, uint8_t bus, uint8_t devfn);
 
 /*
  * Iterate without locking or preemption over all PCI devices known by Xen.
@@ -246,9 +246,9 @@ void pci_conf_write32(pci_sbdf_t sbdf, unsigned int reg, uint32_t data);
 uint32_t pci_conf_read(uint32_t cf8, uint8_t offset, uint8_t bytes);
 void pci_conf_write(uint32_t cf8, uint8_t offset, uint8_t bytes, uint32_t data);
 int pci_mmcfg_read(unsigned int seg, unsigned int bus,
-                   unsigned int devfn, int reg, int len, u32 *value);
+                   unsigned int devfn, int reg, int len, uint32_t *value);
 int pci_mmcfg_write(unsigned int seg, unsigned int bus,
-                    unsigned int devfn, int reg, int len, u32 value);
+                    unsigned int devfn, int reg, int len, uint32_t value);
 unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap);
 unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
                                    const unsigned int caps[], unsigned int n,
-- 
2.43.0



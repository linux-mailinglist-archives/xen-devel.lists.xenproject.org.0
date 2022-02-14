Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7684B5156
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:16:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271912.466657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDH-0001id-C1; Mon, 14 Feb 2022 13:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271912.466657; Mon, 14 Feb 2022 13:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDH-0001em-8Q; Mon, 14 Feb 2022 13:16:19 +0000
Received: by outflank-mailman (input) for mailman id 271912;
 Mon, 14 Feb 2022 13:16:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb3U-00023t-II
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:06:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0413ad2-8d96-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:06:10 +0100 (CET)
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
X-Inumbo-ID: e0413ad2-8d96-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843971;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=qZhvnjEBLt6HNiQInDJlsXjMWzuTPnZZsavbgdbb+Q8=;
  b=IGboPm52Xu/8RsyDY7+JM1YtWkKZ7aSLvl6CJwXdg/BzX8KLOu3BzgIP
   5qzndOF6dxURgrPPJEkelNht5XQdIPWK03gkgYq+5p6THn+sf6z18OWFR
   1PYx75PFpTgG95t5O33aW4zjv6Mo8C+X2eUzj+LDiTMaHEIh6vxcUApfG
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lyrDEo4OMsz6HcvoqhuRMiigziNljYEumekSe7hFU9ENYrAtYLSDI7IPzKXjU00SOpj327clsp
 xb0x1quFKSr6uFUphmruFhZZkYjpu1OdmSvDUF8j0xKkWRBUiqAOaGX+HcLqTbrFY44yeE8O7B
 k728GMPVi6dB4qJMjEN/8pIrgjTZcI3/ngRcIBJIIv1TwYHxJPl09pxoFgmRHBzoVOp01Gsoq4
 KiSozyMQD9WsbM4GHx+sIIC2RrHyDAE/FjuNdJSZnhvLleQDY6z8EIcLRNmRe3wdFkN2Ok+SJ1
 7EHa51g7zKu2QKwh717mcleh
X-SBRS: 5.1
X-MesageID: 64149447
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5q+K6qhQNSBfGjsO5QoImiKyX161fxcKZh0ujC45NGQN5FlHY01je
 htvXGmCOqyKNzSgf95/PYi+80JUv5LWzdUwSwpt+SlgE38b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQx3YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1dlYKZdD4AIJfVp8A8Cj15PxFyAr9JreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiCP
 pZINWYwBPjGSxBLKEc4Go4CpcaTmGvBdyJYqnW5qaVitgA/yyQuieOwYbI5YOeiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0ML/+D5XhqKQs2gfKgDVOVltGDjNXvMVVlGaue8x2F
 nU95BA3kowTrWiKYunxYA+39SvsUgEnZ/JcFOgz6Qeow6XS4hqECmVscgOteODKp+dtG2V0i
 wbhc8fBQGU27ebLES71GqK88GvqURX5O1PucsPtoeEtx9D46L8+gRvUJjqIOP7k14alcd0cL
 t3jkcTfu1nxpZNRv0lY1Qqe695JmnQuZlRrjjg7pkr/smtEiHeNPuREE2Tz4/daN5q+RVKcp
 nUCkMX2xLlQUc3SxHzQHb1UR+vBCxO53Nr02wAHInXc3271py7LkX54vFmS23uFwu5bIGS0M
 Sc/SCta5YNJPWvCUEOES9nZNije9oC5TY6NfqmNNrJmO8EtHCfarHAGTRPBhAjFzRlz+ZzTz
 L/GKK5A+15BUv85pNd3Ls9AuYIWKtcWmz+NG8ChkkjPPHj3TCf9dIrp+WCmNogRhJ5oai2Pm
 zqGH8fVmRhZTsPkZSzbrdwaIVwQdCBpDpHqsc1HMOWEJ1M+Sm0mDvbQx5InepBkwPsJxruZo
 CnlVx8K0kf7iF3GNR6ONiJpZoTwUMsttnk8JyEtYwqlgiBxfYa14a4DXJIrZr17pvd7xPt5Q
 qBdKcWNC/hCUBrd/DEZYcWvpYBubk3z1wmPIzCkcH40eJs5H17F/drtfw3O8igSD3Xo6Zti8
 uP4jg6CGMgNXQVvCsrSecmD9VLpsChPgv92UmvJPsJXJBfm/r91JnGjlfQwOcwNd0nOn2PIy
 waMDB4EjuDRuItposLRjKWJoor1QetzGk1WQzvS4bqsbHSI+2OixclLUfqSfCCbX2Txof3wa
 eJQxvD6EfsGgFcV7NYsT+c1lfozt4n1urtX7gV4B3GaPV2kB4RpLmSCwcQS5LZGwaVUuFfuV
 0+CkjWA1W5l5C8x/IYtGTcY
IronPort-HdrOrdr: A9a23:XfeIua9x/dkPwzLbZNZuk+DaI+orL9Y04lQ7vn2YSXRuHPBw9v
 re5cjzuiWVtN98Yh0dcJW7Scy9qBDnhPhICOsqTNSftWDd0QPCRuxfBMnZslnd8kXFh4lgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149447"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 25/70] xen/vpci: CFI hardening
Date: Mon, 14 Feb 2022 12:50:42 +0000
Message-ID: <20220214125127.17985-26-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/drivers/vpci/header.c | 18 +++++++++---------
 xen/drivers/vpci/msi.c    | 42 +++++++++++++++++++++---------------------
 xen/drivers/vpci/msix.c   | 20 ++++++++++----------
 xen/drivers/vpci/vpci.c   | 16 ++++++++--------
 xen/include/xen/vpci.h    |  8 ++++----
 5 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 40ff79c33f8f..a1c928a0d26f 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -33,8 +33,8 @@ struct map_data {
     bool map;
 };
 
-static int map_range(unsigned long s, unsigned long e, void *data,
-                     unsigned long *c)
+static int cf_check map_range(
+    unsigned long s, unsigned long e, void *data, unsigned long *c)
 {
     const struct map_data *map = data;
     int rc;
@@ -332,8 +332,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     return 0;
 }
 
-static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
-                      uint32_t cmd, void *data)
+static void cf_check cmd_write(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t cmd, void *data)
 {
     uint16_t current_cmd = pci_conf_read16(pdev->sbdf, reg);
 
@@ -353,8 +353,8 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
 
-static void bar_write(const struct pci_dev *pdev, unsigned int reg,
-                      uint32_t val, void *data)
+static void cf_check bar_write(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
     struct vpci_bar *bar = data;
     bool hi = false;
@@ -397,8 +397,8 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
     pci_conf_write32(pdev->sbdf, reg, val);
 }
 
-static void rom_write(const struct pci_dev *pdev, unsigned int reg,
-                      uint32_t val, void *data)
+static void cf_check rom_write(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
     struct vpci_header *header = &pdev->vpci->header;
     struct vpci_bar *rom = data;
@@ -445,7 +445,7 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
         rom->addr = val & PCI_ROM_ADDRESS_MASK;
 }
 
-static int init_bars(struct pci_dev *pdev)
+static int cf_check init_bars(struct pci_dev *pdev)
 {
     uint16_t cmd;
     uint64_t addr, size;
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 5757a7aed20f..8f2b59e61aa4 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -22,8 +22,8 @@
 
 #include <asm/msi.h>
 
-static uint32_t control_read(const struct pci_dev *pdev, unsigned int reg,
-                             void *data)
+static uint32_t cf_check control_read(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
 {
     const struct vpci_msi *msi = data;
 
@@ -34,8 +34,8 @@ static uint32_t control_read(const struct pci_dev *pdev, unsigned int reg,
            (msi->address64 ? PCI_MSI_FLAGS_64BIT : 0);
 }
 
-static void control_write(const struct pci_dev *pdev, unsigned int reg,
-                          uint32_t val, void *data)
+static void cf_check control_write(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
     struct vpci_msi *msi = data;
     unsigned int vectors = min_t(uint8_t,
@@ -89,16 +89,16 @@ static void update_msi(const struct pci_dev *pdev, struct vpci_msi *msi)
 }
 
 /* Handlers for the address field (32bit or low part of a 64bit address). */
-static uint32_t address_read(const struct pci_dev *pdev, unsigned int reg,
-                             void *data)
+static uint32_t cf_check address_read(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
 {
     const struct vpci_msi *msi = data;
 
     return msi->address;
 }
 
-static void address_write(const struct pci_dev *pdev, unsigned int reg,
-                          uint32_t val, void *data)
+static void cf_check address_write(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
     struct vpci_msi *msi = data;
 
@@ -110,16 +110,16 @@ static void address_write(const struct pci_dev *pdev, unsigned int reg,
 }
 
 /* Handlers for the high part of a 64bit address field. */
-static uint32_t address_hi_read(const struct pci_dev *pdev, unsigned int reg,
-                                void *data)
+static uint32_t cf_check address_hi_read(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
 {
     const struct vpci_msi *msi = data;
 
     return msi->address >> 32;
 }
 
-static void address_hi_write(const struct pci_dev *pdev, unsigned int reg,
-                             uint32_t val, void *data)
+static void cf_check address_hi_write(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
     struct vpci_msi *msi = data;
 
@@ -131,16 +131,16 @@ static void address_hi_write(const struct pci_dev *pdev, unsigned int reg,
 }
 
 /* Handlers for the data field. */
-static uint32_t data_read(const struct pci_dev *pdev, unsigned int reg,
-                          void *data)
+static uint32_t cf_check data_read(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
 {
     const struct vpci_msi *msi = data;
 
     return msi->data;
 }
 
-static void data_write(const struct pci_dev *pdev, unsigned int reg,
-                       uint32_t val, void *data)
+static void cf_check data_write(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
     struct vpci_msi *msi = data;
 
@@ -150,16 +150,16 @@ static void data_write(const struct pci_dev *pdev, unsigned int reg,
 }
 
 /* Handlers for the MSI mask bits. */
-static uint32_t mask_read(const struct pci_dev *pdev, unsigned int reg,
-                          void *data)
+static uint32_t cf_check mask_read(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
 {
     const struct vpci_msi *msi = data;
 
     return msi->mask;
 }
 
-static void mask_write(const struct pci_dev *pdev, unsigned int reg,
-                       uint32_t val, void *data)
+static void cf_check mask_write(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
     struct vpci_msi *msi = data;
     uint32_t dmask = msi->mask ^ val;
@@ -182,7 +182,7 @@ static void mask_write(const struct pci_dev *pdev, unsigned int reg,
     msi->mask = val;
 }
 
-static int init_msi(struct pci_dev *pdev)
+static int cf_check init_msi(struct pci_dev *pdev)
 {
     uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
     unsigned int pos = pci_find_cap_offset(pdev->seg, pdev->bus, slot, func,
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 846f1b8d7038..2ab4079412f2 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -27,8 +27,8 @@
     ((addr) >= vmsix_table_addr(vpci, nr) &&                              \
      (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
 
-static uint32_t control_read(const struct pci_dev *pdev, unsigned int reg,
-                             void *data)
+static uint32_t cf_check control_read(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
 {
     const struct vpci_msix *msix = data;
 
@@ -65,8 +65,8 @@ static void update_entry(struct vpci_msix_entry *entry,
     entry->updated = false;
 }
 
-static void control_write(const struct pci_dev *pdev, unsigned int reg,
-                          uint32_t val, void *data)
+static void cf_check control_write(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
     struct vpci_msix *msix = data;
     bool new_masked = val & PCI_MSIX_FLAGS_MASKALL;
@@ -156,7 +156,7 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
     return NULL;
 }
 
-static int msix_accept(struct vcpu *v, unsigned long addr)
+static int cf_check msix_accept(struct vcpu *v, unsigned long addr)
 {
     return !!msix_find(v->domain, addr);
 }
@@ -182,8 +182,8 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
     return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
 }
 
-static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
-                     unsigned long *data)
+static int cf_check msix_read(
+    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
 {
     const struct domain *d = v->domain;
     struct vpci_msix *msix = msix_find(d, addr);
@@ -259,8 +259,8 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
     return X86EMUL_OKAY;
 }
 
-static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
-                      unsigned long data)
+static int cf_check msix_write(
+    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
 {
     const struct domain *d = v->domain;
     struct vpci_msix *msix = msix_find(d, addr);
@@ -428,7 +428,7 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
     return 0;
 }
 
-static int init_msix(struct pci_dev *pdev)
+static int cf_check init_msix(struct pci_dev *pdev)
 {
     struct domain *d = pdev->domain;
     uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index fb0947179b79..f3b32d66cb35 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -106,25 +106,25 @@ static int vpci_register_cmp(const struct vpci_register *r1,
 }
 
 /* Dummy hooks, writes are ignored, reads return 1's */
-static uint32_t vpci_ignored_read(const struct pci_dev *pdev, unsigned int reg,
-                                  void *data)
+static uint32_t cf_check vpci_ignored_read(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
 {
     return ~(uint32_t)0;
 }
 
-static void vpci_ignored_write(const struct pci_dev *pdev, unsigned int reg,
-                               uint32_t val, void *data)
+static void cf_check vpci_ignored_write(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
 }
 
-uint32_t vpci_hw_read16(const struct pci_dev *pdev, unsigned int reg,
-                        void *data)
+uint32_t cf_check vpci_hw_read16(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
 {
     return pci_conf_read16(pdev->sbdf, reg);
 }
 
-uint32_t vpci_hw_read32(const struct pci_dev *pdev, unsigned int reg,
-                        void *data)
+uint32_t cf_check vpci_hw_read32(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
 {
     return pci_conf_read32(pdev->sbdf, reg);
 }
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index e8ac1eb39513..bcad1516aee1 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -46,10 +46,10 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
                 uint32_t data);
 
 /* Passthrough handlers. */
-uint32_t vpci_hw_read16(const struct pci_dev *pdev, unsigned int reg,
-                        void *data);
-uint32_t vpci_hw_read32(const struct pci_dev *pdev, unsigned int reg,
-                        void *data);
+uint32_t cf_check vpci_hw_read16(
+    const struct pci_dev *pdev, unsigned int reg, void *data);
+uint32_t cf_check vpci_hw_read32(
+    const struct pci_dev *pdev, unsigned int reg, void *data);
 
 /*
  * Check for pending vPCI operations on this vcpu. Returns true if the vcpu
-- 
2.11.0



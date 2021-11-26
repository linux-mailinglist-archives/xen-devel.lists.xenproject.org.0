Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4079245EE9A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232780.403787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawO-0003U3-Fg; Fri, 26 Nov 2021 13:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232780.403787; Fri, 26 Nov 2021 13:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawO-0003KB-0v; Fri, 26 Nov 2021 13:07:00 +0000
Received: by outflank-mailman (input) for mailman id 232780;
 Fri, 26 Nov 2021 13:06:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavh-0003W9-L7
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:06:17 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2b13141-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:06:16 +0100 (CET)
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
X-Inumbo-ID: a2b13141-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Or7hnmv/3zwwTutpx5mxBrC73JF1NuKmpQ2hWXjITFk=;
  b=WwlgTmIrMqDklSCfrAWUAxuMIjgc1k2ylcDKe446b05ddgQah7HPmXAL
   XfmZ3JHr5qrJ++z1esZlB62L7yQl8melDDoBea5+wEL+/5qlZzZQ2Le4E
   lu37Eoe8FDoPDjqWr4iDuXlCsdLoUo/EUH2WGBn1+J27uWHQp5LTitfe1
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 23k4lIiUYExCJAh8+kPkeaWlutL67lof2RrJj6EJMlCPthy+uEZkRTCvzfGjFOts2a0Jtq182H
 ViJiGHxlcUmW7kbznEed6LchSEEQzuidpW0TxAOtuvr1kvF3WEIO3OpEbhg/v+fEfpx17ksiXt
 9nDNx4wbAzpA7Z73uuV0BPWJhx0EG/U1M/8iKbalhNwhYznNCsz5YpLjSn+I9AZkMmwp2Gs2Jq
 7VPAbnW6EfbphkwmkSigxGpOaDZIPmRGwt1SNH/HwVezoeLefYCkRaTJqTrBZ57JPfGYVE9PjE
 36ExQSQp1Z1jwhC4gEzPrmXr
X-SBRS: 5.1
X-MesageID: 58635067
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:olcMO6xfdXs1XaBCFe56t+fCwSrEfRIJ4+MujC+fZmUNrF6WrkUCy
 TRKCmzQO/aOYTb2KYsibIuz/B9S65PVmIdrQVZsrSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrRn2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/Zol
 ZZHp5e0cCA0HajtnfsFSTt+LRgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY25AQRquGO
 ZVxhTxHaibvUxBSO3crBZtho8yMh13ETmRapwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krE4mD4DxcyJNGZjz2f/RqEnfTTlCn2XIYTEryQ9fNwhlCXgGsJB3U+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJHlqTICniP/bOtii6RPAkQMncYRwk6dF5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdjv9tlsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStbGK0bb1HRcBJG9GRF5iLJts4DNZWfhoBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66PMYoQP8cgKFHbp0mCgHJ8OUi2yyDAdollZ
 P+mnTuEVy5GWcyLMhLqLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtazOzghQCxPrc+m39q
 o8HX+PTkkk3eLCuM0H/rN9IRXhXfCdTOHwDg5EOHgJ1ClE9Qz9J5j646e5JRrGJaIwJzLqVp
 S/kBRcDoLc97FWeQTi3hrlYQOuHdf5CQbgTZkTA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:3XVoCaBQSPyF5+flHemW55DYdb4zR+YMi2TC1yhKKCC9Ffbo7/
 xG/c5rrCMc5wxhO03I9eruBEDEewK5yXcX2/h2AV7BZniFhILAFugLhuGOrwEIWReOkdK1vZ
 0QCJSWY+eRMbEVt6jHCXGDYrMd/OU=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58635067"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 21/65] xen/vpci: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:02 +0000
Message-ID: <20211126123446.32324-22-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
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
index 657697fe3406..d21264e34edc 100644
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
index 9ea66e033f11..68ae06067031 100644
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



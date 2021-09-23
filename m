Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A0B415F0C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194149.345944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOIY-0006fA-T0; Thu, 23 Sep 2021 12:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194149.345944; Thu, 23 Sep 2021 12:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOIY-0006bf-PH; Thu, 23 Sep 2021 12:57:58 +0000
Received: by outflank-mailman (input) for mailman id 194149;
 Thu, 23 Sep 2021 12:57:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOHQ-0004it-6b
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:56:48 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7f5a879-b865-434e-b8f1-e906b434769c;
 Thu, 23 Sep 2021 12:55:10 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id g41so26148306lfv.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:55:10 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id o12sm453010lft.254.2021.09.23.05.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:55:08 -0700 (PDT)
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
X-Inumbo-ID: e7f5a879-b865-434e-b8f1-e906b434769c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cIPXz2mA5EJS9da7dICK94JpwcF7nJh6i2ljGMdw31k=;
        b=HeIp6l9OjTuGNCf2NE4aerZ8ypyKK4xUPQnFXvFUXP077VWYVQl01B1SqpfXR79jpp
         lumKKt3PtFC1SzIMYHOJ1Xg2K84l1AcTFIOxYWPqFqWJjzHGP9TzgWH0/yE4ulu9RSYJ
         DtMCkXFpokEB7iVvHSiyvLsZau03miegPDqQoXi+dbxgJAyzoJxd0pYptWTney0odSQR
         8f5mzPtX2eYXntjJtjpAMmS1a04xUPR9dNMOfpfvvRtPfzI6cFMmvzoeotsNMzl4sCbb
         TEyTdPUBXZLPe/XpOXC2Gjo/wkpueSH5afjhVEKZRVifB+EMxHeZ5bYVukc7cEAOJaAd
         kkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cIPXz2mA5EJS9da7dICK94JpwcF7nJh6i2ljGMdw31k=;
        b=MlSlWj8Qf8sXRqgSEoaa9ld7qLAzYnja+fM0PiQlP1/mUEgWv6gVeBqoMRZBYQVbKP
         WqVl9jT0F22Sqwj/1a+8CBW2BEi06XNyFTkMocSOnYPl2l93vys7HWgDO8BCzsDNqqkr
         0xasLNJ/LtrRLbtzKkRGiucNfui78K6Ny9p+NRXPXj7XPer5HUpaIQdNcXgszQBc3mry
         gF8kprtG4tLn3n8vVkB0+057G5QBhyM9BtVVoyMK1pTlLNzfHcqSB5QNaFIFWnNJs4y0
         hf7R5ch9YNKoKTuapIe7aVJ+7iw+ZbAW1SbGMcRYHhki79Be0ITrUSP6fNiHYWrLK+Sl
         /7Qg==
X-Gm-Message-State: AOAM532MICJdvEHOJNwSS0Xo+w9fgG2Ie0Ud83DnSMNQz9FSOmZD+rRw
	0yoaKXubjGG6oxkKJgH1p4kisz1JEnlYJQ==
X-Google-Smtp-Source: ABdhPJzNsCE1gRB70SpWfN2PFcPnO8jYHLcnJzCh/r0yGox61/c0i3oggOazkuEWskoC7iatqYj6qw==
X-Received: by 2002:a2e:1508:: with SMTP id s8mr5206646ljd.240.1632401709286;
        Thu, 23 Sep 2021 05:55:09 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v2 05/11] vpci/header: Implement guest BAR register handlers
Date: Thu, 23 Sep 2021 15:54:55 +0300
Message-Id: <20210923125501.234252-6-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125501.234252-1-andr2000@gmail.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Emulate guest BAR register values: this allows creating a guest view
of the registers and emulates size and properties probe as it is done
during PCI device enumeration by the guest.

ROM BAR is only handled for the hardware domain and for guest domains
there is a stub: at the moment PCI expansion ROM is x86 only, so it
might not be used by other architectures without emulating x86. Other
use-cases may include using that expansion ROM before Xen boots, hence
no emulation is needed in Xen itself. Or when a guest wants to use the
ROM code which seems to be rare.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Since v1:
 - re-work guest read/write to be much simpler and do more work on write
   than read which is expected to be called more frequently
 - removed one too obvious comment

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/drivers/vpci/header.c | 30 +++++++++++++++++++++++++++++-
 xen/include/xen/vpci.h    |  3 +++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 1ce98795fcca..ec4d215f36ff 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -400,12 +400,38 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
 static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
                             uint32_t val, void *data)
 {
+    struct vpci_bar *bar = data;
+    bool hi = false;
+
+    if ( bar->type == VPCI_BAR_MEM64_HI )
+    {
+        ASSERT(reg > PCI_BASE_ADDRESS_0);
+        bar--;
+        hi = true;
+    }
+    else
+    {
+        val &= PCI_BASE_ADDRESS_MEM_MASK;
+        val |= bar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
+                                           : PCI_BASE_ADDRESS_MEM_TYPE_64;
+        val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
+    }
+
+    bar->guest_addr &= ~(0xffffffffull << (hi ? 32 : 0));
+    bar->guest_addr |= (uint64_t)val << (hi ? 32 : 0);
+
+    bar->guest_addr &= ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;
 }
 
 static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int reg,
                                void *data)
 {
-    return 0xffffffff;
+    const struct vpci_bar *bar = data;
+
+    if ( bar->type == VPCI_BAR_MEM64_HI )
+        return bar->guest_addr >> 32;
+
+    return bar->guest_addr;
 }
 
 static void rom_write(const struct pci_dev *pdev, unsigned int reg,
@@ -522,6 +548,8 @@ static int add_bar_handlers(const struct pci_dev *pdev, bool is_hwdom)
             if ( rc )
                 return rc;
         }
+
+        bars[i].guest_addr = 0;
     }
     return 0;
 }
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 912cbc6aa7ad..9eaf99f356fe 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -81,7 +81,10 @@ struct vpci {
     struct vpci_header {
         /* Information about the PCI BARs of this device. */
         struct vpci_bar {
+            /* Physical view of the BAR. */
             uint64_t addr;
+            /* Guest view of the BAR. */
+            uint64_t guest_addr;
             uint64_t size;
             enum {
                 VPCI_BAR_EMPTY,
-- 
2.25.1



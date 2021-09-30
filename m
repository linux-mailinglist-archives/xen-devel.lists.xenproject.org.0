Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501D041D4D1
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:53:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199509.353661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqsA-0003eW-Bl; Thu, 30 Sep 2021 07:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199509.353661; Thu, 30 Sep 2021 07:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqsA-0003a6-6R; Thu, 30 Sep 2021 07:52:54 +0000
Received: by outflank-mailman (input) for mailman id 199509;
 Thu, 30 Sep 2021 07:52:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqs8-00017f-5R
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:52:52 +0000
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fac7a3cc-26c2-4c47-b457-e24184136f4b;
 Thu, 30 Sep 2021 07:52:31 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i25so21624009lfg.6
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:52:31 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id 13sm251099ljf.51.2021.09.30.00.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:52:29 -0700 (PDT)
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
X-Inumbo-ID: fac7a3cc-26c2-4c47-b457-e24184136f4b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rVtZpNhlXnSzmfbhCEL+IMfyjOh3bF01cvc201QQbmU=;
        b=hE2uDfRL1hRLRQVqes0DgETsiFrCAaEESlXXIrx14t2k2qtoniLHSCW3Vh+IJBx0sV
         jR0frYyDX02OCrbrTE0+xVaPoiG7IBmARxKBGlO5xYlEvM1AHpt0VP/5OC6FZ+KhNcMi
         gLauGCou1utr94NVGYrqj+DOhs2vnmXf1MkyUH27TcN8WpAPi2tgfH33I2CQAnD49Isu
         HsGrimm/gnCM8k41GqEEOr4htxMX71j4IjAfrqNaEroHyZf1hWcqdhMig7NbiSTdwNiI
         wCs6hRdLHt0TNGcleVYUxDr/4DzDcZ7eMqnNAytWzR8U8xqPWjt4FEM1wIY5Q7LmCJac
         EYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rVtZpNhlXnSzmfbhCEL+IMfyjOh3bF01cvc201QQbmU=;
        b=glbScFWEZDA+TYr+elkg1ROQANJyYANvl8qMqP8kY3kbIpJjiVnkM73aTq34QOGHMJ
         4PcyX7YNLn8xRBSlVTQCdReRF9MfiuuJUmlGQgqiTu+s9y8nfPtjhXNZwPP4Fe8a0Pjv
         RCdje38P/o5nwjNoTfIriQr1wVByAtKNGPo0K7Z6wdaBE8PXA5Cn+4tgcCgdjr9lHnYV
         aUW8ld7pwyeMJKUT+BjUXdHWpxg4K7O/cHwHhwtiiB+/YXjmB0A7pN+kbIWvwTuWg0xj
         gYO6y8YQqqoNaRBR6sxoi5I1ctqWlSNf/xjSDW039bImdMcXF5l/yB0XnuCH+Td/vj+f
         49KQ==
X-Gm-Message-State: AOAM531WkyQTPqB+nP4DVOAQis7qOhK2W1NAi9Q9/nXL1+/+k0XigMAR
	FUXMunkiHtfzmkdbLbsQR1qOVwkeu38=
X-Google-Smtp-Source: ABdhPJy3FaYBUB50uoi6zzCEs665+xGWg3WT1AJusJrIM7oB7ma6dHvZ/NwDWDbmw2T0DPxHmRZ1Kw==
X-Received: by 2002:a05:6512:12d6:: with SMTP id p22mr4595737lfg.42.1632988350031;
        Thu, 30 Sep 2021 00:52:30 -0700 (PDT)
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
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Michal Orzel <michal.orzel@arm.com>
Subject: [PATCH v3 05/11] vpci/header: Implement guest BAR register handlers
Date: Thu, 30 Sep 2021 10:52:17 +0300
Message-Id: <20210930075223.860329-6-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930075223.860329-1-andr2000@gmail.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
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
Reviewed-by: Michal Orzel <michal.orzel@arm.com>
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
index fd822c903af5..a0320b22cb36 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -75,7 +75,10 @@ struct vpci {
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



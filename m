Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9968266C2
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 00:17:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662934.1032847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMcNg-0003Ni-NX; Sun, 07 Jan 2024 23:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662934.1032847; Sun, 07 Jan 2024 23:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMcNg-0003Lz-Kc; Sun, 07 Jan 2024 23:16:36 +0000
Received: by outflank-mailman (input) for mailman id 662934;
 Sun, 07 Jan 2024 23:16:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tS93=IR=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1rMcNf-0003Lm-7C
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2024 23:16:35 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbecb944-adb2-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 00:16:33 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50e7e55c0f6so1047359e87.0
 for <xen-devel@lists.xenproject.org>; Sun, 07 Jan 2024 15:16:33 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-191-044-194.77.191.pool.telefonica.de. [77.191.44.194])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a17090635c900b00a27eddc3dcbsm3338834ejb.198.2024.01.07.15.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 15:16:31 -0800 (PST)
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
X-Inumbo-ID: cbecb944-adb2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704669393; x=1705274193; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6jsVDJtLEm1lPndCJvtY3GO9mpTGY2wxwxo3LuOR4oE=;
        b=TrGqEa6XVWszGUL3Rm7pOFjyhpxAA7bNlDjEoK7TDSuOyG3iWnkXhEw6sAFmjX5f1p
         SZKsnsJGNqBV3be1isrYkfPPEr18vCkhTYG1souXrg0YldZ+DerZSrJoLRG2cQqhUPXM
         1gNbubE74i5RNG9Xv3rNg2BOXsT2S7iiXVc+4viQxDN9TkOtptnnAa5t3/A3ml24xij7
         4adVsH7CoVXDKkzACWpXyY3VQbkxu6QZd6tCNRNvWOdsUDo8EXSdu3OHsxzeuOgONEZa
         LAd++kvdlw6Ai//qLI4tEfvPYPC8LlK5U0+o06vTUaJY+QOondWPYChqd/nQ2ZYxa046
         6czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704669393; x=1705274193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6jsVDJtLEm1lPndCJvtY3GO9mpTGY2wxwxo3LuOR4oE=;
        b=mhAB/oJMnyjexH4gbbTQ//lZ/8X2ppEyg9NNTIrdMVpNmjEp95oaJQkIDBgxvWxZxn
         osxT0Ym7HTIsMt8JN9sbcPFV8YW7YM/CCQ24/bfStcjKnbj/PQQozMKfeg8/p4n4ktUf
         NNT0VEwQZi86WZLU1A+VGNT0RC5WSnmiOUfjquyk4uD3nWVZn0eYtxOb/hACy/zYr4Vz
         F3Mr12Gl1WRHrMz3EDXFddrRVpG30hNphjbTfhxxHllhiDMaN5RzaugVyVw6j2cD3iiH
         fW9CyhV7+0rDMWVOzOwYPR3O9Svch2ZHeuYDtONymv38fTGLrsnzgksMH9l5NcK9hLZx
         +mMg==
X-Gm-Message-State: AOJu0YzOw/7hR8jWZHQfwLYV9Vh8gQfPW4ZXUz3BFWr8oZnup82XH2gC
	vDxBG9fkvQ7E90gN1IevY78=
X-Google-Smtp-Source: AGHT+IHk2KwjckC2+0MPqdilUMmvonza/ii8ds1d+gqApYYQ7ahD486c6CLaIVQh3OrzE2iSYbke6w==
X-Received: by 2002:a05:6512:39ce:b0:50b:f1ca:e6a with SMTP id k14-20020a05651239ce00b0050bf1ca0e6amr610420lfu.48.1704669392392;
        Sun, 07 Jan 2024 15:16:32 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Chuck Zmudzinski <brchuckz@aol.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	David Woodhouse <dwmw2@infradead.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH] hw/i386/pc_piix: Make piix_intx_routing_notifier_xen() more device independent
Date: Mon,  8 Jan 2024 00:16:23 +0100
Message-ID: <20240107231623.5282-1-shentey@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a follow-up on commit 89965db43cce "hw/isa/piix3: Avoid Xen-specific
variant of piix3_write_config()" which introduced
piix_intx_routing_notifier_xen(). This function is implemented in board code but
accesses the PCI configuration space of the PIIX ISA function to determine the
PCI interrupt routes. Avoid this by reusing pci_device_route_intx_to_irq() which
makes piix_intx_routing_notifier_xen() more device-agnostic.

One remaining improvement would be making piix_intx_routing_notifier_xen()
agnostic towards the number of PCI interrupt routes and move it to xen-hvm.
This might be useful for possible Q35 Xen efforts but remains a future exercise
for now.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 042c13cdbc..abfcfe4d2b 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -92,13 +92,10 @@ static void piix_intx_routing_notifier_xen(PCIDevice *dev)
 {
     int i;
 
-    /* Scan for updates to PCI link routes (0x60-0x63). */
+    /* Scan for updates to PCI link routes. */
     for (i = 0; i < PIIX_NUM_PIRQS; i++) {
-        uint8_t v = dev->config_read(dev, PIIX_PIRQCA + i, 1);
-        if (v & 0x80) {
-            v = 0;
-        }
-        v &= 0xf;
+        const PCIINTxRoute route = pci_device_route_intx_to_irq(dev, i);
+        const uint8_t v = route.mode == PCI_INTX_ENABLED ? route.irq : 0;
         xen_set_pci_link_route(i, v);
     }
 }
-- 
2.43.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3E428B4CF
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 14:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5926.15402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRxCh-0002h8-Hw; Mon, 12 Oct 2020 12:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5926.15402; Mon, 12 Oct 2020 12:45:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRxCh-0002gf-Ei; Mon, 12 Oct 2020 12:45:27 +0000
Received: by outflank-mailman (input) for mailman id 5926;
 Mon, 12 Oct 2020 12:45:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Icg=DT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kRxCf-0002fQ-6i
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 12:45:25 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 51cfb409-301b-4ac3-abae-5168facf7e27;
 Mon, 12 Oct 2020 12:45:23 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-wim6cHprMSa0X9dzGXdizw-1; Mon, 12 Oct 2020 08:45:22 -0400
Received: by mail-wr1-f70.google.com with SMTP id t3so2761638wrq.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 05:45:21 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id b5sm2564766wrs.97.2020.10.12.05.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:45:20 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3Icg=DT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kRxCf-0002fQ-6i
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 12:45:25 +0000
X-Inumbo-ID: 51cfb409-301b-4ac3-abae-5168facf7e27
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 51cfb409-301b-4ac3-abae-5168facf7e27;
	Mon, 12 Oct 2020 12:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602506723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uEfJTmQm7IfbaNLnhhKiUk3mZKxHaYrO9aWEgNYf1LY=;
	b=UkT5GRgFttURbsFo2rWy98QsdLC50MaBIDAzU5UWSFUhgBNTQldOvYSB9THd7uq+93GcS5
	czDI0G+LNyv5f/pMHDFSmXdyaE+aJQnkejwqseA5HD/TCcd5HnLx4Boqw0vLyrOXK87naf
	XfRFI8vg6bA4w+5pGzvN/eyqefgNc8I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-wim6cHprMSa0X9dzGXdizw-1; Mon, 12 Oct 2020 08:45:22 -0400
X-MC-Unique: wim6cHprMSa0X9dzGXdizw-1
Received: by mail-wr1-f70.google.com with SMTP id t3so2761638wrq.2
        for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 05:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uEfJTmQm7IfbaNLnhhKiUk3mZKxHaYrO9aWEgNYf1LY=;
        b=TMzkmyvMMihEIwhfSYFEXtWS/J4ZWNtK6jqW5V6qStU2kRx4miIw4KlXXeWsk/9j2x
         pFGl/eYtxUaJb/5zkeLwLO3kiux3EQ8Zw3jsSIoHuDAWcQsteqdDltw3/hU8qbbR0Ix3
         K/EZKpbngfgecccPhodAHYWgelyyA1Z9zcsFHNLKqZ9n4hlxIIGItJ1t6rRr+YEh+HOo
         vYVg9nl8GnIcH1Gm1V46JoN8xstaRRAcm7mUAgAboblwwe7vI4LKxvYwITsimW9Gq61X
         1dFzkmzNIpsioiWGZlTDIKXAGkKwJu3fpbolxVr740m5V4/ySZ81UKSHfGROPY2d6xTC
         iaBg==
X-Gm-Message-State: AOAM530yMK/z4j+/tYHqn+6pr5d4aeZO8m0BNk5HKN6qADSdlrNubrje
	Tz44AvrrudjqqDRTBm/N32097TPdgZ3VUMpQF++rFBJQV/ztJ67C16Q/WE6VsXIMApu1XuFIEyL
	DwDLgC/H1r8LdZit5BsUBjb2I8Zc=
X-Received: by 2002:adf:8b85:: with SMTP id o5mr16319167wra.104.1602506720840;
        Mon, 12 Oct 2020 05:45:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUet7a3+icknkdXIUBYsqHO/fz4MbL6X5ByiZqEc6CjjMuhyc0L0IjJS+YtIXZM/ET90duwQ==
X-Received: by 2002:adf:8b85:: with SMTP id o5mr16319151wra.104.1602506720677;
        Mon, 12 Oct 2020 05:45:20 -0700 (PDT)
Received: from localhost.localdomain (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
        by smtp.gmail.com with ESMTPSA id b5sm2564766wrs.97.2020.10.12.05.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:45:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-ppc@nongnu.org,
	qemu-trivial@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Anthony Perard <anthony.perard@citrix.com>,
	Richard Henderson <rth@twiddle.net>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	xen-devel@lists.xenproject.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 2/5] hw/pci-host: Use the PCI_BUILD_BDF() macro from 'hw/pci/pci.h'
Date: Mon, 12 Oct 2020 14:45:03 +0200
Message-Id: <20201012124506.3406909-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012124506.3406909-1-philmd@redhat.com>
References: <20201012124506.3406909-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We already have a generic PCI_BUILD_BDF() macro in "hw/pci/pci.h"
to pack these values, use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c   | 3 +--
 hw/pci-host/pnv_phb4.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index abb3ee86769..b05295639a6 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -196,8 +196,7 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
 #define PCI_IDSEL_VIA686B          (1 << PCI_IDSEL_VIA686B_BIT)
 
 #define PCI_ADDR(busno , devno , funno , regno)  \
-    ((((busno) << 8) & 0xff00) + (((devno) << 3) & 0xf8) + \
-    (((funno) & 0x7) << 8) + (regno))
+    ((PCI_BUILD_BDF(busno, PCI_DEVFN(devno , funno)) << 8) + (regno))
 
 typedef struct BonitoState BonitoState;
 
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 03daf40a237..6328e985f81 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -889,7 +889,7 @@ static bool pnv_phb4_resolve_pe(PnvPhb4DMASpace *ds)
     /* Read RTE */
     bus_num = pci_bus_num(ds->bus);
     addr = rtt & PHB_RTT_BASE_ADDRESS_MASK;
-    addr += 2 * ((bus_num << 8) | ds->devfn);
+    addr += 2 * PCI_BUILD_BDF(bus_num, ds->devfn);
     if (dma_memory_read(&address_space_memory, addr, &rte, sizeof(rte))) {
         phb_error(ds->phb, "Failed to read RTT entry at 0x%"PRIx64, addr);
         /* Set error bits ? fence ? ... */
-- 
2.26.2



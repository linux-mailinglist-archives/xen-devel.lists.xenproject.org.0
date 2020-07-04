Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31537214688
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:50:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjUO-0003FQ-Dc; Sat, 04 Jul 2020 14:50:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjUN-0003ES-Om
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:49:59 +0000
X-Inumbo-ID: 9dfab0c0-be05-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9dfab0c0-be05-11ea-bb8b-bc764e2007e4;
 Sat, 04 Jul 2020 14:49:52 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s10so35718707wrw.12
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TYD3rdWUPlT0NII6NR282LsOncN84HigXsBo5vZptIs=;
 b=mOBuD8AYvWgD1eKqLpIBdjXVQ5Pph/+FmMaPRcgW2zETZQyqX8+ELNIs1My9xotg49
 yl9bERPQPS4BhKGyeBRx4Qd+uQFLZYRklMZbvqAuJXZY6sEyWYouhWOjPYTFIPLsN1nA
 GHwtlofg4fOkSOvAn8jYj6oYYhDGjGPP34trt8rdNRv6PvCFLzPAjucb8srw71EOzwXj
 tqxRmbVb81GwGMeF/lodyUfzMseIwejEvsc32wNWsbTHQldJGTBhlLiCfR5UelU3S8dR
 pT9OEuZPV2fjo7gKaYA+MWXkGAIMr5hn5Xs7KOlPZHvMRGlwOazCfo5B65rotWknhZhj
 6mPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TYD3rdWUPlT0NII6NR282LsOncN84HigXsBo5vZptIs=;
 b=s/IqLK0KvY7ANIUvonY6gGOR7Vs+sqy0q7dvZtPbDGkSe6NVbFPkxoEP1iLRASnPFw
 /+Ijt8x5FIsW3JTNyb5jXB/eDiy+mW2zXTEezWDxJ1teRCaYkcJMQCxJZHijH3d+O/Qu
 beQCaqTAgwTtnf2e9ErfQ4LUO9w8o/P8lGtp90CRf8GrtfqiZw95KJ07dRGaXYO5c8zK
 R2TJ2clIUVmWDKijKsgNpw93jgdd3IV772bFrBQVeZ3cRf74vNzUhU5i1sMh/duH9LVi
 Ybug2nUgxhgmZRgHQB2AlUpOj3A2yVIUborJIpW/gItH7i4Tk9je1gRVi5Yr5bRWS9Q7
 Lz0A==
X-Gm-Message-State: AOAM532cP+/Z1eCkSsjCo/yZuGggRxJN2Ws/kUW8eUbRMegP98EfZerW
 pst6yb6K7TOBS8pkK9K97KE=
X-Google-Smtp-Source: ABdhPJwmYB47kPgnriIBv4UAA2pvunyU+tdfS4/5cW6u0UXI8kGWbm5Q/26nom3RMXKe12Z+5cK61g==
X-Received: by 2002:adf:d0d0:: with SMTP id z16mr43245870wrh.95.1593874191948; 
 Sat, 04 Jul 2020 07:49:51 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:49:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 02/26] hw/ppc/sam460ex: Add missing 'hw/pci/pci.h' header
Date: Sat,  4 Jul 2020 16:49:19 +0200
Message-Id: <20200704144943.18292-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704144943.18292-1-f4bug@amsat.org>
References: <20200704144943.18292-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This file uses pci_create_simple() and PCI_DEVFN() which are both
declared in "hw/pci/pci.h". This include is indirectly included
by an USB header. As we want to reduce the USB header inclusions
later, include the PCI header now, to avoid later:

  hw/ppc/sam460ex.c:397:5: error: implicit declaration of function ‘pci_create_simple’; did you mean ‘sysbus_create_simple’? [-Werror=implicit-function-declaration]
    397 |     pci_create_simple(pci_bus, PCI_DEVFN(6, 0), "sm501");
        |     ^~~~~~~~~~~~~~~~~
        |     sysbus_create_simple
  hw/ppc/sam460ex.c:397:5: error: nested extern declaration of ‘pci_create_simple’ [-Werror=nested-externs]
  hw/ppc/sam460ex.c:397:32: error: implicit declaration of function ‘PCI_DEVFN’ [-Werror=implicit-function-declaration]
    397 |     pci_create_simple(pci_bus, PCI_DEVFN(6, 0), "sm501");
        |                                ^~~~~~~~~
  hw/ppc/sam460ex.c:397:32: error: nested extern declaration of ‘PCI_DEVFN’ [-Werror=nested-externs]

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/sam460ex.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 1a106a68de..fae970b142 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -38,6 +38,7 @@
 #include "hw/usb/hcd-ehci.h"
 #include "hw/ppc/fdt.h"
 #include "hw/qdev-properties.h"
+#include "hw/pci/pci.h"
 
 #include <libfdt.h>
 
-- 
2.21.3



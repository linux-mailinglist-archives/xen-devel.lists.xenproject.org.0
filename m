Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351652146AE
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:56:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjb2-0005IZ-9p; Sat, 04 Jul 2020 14:56:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjWJ-0003ES-Tc
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:51:59 +0000
X-Inumbo-ID: ba56aea4-be05-11ea-bca7-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba56aea4-be05-11ea-bca7-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:40 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id o2so37045535wmh.2
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uFl2X6lG6vil8sEXKsbieCQlkH7+teoSNXY57sY2N5o=;
 b=pEPq0tBtl3XW/xKrGA5imilI9ZmVHCddD6JX7pQf5W26Rrv3j0GgA9nuE3yRIkzKmh
 xHXVt9A0O2Sb6wPcOQhczgtzphR+PeHVZ4Fdijl43Nrxg+v0v2Hz13FZ7aE8sOrKMSba
 lfG8A6MMb+bM+xNdOi2/2GPMz+xyBlp2BCeJ2lrXsutgPmG7wdmm6i+UpuNi8+BMpdVg
 eiQN9k6197cbsfvPjRB78ybOhM3ezQzyqGNS+gSkzZo/tgdWfPLh9B5gQMHqP+XuG+Vf
 +5B1ATevPKzMRin82a+Fpe8eN19U96Tx56oDwDoz3bikVgrPUqsQH6eHcCsfnf4o51sH
 T5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uFl2X6lG6vil8sEXKsbieCQlkH7+teoSNXY57sY2N5o=;
 b=N0xpKeuxnVk3Dtu9VqSxa1h5OCWxxjzF5sYKtTUwOnVU8lm3EHaMIKTe5POQ818WUU
 xaUdrvj9WncibSVLwWfWtsUMBlRYPCZfiEnvDvrxXSsfhIcu1CpN3n75qOi7L3e21wCb
 Kjelh37NH9v9uOTOO4IsyVxqlD88SgU9mwZ//bZwaGJqlSt/xCsv+wWpsvARapY7eBvx
 pglUWPkKdmBSnOBsgUScxzMQS4DUlkwfCJvK5GGvOrNa9RxzfBtdBP3zLcu2f2SzFkRl
 Hi6I4W0cb9KN6PLHvnKcEu3fj7r/VcjVXwLvd1cV/cM7aP4hhFTNCnzf9EyOVwAKFe0s
 Rj1Q==
X-Gm-Message-State: AOAM5310KX1BMWMrmz3NQIaajp8PBB7TOjQpA2UbfKl1i+SmcG1/uZp+
 G8pbaips41w97JesXGetIYE=
X-Google-Smtp-Source: ABdhPJzM4tGe90D+YYy5lfrAPXqvO73Nu2kMmuLd9RH15Fay5P8lwxNw5t/4Uu8mV3OZMnQRXn0t1A==
X-Received: by 2002:a7b:c44d:: with SMTP id l13mr43119938wmi.66.1593874239587; 
 Sat, 04 Jul 2020 07:50:39 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 25/26] hw/usb/usb-hcd: Use XHCI type definitions
Date: Sat,  4 Jul 2020 16:49:42 +0200
Message-Id: <20200704144943.18292-26-f4bug@amsat.org>
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

Various machine/board/soc models create XHCI device instances
with the generic QDEV API, and don't need to access USB internals.

Simplify header inclusions by moving the QOM type names into a
simple header, with no need to include other "hw/usb" headers.

Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-xhci.h        | 2 +-
 include/hw/usb/usb-hcd.h | 3 +++
 hw/ppc/spapr.c           | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index f9a3aaceec..b6c54e38a6 100644
--- a/hw/usb/hcd-xhci.h
+++ b/hw/usb/hcd-xhci.h
@@ -23,9 +23,9 @@
 #define HW_USB_HCD_XHCI_H
 
 #include "usb-internal.h"
+#include "hw/usb/usb-hcd.h"
 
 #define TYPE_XHCI "base-xhci"
-#define TYPE_NEC_XHCI "nec-usb-xhci"
 #define TYPE_QEMU_XHCI "qemu-xhci"
 
 #define XHCI(obj) \
diff --git a/include/hw/usb/usb-hcd.h b/include/hw/usb/usb-hcd.h
index c9d0a88984..56107fca62 100644
--- a/include/hw/usb/usb-hcd.h
+++ b/include/hw/usb/usb-hcd.h
@@ -30,4 +30,7 @@
 #define TYPE_VT82C686B_USB_UHCI     "vt82c686b-usb-uhci"
 #define TYPE_ICH9_USB_UHCI(n)       "ich9-usb-uhci" #n
 
+/* XHCI */
+#define TYPE_NEC_XHCI "nec-usb-xhci"
+
 #endif
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index db1706a66c..d8b3978f24 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2961,7 +2961,7 @@ static void spapr_machine_init(MachineState *machine)
         if (smc->use_ohci_by_default) {
             pci_create_simple(phb->bus, -1, TYPE_PCI_OHCI);
         } else {
-            pci_create_simple(phb->bus, -1, "nec-usb-xhci");
+            pci_create_simple(phb->bus, -1, TYPE_NEC_XHCI);
         }
 
         if (spapr->has_graphics) {
-- 
2.21.3



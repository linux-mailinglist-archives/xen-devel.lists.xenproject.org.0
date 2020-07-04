Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51918214686
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:50:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjUo-00042Z-0p; Sat, 04 Jul 2020 14:50:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjUm-0003ES-PI
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:50:24 +0000
X-Inumbo-ID: a3f9bdae-be05-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3f9bdae-be05-11ea-bca7-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:02 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z2so13504664wrp.2
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/SEb7i40/nbfV3CvB7T6xkytpAoG+YE52veZZ5mv5j4=;
 b=M86GQvVjqh2GOpnc8959nIEqLnIltzOWwA63YgcRTjTllNzsFeKa2AxLUplFe59nVZ
 EU5gEhxt62SSXh8q7000ETaWmRIbSKTzrgZ47MtBnXMnZm75mqtFngMn13ekv5iU3uR1
 jZH+QjvY71cexOwBR/zzvmBgICLG+ZXIDZGxG3evDVbBXwFvFbeNbh4ioXGgUGUaFauF
 lbh9Jk61RelYOfy760OtZib/qtDn/T5+sGmZ3flNc8ml4r0kTxIqEmHI5Z71CCawDYVS
 JHWip9FEybZwE41MmK/BYGDg85WJYNaGdThCFnN87eeYykN1tf2mZJKQABQuft2b5FSo
 Wb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/SEb7i40/nbfV3CvB7T6xkytpAoG+YE52veZZ5mv5j4=;
 b=bCE1XVYMh3IC8dFrgKf3Cj4UFCjctmDCQDfJOOItTltY0F14a3+Y8CK9FrrAhjAnaB
 9mJg2Z5ps8fNgYhDySiSB4OfOZjG5zr46zHP7TMC4Mp9vImUlBf4up/CWYKx4swvOIFA
 tuDL5OP7AA9y//uVI0qcV7+e65+woOkYhuPdMbBF3MDSL6f/qDOYuolrc5PzNeTOCtZX
 YGWxWauX30VhBFf0qr4FB1c1vZJ8SX/GY/JwCRiFFchv3dZ9LwQmroFP/QPFtfMnZZ21
 qxi5ZRrkQHpep9sWKw6YAcpd2sB/G5NLu7IwcwabnL0TbDqGx5T3BUMFsImJbxAufrS6
 g7yQ==
X-Gm-Message-State: AOAM5333hzYQfqTsKlu9JSlSrja7buGoXQhZYT5Lh/Z0lkVrT9CGIbZ5
 rTa5x8kQ9vY5b4Z4pVMfR2Q=
X-Google-Smtp-Source: ABdhPJzU2sv77zfdcGa3LX0JoxfFviQ6DXsIevpTW1tzmmUhaY0yZ73I5eZpKHBXzbQobqiSJf7dUQ==
X-Received: by 2002:adf:8b50:: with SMTP id v16mr43284603wra.188.1593874202076; 
 Sat, 04 Jul 2020 07:50:02 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 07/26] hw/usb/hcd-dwc2: Restrict some headers to source
Date: Sat,  4 Jul 2020 16:49:24 +0200
Message-Id: <20200704144943.18292-8-f4bug@amsat.org>
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

The header "usb/hcd-dwc2.h" doesn't need to include "qemu/timer.h",
"sysemu/dma.h", "hw/irq.h" (the types required are forward declared).
Include them in the source file which is the only one requiring the
function declarations.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-dwc2.h | 3 ---
 hw/usb/hcd-dwc2.c | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/usb/hcd-dwc2.h b/hw/usb/hcd-dwc2.h
index 4ba809a07b..2adf0f53c7 100644
--- a/hw/usb/hcd-dwc2.h
+++ b/hw/usb/hcd-dwc2.h
@@ -19,11 +19,8 @@
 #ifndef HW_USB_DWC2_H
 #define HW_USB_DWC2_H
 
-#include "qemu/timer.h"
-#include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "hw/usb.h"
-#include "sysemu/dma.h"
 
 #define DWC2_MMIO_SIZE      0x11000
 
diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
index 590e75b455..ccf05d0823 100644
--- a/hw/usb/hcd-dwc2.c
+++ b/hw/usb/hcd-dwc2.c
@@ -36,8 +36,11 @@
 #include "qapi/error.h"
 #include "hw/usb/dwc2-regs.h"
 #include "hw/usb/hcd-dwc2.h"
+#include "hw/irq.h"
+#include "sysemu/dma.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "qemu/timer.h"
 #include "qemu/log.h"
 #include "hw/qdev-properties.h"
 
-- 
2.21.3



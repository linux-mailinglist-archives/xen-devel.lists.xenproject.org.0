Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10362146AC
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:56:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjb1-0005HU-Ra; Sat, 04 Jul 2020 14:56:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjV1-0003ES-QB
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:50:39 +0000
X-Inumbo-ID: a78974d2-be05-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a78974d2-be05-11ea-b7bb-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:08 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id j18so34715268wmi.3
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CVXjF5m55kSlusAor5YG6lDc3XbyrrRebQzgpXEfhAM=;
 b=AP5+c+c62PoQXfTA/LtPm4Xh/2BhHY+f3Lrq+ywLKxnRs/teD8SlK4rBeR1W21QVVg
 MX5/zdYcr6MAV0tTj6y2JwWtreM0kI/3HLVXeM5Km0zk4LkxkDr+JUBRTgKPd4JDTNTQ
 qN+mtEml6SPGpVvDH0gvcL2DaAmIUkHFVWrvjkbOj7nMpqfWvSbHnLG867tnERkfPaEt
 R2NVOPlavAmVmA4nXJZ+9rKOMoryjsy3gDMvjOfRq/6T+kmZOAFOqpsdRHndZbJgqOt0
 X2QNL+czgbdip7AR/uSYj4AY75akrcM9UFux62yHvkIZB1h62OgvTkd3vwzX7RVlkGWT
 qEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CVXjF5m55kSlusAor5YG6lDc3XbyrrRebQzgpXEfhAM=;
 b=lhRpyZUIAEbEPAHb/Nraug1SZ3LRVUHjXHNvI723mGVchXoIGW8irweJuOft/pw8TD
 DKKKCFturVMwwEbHO3DgN9ShNGtSIj/Vzb21wMUDzWEk1EfvDs/KW4JjAbUd8o/dv0F3
 fqZ2vITH6vBldGkiWW5BDLs/nXuwLZpJmbzPk8P9Q6eN7S/QUVt/fxB8uBa/Lskiba+0
 YJ6t2SNrpIgPSOgmRQ/gkcHmwamazUyWsUte5cART1KbcGgt2NClCwt/E5iLjKRL9AuQ
 QlWyAOE/TnmBUqI9cM72lf8XYJsWf67sMhO51lLrvy34OcsUeJrWa/thu2xPbFj4YEgx
 I6vQ==
X-Gm-Message-State: AOAM533jGOYSyEKbNpsL9nB3hEIOUZP7hQ5Bh8cq5kBCZPenxoB8e03F
 ysb5Dnqwmvap+rmDLyUJ8y8=
X-Google-Smtp-Source: ABdhPJymro0ZDYhdB5ObnYkjPPmmHwp/a0dtBWYIDo1/eOyMgDUzyUYBTppKmDKb9G4hobFLnzrm0w==
X-Received: by 2002:a1c:18e:: with SMTP id 136mr10977102wmb.93.1593874208054; 
 Sat, 04 Jul 2020 07:50:08 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 10/26] hw/usb/hcd-ehci: Move few definitions from header to
 source
Date: Sat,  4 Jul 2020 16:49:27 +0200
Message-Id: <20200704144943.18292-11-f4bug@amsat.org>
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

Move definitions only useful for hcd-ehci.c to this source file.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-ehci.h | 11 -----------
 hw/usb/hcd-ehci.c | 12 ++++++++++++
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
index 57b38cfc05..4577f5e31d 100644
--- a/hw/usb/hcd-ehci.h
+++ b/hw/usb/hcd-ehci.h
@@ -24,17 +24,6 @@
 #include "hw/pci/pci.h"
 #include "hw/sysbus.h"
 
-#ifndef EHCI_DEBUG
-#define EHCI_DEBUG   0
-#endif
-
-#if EHCI_DEBUG
-#define DPRINTF printf
-#else
-#define DPRINTF(...)
-#endif
-
-#define MMIO_SIZE        0x1000
 #define CAPA_SIZE        0x10
 
 #define NB_PORTS         6        /* Max. Number of downstream ports */
diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 256fb91e0c..a0beee527c 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -36,6 +36,18 @@
 #include "qemu/error-report.h"
 #include "sysemu/runstate.h"
 
+#ifndef EHCI_DEBUG
+#define EHCI_DEBUG   0
+#endif
+
+#if EHCI_DEBUG
+#define DPRINTF printf
+#else
+#define DPRINTF(...)
+#endif
+
+#define MMIO_SIZE        0x1000
+
 #define FRAME_TIMER_FREQ 1000
 #define FRAME_TIMER_NS   (NANOSECONDS_PER_SECOND / FRAME_TIMER_FREQ)
 #define UFRAME_TIMER_NS  (FRAME_TIMER_NS / 8)
-- 
2.21.3



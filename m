Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8410821469C
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:56:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjag-0004tT-NO; Sat, 04 Jul 2020 14:56:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjVB-0003ES-Qj
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:50:49 +0000
X-Inumbo-ID: a9e8a022-be05-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9e8a022-be05-11ea-b7bb-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:12 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 22so34725437wmg.1
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LIvjoiOYGW8qxH03j7d+uMoGgATq8ow1BJ8pj4MMInc=;
 b=K8OdEPUyesQSU/S5m5qok6/IcUiWOAZO7BMajTrjGs6JPbceMxtuZf8byY8tbJEGHX
 JEhvrKsqhFGfeStk45pdmkIx1Crd26UqdfRtBkDFTF1ZcEpMz4Y9f8h/NujfAZ8zhopU
 tcgLUIVhx4SR2VngYxvbMDeifVcrfHrvzA0aQukuywYfCwQ6dqY2ovVF7OMVfTiF2YPn
 DNxSIQBEYNKYXgGw5SLUtGuykIXaIqdYUBYTZrYeQbwEa/h1m7E4cIMUq8sIDEztAFSW
 sjbJhzGGYK8GyRliwIteCXYFpst00XbTUThRJIANJG3Mz51oqbQ9X/YLHxyeR4B28a9a
 b3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LIvjoiOYGW8qxH03j7d+uMoGgATq8ow1BJ8pj4MMInc=;
 b=GBjuYTscOYDBbDgtp/qBQxOQkuwjlqJYKsftUl+tO8MLgS+KYzRv15oOIw73qK/mYy
 slmB4Hh5VioFNRHdC3snrMKbRL4C0WyKSnqgJ8qLZg8cfS0YAES3Jon3sEby/Bf+GTlE
 uGdCBoYhQAmzcOWinwaoVGZun5wCwvY564UPh91i5m9dkcnDLA3vKWeyKEb7rtg7L88F
 4Y9BbH9udZC3EaB06pzAE4ENe7C1/QPWQhIr55KOTBgiSaiQZCA/dPpGv+N3kTpBPlYk
 hzzcmyxC+eX1HRurvvQvgyIH732rDyrMuTSELaZOGBj/aXpzqE7B1Z/LAg97808YTsjG
 Ukng==
X-Gm-Message-State: AOAM531tAx7hfuExcOghhYP0TV06YfxaCwrCJ0mtqpzOIxi8FM83dbFU
 twg0iFait2LYekxyCIzZW3Y=
X-Google-Smtp-Source: ABdhPJxJqnEAihzmKK5m10VR2mbQ1Jco3QSfcvHgpyoRQzFTU2aqsRISnZhnGEZBTtk3/AGxed2vTA==
X-Received: by 2002:a7b:c313:: with SMTP id k19mr26876880wmj.67.1593874211964; 
 Sat, 04 Jul 2020 07:50:11 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 12/26] hw/usb/hcd-musb: Restrict header scope
Date: Sat,  4 Jul 2020 16:49:29 +0200
Message-Id: <20200704144943.18292-13-f4bug@amsat.org>
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

"hcd-musb.h" is only required by USB device implementions.
As we keep these implementations in the hw/usb/ directory,
move the header there.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 {include/hw => hw}/usb/hcd-musb.h | 0
 hw/usb/hcd-musb.c                 | 2 +-
 hw/usb/tusb6010.c                 | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename {include/hw => hw}/usb/hcd-musb.h (100%)

diff --git a/include/hw/usb/hcd-musb.h b/hw/usb/hcd-musb.h
similarity index 100%
rename from include/hw/usb/hcd-musb.h
rename to hw/usb/hcd-musb.h
diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
index 85f5ff5bd4..b8d8766a4a 100644
--- a/hw/usb/hcd-musb.c
+++ b/hw/usb/hcd-musb.c
@@ -23,9 +23,9 @@
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
 #include "hw/usb.h"
-#include "hw/usb/hcd-musb.h"
 #include "hw/irq.h"
 #include "hw/hw.h"
+#include "hcd-musb.h"
 
 /* Common USB registers */
 #define MUSB_HDRC_FADDR		0x00	/* 8-bit */
diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c
index 27eb28d3e4..9f9b81b09d 100644
--- a/hw/usb/tusb6010.c
+++ b/hw/usb/tusb6010.c
@@ -23,11 +23,11 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "hw/usb.h"
-#include "hw/usb/hcd-musb.h"
 #include "hw/arm/omap.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
+#include "hcd-musb.h"
 
 #define TYPE_TUSB6010 "tusb6010"
 #define TUSB(obj) OBJECT_CHECK(TUSBState, (obj), TYPE_TUSB6010)
-- 
2.21.3



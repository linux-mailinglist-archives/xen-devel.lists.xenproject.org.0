Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F72D21468B
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:50:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjUt-00045P-Az; Sat, 04 Jul 2020 14:50:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjUr-0003ES-Pd
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:50:29 +0000
X-Inumbo-ID: a52e31be-be05-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a52e31be-be05-11ea-bca7-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:04 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z15so24483030wrl.8
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8KnwDCFnDP2p4VznLGchEQ7MhbCDHoouF9hb3OmMvFo=;
 b=qnXK+ln5rQy/kZGC3Fh2RFx/8LLRy2FzRaODh+swFw0DtexOC034PCwojAmD2p2qEc
 +xBeYKP6Sea6ucH8fkvrVNNAXzAZNbHz5N4CojECMrqUJVqYMYiMaro3hTSh93ifaaQa
 XZwymWtZAF5r5fjYDxoQfxgBDwsrJ+DJMbXURYjcQX+7tdru4xwSDdEYfIB4ftoZAWW3
 odapVHwJEugfsQL3deagFHvaMemeZ1/ffZNaL8ml9YhUlAPZWcmqAc9Ldb9FPwIY49F5
 nCg4ELh3hzoGogZjdC9IsUHrjWxHgtGLNK9IssYFB3ec8/8vdv8bxlDIDWrs/Yk59fX7
 Perw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8KnwDCFnDP2p4VznLGchEQ7MhbCDHoouF9hb3OmMvFo=;
 b=Xc/87NXteoX8tE+sTZK7x9T9bgVBFJUbD81cRZ8Rd7hXP17kJXIlcna6HY0OPqx6CX
 7eOZAzi6O1YybqC39JQuf+LUWWetbc+DqPfc9pl9G2nOTnfwmM0aO2BJ5ylZOKUqqe74
 MwwWElhMghcMCfiKAyEo6dfu2AEqQT2uwZk2KFDNpj0dc1JaXq8zBhHkZdKPjvGM2nJ8
 l4DraPTmm53Y6cagBbkJL0BMJwEaO9F8avrnx1Lstbr28zkhQRSo2+VovZhFUBto8Xli
 JWVKl6Sd8Xngnwz+jgAG11aqyQB+ifayMgF8pY5R4qmK/nRpBv6jEd2CK0V+798HyKLD
 9ogA==
X-Gm-Message-State: AOAM53250OkZhW0WUA4vwMqxG+14/Tgv2pE9SeeQnu2LtBFruf/l+nKV
 ZRnjqJt/KCSdvFBBcQWtD+Q=
X-Google-Smtp-Source: ABdhPJy5uEuHNE6Qu6FF+bwIyX64Em7+RTT3tgkuG40gaTm44oygCnXfGMDpLMWbQQ/T4oOMWH2j6A==
X-Received: by 2002:a5d:5381:: with SMTP id d1mr41607272wrv.177.1593874204051; 
 Sat, 04 Jul 2020 07:50:04 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 08/26] hw/usb/hcd-dwc2: Restrict 'dwc2-regs.h' scope
Date: Sat,  4 Jul 2020 16:49:25 +0200
Message-Id: <20200704144943.18292-9-f4bug@amsat.org>
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

We only use these register definitions in files under the
hw/usb/ directory. Keep that header local by moving it there.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 {include/hw => hw}/usb/dwc2-regs.h | 0
 hw/usb/hcd-dwc2.c                  | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename {include/hw => hw}/usb/dwc2-regs.h (100%)

diff --git a/include/hw/usb/dwc2-regs.h b/hw/usb/dwc2-regs.h
similarity index 100%
rename from include/hw/usb/dwc2-regs.h
rename to hw/usb/dwc2-regs.h
diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
index ccf05d0823..252b60ef65 100644
--- a/hw/usb/hcd-dwc2.c
+++ b/hw/usb/hcd-dwc2.c
@@ -34,7 +34,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
-#include "hw/usb/dwc2-regs.h"
 #include "hw/usb/hcd-dwc2.h"
 #include "hw/irq.h"
 #include "sysemu/dma.h"
@@ -43,6 +42,7 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "hw/qdev-properties.h"
+#include "dwc2-regs.h"
 
 #define USB_HZ_FS       12000000
 #define USB_HZ_HS       96000000
-- 
2.21.3



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6577B2146AB
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:56:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjb1-0005Ga-E2; Sat, 04 Jul 2020 14:56:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjVL-0003ES-RK
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:50:59 +0000
X-Inumbo-ID: ac624880-be05-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac624880-be05-11ea-b7bb-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:16 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a6so24089448wmm.0
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xjjAqG2L8PiyECLv8vWl/nPN8wdvqzFPKnLDYj57EWU=;
 b=kGjxAbMk0Y+V1ZM0jG8F7zrUJeEpbEY2rUuWHyvQnUy2BC4TEa4D9G84sW8qU3Tnyi
 hXyLAakl5TAVaESh9mwcqIkW9kPRuFhF1CPBo0iqa9EzqOeUO8dcJwyom69eu1X7is1K
 GI/h4RCMamXhRltfPP+anRNrC4T3Xl/b+bRd7v5Nxqs6IBSrpiZ+NfMzkc3fyOz+zG/O
 qhZVj0cz4AUqg4attnXMbE/OWUZmlqtkxjHzNmmPiDdGXYHh9wyMp7La7dx/LG+WG1y0
 7hKot5Tx+EVBqxTjnBKGlFKxDUcrNR10Wub/RcuZ75CfRChXgIvTj2rJ1blM2eTTB1qV
 uPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xjjAqG2L8PiyECLv8vWl/nPN8wdvqzFPKnLDYj57EWU=;
 b=BlEDOZDvk569CRF8HkryQBb3ozQUYjdhSCo6rKJ6kMBMm7L1/UNLQ3zgLsN8yRZ3T/
 kL1m6TzdYWrT82sJ/hMsknvX/xKfGwzUC+Q3eQRZNFNilV+0ROaTSX4aFbXJbaHllV1l
 R+qUPyIcoCr3Y7bKIdbkogVCZ8I7S+9ly1cg6R4ruYH0nobsJP9Pf0EZcp+/kgLdoMTV
 F8Rh5R2EIw9i+ygLyR0Q5bluiapZYBr1ldXfAPKVTmvQn8BTg7Jj0rUnv8i6gCRsrK/7
 xzox/EFaxJ7FmySljFiPfE2VZBrJCNc4Qc0xeMNl/rAJJQSSuYcdZfEkxzoI2lrv38Z7
 BNoA==
X-Gm-Message-State: AOAM530kn5302bEYPm21F+PWkMpv261nQ5npHk7/b61Qtg3qpR0zv4ei
 dX20Gxsgiu+LycCAVXrQk78=
X-Google-Smtp-Source: ABdhPJyylaQ90oaFVpyNttGYGyUpJwJRvbiuNFcOgPIhMsiwGOGXapRLVUD2ADJD/bSRm2sJT5Aq2g==
X-Received: by 2002:a1c:6788:: with SMTP id
 b130mr42706142wmc.100.1593874216169; 
 Sat, 04 Jul 2020 07:50:16 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 14/26] hw/usb/quirks: Rename included source with '.inc.c'
 suffix
Date: Sat,  4 Jul 2020 16:49:31 +0200
Message-Id: <20200704144943.18292-15-f4bug@amsat.org>
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

This file is not a header, but contains source code which is
included and compiled once. We use the '.inc.c' suffix in few
other cases in the repository. Follow the same convention with
this file.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/quirks.c                   | 2 +-
 hw/usb/{quirks.h => quirks.inc.c} | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)
 rename hw/usb/{quirks.h => quirks.inc.c} (99%)

diff --git a/hw/usb/quirks.c b/hw/usb/quirks.c
index 23ea7a23ea..655b36f2d5 100644
--- a/hw/usb/quirks.c
+++ b/hw/usb/quirks.c
@@ -13,7 +13,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "quirks.h"
+#include "quirks.inc.c"
 #include "hw/usb.h"
 
 static bool usb_id_match(const struct usb_device_id *ids,
diff --git a/hw/usb/quirks.h b/hw/usb/quirks.inc.c
similarity index 99%
rename from hw/usb/quirks.h
rename to hw/usb/quirks.inc.c
index 50ef2f9c2e..004b228aba 100644
--- a/hw/usb/quirks.h
+++ b/hw/usb/quirks.inc.c
@@ -12,9 +12,6 @@
  * (at your option) any later version.
  */
 
-#ifndef HW_USB_QUIRKS_H
-#define HW_USB_QUIRKS_H
-
 /* 1 on 1 copy of linux/drivers/usb/serial/ftdi_sio_ids.h */
 #include "quirks-ftdi-ids.h"
 /* 1 on 1 copy of linux/drivers/usb/serial/pl2303.h */
@@ -915,5 +912,3 @@ static const struct usb_device_id usbredir_ftdi_serial_ids[] = {
 
 #undef USB_DEVICE
 #undef USB_DEVICE_AND_INTERFACE_INFO
-
-#endif
-- 
2.21.3



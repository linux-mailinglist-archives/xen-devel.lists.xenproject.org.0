Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 664B721469F
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:56:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjaV-0004r2-AX; Sat, 04 Jul 2020 14:56:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjV6-0003ES-QP
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:50:44 +0000
X-Inumbo-ID: a8a747b8-be05-11ea-8496-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8a747b8-be05-11ea-8496-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:10 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id o2so37044820wmh.2
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qlr3O8z8K3sxKCQEA3LIB47YWANsKrmr6NiJfPzW+pA=;
 b=BjegYO4FHLxpds48YkBBFzRrjEv1/GP+e4ATsl6+otTSGUY/901sR8dfeFezH6YE/H
 gyqcHtJDTSjMR3xSfApYj8hqtz/wSqo+AhH4cF/fm2j+9m/n0GaYISJPWJ/RwXFwMv0i
 zF35Mon1ROOvzuyLQlhn2ubfKHpMR6u+d6BRgIWzYqjNEGrlhI70Re1P2IMAC6x/WVCy
 UpAhaCc/lRUYHliXs64Cz+eMjpdgUsURvkEK6XHbHXGDgqkC12TEmbUML5S9HZLBsrDI
 CfvgBiMtwGNU5/W+nM99z3Uhdqnhwsjs6JgDwP2puNTcMnyTpTn0mUq5lKsTdp+nUtSr
 CzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Qlr3O8z8K3sxKCQEA3LIB47YWANsKrmr6NiJfPzW+pA=;
 b=ifhHzi4AVl6PBngXYnFGLKyc1CcaCjs4i2HYEZFbggnJTWoM1zOJIXZLpwA9vTpmw4
 n2XKyz0wb4R3QM4Y5tavkRbWJRhKdlCTin488UCSzdhhzTnYwmyYT1CUJHpk3VJ3Gsrw
 JbHZya1Y3YKEIWMB2tKgsYZArmor9C5KW7Y1SKowPy1/2ihKKGyZIhZSYY76e9C25VJL
 GO5fYVQy+FFrA0Y996MPkcpxOnhWRc1ixfBQAxUAATg99OHfTU/7sCBtFHulCRrd7eQO
 BzADbKlRxVJ+BAebuhTtyP7FFDTd2p2wCH+SbP8TE4JyD3/z6s0GNJySFoUu51OtjdYS
 Ix9w==
X-Gm-Message-State: AOAM531+X9+BpluPQyrIvrYSikDY9MbLfiFu20Alec20mbrxi6LSQqi9
 PAP+/bKWfPg15Hvemx4TM1s=
X-Google-Smtp-Source: ABdhPJwynHTB68DwvsWAVjiG8rSM/kHHHNQ70teJ+dR7LseKz9qmvzwpG0TxpNzjRrE6k7cH1DWiTw==
X-Received: by 2002:a1c:f007:: with SMTP id a7mr41379225wmb.103.1593874209918; 
 Sat, 04 Jul 2020 07:50:09 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 11/26] hw/usb/hcd-xhci: Add missing header
Date: Sat,  4 Jul 2020 16:49:28 +0200
Message-Id: <20200704144943.18292-12-f4bug@amsat.org>
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

This header uses the USBPort type which is forward declared
by "hw/usb.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-xhci.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index 946af51fc2..8edbdc2c3e 100644
--- a/hw/usb/hcd-xhci.h
+++ b/hw/usb/hcd-xhci.h
@@ -22,6 +22,8 @@
 #ifndef HW_USB_HCD_XHCI_H
 #define HW_USB_HCD_XHCI_H
 
+#include "hw/usb.h"
+
 #define TYPE_XHCI "base-xhci"
 #define TYPE_NEC_XHCI "nec-usb-xhci"
 #define TYPE_QEMU_XHCI "qemu-xhci"
-- 
2.21.3



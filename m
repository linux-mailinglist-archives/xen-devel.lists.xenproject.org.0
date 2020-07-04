Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D83D21468C
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:50:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjUi-000408-NO; Sat, 04 Jul 2020 14:50:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjUh-0003ES-PK
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:50:19 +0000
X-Inumbo-ID: a2b47b14-be05-11ea-bb8b-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2b47b14-be05-11ea-bb8b-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:00 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g10so12677223wmc.1
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ci3lKGhT7CaGmfO0merQ+/KTVofaj9NyV7u1/2UAP3w=;
 b=HTr3GqMeiMrHSFVz09gNzzyGE5/NusjcYwPUPJ9+Az6tEcg4A2YjJthJc8BKS0f3xF
 F4+ebiouyz8NRclvNRqup/GDrEN4F9p2jviH4u+BYG+0fxPmcN8XcbhSAoh6SFqU4Zw0
 FH/IpcWFj2yRtZ9xJLuf96x1ST8pDEf9hbCzZCPwmk0sO+6vtZTFj/sU4oryrL3pJ5Li
 Z1W2ONSpiFn0BO3jkg80P04ozix3y5MCMrcei0bm8NOU72QICc6nO3mwQ0RF77ptyVlN
 TnLG2rz47FkHMnveffGYGtgCStlP8At2zi6ngwyWWC2wn+upypNWXZkbAwAcNzprcGts
 BnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ci3lKGhT7CaGmfO0merQ+/KTVofaj9NyV7u1/2UAP3w=;
 b=FH6YksVs3O4etbI8wdq8gEuWnxDOQ/P90Pii+Ro7zYi8TLhmAH66yfx1oNDdvuLXd9
 z3bg86sTl+VEIIS+BTFeZT1OyCbeohdS0Em8WDbkODDWmLJ6SG6Ffrl46/oVQTyQlzCp
 fLMKTK8eqX/Qwjl1DLKcEL2TlQi9LMlcx5tz31IY24DfSQ2hNlUsL9OUFLfE9tpFkjx7
 2BSoJGFqsVdX50ppiiaNUhW5xg6MJfvo+OFvrWFnun6YXnlnov2CdS9UNEkeaWbri/yE
 McZFyBRhXlcRVB1EO/a7/V/OMdpIhh5M2pHVVAPY6Ux9FYFii0LqBj1sc3GLCJwzpRR1
 yKEg==
X-Gm-Message-State: AOAM533ev3KBkowerYAlNWi8Qf7x3iApbUxkVyc12H8CXHubc9ZV0tpv
 O+sRgNi5mmr8hm32wvkSvmA=
X-Google-Smtp-Source: ABdhPJxDJ13C73XgkZIyjGV7LxF7eBLsgTcF0RFnIfpAnAwchRq5JuWHl5cvDUWZqd//9F+vT3r0og==
X-Received: by 2002:a1c:b386:: with SMTP id
 c128mr43397378wmf.133.1593874199940; 
 Sat, 04 Jul 2020 07:49:59 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:49:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 06/26] hw/usb/hcd-dwc2: Remove unnecessary includes
Date: Sat,  4 Jul 2020 16:49:23 +0200
Message-Id: <20200704144943.18292-7-f4bug@amsat.org>
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

"qemu/error-report.h" and "qemu/main-loop.h" are not used.
Remove them.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-dwc2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
index 72cbd051f3..590e75b455 100644
--- a/hw/usb/hcd-dwc2.c
+++ b/hw/usb/hcd-dwc2.c
@@ -39,8 +39,6 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 #include "qemu/log.h"
-#include "qemu/error-report.h"
-#include "qemu/main-loop.h"
 #include "hw/qdev-properties.h"
 
 #define USB_HZ_FS       12000000
-- 
2.21.3



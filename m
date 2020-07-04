Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FDF2146A9
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:56:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjb1-0005Fr-03; Sat, 04 Jul 2020 14:56:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjVk-0003ES-Sf
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:51:24 +0000
X-Inumbo-ID: b2790e2a-be05-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2790e2a-be05-11ea-b7bb-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:27 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g10so12677787wmc.1
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lYK2LCkkm8mXjPosH/dQ8dVGr7IbLAxEMo5hKyX8gDM=;
 b=aXPSXSTXJgMKootuaitVYmZBSggQZgK5/msZtoZcg7I8jA8LHFIiATkIx5WCEZldCp
 SeaQ7H/JOLUc20KVhGcA7f0xl4oHCgEjVr98O8j746wh6K6hdXVhWWXSpum0kkLIE1Ll
 o0sWptvhIkbblNoImRzF3l09dCL3iVxJ0WW2ZeILMYy+tYCo1N5He53EBz1ZPY1YrT9P
 UVjDzzudJa9wnQi7oNvmU0XMFcjt7H4ZMvL4fKtFw3JleIBzE+YVCgrp2ICVwl2encpY
 Qq0n9vh6n8s2ZQnJVc4oUaSLVKsimpACr35vRSlpJj6uci1zi0CBBOOmhbGsI86MbzSm
 uOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lYK2LCkkm8mXjPosH/dQ8dVGr7IbLAxEMo5hKyX8gDM=;
 b=l+rlezrdqhdtyXXt3qbbltkAj6M++atsi2n0XhuPBckOQ+peFFUo/TPhzoNvpWvy/e
 lqyLjwEHDV5XQScoH8eQsN0zkeEIvb9G9UxtMoWMG4TnPFTmWTABTbiloQdVW+NKyDZV
 2k/VPhAfj5MsX6Z+CvaoBUUT3/rb3K1cFWul/nmHnNrpHpQlvQZrv+nR9B/rT06uXcID
 WabBFUoVm7kte+GpGrDM3tieuhFhXtpfwTnYvjinSvoBGY9RcxlK56WgdY5zcEJlGr57
 d4SzA6WwXwr2Cz13nxsOEI9O2LI5PTwyIVQCWBAafhcay74Mw/UM2TS2TGzkUFljZKwF
 rBSw==
X-Gm-Message-State: AOAM533WKTiPFLIOw3kFH+MUu83ZPRUrludQAUziDzFT2locpCU1qHly
 4h6gVM0BRY4xix/gpC2b1s8=
X-Google-Smtp-Source: ABdhPJyYWdPo4hPIeG0V9hnWAf/4U3I+ZmZnVun1avHp1mFNCeVPmAKMwxtGlSjuHYbjFpIPmXDhOA==
X-Received: by 2002:a1c:f301:: with SMTP id q1mr41171773wmq.110.1593874226397; 
 Sat, 04 Jul 2020 07:50:26 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 19/26] hw/ppc/spapr: Use usb_get_port_path()
Date: Sat,  4 Jul 2020 16:49:36 +0200
Message-Id: <20200704144943.18292-20-f4bug@amsat.org>
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

To avoid to access the USBDevice internals, and use the
recently added usb_get_port_path() helper instead.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/spapr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index f6f034d039..221d3e7a8c 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3121,7 +3121,8 @@ static char *spapr_get_fw_dev_path(FWPathProvider *p, BusState *bus,
              * We use SRP luns of the form 01000000 | (usb-port << 16) | lun
              * in the top 32 bits of the 64-bit LUN
              */
-            unsigned usb_port = atoi(usb->port->path);
+            g_autofree char *usb_port_path = usb_get_port_path(usb);
+            unsigned usb_port = atoi(usb_port_path);
             unsigned id = 0x1000000 | (usb_port << 16) | d->lun;
             return g_strdup_printf("%s@%"PRIX64, qdev_fw_name(dev),
                                    (uint64_t)id << 32);
@@ -3137,7 +3138,8 @@ static char *spapr_get_fw_dev_path(FWPathProvider *p, BusState *bus,
     if (strcmp("usb-host", qdev_fw_name(dev)) == 0) {
         USBDevice *usbdev = CAST(USBDevice, dev, TYPE_USB_DEVICE);
         if (usb_host_dev_is_scsi_storage(usbdev)) {
-            return g_strdup_printf("storage@%s/disk", usbdev->port->path);
+            g_autofree char *usb_port_path = usb_get_port_path(usbdev);
+            return g_strdup_printf("storage@%s/disk", usb_port_path);
         }
     }
 
-- 
2.21.3



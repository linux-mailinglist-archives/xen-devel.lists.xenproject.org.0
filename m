Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E6E2146A6
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:56:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjau-00055S-CW; Sat, 04 Jul 2020 14:56:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjVV-0003ES-S5
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:51:09 +0000
X-Inumbo-ID: aebbc98a-be05-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aebbc98a-be05-11ea-b7bb-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:20 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w3so24606974wmi.4
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LwCcRU3ITBZcN/p8m4Tvly+Gfq57t4rX34Kk3Uzziqs=;
 b=oKjMAbLQ2Nbdo7AVZTEMo5rKzXNXebbxS2YHgA5kZDA2Z2+DxgsuBaop4Nf7YP0t9g
 825K7Sz5l6DRKW2FWV64F6Y8PFEbfBZ/8mNGGq8q8I/v/XzgiVoT/c6cLtJ4Wq4+y8s/
 ZyQu3ZX70MOw0YMf2jRU84FoSuY8lwe6rfsONGi0EvhvcQH4agyx8WdTlthVPz7oUMLd
 7gZ2JkRsngTeq9VmBw6iuSdlXJYxQF7UzAOPFbD80qjvobuW2TUKX0fMm3Fjk3Rm4noB
 rWoSeUrHYZkkLtcx+JFqgKhA77mwlMll57o/tAzzPnbS9XSESKlGwrsNVmP1tPkGSkA/
 JlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LwCcRU3ITBZcN/p8m4Tvly+Gfq57t4rX34Kk3Uzziqs=;
 b=Eh+6h058r+uOg2DywExGmoYyVrZlZ7+afOmZn0HxjUWbUzJ9BQ3nVptpCONutwHUbr
 N6dprYgypafELQGImKgW/WpwpiQRUWFUN+m4MqKnt2ZnE1dfMELbaA4pDcxbKYlCLxlt
 7GhPlQoXw5QnLqjO3dKIym3s4On00GzF045osVhUtyf+hm2ynS5FPF4Q58fCMGro7whq
 tH3CDTTol9oZdEHyqYsryjHFw0bKY5XPtQtsmgS68QxK3NIxbu5tFsaBaW5vJXcWEEjo
 EzM9KkmMuSEmMSixrt187zqa9XM33c6YmdJzhbNhsZp6Wfi4qAskMAZzsoFepreKIqSN
 w/Nw==
X-Gm-Message-State: AOAM53249mpe4B+m6mJKPNk73OAgEYMKJwMswanzTHf4qdHrveqjNDmg
 wY6Y73EtGCOa37PkRFR6YyM=
X-Google-Smtp-Source: ABdhPJxv37a8GSHu9gIk53qyLIpPiec4lNJ044JwM140Yq2vwztlBB8+hQI1sx3Og8exNtb1rbIDuw==
X-Received: by 2002:a1c:b686:: with SMTP id
 g128mr43033346wmf.145.1593874220071; 
 Sat, 04 Jul 2020 07:50:20 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 16/26] hw/usb/bus: Simplify usb_get_dev_path()
Date: Sat,  4 Jul 2020 16:49:33 +0200
Message-Id: <20200704144943.18292-17-f4bug@amsat.org>
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

Simplify usb_get_dev_path() a bit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/bus.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 111c3af7c1..f8901e822c 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -580,19 +580,18 @@ static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent)
 static char *usb_get_dev_path(DeviceState *qdev)
 {
     USBDevice *dev = USB_DEVICE(qdev);
-    DeviceState *hcd = qdev->parent_bus->parent;
-    char *id = NULL;
 
     if (dev->flags & (1 << USB_DEV_FLAG_FULL_PATH)) {
-        id = qdev_get_dev_path(hcd);
-    }
-    if (id) {
-        char *ret = g_strdup_printf("%s/%s", id, dev->port->path);
-        g_free(id);
-        return ret;
-    } else {
-        return g_strdup(dev->port->path);
+        DeviceState *hcd = qdev->parent_bus->parent;
+        char *id = qdev_get_dev_path(hcd);
+
+        if (id) {
+            char *ret = g_strdup_printf("%s/%s", id, dev->port->path);
+            g_free(id);
+            return ret;
+        }
     }
+    return g_strdup(dev->port->path);
 }
 
 static char *usb_get_fw_dev_path(DeviceState *qdev)
-- 
2.21.3



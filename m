Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E514214687
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:50:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjUT-0003tj-Lx; Sat, 04 Jul 2020 14:50:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjUS-0003ES-Oq
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:50:04 +0000
X-Inumbo-ID: 9f27afa2-be05-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f27afa2-be05-11ea-b7bb-bc764e2007e4;
 Sat, 04 Jul 2020 14:49:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z15so24482792wrl.8
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MuyWjc3EjPCzKMWDQ2x+ag455dTHS4+/J8s0D1IfWzs=;
 b=eJ712M4xvrpeG0WDBqIsWoodAc0KX1IcpGrySlrkuD9AOTok/P4V/I21yqX/UEczz4
 3tSXj1WMi3HUlpJkfq2a6D2xREY05qgcqqJ19Jl7cdWzw2gv+ctBk/5poKNfTIv79Q0n
 BAVVtuIe/u6EewOUx6SzWsbiKfIGzmfWG/Yq7yydaZQAcV3k6WTSGWLLZAqkjp55Pn7+
 lBXvy8gVmzLifoWV3EcPuOxQzRn/bv2cit5TEsCXcdNiE6ar8MCWmB3dx2nr0CNajAWK
 hoBQwV5aFZPYADzkJ6K25xbFFvQMnugh8FXNfFas/L7BOnEBzAH5LJDg5p/AgO1233GU
 IUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MuyWjc3EjPCzKMWDQ2x+ag455dTHS4+/J8s0D1IfWzs=;
 b=bFdZePQLKgPiOthqM0+SNRyYusNfxCytc5NmbTJNcc7oLYEmK6trHvHKqZzEMHWlCR
 ABaib5HMnwhox9GZKSvWyPLnHWINOtYQFWeyy1iPzSzomeWq94yFB18Wm+elHRzKRklC
 C3SylrbVKwDEEV4CVnWhNU3K/1SW/1DO+mmK7he6Qcffy9bGr+Nz5BKIHlNbBfK3aR5k
 8iZVLStIyIPqFazsb9T5VCQZyKXBXdW2WXTvu6lAbMvYFY1oEdoQzQstQ5Clu9JnnDMO
 aYqLAZaWfuU+lcm/Wcxvn3sggXrLrT8uq4+GDEEzhs0/JtCptAz+woFi28/WfDu0C0Km
 nu7A==
X-Gm-Message-State: AOAM5334ZUOgIF2P+SZRYZbeGIXqgm/a1kt+itM0yR21nm6/OzQU+7lw
 45dnKrtPv96oNEL6/rUF4E8=
X-Google-Smtp-Source: ABdhPJyYcaxhb0w6bZS0TVjPWW7MJK44YHjNK2tmtt5WThpkFwrsjrZmdAUU/9drVhDWFP6nr2M8dQ==
X-Received: by 2002:adf:e9c4:: with SMTP id l4mr42871069wrn.9.1593874193982;
 Sat, 04 Jul 2020 07:49:53 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:49:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 03/26] hw/usb: Remove unused VM_USB_HUB_SIZE definition
Date: Sat,  4 Jul 2020 16:49:20 +0200
Message-Id: <20200704144943.18292-4-f4bug@amsat.org>
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

Commit a5d2f7273c ("qdev/usb: make qemu aware of usb busses")
removed the last use of VM_USB_HUB_SIZE, 11 years ago. Time
to drop it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/usb.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/hw/usb.h b/include/hw/usb.h
index e29a37635b..4f04a1a879 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -470,10 +470,6 @@ void usb_generic_async_ctrl_complete(USBDevice *s, USBPacket *p);
 void hmp_info_usbhost(Monitor *mon, const QDict *qdict);
 bool usb_host_dev_is_scsi_storage(USBDevice *usbdev);
 
-/* usb ports of the VM */
-
-#define VM_USB_HUB_SIZE 8
-
 /* usb-bus.c */
 
 #define TYPE_USB_BUS "usb-bus"
-- 
2.21.3



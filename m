Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FFE214684
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:50:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjUe-0003xr-90; Sat, 04 Jul 2020 14:50:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjUc-0003ES-PD
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:50:14 +0000
X-Inumbo-ID: a1811856-be05-11ea-8496-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1811856-be05-11ea-8496-bc764e2007e4;
 Sat, 04 Jul 2020 14:49:58 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f2so7792457wrp.7
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7pFkSbRRQbCuRBQa/wHlCeQOONUZFK/RPfYxuVN6mNY=;
 b=oe96UZf2PvTeWCGOzNPdJjjjwq8e7uWWti9W08FMinN7P58qMXJzwG4jf7BQqAlIXy
 6nHLswC2ubCB3a5BJuyeZJgNcIKrAIDo4ARzHOGDOs8dG3JjWPLZh+xe/GSdKhL1zZpq
 8BYgKvBkBIAl/g+8RWgLQjeAv3/zhyETI0aJxVBr/gw0rUcBfnedTHwEViIUPNIXNva6
 03JOGnSszEoF4cvdF3lLiUVfjtrvuQh3LEc873Fecq0vjBpXttzot5/ZB9ZEJEQG430J
 9YLB5PV5soEOhpr3WG8RhSY1eKgOIEVX6mRUL3RwbaUehHrdq/CwhlxSp1fhDKJcCsc/
 pq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7pFkSbRRQbCuRBQa/wHlCeQOONUZFK/RPfYxuVN6mNY=;
 b=G3iciyn7RQ8poATp+XoZi/LGasfXagXvrMp83LJoggQKPv5/2nWah3EsboJqty8Ey3
 Llbi9QyB3V9/Xuv+OXgLDbtpwJ9OAYFi2nUercF+38gEo8qLrcypuano9wCpcQw6ZskX
 TtB+YE6oGcNNzrZ7XnAOobI5XMxnbMB3XQDgoQWRyv6ic4qP6vPrx9HTHPgpsHOcNmgu
 OCJvopcsNv1Kst/fPpWPdIOrOjNE0NJVXKVakIA88yV8KuWjjpksJdg7ocvvMhJRAPJe
 JEYLUWoxeoXM7/ZFyAkaq7sM1tjQIkRgtVMrqEWN5zJa04rq4deZ3l8fnhibqQq8uFxi
 rRTA==
X-Gm-Message-State: AOAM5317t1vYaqpZiEKllene4TYWqqc/7jTOab5nUgYtIKfizhIEb/+c
 WLs0NuYB9RkclxvMy8nwYZ0=
X-Google-Smtp-Source: ABdhPJyIsvEkdmFv/CEzZPKYJCez2abF31l4aHFgnR6C3Ee2RRBQ8QQm9RtLdC3SuJbJy3WxELYEqQ==
X-Received: by 2002:adf:f08b:: with SMTP id n11mr40029476wro.312.1593874197889; 
 Sat, 04 Jul 2020 07:49:57 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:49:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 05/26] hw/usb/desc: Add missing header
Date: Sat,  4 Jul 2020 16:49:22 +0200
Message-Id: <20200704144943.18292-6-f4bug@amsat.org>
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

This header uses the USBPacket and USBDevice types which are
forward declared in "hw/usb.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/desc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/usb/desc.h b/hw/usb/desc.h
index 4d81c68e0e..92594fbe29 100644
--- a/hw/usb/desc.h
+++ b/hw/usb/desc.h
@@ -2,6 +2,7 @@
 #define QEMU_HW_USB_DESC_H
 
 #include <wchar.h>
+#include "hw/usb.h"
 
 /* binary representation */
 typedef struct USBDescriptor {
-- 
2.21.3



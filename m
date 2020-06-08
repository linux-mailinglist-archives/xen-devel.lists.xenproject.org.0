Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4E31F1CC2
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:03:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKEy-0005DE-Vw; Mon, 08 Jun 2020 16:03:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKEy-0005Cr-E2
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:03:12 +0000
X-Inumbo-ID: 8c86487c-a9a1-11ea-9ad7-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8c86487c-a9a1-11ea-9ad7-bc764e2007e4;
 Mon, 08 Jun 2020 16:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKgZ6rumXDcRDPMbmvtvFrKHcFm+r1xyGKVfqjvJc6Q=;
 b=TGCSDTjSjVESFM0s9RVzGVk/nBmwY3w+YYNoJXfVGVMfhPDDGxFeej0/JMo2m9OXNii0Se
 5ohss3AoEbYC/QoJy4IGccOvaXAcun9zOqJUwkVdWdt1iqJ4uHDFtb6GI/BAsLcyfvGkoC
 3LKehgJXvpYrVHtx0Rs3Q7sKTOixG8U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-2ic1ciL8M6qX7rYM_hrwlw-1; Mon, 08 Jun 2020 12:03:06 -0400
X-MC-Unique: 2ic1ciL8M6qX7rYM_hrwlw-1
Received: by mail-wr1-f72.google.com with SMTP id m14so7339203wrj.12
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RKgZ6rumXDcRDPMbmvtvFrKHcFm+r1xyGKVfqjvJc6Q=;
 b=exPvCKM6LgFWZoRWsyPVJe+KZcFa308yGKEH2nWMb6PQymKNOKVVQOBsMPytjkpdMs
 GimAVuEHnccJB8dtfSmijNCvZ5ZB3AzWv64yG+tVCk/ck0KRum0eYsFWogExsYpcCcXh
 86qjl0/7wLw1uaeI+66O1hqD4IZKR+CQphM5NOKGa8I/d5H2Slg5PS/YiEz06ZKiMqfm
 4ZZ1em9pjYGL141w7d+9kB9TW8BUhLtAQiSDeM9ztWUgNBSlAO8+ctgVlYbRCLsx3Jvt
 OCn9fJigQtgHKNSM59F/A5/VHrrpUI8JILjQOhCY2eHoC9utBNSNr7ovHfaoADfuCLad
 PRfw==
X-Gm-Message-State: AOAM532Adv+fYOUWe0111xzS5bNKfZVKKXvhWhNEygH9X6ALW3rap+IW
 u/Smfi8PrhtHvAHa6CW6e11j9+xk4UXiRhSzCVZaIGLFzKTIhIrUfsfVMPXUu5m8kEunf5Y3tJC
 Pg21w6ZnoLZ71X9sW3F/oCJAS/UI=
X-Received: by 2002:a1c:a906:: with SMTP id s6mr21527wme.171.1591632185578;
 Mon, 08 Jun 2020 09:03:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU3FFzPx8GJONXk2lb2PRS9hlQzh1ioPeLu4txPuU4I7Pa7KejCTY0NavLN6WE+tDOlF/rwQ==
X-Received: by 2002:a1c:a906:: with SMTP id s6mr21489wme.171.1591632185399;
 Mon, 08 Jun 2020 09:03:05 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id g25sm30434wmh.18.2020.06.08.09.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 24/35] hw/misc/cbus: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:33 +0200
Message-Id: <20200608160044.15531-25-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/misc/cbus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/misc/cbus.c b/hw/misc/cbus.c
index 3c3721ad2d..24e197684f 100644
--- a/hw/misc/cbus.c
+++ b/hw/misc/cbus.c
@@ -25,6 +25,7 @@
 #include "hw/irq.h"
 #include "hw/misc/cbus.h"
 #include "sysemu/runstate.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG
 
@@ -135,6 +136,8 @@ CBus *cbus_init(qemu_irq dat)
 {
     CBusPriv *s = (CBusPriv *) g_malloc0(sizeof(*s));
 
+    qdev_warn_deprecated_function_used();
+
     s->dat_out = dat;
     s->cbus.clk = qemu_allocate_irq(cbus_clk, s, 0);
     s->cbus.dat = qemu_allocate_irq(cbus_dat, s, 0);
-- 
2.21.3



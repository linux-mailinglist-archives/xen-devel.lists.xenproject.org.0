Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558161F1CA2
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:01:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKDc-0003zN-R4; Mon, 08 Jun 2020 16:01:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKDb-0003yb-A9
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:01:47 +0000
X-Inumbo-ID: 5ae958d6-a9a1-11ea-ba62-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5ae958d6-a9a1-11ea-ba62-bc764e2007e4;
 Mon, 08 Jun 2020 16:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wevOFGWECaRJOmLpbzON6N0ynWLO2tBiVdtI/WyaADw=;
 b=NkW3UnwTbxxaLsuKfjS3EBcBjcDhv1go6laBXYOB+rFptyXhwpJ6FoPbvRNNbtIsgYMXwH
 TwzJxY/H5i3I16+12dNHPkTrk5JxeJrafH6n5rjvaa5YE56oGnF1R97P/MNFJQZ20kw8sX
 ivtKzD9hc7IWlS6v81sMyb5TvHRDiCs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-BruzOao4MFKnk_HSbyC77A-1; Mon, 08 Jun 2020 12:01:44 -0400
X-MC-Unique: BruzOao4MFKnk_HSbyC77A-1
Received: by mail-wr1-f70.google.com with SMTP id d6so7338878wrn.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wevOFGWECaRJOmLpbzON6N0ynWLO2tBiVdtI/WyaADw=;
 b=cXt5bWqCE/P4uzZ3JdX5em4FbZCHdooGTYV+QBDv+vngkWaTBIH46VSChJZtEhC8x7
 eWHcvAnDQSw7eOmPPDQhN1rmTUNGeOzhBiPaj748YhUJdG56ToInL3nG7jCnvVlRQzqw
 BpNys2pLBRn806lTzp8qwE2pL8RRVp7zDhSOulAVNSkX7VACtvtKuYkC4FcNz4rwKhvO
 /M2t3iF0xZeRLkCHE2ImfbDjVIHEft5Y8h1MzUq8WqPRV1U6/Bgl0vTAGjC+U0qj3IqM
 ykWlK4ATTPfNzXD87hj9wG87ItfKP0+wFmpGyIArQHckOp3t8InLKM5b7z7ph2cmKQvt
 ekfQ==
X-Gm-Message-State: AOAM533sBXYqsClnM1sKqK7ld5Rm4GVDD2W9Q7EUFnrL+lwxrhISaIoh
 nZ06mUHtlEqgnflD3Nk0fhOagDacGdL8Gmb/TKmF7e2ZOrxOpZk5FeWMZNTqYa9cmdL19Ell+9V
 m9GXvSNpFCY7zEtg6KhCMRErEE4g=
X-Received: by 2002:adf:fd81:: with SMTP id d1mr24815725wrr.96.1591632103558; 
 Mon, 08 Jun 2020 09:01:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgYI93lvZ2rTNUf8uc34cwDYk4WA9pXLtkl6aiMXyXdGzMVgF1rzOkVGZM3nz7yDUz0VO1vA==
X-Received: by 2002:adf:fd81:: with SMTP id d1mr24815694wrr.96.1591632103352; 
 Mon, 08 Jun 2020 09:01:43 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id b185sm342940wmd.3.2020.06.08.09.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 10/35] hw/display/tc6393xb: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:19 +0200
Message-Id: <20200608160044.15531-11-philmd@redhat.com>
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
 hw/display/tc6393xb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 49a676d1b0..e4900e9502 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -21,6 +21,7 @@
 #include "ui/console.h"
 #include "ui/pixel_ops.h"
 #include "sysemu/blockdev.h"
+#include "hw/qdev-deprecated.h"
 
 #define IRQ_TC6393_NAND		0
 #define IRQ_TC6393_MMC		1
@@ -556,6 +557,8 @@ TC6393xbState *tc6393xb_init(MemoryRegion *sysmem, uint32_t base, qemu_irq irq)
         },
     };
 
+    qdev_warn_deprecated_function_used();
+
     s = (TC6393xbState *) g_malloc0(sizeof(TC6393xbState));
     s->irq = irq;
     s->gpio_in = qemu_allocate_irqs(tc6393xb_gpio_set, s, TC6393XB_GPIOS);
-- 
2.21.3



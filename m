Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6981F1CCB
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:04:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKFi-00062l-DG; Mon, 08 Jun 2020 16:03:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKFg-00060k-AE
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:03:56 +0000
X-Inumbo-ID: a7c53adb-a9a1-11ea-b292-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a7c53adb-a9a1-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 16:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qfeQjgHHg6Ez9waCGJmOrJzAr/zUBGXbuFUiyuF/Rfo=;
 b=i0gWMupYQnQaFUEqTKaVJBfEe2HNXu7+J/baMmXCmjt4r32d3aYvlLPLRjroSb/5hxImAc
 uC3PbyJL9Znc/AfU8nlK8C59RGAgTKM1qMcX+L4K9FxhXkQhXrh66avYo1etStY+pgnPup
 Oq+k1H8cr0en46mXrLNzlbEfZfcry30=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-fkrCQdsqMBKNuS5RKU1dOA-1; Mon, 08 Jun 2020 12:03:54 -0400
X-MC-Unique: fkrCQdsqMBKNuS5RKU1dOA-1
Received: by mail-wr1-f70.google.com with SMTP id o1so7301067wrm.17
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qfeQjgHHg6Ez9waCGJmOrJzAr/zUBGXbuFUiyuF/Rfo=;
 b=rWixmA5Q8jXZw28KKwt/9OhtlIq9ugTF60XXRG7wSYDZ1vLWtRiSmTvVbcQBxBlxAZ
 G9aobf6c+tEjBcYVl80sbW6l1PvE5+PbxQge7+aQ1xTIJ4yBNQrsBxdSKLtjTWELXZJp
 PbrW/PaLPK+WuLcy9Hr/Fm6Li2ubxhjg1ASA1V+gK9Sat2Xb3rVcc0dlmRs3ty8y2sQF
 DT6PIFvJmdTBkTeB6eyERNM+JYcsLKVmP8u7ePr3hZdfddcFcYJ6C68hILgn+WqueTel
 6DWmjyRojgVjCXalDrefm53MFOPWr2KkWRmCF/XldPmLSKOKPzsFnPkmPuWqLj1j26Ia
 g7RA==
X-Gm-Message-State: AOAM533HrBHZO/Jw4mXWXWC3OtUIxIAGS1dC+zASiB0xFik6A9iE7Uu4
 hiEdLzlv7UaM8rss6mZs/1p6FGwifUepbRvn881GdseL3L1KHtfYOCFpHKuYJaI/ufv355RfH/z
 D50ypoDmTORQ4IeHb0tnMef0i8Iw=
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr54308wmj.3.1591632232863;
 Mon, 08 Jun 2020 09:03:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLcq9fw++IqBSfctMa2VnenePzSclzDPUX9srn5OE/PiQtrx427TCsmbU35rGSbrlanE52/A==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr54282wmj.3.1591632232663;
 Mon, 08 Jun 2020 09:03:52 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id q4sm4466wma.47.2020.06.08.09.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 32/35] hw/riscv: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:41 +0200
Message-Id: <20200608160044.15531-33-philmd@redhat.com>
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
 hw/riscv/riscv_htif.c  | 4 ++++
 hw/riscv/sifive_uart.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/hw/riscv/riscv_htif.c b/hw/riscv/riscv_htif.c
index ca87a5cf9f..bd080dbefb 100644
--- a/hw/riscv/riscv_htif.c
+++ b/hw/riscv/riscv_htif.c
@@ -30,6 +30,7 @@
 #include "hw/riscv/riscv_htif.h"
 #include "qemu/timer.h"
 #include "qemu/error-report.h"
+#include "hw/qdev-deprecated.h"
 
 #define RISCV_DEBUG_HTIF 0
 #define HTIF_DEBUG(fmt, ...)                                                   \
@@ -238,6 +239,9 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
     uint64_t fromhost_offset = fromhost_addr - base;
 
     HTIFState *s = g_malloc0(sizeof(HTIFState));
+
+    qdev_warn_deprecated_function_used();
+
     s->address_space = address_space;
     s->main_mem = main_mem;
     s->main_mem_ram_ptr = memory_region_get_ram_ptr(main_mem);
diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c
index 9350482662..1a5890d5f7 100644
--- a/hw/riscv/sifive_uart.c
+++ b/hw/riscv/sifive_uart.c
@@ -25,6 +25,7 @@
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/riscv/sifive_uart.h"
+#include "hw/qdev-deprecated.h"
 
 /*
  * Not yet implemented:
@@ -183,6 +184,9 @@ SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
     Chardev *chr, qemu_irq irq)
 {
     SiFiveUARTState *s = g_malloc0(sizeof(SiFiveUARTState));
+
+    qdev_warn_deprecated_function_used();
+
     s->irq = irq;
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
     qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
-- 
2.21.3



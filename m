Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993921F1CC1
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:03:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKEl-0004zF-LJ; Mon, 08 Jun 2020 16:02:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKEj-0004xK-Fa
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:02:57 +0000
X-Inumbo-ID: 84dd67cc-a9a1-11ea-b292-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 84dd67cc-a9a1-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 16:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3z7/2H5A05Y0veUntj0sB8fSeRKRdeeSYeKdBwF4Hw=;
 b=fpmhIKFvXLBpniJCwiDDDhPv207fXRcRPf8Fyzb5skveGIlLOsn5quV6q8sdbFQl24gin0
 pn8EXow3zBSue5C8vbvUVw2Mp3zYD3fBOtJEipjW+o09za2eUlMYrD7hIhzVutB/3tAQPA
 bz1mHO1dTKHznxeOYtNDRhN1EJmjMr0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-7XjA2IgJMUC4pFDJteqlGQ-1; Mon, 08 Jun 2020 12:02:55 -0400
X-MC-Unique: 7XjA2IgJMUC4pFDJteqlGQ-1
Received: by mail-wr1-f69.google.com with SMTP id t5so7327475wro.20
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L3z7/2H5A05Y0veUntj0sB8fSeRKRdeeSYeKdBwF4Hw=;
 b=XwQ4gqHPIImJ644DyU7+b98n6CPZSplRgJZAkqXd/bH4qMPsRGu2jra8/JhzP46H1L
 uMHXlYwB8lFJq2Bm2A6IaP3r+FxIOUPwE+PgUn5UOLf/I8D6q6r2P5V2LF6ixmMGIciY
 EVsJ3FT3vHPvLZzbBm9Q2NrisnLhRonyn2T56QKC8yMFltfEOizJqsE7en4CHAU4IZ3X
 xCzZXOcF79vIKu1ARmstd8kdinumyifP/S6IjTskfi+4yrWrlPzXhP/VdSSpF6PvOZhF
 1dp8UjPVvyfGjXdeC5A0TZA9fWVOzc56PHybTStSQVEfror9mlNG25CmzcK5q3ST8Vnk
 b1eQ==
X-Gm-Message-State: AOAM533n5E7CIXKUfeS7o08hCVtT/nEPwrosY/10o4b1fDgL9rMcUWHV
 dr0VRu1gn9Ez0IzTcPjkpmK6mxUJHEmswoOBSak8TCccoFwbuwIvFjSdwMn6MTtsgqSHcvT1O/L
 3anfwIPjeuAOY6oHolu+Ju+o1Jvw=
X-Received: by 2002:a5d:4841:: with SMTP id n1mr25485583wrs.64.1591632174026; 
 Mon, 08 Jun 2020 09:02:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxA5a/fZ3ZxfFd0NOMzf3yCM2KT4oTBQZPfei9kF9bupOnm+jcw1E0PX8MzjNlME16qgafXA==
X-Received: by 2002:a5d:4841:: with SMTP id n1mr25485541wrs.64.1591632173820; 
 Mon, 08 Jun 2020 09:02:53 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id q8sm49134wmq.1.2020.06.08.09.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 22/35] hw/m68k/mcf520x: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:31 +0200
Message-Id: <20200608160044.15531-23-philmd@redhat.com>
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
 hw/m68k/mcf5206.c | 5 +++++
 hw/m68k/mcf5208.c | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index a2fef04f8e..ec0d176674 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -16,6 +16,7 @@
 #include "qemu/timer.h"
 #include "hw/ptimer.h"
 #include "sysemu/sysemu.h"
+#include "hw/qdev-deprecated.h"
 
 /* General purpose timer module.  */
 typedef struct {
@@ -144,6 +145,8 @@ static m5206_timer_state *m5206_timer_init(qemu_irq irq)
 {
     m5206_timer_state *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_new0(m5206_timer_state, 1);
     s->timer = ptimer_init(m5206_timer_trigger, s, PTIMER_POLICY_DEFAULT);
     s->irq = irq;
@@ -566,6 +569,8 @@ qemu_irq *mcf5206_init(MemoryRegion *sysmem, uint32_t base, M68kCPU *cpu)
     m5206_mbar_state *s;
     qemu_irq *pic;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_new0(m5206_mbar_state, 1);
 
     memory_region_init_io(&s->iomem, NULL, &m5206_mbar_ops, s,
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index 2ab9701ad6..72627f6833 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -26,6 +26,7 @@
 #include "hw/sysbus.h"
 #include "elf.h"
 #include "exec/address-spaces.h"
+#include "hw/qdev-deprecated.h"
 
 #define SYS_FREQ 166666666
 
@@ -191,6 +192,8 @@ static void mcf5208_sys_init(MemoryRegion *address_space, qemu_irq *pic)
     m5208_timer_state *s;
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     /* SDRAMC.  */
     memory_region_init_io(iomem, NULL, &m5208_sys_ops, NULL, "m5208-sys", 0x00004000);
     memory_region_add_subregion(address_space, 0xfc0a8000, iomem);
-- 
2.21.3



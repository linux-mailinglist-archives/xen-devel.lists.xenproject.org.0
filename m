Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C462B1F1CA5
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKDn-00047C-Jb; Mon, 08 Jun 2020 16:01:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKDm-00045t-4x
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:01:58 +0000
X-Inumbo-ID: 6176dfe9-a9a1-11ea-b292-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6176dfe9-a9a1-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHbfMTMnP0pPoIUOMaNBIF3qcn8JPSW/pdevUa2NjDA=;
 b=FpF4eDcfAtrF/PCga4L5v4LJ/fkMSyuZchTlSs/sjRwmrIZHt3KruPO4ic/slfdA7ekyOW
 TM8fg+jamCenJ88JGGsbY4EPbKUd22wgmF1++KUf4LfZjlKIgd65Y9riR2USmHzLPFTDkR
 0WrCCxnwwAnU/vRsqjHkN0o/tf2Mzmk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-IyjJ421gM3agjRJtPom0Gg-1; Mon, 08 Jun 2020 12:01:56 -0400
X-MC-Unique: IyjJ421gM3agjRJtPom0Gg-1
Received: by mail-wm1-f72.google.com with SMTP id y15so12425wmi.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uHbfMTMnP0pPoIUOMaNBIF3qcn8JPSW/pdevUa2NjDA=;
 b=BiIsoqjtuNsJ9Dop55nnUQTKGx+PtGVzPSNrVsJjmML88QdhmotgXhggwhLXqZMn6/
 eFsvrM0NXGMXdkgDCN3GUFHnwSbUQBX2OLKTfvcLF5jcR/ettcYwqvql40TI0tDrn8kL
 Sy2ncXLuNrlXdhx/VRP2L9i/LweT1sp82i5b8uWu0JVfgllDmYsC/zAiJLBJCrvI6gA1
 lhA227POOqpukHCVxZZLy/Jmj9qAWk8fkm3uyp/17zeyZo3XmD6btFayp2FPDwB5j1gQ
 jP0931SVlw6s6dueP+KgwMdiKRfLiuhciFvhCGg2JvH4rGjhJ9kKWuW+4tnioeFc7rYm
 kYtQ==
X-Gm-Message-State: AOAM533fOUy4OtPuQsoI7vA2+Bzc1K1TVegMKLE0s5KguHEM+sBEp8U8
 qKduaYZ1FTs3kp2RyToKuJjh8WtSyKhS1KVTk1xMZGqQxJW/uJKS4dHX6RLKviZ7wK6Azn5mN4o
 rRIpvj24EpKQPZjNTFoDgAlFuuM0=
X-Received: by 2002:a05:6000:4c:: with SMTP id
 k12mr23864566wrx.215.1591632114952; 
 Mon, 08 Jun 2020 09:01:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjnqOGBWofUhF/g/CPg0SMkJ8njA1iKr2pcTJ7xpwajdAOHpMg7tlHe1H6wlLAySWDO/5VvQ==
X-Received: by 2002:a05:6000:4c:: with SMTP id
 k12mr23864524wrx.215.1591632114766; 
 Mon, 08 Jun 2020 09:01:54 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id y17sm194731wrn.12.2020.06.08.09.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 12/35] hw/dma/etraxfs_dma: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:21 +0200
Message-Id: <20200608160044.15531-13-philmd@redhat.com>
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
 hw/dma/etraxfs_dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index c4334e87bf..d2f7e7ca9d 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -28,7 +28,7 @@
 #include "qemu/main-loop.h"
 #include "sysemu/runstate.h"
 #include "exec/address-spaces.h"
-
+#include "hw/qdev-deprecated.h"
 #include "hw/cris/etraxfs_dma.h"
 
 #define D(x)
@@ -765,6 +765,8 @@ void *etraxfs_dmac_init(hwaddr base, int nr_channels)
 {
 	struct fs_dma_ctrl *ctrl = NULL;
 
+    qdev_warn_deprecated_function_used();
+
 	ctrl = g_malloc0(sizeof *ctrl);
 
         ctrl->bh = qemu_bh_new(DMA_run, ctrl);
-- 
2.21.3



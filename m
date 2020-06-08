Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EA71F1CA7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKE0-0004GK-4W; Mon, 08 Jun 2020 16:02:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKDy-0004FG-B1
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:02:10 +0000
X-Inumbo-ID: 68a82808-a9a1-11ea-9b55-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 68a82808-a9a1-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 16:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swd27F6/1+WGmnfSzwg22l5POZg58LkwHV81fIkNGaQ=;
 b=FstAH5DzUckULHIdThFTTCVGLMNQq15alAlW3hM6uGHmUhc92odcT1RedTTk4iyV6NYp0X
 QkdabGfWI4RvkDlSEr8ZMxGGSlqx4xZigzmeBgmfLl2zlHM/u/9LScZSlR7ExlG10K1wTW
 FHHhPlI2u8Uq1k4txdSaFwsh+1J8w3E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-S4pWr-85NjG2Ds4FfRrF6w-1; Mon, 08 Jun 2020 12:02:08 -0400
X-MC-Unique: S4pWr-85NjG2Ds4FfRrF6w-1
Received: by mail-wm1-f69.google.com with SMTP id j128so6684wmj.6
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=swd27F6/1+WGmnfSzwg22l5POZg58LkwHV81fIkNGaQ=;
 b=E81JLIStopXH1hzW6Svk99WyAwEp0rs66f7wPoBBJn1p9iThaLK7f2O6UsqbYY/b7u
 4pPDlNqCF44MBTKbo8NdLcjuacYsWgwSV/XIV4Wt3OYcRx0fFLhyKl7AaOz6wP6jjEQz
 7JdflL52IHEC1YIYF/hEGDEoh+BK8rfG27+ZFVkk3hG1vUIT3qGczoV/sJU0wTPrE1jy
 2jhgL6EfnM1os5m2cvMiCTiUP0pU8g9Kzod8ruEJgemmRjwkwMbrc6xdLk/3a3yYNu+S
 6UF/uwTydYw8z9u7xdv3hj/+O/PpyUpXe8E85StSNU2meBaV+LjLrRjZZW1lFdtciFKy
 XRcA==
X-Gm-Message-State: AOAM531UFThT6jK5QZFqMPt3mFMtxgAIeSKg8VkxU4VGZQJMKrsfqwvL
 OoZBjYyYTKBemVS69OmvjWmzJ4ALjo38UtCc79EVi1191de3ygR5OM7pdkY4DMPEd6nkiCkTGOC
 F983tbwRpBiTj1tL/aPSdhAksOUw=
X-Received: by 2002:a1c:cc0d:: with SMTP id h13mr58663wmb.168.1591632126777;
 Mon, 08 Jun 2020 09:02:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwD9AlGEl1YrzMFzzhVE1vb4kbCf4YFVdSir7m67DLKARx2zMO0OlXdHqSCrgQOgDPIF6US1w==
X-Received: by 2002:a1c:cc0d:: with SMTP id h13mr58578wmb.168.1591632126013;
 Mon, 08 Jun 2020 09:02:06 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id z206sm13115wmg.30.2020.06.08.09.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 14/35] hw/i386/pc: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:23 +0200
Message-Id: <20200608160044.15531-15-philmd@redhat.com>
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
 hw/i386/pc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2128f3d6fe..c71809fd28 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -94,6 +94,7 @@
 #include "vmport.h"
 #include "fw_cfg.h"
 #include "trace.h"
+#include "hw/qdev-deprecated.h"
 
 GlobalProperty pc_compat_5_0[] = {};
 const size_t pc_compat_5_0_len = G_N_ELEMENTS(pc_compat_5_0);
@@ -348,6 +349,8 @@ GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled)
 {
     GSIState *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_new0(GSIState, 1);
     if (kvm_ioapic_in_kernel()) {
         kvm_pc_setup_irq_routing(pci_enabled);
-- 
2.21.3



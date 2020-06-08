Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5551F1CCA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:03:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKFd-0005xS-WA; Mon, 08 Jun 2020 16:03:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKFc-0005vx-F5
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:03:52 +0000
X-Inumbo-ID: a2574c78-a9a1-11ea-96fb-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a2574c78-a9a1-11ea-96fb-bc764e2007e4;
 Mon, 08 Jun 2020 16:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7kyMhVQ9HQhJiyo6QGAHK03lmBlbuIzucxY+SHtzpks=;
 b=gOYOLjUa3SErlNwXKlU2eDT1PAPgwl56xFbNvTRv1I+orIWRKljvuZIHlyKYUO3X8I+VnW
 ZH9iIDPjakh67DKxqGNUmOotSSVu2eamUItw4Apf3m72m65Vc7w3Eq2e63AJOejSWJQH8z
 a4rRuj2/dpj4UfSpz/DQndVeQ3ze48g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-VnuTzJqdMgCI7cGKIB3R5A-1; Mon, 08 Jun 2020 12:03:42 -0400
X-MC-Unique: VnuTzJqdMgCI7cGKIB3R5A-1
Received: by mail-wm1-f71.google.com with SMTP id r1so7252wmh.7
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7kyMhVQ9HQhJiyo6QGAHK03lmBlbuIzucxY+SHtzpks=;
 b=TkTYh/ov6JLnFrIv4kKTxAjg55WgTvOZR3/o6hBG36P8kT2BrskRYvt14WS3MSdDrO
 hPGHeXl4X0RSatxDFoax63UvBBhkk2Kw+yHf3dAagWwOI3o3uwj3pdg9L/E981hbnKsC
 XpAV9uT7UYlQyYrW3Mf8E2zQ1yrCgRVSLDLCiGhcs9f5yj3XnsmMl5sRDONx27YFn4hi
 cvtEN8R11Lwbzou00/9C61frIUXezVTanV+AN6SWZ+9aHjG6SCmigToG2oNXOlXVdqkI
 SyHpGk1hNqOPwICsS1z/L0URVXptXZnK2vt04ACjZqVi9ZD0mEIL/SKQere3kD0hQOCh
 1I1Q==
X-Gm-Message-State: AOAM530ezekEqph+KK957aLtZwbznHL8VNsvBvYdwP7LqzU0y+cRzAsj
 FD0918qH51tFHGpgqJlaWX97pQsV23S/8EU/yxZIPQS1UHwUaQ6ASMdZ+/YKyhaeAJxkoc4FBeM
 WpHm4uwcZ9MISeGQFZnqt5NxEQjE=
X-Received: by 2002:a5d:6087:: with SMTP id w7mr26621418wrt.158.1591632221506; 
 Mon, 08 Jun 2020 09:03:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEzYn7IfaprZ27/xV2VCZHXx76WBbSnolmOS6yBDnvZe3b82K5DvPVvnhVs7yLdMTrFxNPeQ==
X-Received: by 2002:a5d:6087:: with SMTP id w7mr26621373wrt.158.1591632221329; 
 Mon, 08 Jun 2020 09:03:41 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id o82sm8088wmo.40.2020.06.08.09.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 30/35] hw/ppc/virtex_ml507: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:39 +0200
Message-Id: <20200608160044.15531-31-philmd@redhat.com>
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
 hw/ppc/virtex_ml507.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 0dacfcd236..17b8036c38 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -40,7 +40,7 @@
 #include "qemu/log.h"
 #include "qemu/option.h"
 #include "exec/address-spaces.h"
-
+#include "hw/qdev-deprecated.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/ppc4xx.h"
 #include "hw/qdev-properties.h"
@@ -95,6 +95,8 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
     CPUPPCState *env;
     qemu_irq *irqs;
 
+    qdev_warn_deprecated_function_used();
+
     cpu = POWERPC_CPU(cpu_create(cpu_type));
     env = &cpu->env;
 
-- 
2.21.3



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D715B1F1CA0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:01:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKDV-0003uA-95; Mon, 08 Jun 2020 16:01:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKDT-0003tZ-Rs
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:01:39 +0000
X-Inumbo-ID: 56829686-a9a1-11ea-b292-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 56829686-a9a1-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 16:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ORhV1sd4nU6DWHF34s88hmmcxuNYxVDeCG6mbf27fE=;
 b=Q1JwZVZGzKEAPOC7Sd9FGrVIN4YJJcMxpNnvmirkMoTyjUIUUxlrNLedS/XD34fBWTPCr3
 ILftppu9HZSpfuuNpuNHHxGBElgspQXN7CuaqnxPTcCTo1P33heoGQHKJrSFaDn3wAbT8W
 RlBI3eUyf2aMlGKL4C4j4ZLXzcnDMt0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-OTBIR5U5MPCYVDLTTtN25g-1; Mon, 08 Jun 2020 12:01:34 -0400
X-MC-Unique: OTBIR5U5MPCYVDLTTtN25g-1
Received: by mail-wm1-f72.google.com with SMTP id b63so114817wme.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ORhV1sd4nU6DWHF34s88hmmcxuNYxVDeCG6mbf27fE=;
 b=hp+05fApLNqPLMRGLmXFW5P3MCCXJwqskl+jxtI8Yv6WHfOeTO8KtbqnVe4m7euSpa
 MFzgZ+5Q7HcDUL/jo4F05AN0S81ilAJd/+I9CZsvTc/wVXeE0ZAI6d5rYff9cDw56bd+
 J5ESDrtIuszdOR4Ja1qxQ6a6mKsKLfUGd7kkGVVg9dcVU/JXRgsv5rrMqOJSego0ovxW
 +oWSPEAU9xdyMi70wobPdoDSHNLsngx2sN26T7iMtYtWZk1nPUF1nMZUP3BKpTPhD02k
 ZJUE/MujIKsw1lP+QM8UQU2yHl6/xf/h8YPEOSE5xFBE7xe9fDZPxGDfHRdsbvebrBVP
 GkgQ==
X-Gm-Message-State: AOAM530KgS3E3QMqY0N5Z19trP7vLcmInabKHeaxCnnfaMrPpeT8+f/D
 485YXte0t44rQ5VVaz+Co6l1owiLlqTvKU/p+WcqxfPQiHD/MfiJcTG0wb+XIG27WNZjBk16Gf2
 ec+Vbie4dhaBs7AEtGLRDllvcRos=
X-Received: by 2002:a5d:6a4b:: with SMTP id t11mr23943725wrw.404.1591632092862; 
 Mon, 08 Jun 2020 09:01:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzX3WHm4bb0lVL0OqrCVvYAl9aSgd4/p4YzE7wN3r2SHFS1TTcIn2CmgHMd0vmMkRzt+4NE2w==
X-Received: by 2002:a5d:6a4b:: with SMTP id t11mr23943661wrw.404.1591632092491; 
 Mon, 08 Jun 2020 09:01:32 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id a3sm122524wrp.91.2020.06.08.09.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 08/35] hw/display/blizzard: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:17 +0200
Message-Id: <20200608160044.15531-9-philmd@redhat.com>
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
 hw/display/blizzard.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/display/blizzard.c b/hw/display/blizzard.c
index 105241577d..74557b152b 100644
--- a/hw/display/blizzard.c
+++ b/hw/display/blizzard.c
@@ -23,6 +23,7 @@
 #include "ui/console.h"
 #include "hw/display/blizzard.h"
 #include "ui/pixel_ops.h"
+#include "hw/qdev-deprecated.h"
 
 typedef void (*blizzard_fn_t)(uint8_t *, const uint8_t *, unsigned int);
 
@@ -1010,6 +1011,8 @@ void *s1d13745_init(qemu_irq gpio_int)
     BlizzardState *s = (BlizzardState *) g_malloc0(sizeof(*s));
     DisplaySurface *surface;
 
+    qdev_warn_deprecated_function_used();
+
     s->fb = g_malloc(0x180000);
 
     s->con = graphic_console_init(NULL, 0, &blizzard_ops, s);
-- 
2.21.3



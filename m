Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B549B1F1CC8
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:03:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKFU-0005m6-3K; Mon, 08 Jun 2020 16:03:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKFS-0005kP-Ez
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:03:42 +0000
X-Inumbo-ID: 9e35e168-a9a1-11ea-ba62-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9e35e168-a9a1-11ea-ba62-bc764e2007e4;
 Mon, 08 Jun 2020 16:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tavsnBMcjbLYqmKTQpJNbu5aW+OtaIuHgP5ZHfhD4y8=;
 b=V17EZvJ3O7UxkcIA4fwzWYf9sJDK7VD+RfGPMVHLoZ8FSRb3hk03dw3fsGSn43W/OTRdBP
 ZiiwA8GsXkDXvBMMotZyBfsmui2P8OvpQpGWow4BZiEvIKq0GDMocZU1V6mPlUnEDx6iNS
 hvt9SekaXRxiQx0KOT9IH53HK1wYCVo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-PlDlpjQIPDGie0lUBoo4gw-1; Mon, 08 Jun 2020 12:03:38 -0400
X-MC-Unique: PlDlpjQIPDGie0lUBoo4gw-1
Received: by mail-wr1-f71.google.com with SMTP id p9so7363845wrx.10
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tavsnBMcjbLYqmKTQpJNbu5aW+OtaIuHgP5ZHfhD4y8=;
 b=Jy4Kk8CgNC7mimeVHr/brQUZCAMimXSh1bGYOjBPPsbrT4CpJsyWV4CRB2NPw/L/Jv
 0rBb5sVnwWOBEgWoA5W3rTN2oR5C/MhWLsyz/9vTM3px3/RvmTIxpzNzGGNvPzqY/GnH
 V1hkq7TKLaV7xMMag7YnE9Ij15NR2Gp6ehpdir3UsQhEF4bZyOHbQ3COfjMFjmqyKnGR
 rm/4l11x9I22IeDJoE0GeF21aQdMVzGyt1z1CtDoYUYRBcV390TQGDWBJz3Wg4ov21KM
 cFEdonXAhNyjVyDBLcw9Hfkzevz3N2AsJuLUftYgjy6xODchtjlJ7OrJagvR8/JlpxuM
 A5yA==
X-Gm-Message-State: AOAM533tfE4QckauYIjng4q6ibINxet6VNyO820NbOEUeaSU3ougkVWL
 /8g0ZlgKsBTIcjYMT1+2MOVQPVaIiAfwd6ZwepHX5F5P2pRAgCR8qUCeEpeYO2oK0mupabfoSnu
 nVZibqDL7/vwQWAUspQBaVPWBNJs=
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr73319wmj.118.1591632216884;
 Mon, 08 Jun 2020 09:03:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1E2OUT8wjgYne61y8m5ATBeXEAgbFH/vhvj6PwSHzmhBdaDf8vJ9I14Vkb0SP4ZL7hYVwYg==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr73214wmj.118.1591632215737;
 Mon, 08 Jun 2020 09:03:35 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id l17sm200565wrq.17.2020.06.08.09.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 29/35] hw/ppc/ppc_booke: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:38 +0200
Message-Id: <20200608160044.15531-30-philmd@redhat.com>
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
 hw/ppc/ppc_booke.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
index 652a21b806..a9e5e68578 100644
--- a/hw/ppc/ppc_booke.c
+++ b/hw/ppc/ppc_booke.c
@@ -31,7 +31,7 @@
 #include "qemu/log.h"
 #include "hw/loader.h"
 #include "kvm_ppc.h"
-
+#include "hw/qdev-deprecated.h"
 
 /* Timer Control Register */
 
@@ -338,6 +338,8 @@ void ppc_booke_timers_init(PowerPCCPU *cpu, uint32_t freq, uint32_t flags)
     booke_timer_t *booke_timer;
     int ret = 0;
 
+    qdev_warn_deprecated_function_used();
+
     tb_env      = g_malloc0(sizeof(ppc_tb_t));
     booke_timer = g_malloc0(sizeof(booke_timer_t));
 
-- 
2.21.3



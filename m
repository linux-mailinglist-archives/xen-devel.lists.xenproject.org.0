Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCD01F1CA6
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKDs-0004B7-Ra; Mon, 08 Jun 2020 16:02:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKDr-0004AK-Ku
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:02:03 +0000
X-Inumbo-ID: 648e11a6-a9a1-11ea-b292-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 648e11a6-a9a1-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 16:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JPFQ0bX3Ul9NeHHcjGis7Hob0YUuGxD/aHEXimgfPe0=;
 b=SNg3Vw1wOv3e531S7bQvEPa0ySxt/QmIxqGPmHm/U1zxU1WjNFWluxou2WsblLYn2lyaBM
 tWW3Vjg0Ms+1vtmiSD1HfOBfIBEXNjXKjrV04oUxlAqtQaMwUvew9W0ltKOY5mwQYPF0DX
 w8mMKJPlge1H2E7RMOkn/Rn4IoSse68=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-l8Bl9tn2MCqI9ozdZXHAHQ-1; Mon, 08 Jun 2020 12:01:16 -0400
X-MC-Unique: l8Bl9tn2MCqI9ozdZXHAHQ-1
Received: by mail-wr1-f71.google.com with SMTP id c14so7301677wrw.11
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JPFQ0bX3Ul9NeHHcjGis7Hob0YUuGxD/aHEXimgfPe0=;
 b=JHuZ41yMKsrE7iToceMc9W8Sx1VA4Yhzp7GST67+JuTT8b8fg8j9SQCH5R54zbcgO4
 Yi9M9QzQVmMfXkpGK9iJP4I4Hc8u0HgtKRsVJtJN2GjmwTUgpIcug4W8K9srpmwgRBkn
 LwWvbRnBa5CC/oMxWE2YqjslQTCnLl+p18pP5Fp85kppjVgVf8n1TkR020pfKbLgI/cF
 RZXNx6T35Uvh8qFSv200cBLYpb/7mnG9Br1jDQy0KqvdO8Ql4P6v9cgCtV0AECdjZVwz
 6lvcqKIJRcUxtCxuLZIGVFd35feupXj6/B+SmKjVkeFj8hHACK0GUoackEOjycuip20K
 1PWQ==
X-Gm-Message-State: AOAM5322JTqBec5Ssuo3B6IIWMS1HWbMWe4JvSYL0N5058hZnPhV8Zju
 eCh/yXIM0J1WOPkpA3oFd9o6FEnjYLKF3rYVliznpULAPj+hzeh2pza0dhsABPSS6kBYTW+sEpI
 9yyKQpB8+itw4giaEg//xfC5l5oQ=
X-Received: by 2002:a1c:63c2:: with SMTP id x185mr71332wmb.68.1591632075683;
 Mon, 08 Jun 2020 09:01:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHSTbXCqkGc9kOsbxhlXHtghZhPx9xWZVb7ZeU/GWo7Q7cDZTZJUQ93U+AAUtsWNU3dUVBvg==
X-Received: by 2002:a1c:63c2:: with SMTP id x185mr71295wmb.68.1591632075484;
 Mon, 08 Jun 2020 09:01:15 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id h12sm145322wro.80.2020.06.08.09.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 05/35] hw/arm/nseries: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:14 +0200
Message-Id: <20200608160044.15531-6-philmd@redhat.com>
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
 hw/arm/nseries.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index eae800b5c1..bd0c3f39a9 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -44,6 +44,7 @@
 #include "hw/sysbus.h"
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
+#include "hw/qdev-deprecated.h"
 
 /* Nokia N8x0 support */
 struct n800_s {
@@ -703,6 +704,7 @@ static void *mipid_init(void)
 {
     struct mipid_s *s = (struct mipid_s *) g_malloc0(sizeof(*s));
 
+    qdev_warn_deprecated_function_used();
     s->id = 0x838f03;
     mipid_reset(s);
 
-- 
2.21.3



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9446A1F1CB6
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKEO-0004cB-TY; Mon, 08 Jun 2020 16:02:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKEN-0004bV-Q1
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:02:35 +0000
X-Inumbo-ID: 779caeec-a9a1-11ea-b292-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 779caeec-a9a1-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 16:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WCNM8bx54yBBH5o9OGeaVnQ5KO/kQFXlsHgIbovX6w0=;
 b=OSP+kVLeIhqukfrvtEtsMVywZKXWRhzo95azkYUBDgNofS3KrnVOoAXpLsyuTz8agIcqca
 tnYw9n8/ecymqMUxmKxAusqsuDLbO48qqHTHv9nKxR24C9fz7kCPl0e2jTufYah1EzE/8d
 CZ6q7kEbbAuXPx+i6dq1kLaPIOTc94k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-GZscxDwhPtCzJ98VSVFCMA-1; Mon, 08 Jun 2020 12:02:31 -0400
X-MC-Unique: GZscxDwhPtCzJ98VSVFCMA-1
Received: by mail-wr1-f71.google.com with SMTP id s7so7360667wrm.16
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WCNM8bx54yBBH5o9OGeaVnQ5KO/kQFXlsHgIbovX6w0=;
 b=hnLe+SOYxOxkTQo0lF9i5hc+8NxIWDUbFPvmYCEo+yWUE9C9Bvvim1dr2XzMXGsS6w
 IH7wrB2sjvfsnsXjBMqmu2lRb9SNzgP6kvfHCVVfX8EKksJkUUrjh0yLGMmDPZUSEqax
 YW4f+Y7zErVvKTzGjXAiYuWCyVAR19uzTS5IoStZcu6jD47DHoPmDaBPEBWWI13UtI5r
 qX1jMAVQWoKXDxHgQNe/6zYlY1bgB7EwyD4PTgsvwr/pJIJSjt2ukK7kPfHL9p7wppml
 AHt1nnFj2lznfOyb/er63MDDUICxGFoGvvwYYh+ckosPPpy0m0xhoSvRBNNOJuHHBsQP
 LGcQ==
X-Gm-Message-State: AOAM530JkTwFrCHihvtkDTqp74LkzlgtPJkG6sVPpCGZ4U0aIEYe9SEd
 xpbnArGoFaU0BYDfg0k0imHnoX4NZuU1wYj9A1+BMqRA8eIjn1hBSvCB2VFIiuwKN8TKaxQw5/Z
 q0ghoWHIbe/85TYfOiO9pQ3pM2q8=
X-Received: by 2002:adf:e592:: with SMTP id l18mr25927551wrm.175.1591632150057; 
 Mon, 08 Jun 2020 09:02:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHbdh31UUEH4xek22DEL2omJfknmcGPt3J3CvVWH4WiiSsovdS3jiUsnUw+9yn+Qkjdrssug==
X-Received: by 2002:adf:e592:: with SMTP id l18mr25927507wrm.175.1591632149848; 
 Mon, 08 Jun 2020 09:02:29 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id c6sm144638wro.92.2020.06.08.09.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 18/35] hw/input/ps2: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:27 +0200
Message-Id: <20200608160044.15531-19-philmd@redhat.com>
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
 hw/input/ps2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index f8746d2f52..0d84061cae 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -30,7 +30,7 @@
 #include "ui/input.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
-
+#include "hw/qdev-deprecated.h"
 #include "trace.h"
 
 /* debug PC keyboard */
@@ -1136,6 +1136,8 @@ void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
 {
     PS2KbdState *s = (PS2KbdState *)g_malloc0(sizeof(PS2KbdState));
 
+    qdev_warn_deprecated_function_used();
+
     trace_ps2_kbd_init(s);
     s->common.update_irq = update_irq;
     s->common.update_arg = update_arg;
@@ -1158,6 +1160,8 @@ void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
 {
     PS2MouseState *s = (PS2MouseState *)g_malloc0(sizeof(PS2MouseState));
 
+    qdev_warn_deprecated_function_used();
+
     trace_ps2_mouse_init(s);
     s->common.update_irq = update_irq;
     s->common.update_arg = update_arg;
-- 
2.21.3



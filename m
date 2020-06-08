Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0D51F1CC4
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:03:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKF4-0005Jt-Np; Mon, 08 Jun 2020 16:03:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKF3-0005IM-DX
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:03:17 +0000
X-Inumbo-ID: 8e7f317a-a9a1-11ea-ba62-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8e7f317a-a9a1-11ea-ba62-bc764e2007e4;
 Mon, 08 Jun 2020 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bGDaAMWSjpprqA7Io3dm7QCtlFgafERZCyah8ISMES0=;
 b=bf5ZFLPDxjE6uiQntaPwYH/JDEJnO2OnpzJmRieVnXA5g817BBjWqKROH+Ubd6CUCgp6eC
 u3T0y4xfwQmFNhEmDf4Jf0uyNvwIgZEtAMvNzLRfBi5UDLrMJbjmSMsnHUHCdCpI+WzQ/Q
 nOeO5+ilEZkg0lXck7CJioQbHk450e4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-FNu1G7uOMlustuBoYjh4jw-1; Mon, 08 Jun 2020 12:03:01 -0400
X-MC-Unique: FNu1G7uOMlustuBoYjh4jw-1
Received: by mail-wm1-f72.google.com with SMTP id p24so13297wmc.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bGDaAMWSjpprqA7Io3dm7QCtlFgafERZCyah8ISMES0=;
 b=WN4tTUjx3+znpykV0GE1TdKbx9Vv8DDNOxFATeiC76gTTHMa04A7vWbDD8z+pIwkKP
 VeZzgZss1XJe55yCaqtojpIxUHV48+40x+q0r57lIC52B2BGvPYgpClwYh+x8uEi2b31
 4LEfA7+yHH+JgH+N2oknKc5zZFJ3ehQbhiH89PH1zaKFi+R8dWVS1DOnGY7RpROPs0mq
 W6nWhY9doD1MyCsElMZ2H3eeXYWNeoaev0K0we6FOal6Bm/G7tPGLlurH5aQLnb2vzFa
 V4jQWHKuEYyS7RnmVQ6EjLcXBOwiziKUxhWL/uzGzaSd8AwObwHkW/n0aWXoJfUSUecJ
 jvLQ==
X-Gm-Message-State: AOAM532W2gcluKOrr4i5SktTsJXREo/FfYxpfYzkZdF4NPrRcVKcaFO4
 DxXXysy7VrA0w/aL82bN004FcvTFg3XW2bq7TIydy7H7pFHbv6S0+zKO9XezBKwSCd3BNnono8C
 Cc/g0qxKChT4smewRfD1qsKjFYfo=
X-Received: by 2002:a7b:c201:: with SMTP id x1mr78869wmi.58.1591632180064;
 Mon, 08 Jun 2020 09:03:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF5+TIjMo5Pv/JZUc9oRpRqa5yr/ufMOXB39AL2QL+RAu+P6Qy6euM0Zs2QNe7FGM5NNcPJw==
X-Received: by 2002:a7b:c201:: with SMTP id x1mr78842wmi.58.1591632179907;
 Mon, 08 Jun 2020 09:02:59 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id q1sm34631wmc.12.2020.06.08.09.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 23/35] hw/misc/applesmc: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:32 +0200
Message-Id: <20200608160044.15531-24-philmd@redhat.com>
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
 hw/misc/applesmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 1c4addb201..d63f19038d 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -36,6 +36,7 @@
 #include "ui/console.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
+#include "hw/qdev-deprecated.h"
 
 /* #define DEBUG_SMC */
 
@@ -253,6 +254,8 @@ static void applesmc_add_key(AppleSMCState *s, const char *key,
 {
     struct AppleSMCData *def;
 
+    qdev_warn_deprecated_function_used();
+
     def = g_malloc0(sizeof(struct AppleSMCData));
     def->key = key;
     def->len = len;
-- 
2.21.3



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D929D1F1CB9
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKEY-0004lQ-IR; Mon, 08 Jun 2020 16:02:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKEW-0004k4-Uc
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:02:44 +0000
X-Inumbo-ID: 7d4f0fb0-a9a1-11ea-b292-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7d4f0fb0-a9a1-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 16:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Lcxf8cj+CxLJSf8aQEjLTWyUhOWt7SwLOi9PO4gCM4=;
 b=Ws7dibcH76dLE0IMqS9G+8PrYyLzxFdL2Mzcp1ynzfIPrCCD17/vI0ZiXSlye+Fu7X5+s/
 vHIAfOR4oZQttPgKRoU5jrIaHrUT5x2AsTSubzvkPxcWvv57+AeOE7/wcx3Aql78BIuH0a
 G9Rkc28mHLaJIqQ/9FqHVs4eFodQM0o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-yQDt05YoPFm1mWxhzHE84Q-1; Mon, 08 Jun 2020 12:02:42 -0400
X-MC-Unique: yQDt05YoPFm1mWxhzHE84Q-1
Received: by mail-wr1-f70.google.com with SMTP id w4so7365688wrl.13
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Lcxf8cj+CxLJSf8aQEjLTWyUhOWt7SwLOi9PO4gCM4=;
 b=ZlwjrFd6WBtEioLlIXCiMa8E8t4grs9ACbMWwj1xUqPQckvMsdB3A1FPoEGmT+qkE3
 Y0HQi8L+d1XvvpBVXXbnaOtSAL9k+R3G9Vq0ZandharXTk7V9EstjybEQDt5+3ToBUK3
 xd+sVQZPG1iQtQ4AX7q0uPW7QmXF7ciSlbrJzIrKB8cUHrVkoiCHOGgmxgVzhzQstmPJ
 CAiRNIiurrQ24WBFHgQvWGY8kdsavlw8zw7wylmUnpLGw6rYBLIK48Op1GU9P3zX31yz
 tLtWfrKs/3ZmaWKFmzdxy3FjN2QgjPSGKMlFX4zGBMJb/rBtRWi68mQxBYVJ+FYav2nI
 /TqQ==
X-Gm-Message-State: AOAM530CyrDZGJI/U59Yjmu2qg1Zcz9G9/0tFL+J/uIHwsERuTeeFFUg
 LDNNbGoHGLd0TfDqrTPpDWnUv0PKyNZyBXHqCvHpsQAl35Efcqk/rS1wnKRCCngi5ENTfx+DiqM
 pzJiEo0jj6WjYiChPvTqx+KYglhY=
X-Received: by 2002:a1c:6056:: with SMTP id u83mr60177wmb.138.1591632161698;
 Mon, 08 Jun 2020 09:02:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztIcOuKmMAnKpEQL/s7NO4XNCQYfWj4X6mQCPh85ejUPn/olQa6U5W1zctaCPlsras+JjNJA==
X-Received: by 2002:a1c:6056:: with SMTP id u83mr60154wmb.138.1591632161497;
 Mon, 08 Jun 2020 09:02:41 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id a81sm19165wmd.25.2020.06.08.09.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 20/35] hw/intc/i8259: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:29 +0200
Message-Id: <20200608160044.15531-21-philmd@redhat.com>
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
 hw/intc/i8259.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 51b27f6a34..9d9609cdab 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -30,6 +30,7 @@
 #include "qemu/log.h"
 #include "hw/isa/i8259_internal.h"
 #include "trace.h"
+#include "hw/qdev-deprecated.h"
 
 /* debug PIC */
 //#define DEBUG_PIC
@@ -414,6 +415,8 @@ qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq)
     ISADevice *isadev;
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     irq_set = g_new0(qemu_irq, ISA_NUM_IRQS);
 
     isadev = i8259_init_chip(TYPE_I8259, bus, true);
-- 
2.21.3



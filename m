Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481701F1CAB
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKED-0004Rx-8P; Mon, 08 Jun 2020 16:02:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKEB-0004QC-JK
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:02:23 +0000
X-Inumbo-ID: 7024f99e-a9a1-11ea-b292-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7024f99e-a9a1-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 16:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5ly0fcUXOf9qpye/9fR2nyQtN4aqsUxjucs8EhlOCo=;
 b=KBOaR8c99ngR+4aSR2mkH8Ans4ohxU2RPgBRcCKZTDAYWmyysiiD5hGFI6WmNGjVa7LuhX
 SrVgOdLxrxmgL0WX53kcWbiK3FSjtv2rI8fb46zRMGrAicZ4rqkdC1J8eqJ1fP6kr5N6tq
 H02FyPwXqfmkbJ9LKFGWhCNf3AaQeEU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-d3P1SnCsPEq1qVUXQBOo_Q-1; Mon, 08 Jun 2020 12:02:19 -0400
X-MC-Unique: d3P1SnCsPEq1qVUXQBOo_Q-1
Received: by mail-wm1-f70.google.com with SMTP id 11so5433wmj.6
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g5ly0fcUXOf9qpye/9fR2nyQtN4aqsUxjucs8EhlOCo=;
 b=g6gVJQKedbDJsMwTsWhKbJp9dBEHDP1/L0uzgklOZUQjRbvRnerwTlDb4AVjD5mpot
 1QDY84l0y/T/TAgHTWDXZYYRY6qaIPB3ZpDehaiW67c8VouPySdVYs7etD3n0kUUzAEW
 SFfDp/1MWO0nEqw66nMzg4rBnGT4ZgfQi1bp9wy7dmWWgyqPEy6qKTBR7Ord30cqlLBt
 sK7YNdNeUGs6PCr1epeed6AHcATq6NlM62pb2HAuNl92TfiL0xIpRHDEmik2MKi9ZtJR
 AYrOgRrJTYfkrJh+4sK1EgEzB13oMWD2fXlemFzSSa3WyGX3jNsOPbIc3uUhyGU6cLX7
 ZwAA==
X-Gm-Message-State: AOAM530i6tVRSAmGVzQ0dU6Eb2IX2t01ACYlQNSd2SQtQDAPYEF19VM0
 htFij+yo5AXpxhvVat8FGD3rLyKpxYB3qC/k7gGt7erynmwy7Oxgcow/1soKdn3Gjx2aF9bz/1F
 p1X7WSm/f2Hvnez/Il8Te9J3a5e4=
X-Received: by 2002:a5d:6944:: with SMTP id r4mr23775348wrw.169.1591632138152; 
 Mon, 08 Jun 2020 09:02:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoiY9HH6DYEAYHN6rucdTjohElJ6XD9T5NIDyn78LYZQIrFIp9Ryvcx8eKgENNoeOnl+u4SA==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr23775315wrw.169.1591632137954; 
 Mon, 08 Jun 2020 09:02:17 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id u130sm12527wmg.32.2020.06.08.09.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 16/35] hw/input/lasips2: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:25 +0200
Message-Id: <20200608160044.15531-17-philmd@redhat.com>
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
 hw/input/lasips2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 0786e57338..452244f037 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -34,7 +34,7 @@
 #include "exec/address-spaces.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
-
+#include "hw/qdev-deprecated.h"
 
 struct LASIPS2State;
 typedef struct LASIPS2Port {
@@ -269,6 +269,8 @@ void lasips2_init(MemoryRegion *address_space,
 {
     LASIPS2State *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_malloc0(sizeof(LASIPS2State));
 
     s->irq = irq;
-- 
2.21.3



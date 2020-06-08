Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7231F1CCC
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:04:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKFn-00069T-OO; Mon, 08 Jun 2020 16:04:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKFm-00068G-Ev
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:04:02 +0000
X-Inumbo-ID: ab6aabf2-a9a1-11ea-9b55-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ab6aabf2-a9a1-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sNDlXKA4V05uqH+zGvitoUZAatp4aCkSuEKALsyTQs8=;
 b=HeNN6HG5dljzfXf/kdzP3t/U03v9VOeBlblCjxWuB5446GIloDHATjcejtpXQCBF+bDw0T
 QUMxrCUiGI9Rz4E90V5KsdXtIc4cB8ABIOwpfG1LU/lTjMgMUGn6AsGGwL1KwkgddeEyc/
 gsdBDli7PxrmFElX/F0nAsxDF26plaw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-ofcue9yWOEm4LAYDKBOMtg-1; Mon, 08 Jun 2020 12:04:00 -0400
X-MC-Unique: ofcue9yWOEm4LAYDKBOMtg-1
Received: by mail-wm1-f72.google.com with SMTP id b65so9756wmb.5
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sNDlXKA4V05uqH+zGvitoUZAatp4aCkSuEKALsyTQs8=;
 b=jT+FjKSGh+q5szLO8epm+D38uY8F5oDJfCyjdLd9nT5Rkh1vNKSQdAZj5UZOieIQkf
 4L27qTrkZwTM0GaoKydz3uflvhqNUNzJPfbjHOP+OWecO4AaQlbT3wMMIY1AC66XAznB
 D+jzNTz5ZAHTK35rPVbaMALLE0JsfbOdWIYpseIapCOzFptk3VAVM4A9WWFjHxWYHI41
 eZdWyHcqgEfZXANPWwtxPVRXwvhGSjKSNWAAa5Ypep1cTUFer1iDPFOe8kmN3pEa3T2x
 e4sC/HgoA4y4/xDLJzeQlkbzvmEoLaqLJ6UnxKh5NYq/9bUgDgFIdxNYN4NcT39Lwpj6
 FovQ==
X-Gm-Message-State: AOAM532ytmqRfe8xM+pGMfdaKBQsRIhIdq3AUjL9Ng/bt3eVMjPY4kWG
 o3PtGJixp+w/g9VR+zBtcoDLyKYCMLdcG/tnk/iY5wQnos41YP2ns3yGLMgIQcLbuPqnHgYpnhj
 nrQZYdRQmo8P+K4Yrb7NpKc4JABk=
X-Received: by 2002:a1c:2082:: with SMTP id g124mr55782wmg.21.1591632239007;
 Mon, 08 Jun 2020 09:03:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6Ea3200SCtYHheH/UK2Mas0Wr6/SnNtzGrclQZuKXFOcXxL+qpSERI07OhtEH9rZ1aPQhvQ==
X-Received: by 2002:a1c:2082:: with SMTP id g124mr55753wmg.21.1591632238819;
 Mon, 08 Jun 2020 09:03:58 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id h188sm48452wmh.2.2020.06.08.09.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 33/35] hw/timer/slavio_timer: Emit warning when old code
 is used
Date: Mon,  8 Jun 2020 18:00:42 +0200
Message-Id: <20200608160044.15531-34-philmd@redhat.com>
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
 hw/timer/slavio_timer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
index 4c5d65e391..16f21669bf 100644
--- a/hw/timer/slavio_timer.c
+++ b/hw/timer/slavio_timer.c
@@ -31,6 +31,7 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 #include "qemu/module.h"
+#include "hw/qdev-deprecated.h"
 
 /*
  * Registers of hardware timer in sun4m.
@@ -392,6 +393,8 @@ static void slavio_timer_init(Object *obj)
     unsigned int i;
     TimerContext *tc;
 
+    qdev_warn_deprecated_function_used();
+
     for (i = 0; i <= MAX_CPUS; i++) {
         uint64_t size;
         char timer_name[20];
-- 
2.21.3



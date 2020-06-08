Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2081F1CA9
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKE6-0004LE-PN; Mon, 08 Jun 2020 16:02:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKE5-0004KX-SX
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:02:17 +0000
X-Inumbo-ID: 6d2883b4-a9a1-11ea-ba62-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6d2883b4-a9a1-11ea-ba62-bc764e2007e4;
 Mon, 08 Jun 2020 16:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8wt5v6YHTpbkeCWEGxoSB2Z3fXavqt1TINJtdAbbd4=;
 b=aak3k5D4JTv8Lv6hKugg4G7t/BpA15BHN2BinvRC/iH0mVeGu1ZejYV9OvQMViWzkKoIJ3
 HfPoFl6ZveSFq+xAGA6vxXzpFJslmOeZta8VlT7Hmjm1RAumeMELv+BS+CKemMEGYO1tyH
 fRF4QSOpl+I874nRGaNmUThWSuFMp4s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-AzA8WRaAPRCQsiKYcq9jsg-1; Mon, 08 Jun 2020 12:02:01 -0400
X-MC-Unique: AzA8WRaAPRCQsiKYcq9jsg-1
Received: by mail-wr1-f72.google.com with SMTP id w4so7364837wrl.13
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y8wt5v6YHTpbkeCWEGxoSB2Z3fXavqt1TINJtdAbbd4=;
 b=gL7ulGox1L49gfmfCPlaMDVyVuPBaqt51gZQjs1Ya3sqMNUIp1O5fZEnCssvyev9CZ
 OgJLUfbIp2dc7geWOr813p1vgF6n6blrw4rEt6UW4i1LnBjMkZS+7wgVrZ6jeLwY5O74
 YKMjgjJFnDPrDEFaeMX+92e2nq0JZGH1NSclK64HYP6B5YFxBnFKBxK++bLbbLFfr2Nn
 MDsNUL3fY7D1MaKKtHvEsJKHwSshVXIajOaEvHij4jZyZpvYGmCpJ1+0g/swgi0av5Mz
 Jnr6NlXcubLYsCo9BwkYcCXMPLs6qyEo6iBgoenqy+V1fRrHH1vZg4/JmMP8KSdlCLjZ
 acNg==
X-Gm-Message-State: AOAM530M3rKvvOi4W3LtmGP5HUURS3lNaao7L1GiuNKR8vJn59uIImwM
 H0BEgBBMpka4hGuKPKG6rpAy2N44CwkIjzJbeO3sIfYDmrYw8AyTdNRsac8cUUuxWZDirUTfNlX
 4Xag1RSE2ecsplr8ag0FIoS+Sf54=
X-Received: by 2002:a1c:49c1:: with SMTP id w184mr73364wma.46.1591632120643;
 Mon, 08 Jun 2020 09:02:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOUfdYxrvW9CPb/dnvfewyhVs9Qx2I/bhjoR6HiKlxToMKENTue7cOTAycSFeLnlY6TznpXw==
X-Received: by 2002:a1c:49c1:: with SMTP id w184mr73337wma.46.1591632120442;
 Mon, 08 Jun 2020 09:02:00 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id j11sm154169wru.69.2020.06.08.09.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 13/35] hw/dma/soc_dma: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:22 +0200
Message-Id: <20200608160044.15531-14-philmd@redhat.com>
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
 hw/dma/soc_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/dma/soc_dma.c b/hw/dma/soc_dma.c
index 3a430057f5..22fd8c38b0 100644
--- a/hw/dma/soc_dma.c
+++ b/hw/dma/soc_dma.c
@@ -21,6 +21,7 @@
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
 #include "hw/arm/soc_dma.h"
+#include "hw/qdev-deprecated.h"
 
 static void transfer_mem2mem(struct soc_dma_ch_s *ch)
 {
@@ -242,6 +243,8 @@ struct soc_dma_s *soc_dma_init(int n)
     int i;
     struct dma_s *s = g_malloc0(sizeof(*s) + n * sizeof(*s->ch));
 
+    qdev_warn_deprecated_function_used();
+
     s->chnum = n;
     s->soc.ch = s->ch;
     for (i = 0; i < n; i ++) {
-- 
2.21.3



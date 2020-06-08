Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 727A51F1CC3
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:03:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKF3-0005Hr-9M; Mon, 08 Jun 2020 16:03:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKF2-0005HC-CC
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:03:16 +0000
X-Inumbo-ID: 8ffd052c-a9a1-11ea-b292-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8ffd052c-a9a1-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 16:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R7tSIIx0YAEULmCHrXDbhmRzYLD86lXGUTjUWu9J2Gg=;
 b=VRyUzNKCax0fgLHPHa6Sl8EK0azfGKyeK/3k3ypgafC8JYydnbQGURXZ+NxYZYTfQya6s/
 rnFFZwrcD2OPdGVmTQe9mHptycE06lDild6kQyDhGmjfXiPb+03lyEdEJIE+QikKO3xs4N
 kcEXM1mcDknwPypIReRTuy01412vReQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-QycDscOCMo2qBiQCyUGsJA-1; Mon, 08 Jun 2020 12:03:14 -0400
X-MC-Unique: QycDscOCMo2qBiQCyUGsJA-1
Received: by mail-wr1-f69.google.com with SMTP id f4so7350465wrp.21
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7tSIIx0YAEULmCHrXDbhmRzYLD86lXGUTjUWu9J2Gg=;
 b=jXl7ai4CZ/JwVk80EK3Nh94bj8X/xhOK67q2lyWXyiAVkMdqtA7EuEvEN4gHEGZT3Q
 DKgSPm/49WHvpb6oqoGqixMGiZ9z4C/A28N8vbIGLkTXDB5jx6dfBEdw1y25NyoRlmWs
 zivDtj/HK9p9cgBqAfA9FdRkc5SfSp3+QR0UB8AepSUxssGJD9OInB4tDAHWFWakLPSa
 LRwUbL9oWDACpnQLb3CHCuDV/TqQBQsP/Sr7zUcCA9lJHFCLb+Bt0kwlVqH+C7qwsHSt
 FqnhgAjCg9yytH9wBGKG8gYqqlm+4jOacNviOI8R0mlJUhTy+K/vEUlNi2ApyOzimdch
 ihqw==
X-Gm-Message-State: AOAM533zlA/eC66iVf0VAESChl767CBi7Eylf+S1tr/bQhdjSodZN5ar
 etCxfNFRs7s+QLEuiuEZHqsEMu/zjqCv09C7ADkSVklx0ACHrwqrC4Pznj+yPvFW4bvwBnd2yXj
 79vzWl2/xVflUxRjyIkM7R28aZ0M=
X-Received: by 2002:a05:6000:10cf:: with SMTP id
 b15mr23742582wrx.214.1591632191245; 
 Mon, 08 Jun 2020 09:03:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiLyN7q/sPm3H+0NWOb+JiZp0uyhOR/YmqM2AxV/YlDV1PyuM240OziAWJ+tx+PgKwy933zg==
X-Received: by 2002:a05:6000:10cf:: with SMTP id
 b15mr23742535wrx.214.1591632190993; 
 Mon, 08 Jun 2020 09:03:10 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id e15sm39541wme.9.2020.06.08.09.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 25/35] hw/nvram/eeprom93xx: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:34 +0200
Message-Id: <20200608160044.15531-26-philmd@redhat.com>
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
 hw/nvram/eeprom93xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/nvram/eeprom93xx.c b/hw/nvram/eeprom93xx.c
index ca6f591c84..56603ea42b 100644
--- a/hw/nvram/eeprom93xx.c
+++ b/hw/nvram/eeprom93xx.c
@@ -39,6 +39,7 @@
 #include "hw/nvram/eeprom93xx.h"
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
+#include "hw/qdev-deprecated.h"
 
 /* Debug EEPROM emulation. */
 //~ #define DEBUG_EEPROM
@@ -300,6 +301,8 @@ eeprom_t *eeprom93xx_new(DeviceState *dev, uint16_t nwords)
     eeprom_t *eeprom;
     uint8_t addrbits;
 
+    qdev_warn_deprecated_function_used();
+
     switch (nwords) {
     case 16:
     case 64:
-- 
2.21.3



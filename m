Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDBA214685
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:50:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjUK-0003F0-57; Sat, 04 Jul 2020 14:49:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjUI-0003ES-OV
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:49:54 +0000
X-Inumbo-ID: 9cb3dfd4-be05-11ea-8496-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cb3dfd4-be05-11ea-8496-bc764e2007e4;
 Sat, 04 Jul 2020 14:49:50 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f18so27701613wrs.0
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1LONYHTd7jeNrmu8RfEJNRKaqa+4/OTfMiA08MmDC4w=;
 b=LCSMbVvH8N0ZbcZUYZvlwl0/LtuSzor2alX6qtutU+9ODMj8+C2lynOKjaqj8fXnEI
 Up7WQjLdb8bh14eYdbzmWq0pniHymCkqwLxs7uZhzz+SQeCK8ybk5MN0Zyhj8Eee+SQj
 wRrntXxiS8ThEJ3VSHHvZJ08OGnA1vj0opel3/dZthPvXbGAIhhQVqi63UTc46zKMF8g
 WrVDYhnL59CSHsALtHCZR8uG2+fDNJPpG55w+1h1DIiM4zmD5wiPD6EKOmnxiehzG+GO
 tiIAW62Y9YFjeqMNBorgEysK6Wv7zhm124e0UVH2qXSktIEDr+5rtVe5ZIRMCgW9yetf
 3gAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1LONYHTd7jeNrmu8RfEJNRKaqa+4/OTfMiA08MmDC4w=;
 b=rvpxhDr4dbszXwU+bgnQmd5GzmoFtIfpYWbDOK8hKp/T9nX0bqBZIovWjqN6Vu1uwT
 8hAoaFi3tDWktCu5kzDTUt/aDT+E+bvdQalU9BSby6de/IARYlSaBleLx3C9OICkW+ju
 R4GrEiIqoZA3lCxAEEYgtQSOWSKqUkN6SajSVgRrwga+tluhXsQaBhYbRicJurxjpDwN
 R4cyotqNZEhc5WPY+z9hTct3owW6AXLZwNjRWmBmzT+lcXQQj7rsepuFn9O3lfX9BoLN
 V1+m5XzXd0OAFifHzFnhXd0mS+OBz7Lvh2GlOHBCAvcJtjEXir2C4MqhOzESVat0wYfv
 E1tw==
X-Gm-Message-State: AOAM53120zcCvWEDdWObFzL/2hklERl8Mzf14khsrYnYOnHnz1OKr3AR
 +SXNaHGUPr7FX+4jU/pteVc=
X-Google-Smtp-Source: ABdhPJyhL9pSuntp8VeiIjIT6N9OP48blUH4lL3NMOGJ+4E4luyAkGU/9nzb7bgsn2yWXLxxbe616w==
X-Received: by 2002:adf:f54b:: with SMTP id j11mr41454017wrp.206.1593874189885; 
 Sat, 04 Jul 2020 07:49:49 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:49:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 01/26] hw/arm/sbsa-ref: Remove unused 'hw/usb.h' header
Date: Sat,  4 Jul 2020 16:49:18 +0200
Message-Id: <20200704144943.18292-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704144943.18292-1-f4bug@amsat.org>
References: <20200704144943.18292-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This file doesn't access anything from "hw/usb.h", remove its
inclusion.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/sbsa-ref.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index e40c868a82..021e7c1b8b 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -38,7 +38,6 @@
 #include "hw/loader.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/qdev-properties.h"
-#include "hw/usb.h"
 #include "hw/char/pl011.h"
 #include "net/net.h"
 
-- 
2.21.3



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A98D21468A
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:50:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjUY-0003w0-Ve; Sat, 04 Jul 2020 14:50:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjUX-0003ES-P6
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:50:09 +0000
X-Inumbo-ID: a0583856-be05-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0583856-be05-11ea-b7bb-bc764e2007e4;
 Sat, 04 Jul 2020 14:49:56 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q5so35745347wru.6
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oswm/m1DAWqBYNXr2uTrm9A1MHSMTs1YgVZvoQJC8bI=;
 b=gQJg1+Wh58x4r1H2OG452+zx84IaV+E1T+M1C2BaKGGeGjGLijbGT/5fa47rZbH8+0
 wx3oFF6OQ4YShJqliLGLwkPIB5oJdoms+e1FUh9KOzyP0OaQJPWoQRUIivVmvk/OIni+
 pIzj1GiWmXLxj18zi7ZWsi1d3bC0/vHZhYuKuqhtZGYCTA6vwHL3QyRfwCu4wrFZiM4w
 nFj0qm+tx7V6fzx/zRQcGItYIzadZOv9ExIOm820D40RuWqtW4US5zoVgHElBrDFWXJU
 AbeBG/uIbXymxcCdns7Thwq8fUZU4bxlC2yWqkCy++/qfZTE6Jfr1HmDinGWpjPF9fWy
 Rs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Oswm/m1DAWqBYNXr2uTrm9A1MHSMTs1YgVZvoQJC8bI=;
 b=aGJnS5c6zOcu5hbRbQWdzrVZ8XL7rqvgyex1qGcPxeCaXhlBt/ISVyV0o+WEMcPO5z
 oWgScbSk6WOw+98tLtCCIIF4e4sq+mwdMOOs7z5xmGIA1tTxQZ22K/VQDLSXbiIbv7+p
 x5cxs2SGN+eLllA0rxQmJR/T+Qy/0dSDBFdVYk/whO+KYkjVaN0VLQRVO1U6YrM5QDER
 BHUdJmF5H7hGbSfL3u1OXt14vJO1kt1KJQofRCfGFeGeWMUTEGHqZcxZZokW0Cv35/U1
 ficfSzBy2zb3aYHCKFHFgrqVTG+jOw94oJe8gdVYlVZtXLCvG4kMxPCZttWfesGDcSRY
 fwog==
X-Gm-Message-State: AOAM533C/b666Oo3B2eG9Uhc/YbapWM4MH/7y3LYlC7lvRl9KIrHlvV6
 Q836nAAlyWHN/4wTGamz7ks=
X-Google-Smtp-Source: ABdhPJwNyiTXMTeB3cC7VryyLyGzYsyh9YLCpLFWWlt+IfdrZqIJno2o/CWRvBISeVrXF/zuyPa+Cw==
X-Received: by 2002:adf:9561:: with SMTP id 88mr11042389wrs.240.1593874195987; 
 Sat, 04 Jul 2020 07:49:55 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:49:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 04/26] hw/usb: Reduce 'exec/memory.h' inclusion
Date: Sat,  4 Jul 2020 16:49:21 +0200
Message-Id: <20200704144943.18292-5-f4bug@amsat.org>
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

"exec/memory.h" is only required by "hw/usb/hcd-musb.h".
Include it there directly.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/usb.h          | 1 -
 include/hw/usb/hcd-musb.h | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/usb.h b/include/hw/usb.h
index 4f04a1a879..15b2ef300a 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -25,7 +25,6 @@
  * THE SOFTWARE.
  */
 
-#include "exec/memory.h"
 #include "hw/qdev-core.h"
 #include "qemu/iov.h"
 #include "qemu/queue.h"
diff --git a/include/hw/usb/hcd-musb.h b/include/hw/usb/hcd-musb.h
index c874b9f292..ec3ee5c4b0 100644
--- a/include/hw/usb/hcd-musb.h
+++ b/include/hw/usb/hcd-musb.h
@@ -13,6 +13,8 @@
 #ifndef HW_USB_MUSB_H
 #define HW_USB_MUSB_H
 
+#include "exec/memory.h"
+
 enum musb_irq_source_e {
     musb_irq_suspend = 0,
     musb_irq_resume,
-- 
2.21.3



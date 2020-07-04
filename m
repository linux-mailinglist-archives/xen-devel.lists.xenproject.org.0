Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4621A214683
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:50:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjUy-00048H-Lj; Sat, 04 Jul 2020 14:50:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjUw-0003ES-Pr
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:50:34 +0000
X-Inumbo-ID: a6634f6a-be05-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6634f6a-be05-11ea-bb8b-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:06 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id f18so27702015wrs.0
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Mlo0AeYRU65Ls2fCVkmevBd3nH8ZXr33Z7OmOj+vXU=;
 b=gODFZA0NwiEg34xoLUZooBEFePqRiHvzOgk7GoIz2n1rFGd4QSl0yPFHs0kMpTwfun
 VxbOHiWGiK7hGkJcR55uhGHJOkSnTOylYJNNNeJNFX5MQ1AJWFLxthC0JxYRXwwA8UD6
 0T4W6OXB8JWENKKs9BjOmQtMx26PqxWLkNEqphVLzbN6BpKPqkGpMh3IysQmS3XaqFCH
 w/AkpcTcynoV0yqxNIqLzGxVmIkT1wEWEZ/2m+7m7ZFEkqqyiCInBV+iToCedjNeVAij
 I8W2Zmy8BwxXfoflWqBcUrD9nDoivwv8OJoVTnLun2Tiql7zQaqUo+6b6+3cW7+Kchj4
 DYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6Mlo0AeYRU65Ls2fCVkmevBd3nH8ZXr33Z7OmOj+vXU=;
 b=pMmpzGN3Jn9yhmi/+4hWkDRbZSGJbXLJdy9AA1ygmj44la6DrbZLsx3+nPqHQfo1qk
 sdwTt1iiHw0DNxnlVP8fc6MfihBShS/xKrD0rw4bHGrhKuTc0dgNY4N1Ed0RBeD4ua/i
 7Qt1sITlAlSlZIS63/PfouCelOo9AeFK5kNOyI3cIiXwxUVC+m1fb5pqbgRI0hFgr+Io
 S85tYEIYMGO9n9cZA8T5oKH9FfWYD7zLOG671ywULlx8B81WP6uPrUnywwVMqZrJSWAh
 w6u54D9bBtacB6MPb/cl7HZdx15GSPECMENA+e3XMFFdTFRrLw6yfZLnX+0QV0yL8yes
 xRwg==
X-Gm-Message-State: AOAM531CnM3aEYxrYy+v0HIW+K42E9Si9cdTSE0VO6tsYzraPOkGjV3K
 pg/DoljnFlHJyrCuwZNHjqA=
X-Google-Smtp-Source: ABdhPJx90xoS99/KVAVNosR0acMctdxAlHMTJW7Yd8LCiWu1nVe8JG8D7h3cg324kUXYXFvYsOB19w==
X-Received: by 2002:adf:f504:: with SMTP id q4mr40505370wro.163.1593874206130; 
 Sat, 04 Jul 2020 07:50:06 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 09/26] hw/usb/hcd-ehci: Remove unnecessary include
Date: Sat,  4 Jul 2020 16:49:26 +0200
Message-Id: <20200704144943.18292-10-f4bug@amsat.org>
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

As "qemu/main-loop.h" is not used, remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-ehci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 1495e8f7fa..256fb91e0c 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -34,7 +34,6 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 #include "qemu/error-report.h"
-#include "qemu/main-loop.h"
 #include "sysemu/runstate.h"
 
 #define FRAME_TIMER_FREQ 1000
-- 
2.21.3



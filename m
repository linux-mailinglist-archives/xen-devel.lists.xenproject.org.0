Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F2D2146A3
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:56:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjat-00054J-NK; Sat, 04 Jul 2020 14:56:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjWO-0003ES-Tr
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:52:04 +0000
X-Inumbo-ID: bb939dcc-be05-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb939dcc-be05-11ea-bca7-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:42 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so35748311wrs.11
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uE7YqG+qACaG8Uud6yeGxAsfWVnV3rkTeBq37HQj1qo=;
 b=sIhGHE4QN5ORR+3/Mgnoaxt2dRH9Duka3DMpiaQTVgS1lpSJEJ8KEB4VjCSKQqSlfc
 HwpmkE15woH+abTAT5VLKiyhb0Zq+u1XvalFXiALNHpXyYLuDGhlcjr3PJjaoEf3+FY7
 4UjhgJzhzYvcqHRKWwR/aqKYvEyqZ1yrs8FGt1f9ohuKcUlxQe/dtogbIP9H2gOPTdM+
 X1mnhOjui1Vk5B+Xa4Ju6b+X93HolCAPQsIP0PCVa5noiOK0+NH5/fSK60TLZZ4znABy
 cKKta1I+QCL7DFqQUZxr5qs5kGd/t289lAxS+UdQKR8b+NnivhadaJIHkJJVNpWJ4AOo
 xV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uE7YqG+qACaG8Uud6yeGxAsfWVnV3rkTeBq37HQj1qo=;
 b=BliaDKB+yVVOwZmDb8XSgmOZ+8Q6LzESelP7O/Y4C+k7ABU+IwZMztWdVTwVo2hKJl
 v/lzsbrzUR9gANXd8un2oIV6ztb5IQiPIvQtOv9e3ZVg4qtW6zsJ8e9GjsNykxMB20uz
 /3WaANDkAR5EYazCqy6G5wGq3MLR+K8XMLXm/jYcyXD848xVYtvqh2mYUNb3Dglzws3O
 RiLus8U7zmNrNhpQpjQdD85gXTyl9PTjvzmLFkbyQlJBlP6lZdFD4oqDLHxCS1PvOFZN
 KrybYzzKFgu8lz2VlOf+HRGxCZNdOEa7ws/81Ys9YRzvCdT/5x4P4KBWVCIAJW91qjXi
 ZITQ==
X-Gm-Message-State: AOAM533+cHJPRdAXI+pl0TJtGOyEGypK82tb2tzr4C69lrg+AKY3tydt
 Ejf/GbpeLpYJ1q+NLMmfrkQ=
X-Google-Smtp-Source: ABdhPJw68YNz9StYiIER/Bcj0m+eoPkR5IWJU/SRvblSzDy3zWSMVqWNGeAGRScY2s+A4+/iXWgZVA==
X-Received: by 2002:adf:9561:: with SMTP id 88mr11043924wrs.240.1593874241665; 
 Sat, 04 Jul 2020 07:50:41 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 26/26] MAINTAINERS: Cover dwc-hsotg (dwc2) USB host controller
 emulation
Date: Sat,  4 Jul 2020 16:49:43 +0200
Message-Id: <20200704144943.18292-27-f4bug@amsat.org>
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

Add an section for the dwc2 host controller emulation
introduced in commit 153ef1662c.

Cc: Paul Zimmerman <pauldzim@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2566566d72..e3f895bc6e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1651,6 +1651,12 @@ M: Samuel Thibault <samuel.thibault@ens-lyon.org>
 S: Maintained
 F: hw/usb/dev-serial.c
 
+USB dwc-hsotg (dwc2)
+M: Gerd Hoffmann <kraxel@redhat.com>
+R: Paul Zimmerman <pauldzim@gmail.com>
+S: Maintained
+F: hw/usb/*dwc2*
+
 VFIO
 M: Alex Williamson <alex.williamson@redhat.com>
 S: Supported
-- 
2.21.3



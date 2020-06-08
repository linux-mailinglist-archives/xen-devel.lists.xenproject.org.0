Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7DC1F1CA1
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:01:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKDX-0003vr-Ho; Mon, 08 Jun 2020 16:01:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKDV-0003ui-K4
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:01:41 +0000
X-Inumbo-ID: 57832dd4-a9a1-11ea-9ad7-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 57832dd4-a9a1-11ea-9ad7-bc764e2007e4;
 Mon, 08 Jun 2020 16:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gxT4B45O1zWyFYki8IWzx+7CIdrw2K/5FRLdU4/GP/s=;
 b=N2DdErRqsyskEuGnIL6IIOra+szxgFTHezrH3k0nylRDWuV5ophAD6etCKcTawrsz+1NAp
 GZg3tyFIeLDnBXR5q6xZgD9JXWkA9kASGqE/FAzhtm4i5fxoyVhuZABTJwOglFafAz6Z97
 +HVomMRl/DPlD9V7hNYGcjleYUuGI7g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-WAtSPRwdOTqH1Ew_IoSHJA-1; Mon, 08 Jun 2020 12:01:39 -0400
X-MC-Unique: WAtSPRwdOTqH1Ew_IoSHJA-1
Received: by mail-wm1-f71.google.com with SMTP id r1so4998wmh.7
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gxT4B45O1zWyFYki8IWzx+7CIdrw2K/5FRLdU4/GP/s=;
 b=eRCJ2v1RMV6FFHCWYo2qljR6RDN9fcwLVPialCVV5XBWN8o+zaAnlYYUEamf6X9S/h
 7NMRPq4rfQBHFdD+YMdZHsr9Tu3vo5SGuDwgfo2SHfTwNLWL5cRMTPritTibZH0cDfrW
 TGS7BoRjOK582k5hhv756GFvpDG1jQSmJ+SfH80qIqooIDhIKGvjuOMi1UumFdQkShHs
 G1A10drk2Z/P+edqanbCRIQTZtWa3BRWi8cTnr4/ntRsffv8etFiypWyByPv7oaK/xin
 lq3+MHa1YCUjq53I/RvDBeM7k3WOMmJpOVOEobVVfp8ksvNhOxb/zBurCbuS81wgp3IH
 hV7g==
X-Gm-Message-State: AOAM532R9JVEkTEZhjNuSd+aEJY5KNIZZpfO5LBabH5/UgihPfeA9ouT
 JEsxQo3Fr3SH7opIfovVH+B00KVjdLYtzxm3siViC0GEo8cu58QezPkVvnvcjhFEzyc6XhGBmxO
 i0esXEHTux5WIHhOW/en2oVvYeYk=
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr76252wml.48.1591632098182; 
 Mon, 08 Jun 2020 09:01:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxecWPcyOuK8uF9ReCv2dq+PoGEfPzfu+FZfYV8n2WgE2MmJ6zu0OPEpglwHYV7Ppo9rtY/wQ==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr76223wml.48.1591632098001; 
 Mon, 08 Jun 2020 09:01:38 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id g3sm188327wrb.46.2020.06.08.09.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 09/35] hw/display/ramfb: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:18 +0200
Message-Id: <20200608160044.15531-10-philmd@redhat.com>
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
 hw/display/ramfb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/display/ramfb.c b/hw/display/ramfb.c
index 79b9754a58..a4a427e5c7 100644
--- a/hw/display/ramfb.c
+++ b/hw/display/ramfb.c
@@ -18,6 +18,7 @@
 #include "hw/display/bochs-vbe.h" /* for limits */
 #include "ui/console.h"
 #include "sysemu/reset.h"
+#include "hw/qdev-deprecated.h"
 
 struct QEMU_PACKED RAMFBCfg {
     uint64_t addr;
@@ -120,6 +121,8 @@ RAMFBState *ramfb_setup(Error **errp)
     FWCfgState *fw_cfg = fw_cfg_find();
     RAMFBState *s;
 
+    qdev_warn_deprecated_function_used();
+
     if (!fw_cfg || !fw_cfg->dma_enabled) {
         error_setg(errp, "ramfb device requires fw_cfg with DMA");
         return NULL;
-- 
2.21.3



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B86151F1CCE
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:04:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKGD-0006Yh-Gf; Mon, 08 Jun 2020 16:04:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKGB-0006XS-Gq
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:04:27 +0000
X-Inumbo-ID: b225dce6-a9a1-11ea-9ad7-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b225dce6-a9a1-11ea-9ad7-bc764e2007e4;
 Mon, 08 Jun 2020 16:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6eEd/TZ2fHyvBWvIJ4C8+kCwxjhDxL4elOTIEe035mA=;
 b=hHuCqph27roUMrw8KtTy81Vhjqjimm2gQFdWrtk41rDRuw/AAQL/FGDN+E/vILI+7D7M9l
 Cf6aI1OpL2Myp5c83nUbd8VUPB9/U+RLB+YwkHjMkYWYG1e2/Ir/E7225JnSAgqNU3nr+Q
 OzbpBlhXHBMN4jbDT6y74tv+0IPLcZc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-qzWtedKVO1eW0Ed_00J5cg-1; Mon, 08 Jun 2020 12:04:11 -0400
X-MC-Unique: qzWtedKVO1eW0Ed_00J5cg-1
Received: by mail-wr1-f72.google.com with SMTP id s17so7307327wrt.7
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6eEd/TZ2fHyvBWvIJ4C8+kCwxjhDxL4elOTIEe035mA=;
 b=gOsNnegEhpTrAEqpo9b+wFaqfwW2py9DSIesFlJ0GUxW9MSZmJ2otxrXiI5ggoQ99D
 njyzLfJxhiuM8DqvQ0hxDf0QGAO8xc/1msMKoEDuakWzYSIWztMTixkZnd5Po5SF7EXA
 PMCGW6Wo2yPTbHMZj7/tkTecFGTNrwt2Er1j5P1mBDJDqt2SysuDv4xKZI2194eTyS7K
 UUqKUnSAPI9OFsCRJXel/ZlOI9+0AoYRawkjuRGQVgWZTthWoGhLLrvjg8PNzosiSw0C
 0fcaB5lTr6ByoCh1iDNSq0udZ3V49odal6gr0CEISOTN+RArWcTuKcwPhz9uOf8GJUSt
 NsHA==
X-Gm-Message-State: AOAM533J5y2qHCguCUcRydEQINkrFOorTMuZ3HdcLOhCuTOPjvF08u76
 aMX1nm85ua/4dzi897HliYbPFVTuFSHBzYg4DyLud5+j++dPgVx23X+poMytK+WpstqY//bEiLl
 WBtd4UW9x/+x70gVM31yYI3/3Vfk=
X-Received: by 2002:a1c:bb05:: with SMTP id l5mr29005wmf.141.1591632250058;
 Mon, 08 Jun 2020 09:04:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwleTjEs6m/0F9WTXFTKcyesoS9BhM/fhVRhaP0ZaaZMgPHfTC+huUmGRS6bDSqa1xeeej4Q==
X-Received: by 2002:a1c:bb05:: with SMTP id l5mr28952wmf.141.1591632249790;
 Mon, 08 Jun 2020 09:04:09 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id j16sm243025wre.21.2020.06.08.09.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:04:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 35/35] hw/xtensa/xtfpga: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:44 +0200
Message-Id: <20200608160044.15531-36-philmd@redhat.com>
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
 hw/xtensa/xtfpga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 60ccc74f5f..a3c82dc81a 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -50,6 +50,7 @@
 #include "xtensa_memory.h"
 #include "hw/xtensa/mx_pic.h"
 #include "migration/vmstate.h"
+#include "hw/qdev-deprecated.h"
 
 typedef struct XtfpgaFlashDesc {
     hwaddr base;
@@ -129,6 +130,8 @@ static XtfpgaFpgaState *xtfpga_fpga_init(MemoryRegion *address_space,
 {
     XtfpgaFpgaState *s = g_malloc(sizeof(XtfpgaFpgaState));
 
+    qdev_warn_deprecated_function_used();
+
     memory_region_init_io(&s->iomem, NULL, &xtfpga_fpga_ops, s,
                           "xtfpga.fpga", 0x10000);
     memory_region_add_subregion(address_space, base, &s->iomem);
-- 
2.21.3



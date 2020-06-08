Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B17C41F1C9F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:01:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKDL-0003pm-V8; Mon, 08 Jun 2020 16:01:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKDL-0003pP-3N
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:01:31 +0000
X-Inumbo-ID: 5127934e-a9a1-11ea-ba62-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5127934e-a9a1-11ea-ba62-bc764e2007e4;
 Mon, 08 Jun 2020 16:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P++PpnzVmXXtn3Xqf4XIHbmL4uqsh2R3Dd1pfn2k/GY=;
 b=KuLTfay+BjUA9tm25il0dVm1obY2X+WoFOeRz4dL/tw/N+nLrrfdHiWh0+RHp5r+xgIJIt
 zdtGAp8UaVSWVevhmHB3N3V21ASJGWIo2xTXpmmGljkthpWIra3S/Wvh34rygklxtq2hS3
 MmbgampXCMaaOT/W60SmlaHJTIwg9HY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-evCRsI3pPvyqLkFAVRu_YQ-1; Mon, 08 Jun 2020 12:01:28 -0400
X-MC-Unique: evCRsI3pPvyqLkFAVRu_YQ-1
Received: by mail-wr1-f71.google.com with SMTP id h6so7394885wrx.4
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P++PpnzVmXXtn3Xqf4XIHbmL4uqsh2R3Dd1pfn2k/GY=;
 b=kHW7GDKecbSyYwieV/60x4RWj3zY+SPuGeDX3dpi4fnzCdcTqBfMKDfX1ypbSJGkUW
 nuljNmhOdy4x6gMgCoMgZRSCLWpVLmbKVdW63jgwcYyWG7KCGdhJ35oKLeXVfMwhR17p
 jg2kt/By4ghqASLJgE44fbtpVOpWqFxkcjuCl3XJFMV9gZan/cdBbSwjLTFdCH2OSEv8
 qwU7GFVc6GT6GBBelLY14cslKygia08txEik28crIaBXmIUL9j/UdQX/nG0SIVO4PHcE
 rL/gtumk+/4qH3fK4+sJVmgNYYTGKeZwVrqTwxdqOOeZWU31IDpF08R+3au3MudbT2Qd
 QQYQ==
X-Gm-Message-State: AOAM531ouEECMb+5win23jRCDaW9UVD2+RTSwTvUoA0FaCpXu4yWrO+5
 I/pd4ZadiFpQtQfCuqafDoRUmPw3pWukea6gxnR27prS5G/VoFUcW3Wq4jq8CjqfZlJW1JM6vQh
 9Q8HX8RI7B6GovGMptU7LHndCYzY=
X-Received: by 2002:a1c:f007:: with SMTP id a7mr27146wmb.103.1591632087261;
 Mon, 08 Jun 2020 09:01:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi6QGEqKJNT1xfJrXVN1hFb5ZVsGqmEk2sV/P9tBTDLMUlN7hRgEWpk7m+66ilMFrnYarGkA==
X-Received: by 2002:a1c:f007:: with SMTP id a7mr27088wmb.103.1591632086930;
 Mon, 08 Jun 2020 09:01:26 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id o9sm7066wmh.37.2020.06.08.09.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 07/35] hw/char/parallel: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:16 +0200
Message-Id: <20200608160044.15531-8-philmd@redhat.com>
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
 hw/char/parallel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index 8dd67d1375..0ee577d420 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -35,6 +35,7 @@
 #include "hw/char/parallel.h"
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
+#include "hw/qdev-deprecated.h"
 #include "trace.h"
 
 //#define DEBUG_PARALLEL
@@ -601,6 +602,8 @@ bool parallel_mm_init(MemoryRegion *address_space,
 {
     ParallelState *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_malloc0(sizeof(ParallelState));
     s->irq = irq;
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
-- 
2.21.3



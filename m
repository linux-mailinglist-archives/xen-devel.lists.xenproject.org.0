Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F051F1CC5
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:03:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKF9-0005Om-1s; Mon, 08 Jun 2020 16:03:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKF6-0005Mf-TZ
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:03:20 +0000
X-Inumbo-ID: 92650185-a9a1-11ea-b292-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 92650185-a9a1-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 16:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J738BQqBvhpMt3eJFPP/lmrii93ELO7mMMfmrV28FMw=;
 b=Jd0Mgg+ZT6Y8OPN783wC5xi+OI1H3J++7k9ZDAL06Q0UQirlPDkyhB1KGqCWfWttlsPVxZ
 zKYudmWG5aIkMsrbm0N7Cj2DGJ9TH1Aon+M6ltxG4csce6FYFf3bFMl8JG5r7wpMcnfRVl
 hWmnZYeBhWehD8VbhLJqFZiw2a5H3qo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-U1L0J_ShPWCUkCO6Wtav9Q-1; Mon, 08 Jun 2020 12:03:18 -0400
X-MC-Unique: U1L0J_ShPWCUkCO6Wtav9Q-1
Received: by mail-wm1-f70.google.com with SMTP id s15so5963wmc.8
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J738BQqBvhpMt3eJFPP/lmrii93ELO7mMMfmrV28FMw=;
 b=oPS36daukOFH+ywisHayweVDwAce5z8ayGreJDTIPCymeGx3KVGSeSNj5Mezoww0Yj
 Gro1PDNDwr+bsAgeXD4KUdJC7cEylWu/1m7RI4cxSdOKwWjyVdxwBCQ8e8yh6ZE1SJ72
 y4fc9/IOPiU2uqjdjViROwtJwi9DKe8McH7gAAH56KyicJ8xjZJXwaghdjzocysvdD38
 v7Ml2nKKvEyE51Sg/W9L+MM2/CKNLI+4ZPhqr82H2qDp+jiRMPe9aL0+YgUYqbKOD0pS
 rrf/FBPc+m8clO+01WNvprLLW5VludVn45AX64zp+9D+KC2AU+YQs9R8/MaNJD8SucfY
 YnCg==
X-Gm-Message-State: AOAM530I9un4QwOzhgJwobVM/0QpiExZXGkxAIqT3W24Kg/4jdbaxrng
 9RU/4oqECo1vVVN3oy3bkFy5Vau87K/mLl32Dayrx/UV8RG8/aJsq0P4y5aUokXJD+LAgxQsa+f
 FFCg8cAj6DQTULAy2FMFB15CKGkk=
X-Received: by 2002:a05:600c:4410:: with SMTP id
 u16mr73255wmn.88.1591632196834; 
 Mon, 08 Jun 2020 09:03:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3xkvh2Vk+4PYCBSKCv2fZwGK7MNY+4FcnyFPW+oUbVotWO8gdASoKL+nfN+0YxJIIGJ7I2g==
X-Received: by 2002:a05:600c:4410:: with SMTP id
 u16mr73234wmn.88.1591632196640; 
 Mon, 08 Jun 2020 09:03:16 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id l17sm32396wmi.16.2020.06.08.09.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 26/35] hw/openrisc/cputimer: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:35 +0200
Message-Id: <20200608160044.15531-27-philmd@redhat.com>
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
 hw/openrisc/cputimer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/openrisc/cputimer.c b/hw/openrisc/cputimer.c
index 93268815d8..60f2c9667f 100644
--- a/hw/openrisc/cputimer.c
+++ b/hw/openrisc/cputimer.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "migration/vmstate.h"
 #include "qemu/timer.h"
+#include "hw/qdev-deprecated.h"
 
 #define TIMER_PERIOD 50 /* 50 ns period for 20 MHz timer */
 
@@ -135,6 +136,8 @@ static const VMStateDescription vmstate_or1k_timer = {
 
 void cpu_openrisc_clock_init(OpenRISCCPU *cpu)
 {
+    qdev_warn_deprecated_function_used();
+
     cpu->env.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &openrisc_timer_cb, cpu);
     cpu->env.ttmr = 0x00000000;
 
-- 
2.21.3



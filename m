Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B05D2612A9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 16:26:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFeZZ-0004Xd-Q4; Tue, 08 Sep 2020 14:26:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cV5b=CR=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kFeZY-0004XM-KK
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 14:26:12 +0000
X-Inumbo-ID: 823362f5-f368-4615-a301-739d3fc7bb04
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 823362f5-f368-4615-a301-739d3fc7bb04;
 Tue, 08 Sep 2020 14:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599575171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rd1yDVC2PLm/mbyb4s3J2rHQe4El+Eyr3YAhnhSaUkU=;
 b=BW4aikP8PPdjwjxqh1co/X1stkiJss+iHh8a3dGVsR+RFYoBzd/U04C41ZeG720Rcdj0Pk
 FuKJXBz5DsxTZz15DciCCD1TeJMjhH++Pn7pNvglFjrLKqtW0yVUGAgVRkYTWijcQ5HvAB
 gjtZExxRgzKnEzL/7xSt6Gefwa/2RSo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-jHZt99uaMXeNHGQ1kh7CTQ-1; Tue, 08 Sep 2020 10:26:07 -0400
X-MC-Unique: jHZt99uaMXeNHGQ1kh7CTQ-1
Received: by mail-wr1-f69.google.com with SMTP id 33so7070984wre.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 07:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rd1yDVC2PLm/mbyb4s3J2rHQe4El+Eyr3YAhnhSaUkU=;
 b=F5r4NC/aAwR9lyhcsCv4odSONY54eALyfFT4RfZ0PQ1nvSS0f24CKqQzNrIzfqqcxt
 LYjJfVc1dMgEkZLH0rfjJB0zHmXymP5SfTNy+qTY4zLqpKdg/br6tW5VjQVQjn4np2om
 nmdLcBsEGocTHdkoI1oE2rWRkTQeZiApt5no57qEXGZv5Nv90r108pr8ptPap5aNoJOz
 r9x/NdAbx4XWbTyUcRlwQC0zB+iV8V5pnCP60VJFn/tIXEtjT/jpAk0pIX9uKmKp7LHB
 bCdIPQ+7KY1vIeomrquZ9DcRND1QcrqAmM9TaUzt86eAR88dlB7m8/eemN3gUCnOXrlE
 AnHA==
X-Gm-Message-State: AOAM532RKt+6qsugIicS/OHyvCbmlB8rptsM4sizzrxwpcCFrPp3qgfK
 glrySpGECqPUq0rimkySoD4jNp51XuW0Kl2q+A8OmUmeLc3i+0ZIuIYASFt1wiTYr8Li5YHNGjK
 pXbaueZCHX3HSIGzBMwHWA7X+izI=
X-Received: by 2002:adf:efc9:: with SMTP id i9mr28298433wrp.187.1599575166447; 
 Tue, 08 Sep 2020 07:26:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy17scw5GBd0vKOfK7z1JRSIOHwjuajPWIItLLQxN9yoqVYIMsCoqxbS7A7Vn2FqxWJdDcxOw==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr28298412wrp.187.1599575166224; 
 Tue, 08 Sep 2020 07:26:06 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id b2sm32569506wmh.47.2020.09.08.07.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 07:26:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 1/5] hw/i386/q35: Remove unreachable Xen code on Q35 machine
Date: Tue,  8 Sep 2020 16:25:55 +0200
Message-Id: <20200908142559.192945-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908142559.192945-1-philmd@redhat.com>
References: <20200908142559.192945-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Xen accelerator requires specific changes to a machine to be able
to use it. See for example the 'Xen PC' machine configure its PCI
bus calling pc_xen_hvm_init_pci(). There is no 'Xen Q35' machine
declared. This code was probably added while introducing the Q35
machine, based on the existing PC machine (see commit df2d8b3ed4
"Introduce q35 pc based chipset emulator"). Remove the unreachable
code to simplify this file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/i386/pc_q35.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 0cb9c18cd44..f3506269fe0 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -34,9 +34,7 @@
 #include "sysemu/arch_init.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/rtc/mc146818rtc.h"
-#include "hw/xen/xen.h"
 #include "sysemu/kvm.h"
-#include "sysemu/xen.h"
 #include "hw/kvm/clock.h"
 #include "hw/pci-host/q35.h"
 #include "hw/qdev-properties.h"
@@ -179,10 +177,6 @@ static void pc_q35_init(MachineState *machine)
         x86ms->below_4g_mem_size = machine->ram_size;
     }
 
-    if (xen_enabled()) {
-        xen_hvm_init(pcms, &ram_memory);
-    }
-
     x86_cpus_init(x86ms, pcmc->default_cpu_version);
 
     kvmclock_create();
@@ -208,10 +202,7 @@ static void pc_q35_init(MachineState *machine)
     }
 
     /* allocate ram and load rom/bios */
-    if (!xen_enabled()) {
-        pc_memory_init(pcms, get_system_memory(),
-                       rom_memory, &ram_memory);
-    }
+    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
 
     /* create pci host bus */
     q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
@@ -271,7 +262,7 @@ static void pc_q35_init(MachineState *machine)
 
     assert(pcms->vmport != ON_OFF_AUTO__MAX);
     if (pcms->vmport == ON_OFF_AUTO_AUTO) {
-        pcms->vmport = xen_enabled() ? ON_OFF_AUTO_OFF : ON_OFF_AUTO_ON;
+        pcms->vmport = ON_OFF_AUTO_ON;
     }
 
     /* init basic PC hardware */
-- 
2.26.2



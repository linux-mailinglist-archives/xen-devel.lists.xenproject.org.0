Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0162322935A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 10:25:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyA46-0007q9-Ps; Wed, 22 Jul 2020 08:25:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HSf=BB=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jyA44-0007q4-PO
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 08:25:25 +0000
X-Inumbo-ID: e3756300-cbf4-11ea-8620-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e3756300-cbf4-11ea-8620-bc764e2007e4;
 Wed, 22 Jul 2020 08:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595406323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iMxQatL9RPRr52uoa/cQsIi+/qvfqC+NGO6O/Z/trAk=;
 b=ELpFr0TSwHtbJhlGuvPPyiR4Rv6JBARFNyjN/7mtmxphARaHrlMw2YePFITgKznRGzEn4j
 qx75Hf+Nx67Cx1TU9p/A60YcDjw+/+RvOC7pTTqIQZzbMmqVZyZNBb6+3KLl5Lodygv7T4
 lOmBPCwCh/8l7qm7RFF7c2O1dWJTnaU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-jdFd6FPHM4i93iT34d2hRw-1; Wed, 22 Jul 2020 04:25:21 -0400
X-MC-Unique: jdFd6FPHM4i93iT34d2hRw-1
Received: by mail-ej1-f70.google.com with SMTP id cf15so714085ejb.6
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2020 01:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iMxQatL9RPRr52uoa/cQsIi+/qvfqC+NGO6O/Z/trAk=;
 b=EwWWK7OJBR3V5Gv9gtCjvDCyQV3iz5unkBALUUfugG+LqGmU/QoNyChSC7UH5QzuQx
 qp69im05n9l/Bzwa+obGJtML/gOCSfgofcsP86TjfaSyBXfiWHUe51ELw4Y6rnShJrv2
 obVH3HR5vZec7Ux/UXU4MBOOAPbjdhwq/qPLu081hA7ZHQa1vtGP6XR7+pdGS+MhrYkV
 TA4Aad6fjDGNFAqzAmp5eDSPqhU2YPtCPLbxtDfX8oWcy3wo1RMgO1hLFtUAE0vtzDJN
 3ajXjlGN4rV0glKdjluRDhXNqgRCxJD7hxZjVOJmQTghIKCRhegOWXYc70YPtN7qJIdX
 7SUA==
X-Gm-Message-State: AOAM532QCCnIdIiRGZ0K5/2fPQa+ixtbm6vN08REXHh9A3eWPFBJlumj
 ZNZ1pwbIAziafS0aJElzdNNpH61prEy9X3MRWPbeEfvvJ9+56ybM7xiR9WOb9tC9nRLVqhdgONa
 67YHVzuJOfD6J17UuQwycsk/wmJE=
X-Received: by 2002:a05:6402:cb9:: with SMTP id
 cn25mr30469507edb.247.1595406319987; 
 Wed, 22 Jul 2020 01:25:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjYRzzJTOzYTRVfwqd/zbj7wdZv8GzJF0hCcZfQHNO6k/Ak91x0TPiYTcKtYKYbO1SqY50dg==
X-Received: by 2002:a05:6402:cb9:: with SMTP id
 cn25mr30469485edb.247.1595406319749; 
 Wed, 22 Jul 2020 01:25:19 -0700 (PDT)
Received: from x1w.redhat.com (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id m6sm18125273eja.87.2020.07.22.01.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 01:25:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2] hw/i386/q35: Remove unreachable Xen code on Q35
 machine
Date: Wed, 22 Jul 2020 10:25:17 +0200
Message-Id: <20200722082517.18708-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
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
---
 hw/i386/pc_q35.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index a3e607a544..12f5934241 100644
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
2.21.3



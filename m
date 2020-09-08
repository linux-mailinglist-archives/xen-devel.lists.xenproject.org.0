Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A312613E5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 17:55:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFfyB-0005lD-Ld; Tue, 08 Sep 2020 15:55:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cV5b=CR=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kFfy9-0005kl-Th
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 15:55:41 +0000
X-Inumbo-ID: 03031e26-f964-4298-8c76-6bbb7745c7b7
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 03031e26-f964-4298-8c76-6bbb7745c7b7;
 Tue, 08 Sep 2020 15:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599580541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rd1yDVC2PLm/mbyb4s3J2rHQe4El+Eyr3YAhnhSaUkU=;
 b=jWbm+J8J5T8MvInyC3T8bziRccFbRUw+7afSpolm2v/A+4H90kgWfM1eayAKn7Ki7p6er2
 LfmkavgvrfspgpcCPNP2zlWI4dIYkYbxV3k2y8nvY1bcRp/uEmC9/mODpJn1iZP22oXlWN
 7RH9/wPMPOGghjiQ9Vae48zxXWijZQc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-2apKmDi0PgCro21DOvmQ4A-1; Tue, 08 Sep 2020 11:55:39 -0400
X-MC-Unique: 2apKmDi0PgCro21DOvmQ4A-1
Received: by mail-wm1-f71.google.com with SMTP id b73so3632786wmb.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 08:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rd1yDVC2PLm/mbyb4s3J2rHQe4El+Eyr3YAhnhSaUkU=;
 b=pwni3Bv+5Zuc69ioAD8hQaM/9YrSQbEL+m7Y6OZcuDwBdsdL2RzWMseeNeMsGcTOFk
 tRyaAlx32YsFhpWFfLwzw+RDOtCtLVYifQ0U+d3b29iSqaf+flBgJYxJ5M8VqqEds7OR
 X65e2+n7srHvIS/on14nKum23luslmfPCoUpZWdl7weLXA9ahqw677e+eIn1Ul/khO2K
 Q746SjBg4UVKBTXt6ibutQEpdAGcsyOvBcJW5SrJf3eO0YGm0yd8eVd9W27jRQ8JTh23
 9XAANGuzlnrU1IIMZmepOlsxEyufC6pmqh1D/4S4ZGAa0H8OsknS21fn2bJBxj7iNzzG
 0QKg==
X-Gm-Message-State: AOAM533apb1h8SGvchv+rqvme03FDxUwPGT/S/MnjrtnbA+JyZv3fk0U
 uK4Ny9sJ85QosgR7AFO3VDnmdb89cmspmfL0/Ppl5Du5IJpfedd66hXs9DDsHuo+sQ56W9ibvj/
 0ZzBYluQdoRxBRx/BohZREVM3TaI=
X-Received: by 2002:a7b:ca56:: with SMTP id m22mr221220wml.12.1599580538030;
 Tue, 08 Sep 2020 08:55:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYnoWVgP/Ap99zKyQud1Rr5s6XZtll0OYfYZ+la+K5Rnwnnrg8qI1BhbSu4nN0ILR5SpT+xA==
X-Received: by 2002:a7b:ca56:: with SMTP id m22mr221200wml.12.1599580537809;
 Tue, 08 Sep 2020 08:55:37 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id b187sm33175270wmb.8.2020.09.08.08.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:55:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 1/6] hw/i386/q35: Remove unreachable Xen code on Q35 machine
Date: Tue,  8 Sep 2020 17:55:25 +0200
Message-Id: <20200908155530.249806-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908155530.249806-1-philmd@redhat.com>
References: <20200908155530.249806-1-philmd@redhat.com>
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



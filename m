Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 619A32613E9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 17:56:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFfyV-0005sh-Uk; Tue, 08 Sep 2020 15:56:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cV5b=CR=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kFfyU-0005s0-1X
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 15:56:02 +0000
X-Inumbo-ID: 2d188795-9b5b-487f-9b64-ca79f0a36b7d
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2d188795-9b5b-487f-9b64-ca79f0a36b7d;
 Tue, 08 Sep 2020 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599580561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7Ag5wnuoUQYeKlBzjbRjYp0ocSUB86y3tv8q6ZNJJA=;
 b=Zp7qXZqq5EDAIUlWGYHmdN4upVhKrIOcOF2iIqmt9g+jFaXaIJ3uDtMbR9zJWj71GIuQEU
 ESO2TbK44gJzorlmBApBeerNJT1zqejnBa7yztuZntLzYCieIyFuf0KHucjjCmCYb3OEj7
 KOlktO4cbfMQWTMHuhyH07folt1L558=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-ybpaOyRgMIKXt1FTUnF4Bg-1; Tue, 08 Sep 2020 11:55:59 -0400
X-MC-Unique: ybpaOyRgMIKXt1FTUnF4Bg-1
Received: by mail-wm1-f71.google.com with SMTP id c72so3625130wme.4
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 08:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l7Ag5wnuoUQYeKlBzjbRjYp0ocSUB86y3tv8q6ZNJJA=;
 b=tcppQ/dHe+JjtWvX+oaj8GQ0zKdJ2Po2c02d7zBs0QuVudCqEkXK8XpLM+5+ooBgWj
 Lu7Z/AFhbz1dwDdo2qddjixZNL97Tz8tNiKmM0yDVzd/x0yuCmmNv0AOPvf9lvzHAPrf
 l1wyjFhr0zyXUzG2vtef3Xeh9hEsT1/3TLNAEkyGe/P5cPAa+3jGjVp7+BvRjt6dBKjv
 /OK+a5PQX2dqZV1eMWwPIEr4GPjsMx0meg+74GWY7gouLm0mCJqBkF4k2Ziv1DLdr/zk
 5hE91Xrcdrd+vtEv7RrTgnV2FhVJoQnLsLVS3XkUaZLaEKJ5AX+/LQrNqFL2adbXfmQv
 kwaA==
X-Gm-Message-State: AOAM533h/GuIAA3pyTJj8P5Z9uyZ+04v9DFm9dbZxlB2Yx6APhLayAOm
 QnopC7Un2dmnPSFTSnZjjwoxXgVz0XKq9EEeUIS8Euq2RrTOsU30FAZSjvfuHPfjvCsEemyWkRn
 k2yClcdA7WvyeeytH7KvRwWOtd/I=
X-Received: by 2002:a1c:408a:: with SMTP id n132mr171985wma.45.1599580557610; 
 Tue, 08 Sep 2020 08:55:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUFRkRRVJCqVG6l89owtWDMK776psHv3Hm0UYLZ9EZUoKSwjLV4cvgxH1H8jSVri7Qh45g4w==
X-Received: by 2002:a1c:408a:: with SMTP id n132mr171968wma.45.1599580557436; 
 Tue, 08 Sep 2020 08:55:57 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id 11sm32118347wmi.14.2020.09.08.08.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:55:56 -0700 (PDT)
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
Subject: [PATCH v2 5/6] hw/xen: Split x86-specific declaration from generic
 hardware ones
Date: Tue,  8 Sep 2020 17:55:29 +0200
Message-Id: <20200908155530.249806-6-philmd@redhat.com>
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

xen_hvm_init() is restricted to the X86 architecture.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/xen/xen-x86.h | 15 +++++++++++++++
 include/hw/xen/xen.h     |  2 --
 hw/i386/pc_piix.c        |  2 +-
 hw/i386/xen/xen-hvm.c    |  1 +
 stubs/xen-hw-stub.c      |  1 +
 5 files changed, 18 insertions(+), 3 deletions(-)
 create mode 100644 include/hw/xen/xen-x86.h

diff --git a/include/hw/xen/xen-x86.h b/include/hw/xen/xen-x86.h
new file mode 100644
index 00000000000..85e3db1b8de
--- /dev/null
+++ b/include/hw/xen/xen-x86.h
@@ -0,0 +1,15 @@
+/*
+ * Xen X86-specific
+ *
+ * Copyright 2020 Red Hat, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef QEMU_HW_XEN_X86_H
+#define QEMU_HW_XEN_X86_H
+
+#include "hw/i386/pc.h"
+
+void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory);
+
+#endif /* QEMU_HW_XEN_X86_H */
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index b2b459964cb..1406648ca58 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -30,8 +30,6 @@ qemu_irq *xen_interrupt_controller_init(void);
 
 void xenstore_store_pv_console_info(int i, struct Chardev *chr);
 
-void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory);
-
 void xen_register_framebuffer(struct MemoryRegion *mr);
 
 #endif /* QEMU_HW_XEN_H */
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 3e008bb0b1a..43205f48188 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -46,7 +46,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/arch_init.h"
 #include "hw/i2c/smbus_eeprom.h"
-#include "hw/xen/xen.h"
+#include "hw/xen/xen-x86.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
 #include "hw/acpi/acpi.h"
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 49748cda3fb..e03c59e53da 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -22,6 +22,7 @@
 #include "hw/xen/xen_common.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "hw/xen/xen-bus.h"
+#include "hw/xen/xen-x86.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qemu/error-report.h"
diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index d14efef49e9..2ea81909217 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -8,6 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/xen/xen.h"
+#include "hw/xen/xen-x86.h"
 
 void xenstore_store_pv_console_info(int i, Chardev *chr)
 {
-- 
2.26.2



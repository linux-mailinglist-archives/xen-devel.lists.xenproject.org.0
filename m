Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0CE2612AC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 16:26:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFeZm-0004cj-NF; Tue, 08 Sep 2020 14:26:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cV5b=CR=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kFeZl-0004aJ-8Q
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 14:26:25 +0000
X-Inumbo-ID: 546c4246-e748-4f16-b64c-a03486c3ff1f
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 546c4246-e748-4f16-b64c-a03486c3ff1f;
 Tue, 08 Sep 2020 14:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599575184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PKU6z94K7UIxWkqADbhCdk+fTBY5NmZMu8z2vQrSItw=;
 b=C0bS9mW49YnvLU89SLxzYcFjhDaRI6t6NxspnPDek8R/H4vaTlsgMIG9oIgxF1e7/yQCDf
 TXj+oZNjxosQHwvlwP5XbDFqDI37/vjuLg9Pg6sbut8K+HjfgfYhbY9/GODIqcUc+hMX1G
 IYEZjyP0TQqCsa0PHPMj8PHWvv1CQ3A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-ceIv4dnkP06kRg3HQqPg0A-1; Tue, 08 Sep 2020 10:26:22 -0400
X-MC-Unique: ceIv4dnkP06kRg3HQqPg0A-1
Received: by mail-wm1-f69.google.com with SMTP id w3so4802775wmg.4
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 07:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PKU6z94K7UIxWkqADbhCdk+fTBY5NmZMu8z2vQrSItw=;
 b=aZ2Kb8GvccXQKdkzatHY54YTGe155kcUuA5r62jILTm6kl+DILO4FTXlALQXpjILv3
 zJFT810Ud5b1YkwJi9owYCBepVtL+l4biX3Sxn2cQ+v/6OJGxAesJ9y4oz4aeGsO1Tjj
 h16MMjHMvJsMIDCprTAkH96e1s1woYBCCo4Oog6Z8VZ7BKHVMDUU/Sa9IS29k2wXx8vV
 zZ81eBfsnVqCjUMJT/JGp9eyKOsFv7lnnFj9oLlVUToJPM8yPAVDtAXKMEFVMGOWL6Tb
 +T8yppUDM2N1AUCW+bJVFVniZqj/Dp7FmMJLQZ+nXsCHlkC9Agdq5ebWi+4r5VDe6sN0
 ay6Q==
X-Gm-Message-State: AOAM533sJzCMbk0WrYaQ8j/Fahffbjpxjdnr4JqVxL6X9bwZ7jnUiWda
 LJYGsL+jDN5oH4K0YrIgpGSJ/sy3Anwx8ArKWEwS3nePTAQYGWLZbFUTl41ZI+xpIA3rhmnFFDC
 rOh4H/yNphg4soHR5/pNZLf9MUsY=
X-Received: by 2002:adf:e690:: with SMTP id r16mr22862680wrm.15.1599575181396; 
 Tue, 08 Sep 2020 07:26:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxi9E+6zi0GSsRROj52mze2J8TZAWamqoyYBE/YoqC5pV7oZ//ef2PGOt34D9MOXVPg3sxNYQ==
X-Received: by 2002:adf:e690:: with SMTP id r16mr22862661wrm.15.1599575181175; 
 Tue, 08 Sep 2020 07:26:21 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id h8sm34388736wrw.68.2020.09.08.07.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 07:26:20 -0700 (PDT)
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
Subject: [PATCH 4/5] hw/xen: Split x86-specific declaration from generic
 hardware ones
Date: Tue,  8 Sep 2020 16:25:58 +0200
Message-Id: <20200908142559.192945-5-philmd@redhat.com>
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

xen_hvm_init() is restricted to the X86 architecture.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/xen/xen-x86.h | 15 +++++++++++++++
 include/hw/xen/xen.h     |  2 --
 hw/i386/pc_piix.c        |  2 +-
 hw/i386/xen/xen-hvm.c    |  1 +
 4 files changed, 17 insertions(+), 3 deletions(-)
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
-- 
2.26.2



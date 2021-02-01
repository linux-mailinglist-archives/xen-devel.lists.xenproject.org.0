Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D11930A682
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 12:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79772.145301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XOU-0002e8-0u; Mon, 01 Feb 2021 11:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79772.145301; Mon, 01 Feb 2021 11:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6XOT-0002dV-SF; Mon, 01 Feb 2021 11:29:21 +0000
Received: by outflank-mailman (input) for mailman id 79772;
 Mon, 01 Feb 2021 11:29:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUbX=HD=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6XOS-0002d8-UU
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 11:29:20 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 712290df-d38f-45e8-ae26-fea464031983;
 Mon, 01 Feb 2021 11:29:20 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q7so16138853wre.13
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 03:29:20 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id y6sm26305538wrp.6.2021.02.01.03.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:29:18 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
X-Inumbo-ID: 712290df-d38f-45e8-ae26-fea464031983
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aPiraoQq+wBjdcIQOiUTo/rKER9nPb2vFzjApKq2T+g=;
        b=ko4bHURsbdywzQeAqTKNRMtP+zzJ6yTACMFwMAle7bWMNtkvJufYJrtPUI/M5VW3/O
         frmacZk8z5EwOYVKlR1W7pU0lJDo4Xtr7KDcSHqPIQGwsREIlJ5kPDQQ61Cr1BYMoUWE
         CF0rc60JUGkcPOKbMV0O0+zHtMU1Tui4QSz+lBYsHlKckNcTiNoyfbBX8hLgAYBcFvOE
         uNIFEwGblR6Um04jIkD8OHxk0Gs5LrqqQzd0x+eiVKhrXYbg0AxzeRgUoumA1uDQTC4m
         FxrgOOgPU5iJBrHon1c+gWeae2DbmRnTY7+cbkCrU59wU2snpSOPEcSb8jlKgXrUPOGp
         zwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=aPiraoQq+wBjdcIQOiUTo/rKER9nPb2vFzjApKq2T+g=;
        b=ojeT7zw2DR0nZAaMP9ChrBI55nFDHgcpMPuarD5KOds/pMTM41uEfhDqHqCNHrfJAn
         qfwJIeZUzDjC8U9fqHonzTBA94hYk4Fsmn7MX14P763olOjv+/A2QxEhjOjxYeLdIF3f
         m5GSuYMI1XuPHd1+pNehtNPC1ReAS7jA/pG5c3Nn/H04xLU1MTPBfKe12X7Wjdsy5AM7
         mLLYsub9HEQaFw0RFqoa3dL9jTYPu4djTQ14tgadEEX3yOKtyEusoKiDPXUWlnjuzMJh
         resaWkw6uxKuBHAtN416dDapcmoUoKsw+fZMCyxaDkmElpIUYHtfcrp4DwHeQFAQ+ZDe
         XNIQ==
X-Gm-Message-State: AOAM530PjKulwDdGeLI1W5LSYaZE4A8mdfZZMIBsJFSJ9psw9cFcC7FX
	w3Zn+xmciA/yGN4jaHiQ6Rg=
X-Google-Smtp-Source: ABdhPJwPt7ERal1fQeDzwH3w64qDIOwi7IRP9XTWdLtX/WYy5c6IDx5O5BK4Mw3ZLOmXAK4MQef0Tw==
X-Received: by 2002:a5d:4e0e:: with SMTP id p14mr17735664wrt.58.1612178959403;
        Mon, 01 Feb 2021 03:29:19 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 2/7] hw/xen: Relax dependency on FSDEV_9P
Date: Mon,  1 Feb 2021 12:29:00 +0100
Message-Id: <20210201112905.545144-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201112905.545144-1-f4bug@amsat.org>
References: <20210201112905.545144-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Relax the dependency on 9pfs by using the 'imply' Kconfig rule.
This fixes when XEN_PV without XEN_FV:

  /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function
  `xen_be_register_common':
  hw/xen/xen-legacy-backend.c:754: undefined reference to `xen_9pfs_ops'

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/xen/xen-legacy-backend.c | 3 ++-
 accel/Kconfig               | 2 +-
 hw/xen/meson.build          | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index b61a4855b7b..338d443a5c0 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -33,6 +33,7 @@
 #include "hw/xen/xen-legacy-backend.h"
 #include "hw/xen/xen_pvdev.h"
 #include "monitor/qdev.h"
+#include CONFIG_DEVICES
 
 DeviceState *xen_sysdev;
 BusState *xen_sysbus;
@@ -750,7 +751,7 @@ void xen_be_register_common(void)
 
     xen_be_register("console", &xen_console_ops);
     xen_be_register("vkbd", &xen_kbdmouse_ops);
-#ifdef CONFIG_VIRTFS
+#ifdef CONFIG_FSDEV_9P
     xen_be_register("9pfs", &xen_9pfs_ops);
 #endif
 #ifdef CONFIG_USB_LIBUSB
diff --git a/accel/Kconfig b/accel/Kconfig
index 461104c7715..7565ccf69e6 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -15,4 +15,4 @@ config KVM
 
 config XEN
     bool
-    select FSDEV_9P if VIRTFS
+    imply FSDEV_9P
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 076954b89ca..3c2062b9b3e 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -2,12 +2,12 @@
   'xen-backend.c',
   'xen-bus-helper.c',
   'xen-bus.c',
-  'xen-legacy-backend.c',
   'xen_devconfig.c',
   'xen_pvdev.c',
 ))
 
 xen_specific_ss = ss.source_set()
+xen_specific_ss.add(files('xen-legacy-backend.c'))
 xen_specific_ss.add(when: 'CONFIG_XEN_PCI_PASSTHROUGH', if_true: files(
   'xen-host-pci-device.c',
   'xen_pt.c',
-- 
2.26.2



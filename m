Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CC37EB2F5
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:00:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632720.987129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uu1-0001uM-JZ; Tue, 14 Nov 2023 15:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632720.987129; Tue, 14 Nov 2023 15:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uu1-0001r9-G6; Tue, 14 Nov 2023 15:00:33 +0000
Received: by outflank-mailman (input) for mailman id 632720;
 Tue, 14 Nov 2023 15:00:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uab-0003vI-Ux
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:40:29 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1ac0474-82fb-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 15:40:29 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9d216597f64so867250266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:40:29 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 t25-20020a1709066bd900b0099c53c4407dsm5561943ejs.78.2023.11.14.06.40.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:40:28 -0800 (PST)
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
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c1ac0474-82fb-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972829; x=1700577629; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85224ACu16xcahxMJd73na2pr08geUP2BaqK8DQk41g=;
        b=CqFxKExZx2zVxBU4nAvTQG416qy1C7DnCz3i8i8kEqrLzu7cT4cSmCqjObTW7uWiz5
         e13jIqbr3o6yr4uCxkVL9/sEp1s2hM3Tsq+fhyTM+mw5KEEnr5+/OmcEV8VBY+X1R7Gq
         xG3C5+nTBvZ4k/R5EmPvb0cU8FvvSQwZBlLIRqyjuUy3s6DR9oJBHNXpjKKLzHpRQcbM
         1P2aUoksphLNkPw7OF4/teBTk5HcG/rL2z4cnzkRmSsR5E7DY9W8odtjEPyIx/aAfmha
         EEROBZf31Wm0V06rS8Hixal1NrU1XtI5+CHWMGIEqShLK+SzUFpcdIpVuskOGIDAfCee
         EiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972829; x=1700577629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85224ACu16xcahxMJd73na2pr08geUP2BaqK8DQk41g=;
        b=dUWjDUFRpYAM9Ynrta3pdMuwJskTFDIoPJvjFaruVlslsfSpMh9t/F2D71RvlUG7y9
         ZoIy7qbGfCXcVX/GBw0mCehePCWqaoojByZ9MIIUTpIl8h9yKYPoZF6ojgmDVasaEbd2
         Flbu/Xac70Baa9KrhDn5zhzLAs9Hb2+iZuSnjdbuGNfa9sGZsUBMoGC2F4O+AOSnUeA2
         U3o5IwGtsVAhph9ByxvK9L9yp/teDR/2nt5Jvfiya7Dl3hj6RbNTqmmWwXzNKJ/Ze+tV
         EMW2CUkNXjVrXMGRqbFsXWuEELcf2R6Du9vKyNvVGXIEaZoYDGR0lYxeSGETUaC0FDlP
         1d3Q==
X-Gm-Message-State: AOJu0YxqfOxHWb2w1Z2nOPIH6HNZp5xKW2iNrDzjR5GKZsr8BKcrU6SD
	qzlO3oIw7wPHXI0N3zfigUn2+w==
X-Google-Smtp-Source: AGHT+IE4fe4f8bleIo+ydEdJnHpXElyEFzfSvfuN7IjKmK4sPC2Xb+6oIBNsyuQ4jtW9IDSYhgY52Q==
X-Received: by 2002:a17:907:969f:b0:9eb:af0e:39da with SMTP id hd31-20020a170907969f00b009ebaf0e39damr3096379ejc.46.1699972828864;
        Tue, 14 Nov 2023 06:40:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH-for-9.0 v2 19/19] hw/xen: Have most of Xen files become target-agnostic
Date: Tue, 14 Nov 2023 15:38:15 +0100
Message-ID: <20231114143816.71079-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Previous commits re-organized the target-specific bits
from Xen files. We can now build the common files once
instead of per-target.

Only 4 files call libxen API (thus its CPPFLAGS):
- xen-hvm-common.c,
- xen_pt.c, xen_pt_graphics.c, xen_pt_msi.c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Reworked since v1 so dropping David's R-b tag.
---
 accel/xen/meson.build          |  2 +-
 hw/block/dataplane/meson.build |  2 +-
 hw/xen/meson.build             | 21 ++++++++++-----------
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/accel/xen/meson.build b/accel/xen/meson.build
index 002bdb03c6..455ad5d6be 100644
--- a/accel/xen/meson.build
+++ b/accel/xen/meson.build
@@ -1 +1 @@
-specific_ss.add(when: 'CONFIG_XEN', if_true: files('xen-all.c'))
+system_ss.add(when: 'CONFIG_XEN', if_true: files('xen-all.c'))
diff --git a/hw/block/dataplane/meson.build b/hw/block/dataplane/meson.build
index 025b3b061b..4d8bcb0bb9 100644
--- a/hw/block/dataplane/meson.build
+++ b/hw/block/dataplane/meson.build
@@ -1,2 +1,2 @@
 system_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
-specific_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
+system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index d887fa9ba4..403cab49cf 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -7,26 +7,25 @@ system_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
   'xen_pvdev.c',
 ))
 
-system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
+system_ss.add(when: ['CONFIG_XEN'], if_true: files(
   'xen-operations.c',
-))
-
-xen_specific_ss = ss.source_set()
-xen_specific_ss.add(files(
   'xen-mapcache.c',
+))
+system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
   'xen-hvm-common.c',
 ))
+
 if have_xen_pci_passthrough
-  xen_specific_ss.add(files(
+  system_ss.add(when: ['CONFIG_XEN'], if_true: files(
     'xen-host-pci-device.c',
-    'xen_pt.c',
     'xen_pt_config_init.c',
-    'xen_pt_graphics.c',
     'xen_pt_load_rom.c',
+  ))
+  system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
+    'xen_pt.c',
+    'xen_pt_graphics.c',
     'xen_pt_msi.c',
   ))
 else
-  xen_specific_ss.add(files('xen_pt_stub.c'))
+  system_ss.add(when: ['CONFIG_XEN'], if_true: files('xen_pt_stub.c'))
 endif
-
-specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
-- 
2.41.0



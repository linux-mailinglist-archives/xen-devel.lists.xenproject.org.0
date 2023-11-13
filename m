Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE85B7EA013
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:35:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631736.985384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Yxk-00019O-3M; Mon, 13 Nov 2023 15:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631736.985384; Mon, 13 Nov 2023 15:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Yxk-000173-0c; Mon, 13 Nov 2023 15:34:56 +0000
Received: by outflank-mailman (input) for mailman id 631736;
 Mon, 13 Nov 2023 15:34:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DPbO=G2=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2YlZ-0005il-1J
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:22:21 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70027308-8238-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 16:22:20 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-54553e4888bso6893748a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 07:22:20 -0800 (PST)
Received: from m1x-phil.lan ([176.164.221.204])
 by smtp.gmail.com with ESMTPSA id
 lw27-20020a170906bcdb00b009de11bcbbcasm4238875ejb.175.2023.11.13.07.22.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Nov 2023 07:22:19 -0800 (PST)
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
X-Inumbo-ID: 70027308-8238-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888940; x=1700493740; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2PpOM4WQ+uf4xck1acJwuABeC89nz7da2f3K2pGLBg=;
        b=U+3ipKtyp5p1l6dXSqpdO3ts4CnflliP0KAIZGvl5PPnYbOytr4thmGtKNukPSbSNj
         VIW/fBcMZtqp0Sp7Qt3T4VPzQpkfUe6CWhT6eeTXMpQ7ifprmk+r6VTu/F2idGXT14GK
         UAc9J4exvtLeihc5qRhWQuGmnLAfDZzdw9mElDeJe+6JkAem+iY6swUdG/PJNvLJDhs7
         W3EO4zcYyCkqmUOMIFwgKJfiwJsesrq4VBdSIidFgS+NXajDU9QE1Fi+BfVQDg2gb7yh
         RMziBfYP5ATrP6qgjP6YWDDaWCiqY+5TF66Brgz4IvXPfomHmhQlfuKqQ/O0vDX+UF2F
         f+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888940; x=1700493740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2PpOM4WQ+uf4xck1acJwuABeC89nz7da2f3K2pGLBg=;
        b=ro6iGkumsmcEsBHrhdcWaZ5sqX6zONMVYX6bCYXh76YYIecsmSgMw3t7N7KoQeOb3g
         2NyHym5iv7pC81+TK/nbMJfFyxd7DFzZQo2KnAGfDXtoz+udfNv/wAwab5pUncVxnl5g
         ditIJncEWFDv8HCj8WNUoGZiq1fQtp/roLfmMd0m+iHbUY6UkeHDSRveZo8wgUkTsB3v
         ht+AJfKs2LQXh6WxTBtqRCefVlLprp8+zEhtK9D3YQXPh8PSRSQWMLtwoRrE6osMWOU6
         DzhWjuBEWxtRlTAk0+7tp9HhV2TSEoGd9XvUY/don0vMyNZ6eNgCU960eq3Zf33VlzND
         gV6A==
X-Gm-Message-State: AOJu0YzkpKiTuz/l7m7Ux/vPjV1nLm4/C3sJz0TFbnFRopuZ+NxhX9KP
	XkpyamjRmUaBXB2yZTO/HZ27oQ==
X-Google-Smtp-Source: AGHT+IFN0oQYvnRoNATsOZJ25LMlTXynSPofCu2en/Z0LYSJQyfcBbtJzfmWQwHuJeMUC7biyDShHw==
X-Received: by 2002:a17:906:f2c3:b0:9bd:a738:2bfe with SMTP id gz3-20020a170906f2c300b009bda7382bfemr5045867ejb.38.1699888940071;
        Mon, 13 Nov 2023 07:22:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH-for-9.0 10/10] hw/xen: Have most of Xen files become target-agnostic
Date: Mon, 13 Nov 2023 16:21:13 +0100
Message-ID: <20231113152114.47916-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Previous commits re-organized the target-specific bits
from Xen files. We can now build the common files once
instead of per-target.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/xen/meson.build          |  2 +-
 hw/block/dataplane/meson.build |  2 +-
 hw/xen/meson.build             | 13 ++++---------
 3 files changed, 6 insertions(+), 11 deletions(-)

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
index d887fa9ba4..29adfadd1c 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -9,15 +9,12 @@ system_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
 
 system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
   'xen-operations.c',
+  'xen-hvm-common.c',
+  'xen-mapcache.c',
 ))
 
-xen_specific_ss = ss.source_set()
-xen_specific_ss.add(files(
-  'xen-mapcache.c',
-  'xen-hvm-common.c',
-))
 if have_xen_pci_passthrough
-  xen_specific_ss.add(files(
+  system_ss.add(files(
     'xen-host-pci-device.c',
     'xen_pt.c',
     'xen_pt_config_init.c',
@@ -26,7 +23,5 @@ if have_xen_pci_passthrough
     'xen_pt_msi.c',
   ))
 else
-  xen_specific_ss.add(files('xen_pt_stub.c'))
+  system_ss.add(files('xen_pt_stub.c'))
 endif
-
-specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
-- 
2.41.0



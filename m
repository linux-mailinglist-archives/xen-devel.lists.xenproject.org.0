Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D81867BD8
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 17:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685631.1066642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rednH-0003GN-T7; Mon, 26 Feb 2024 16:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685631.1066642; Mon, 26 Feb 2024 16:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rednH-0003DV-QA; Mon, 26 Feb 2024 16:25:31 +0000
Received: by outflank-mailman (input) for mailman id 685631;
 Mon, 26 Feb 2024 16:25:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdVt=KD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rednG-0003DP-QA
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 16:25:30 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7b513b3-d4c3-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 17:25:29 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a3d01a9a9a2so339525566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 08:25:29 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 lg25-20020a170907181900b00a43903e7a7csm170636ejc.51.2024.02.26.08.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 08:25:28 -0800 (PST)
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
X-Inumbo-ID: a7b513b3-d4c3-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708964728; x=1709569528; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+tmouwWJuYSCzk6pXS8mGFw3qvx7hu9XnjEfJTFEA2A=;
        b=GvcmF+5tXEsgfrOHgRi6vA0MTaxj3A9RVYrSK1FCno0C217aiod/QkmHGOKde00AKJ
         ysCSq4serYSOnkRV52nVZKY1ui/k34Uvvm7unKOu9hFofZemJ++kESldVFIb9XuITfum
         aR9qj8gRFor1bTYs5E8n6uLzmwjAJwW030I/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708964728; x=1709569528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tmouwWJuYSCzk6pXS8mGFw3qvx7hu9XnjEfJTFEA2A=;
        b=HhsRD2DKT9jwjmIBP4jfHQ8+rz+UR/w5so/6t+hfthlGkcoBD0ws+9y3KfV8WHBEju
         VWqAuHIExS8JJUa0xKhRU16UNRhbw+hglomj7CkWO/YDWdRo1blQbw0i3zI6hS732c5T
         nPGCKhmioDnGenK16PXkN2nkPMe7mILTFdpcGLNuwYTTqz6Csuw9rzHtiw8YO00gOfxD
         WeWe86ZssYt/WafpNRcUCa7ymoqHzEnELytDawDQOWnWMsM/Drv/ey55P3hCqj1OHeBX
         9HKoeq+OLJ9s8SzWvGKJQVpW7xgmYa0m3Qg9mVPuB4Ome1gIaHfN4pb3T6RpvpkA+hAS
         5jWQ==
X-Gm-Message-State: AOJu0YxkHxbksQEbHbOp55RVJdfN6n3IirlJNkMggUi3Jpxk5E0jELg7
	+QE/FPWjafzStvdEE83D9uHpoDLUiQxBa3uoabz2YRg3Q6dR2fIDXB5QW5bNuGR7vwc8CtXbH1v
	9
X-Google-Smtp-Source: AGHT+IHrm1Ok7e1tGMvLgtxKPn+GdKoxxK0rcGy5BpNkWAFsFVrJs1b0gEHgOo6/qf1GURM3PfmO9Q==
X-Received: by 2002:a17:906:f15a:b0:a3e:66b5:d65f with SMTP id gw26-20020a170906f15a00b00a3e66b5d65fmr4726665ejb.67.1708964728313;
        Mon, 26 Feb 2024 08:25:28 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] docs/sphinx: Start an FAQ, and add Kconfig/CET details
Date: Mon, 26 Feb 2024 16:25:27 +0000
Message-Id: <20240226162527.1247421-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is long overdue, and we need to start somewhere.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 docs/faq.rst      | 71 +++++++++++++++++++++++++++++++++++++++++++++++
 docs/glossary.rst | 15 ++++++++++
 docs/index.rst    |  1 +
 3 files changed, 87 insertions(+)
 create mode 100644 docs/faq.rst

diff --git a/docs/faq.rst b/docs/faq.rst
new file mode 100644
index 000000000000..75cd70328a5c
--- /dev/null
+++ b/docs/faq.rst
@@ -0,0 +1,71 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Frequently Asked Questions
+==========================
+
+How do I...
+-----------
+
+... check whether a Kconfig option is active?
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+  Kconfig is a build time configuration system, combining inherent knowledge,
+  the capabilities of the toolchain, and explicit user choice to form a
+  configuration of a build of Xen.
+
+  A file, by default ``.config``, is produced by the build identifying the
+  configuration used.  Kconfig symbols all start with ``CONFIG_``, and come in
+  a variety of types including strings, integers and booleans.  Booleans are
+  the most common, and when active are expressed with ``...=y``.  e.g.::
+
+    xen.git/xen$ grep CONFIG_FOO .config
+    CONFIG_FOO_BOOLEAN=y
+    CONFIG_FOO_STRING="lorem ipsum"
+    CONFIG_FOO_INTEGER=42
+
+  Symbols which are either absent, or expressed as ``... is not set`` are
+  disabled.  e.g.::
+
+    xen.git/xen$ grep CONFIG_BAR .config
+    # CONFIG_BAR is not set
+
+  Builds of Xen configured with ``CONFIG_HYPFS_CONFIG=y`` embed their own
+  ``.config`` at build time, and can provide it to the :term:`control domain`
+  upon requested.  e.g.::
+
+    [root@host ~]# xenhypfs cat /buildinfo/config | grep -e FOO -e BAR
+    CONFIG_FOO=y
+    # CONFIG_BAR is not set
+
+
+... tell if CET is active?
+^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+  Control-flow Enforcement Technology support was added to Xen 4.14.  It is
+  build time conditional, dependent on both having a new-enough toolchain and
+  an explicit Kconfig option, and also requires capable hardware.  See
+  :term:`CET`.
+
+  For CET-SS, Shadow Stacks, the minimum toolchain requirements are ``binutils
+  >= 2.29`` or ``LLVM >= 6``.  No specific compiler support is required.
+  Check for ``CONFIG_XEN_SHSTK`` being active.
+
+  For CET-IBT, Indirect Branch Tracking, the minimum toolchain requirements
+  are ``GCC >= 9`` and ``binutils >= 2.29``.  Xen relies on a compiler feature
+  which is specific to GCC at the time of writing.  Check for
+  ``CONFIG_XEN_IBT`` being active.
+
+  If a capable Xen with booted on capable hardware, and CET is not disabled by
+  command line option or errata, Xen will print some details early on boot
+  about which CET facilities have been turned on::
+
+    ...
+    (XEN) CPU Vendor: Intel, Family 6 (0x6), Model 143 (0x8f), Stepping 8 (raw 000806f8)
+    (XEN) Enabling Supervisor Shadow Stacks
+    (XEN) Enabling Indirect Branch Tracking
+    (XEN)   - IBT disabled in UEFI Runtime Services
+    (XEN) EFI RAM map:
+    ...
+
+  This can be obtained from the control domain with ``xl dmesg``, but remember
+  to confirm that the console ring hasn't wrapped.
diff --git a/docs/glossary.rst b/docs/glossary.rst
index 8ddbdab160a1..6adeec77e14c 100644
--- a/docs/glossary.rst
+++ b/docs/glossary.rst
@@ -28,6 +28,21 @@ Glossary
      single instance of Xen, used as the identifier in various APIs, and is
      typically allocated sequentially from 0.
 
+   CET
+     Control-flow Enforcement Technology is a facility in x86 CPUs for
+     defending against memory safety vulnerabilities.  It is formed of two
+     independent features:
+
+     * CET-SS, Shadow Stacks, are designed to protect against Return Oriented
+       Programming (ROP) attacks.
+
+     * CET-IBT, Indirect Branch Tracking, is designed to protect against Call
+       or Jump Oriented Programming (COP/JOP) attacks.
+
+     Intel support CET-SS and CET-IBT from the Tiger Lake (Client, 2020) and
+     Sapphire Rapids (Server, 2023) CPUs.  AMD support only CET-SS, starting
+     with Zen3 (Both client and server, 2020) CPUs.
+
    guest
      The term 'guest' has two different meanings, depending on context, and
      should not be confused with :term:`domain`.
diff --git a/docs/index.rst b/docs/index.rst
index 22fdde80590c..ab051a0f3833 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -72,4 +72,5 @@ Miscellanea
 
 .. toctree::
 
+   faq
    glossary

base-commit: 60e00f77a5cc671d30c5ef3318f5b8e9b74e4aa3
-- 
2.30.2



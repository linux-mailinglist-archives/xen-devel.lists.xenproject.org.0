Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457C12A8552
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 18:53:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19960.45499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kajQz-0000Kd-UZ; Thu, 05 Nov 2020 17:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19960.45499; Thu, 05 Nov 2020 17:52:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kajQz-0000KE-Qi; Thu, 05 Nov 2020 17:52:29 +0000
Received: by outflank-mailman (input) for mailman id 19960;
 Thu, 05 Nov 2020 17:52:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWoZ=EL=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kajQy-0000K9-GG
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 17:52:28 +0000
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02f3b7a5-5495-46fd-b349-d5c92d25a256;
 Thu, 05 Nov 2020 17:52:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g12so2774371wrp.10
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 09:52:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a185sm3323029wmf.24.2020.11.05.09.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 09:52:15 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 154F51FF9D;
 Thu,  5 Nov 2020 17:51:55 +0000 (GMT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aWoZ=EL=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
	id 1kajQy-0000K9-GG
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 17:52:28 +0000
X-Inumbo-ID: 02f3b7a5-5495-46fd-b349-d5c92d25a256
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 02f3b7a5-5495-46fd-b349-d5c92d25a256;
	Thu, 05 Nov 2020 17:52:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g12so2774371wrp.10
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 09:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PWX79l8aK71+AYI8WeJL1C20BLKUbqb3b0w9LAzwhV8=;
        b=sKuBjdxgzO5u9D8pgwF/tGU3Jl9e9kVQLXkjUZin+MoLsmfLdqrVeqhqiki4zrHNmt
         5hy7oStzIxiY+o16gdITJ6d17aQlrLazLaOKd1So+BBwfe/FRh1q20LBPkyH1CYBKIBc
         89BFyfERsJdvAKbEqLP1/bDRte++Si1BFXcV5wA53Yg3P8t5AiT8ptxNXg/9K4dFdUJ5
         sPXa8twvD5cGmJ5dvqqFdwnTja/ybh6DzAOswcsvh1WULOZk8Tif6W1wiM9fUjihlpqK
         kiMe6f4QE/wGEOHChHWXznLNi+6OKoDNmYdzcJDS8aOMnUWcpxcWrDD/Hk5hUq8sEImR
         ikkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PWX79l8aK71+AYI8WeJL1C20BLKUbqb3b0w9LAzwhV8=;
        b=l93Kg90nRJu20jRooqwyZ1DWg2j8+W76gO7/wzUC/XaNcmycjpcBJjiY6XPFw1Drc3
         dV+gVXYxGD2j+PWCWPWzI34+5L/K0K4+qj9gfSJ3Yzu0GeLvXgOskohu+QqxVJEImHb4
         UdjKbX1C9rZWCqkO93ojH484gGHIQrfOgT1r3jePnVt1YCVBtwGiKp+lanGUGWYUlniF
         QqZL747Rfr7zBCiDfBcm86NIE9K/XjPlpWooPYpkH4E+2+tGICFl/p60NWNKWLh3Bmpi
         8XcwlW7okmvSbE6ZgemwSy6eVv1CQCTGYZBeOqzP8XmpIyRGW5HGQq8moEl1P1StewJ2
         CCNQ==
X-Gm-Message-State: AOAM5308b1ppuTNkXw20n0dTnqp1wqeiPYYlqCXTJp8fmhSmVnWnoEQh
	wij/AW6Fs7z1S/Xm40gLaBzXnA==
X-Google-Smtp-Source: ABdhPJykPmP1sXUte37eZYccOK8QD1oW46dCne80dIEM79/5lUgUNgxRnHI2ok44wyDkI60skFiMrA==
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr4588066wrn.73.1604598746349;
        Thu, 05 Nov 2020 09:52:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a185sm3323029wmf.24.2020.11.05.09.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 09:52:15 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 154F51FF9D;
	Thu,  5 Nov 2020 17:51:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: julien@xen.org,
	stefano.stabellini@linaro.org,
	stefano.stabellini@xilinx.com,
	masami.hiramatsu@linaro.org,
	takahiro.akashi@linaro.org,
	andre.przywara@arm.com,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [RFC PATCH  14/15] xen: only build HVM support under CONFIG_XEN_HVM
Date: Thu,  5 Nov 2020 17:51:52 +0000
Message-Id: <20201105175153.30489-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201105175153.30489-1-alex.bennee@linaro.org>
References: <20201105175153.30489-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When running on non-x86 systems there is no point building HVM support
because we will never see such things. To achieve this we need to
shuffle a little bit of the inline and other stubs about.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/sysemu/xen-mapcache.h |  2 +-
 include/sysemu/xen.h          |  9 +++++----
 accel/stubs/xen-all-stub.c    | 11 +++++++++++
 accel/stubs/xen-stub.c        |  2 --
 accel/stubs/meson.build       |  3 ++-
 hw/i386/xen/meson.build       |  2 +-
 6 files changed, 20 insertions(+), 9 deletions(-)
 create mode 100644 accel/stubs/xen-all-stub.c

diff --git a/include/sysemu/xen-mapcache.h b/include/sysemu/xen-mapcache.h
index c8e7c2f6cf..4bba764745 100644
--- a/include/sysemu/xen-mapcache.h
+++ b/include/sysemu/xen-mapcache.h
@@ -13,7 +13,7 @@
 
 typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
                                          ram_addr_t size);
-#ifdef CONFIG_XEN
+#ifdef CONFIG_XEN_HVM
 
 void xen_map_cache_init(phys_offset_to_gaddr_t f,
                         void *opaque);
diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
index 0ca25697e4..43d2314441 100644
--- a/include/sysemu/xen.h
+++ b/include/sysemu/xen.h
@@ -24,7 +24,7 @@ extern bool xen_allowed;
 
 #define xen_enabled()           (xen_allowed)
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_XEN_HVM
 void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
                    struct MemoryRegion *mr, Error **errp);
@@ -33,7 +33,10 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
 #else /* !CONFIG_XEN_IS_POSSIBLE */
 
 #define xen_enabled() 0
-#ifndef CONFIG_USER_ONLY
+
+#endif /* CONFIG_XEN_IS_POSSIBLE */
+
+#if !defined(CONFIG_XEN_HVM) && !defined(CONFIG_USER_ONLY)
 static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
 {
     /* nothing */
@@ -45,6 +48,4 @@ static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
 }
 #endif
 
-#endif /* CONFIG_XEN_IS_POSSIBLE */
-
 #endif
diff --git a/accel/stubs/xen-all-stub.c b/accel/stubs/xen-all-stub.c
new file mode 100644
index 0000000000..597c5789cc
--- /dev/null
+++ b/accel/stubs/xen-all-stub.c
@@ -0,0 +1,11 @@
+/*
+ * Copyright (C) 2014       Citrix Systems UK Ltd.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/xen.h"
+
+bool xen_allowed;
diff --git a/accel/stubs/xen-stub.c b/accel/stubs/xen-stub.c
index 7054965c48..6bc9906239 100644
--- a/accel/stubs/xen-stub.c
+++ b/accel/stubs/xen-stub.c
@@ -9,8 +9,6 @@
 #include "sysemu/xen.h"
 #include "qapi/qapi-commands-migration.h"
 
-bool xen_allowed;
-
 void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
 {
 }
diff --git a/accel/stubs/meson.build b/accel/stubs/meson.build
index d65cb6a5e1..dca468c82a 100644
--- a/accel/stubs/meson.build
+++ b/accel/stubs/meson.build
@@ -1,7 +1,8 @@
 softmmu_stub_ss = ss.source_set()
 
 softmmu_stub_ss.add(when: 'CONFIG_HAX', if_false: files('hax-stub.c'))
-softmmu_stub_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
+softmmu_stub_ss.add(when: 'CONFIG_XEN', if_false: files('xen-all-stub.c'))
+softmmu_stub_ss.add(when: 'CONFIG_XEN_HVM', if_false: files('xen-stub.c'))
 softmmu_stub_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 softmmu_stub_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
 
diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
index be84130300..576e2cc5dc 100644
--- a/hw/i386/xen/meson.build
+++ b/hw/i386/xen/meson.build
@@ -1,4 +1,4 @@
-i386_ss.add(when: 'CONFIG_XEN', if_true: files(
+i386_ss.add(when: 'CONFIG_XEN_HVM', if_true: files(
   'xen-hvm.c',
   'xen-mapcache.c',
   'xen_apic.c',
-- 
2.20.1



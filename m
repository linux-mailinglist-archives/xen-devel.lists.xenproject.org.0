Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E9923B60A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 09:49:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2rhh-0000q4-9H; Tue, 04 Aug 2020 07:49:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bOER=BO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1k2rhf-0000oD-QR
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 07:49:43 +0000
X-Inumbo-ID: 0dbe3268-d627-11ea-b019-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0dbe3268-d627-11ea-b019-12813bfff9fa;
 Tue, 04 Aug 2020 07:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596527380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DubP2PHuYgedFkG9BnFDW3kZHoveZWoPNSRntSxbcE8=;
 b=FRrLbNDcNESAr3BrAdeaqKi+fWMIIpzBObhlZYG720/hCO9olaIfpRD1eHgcweu0aiZrXo
 kuuxqi2eJCpKU9s6UkGg8joxtM2dw4nOaidwqzylbGq26Idcizxjtn8hOJXWzgEehqfLI4
 enCuNz74v8HlUkkZSNWgiH83wB5yllQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-VYg0lAgLOdasHuA7fw8ezA-1; Tue, 04 Aug 2020 03:49:38 -0400
X-MC-Unique: VYg0lAgLOdasHuA7fw8ezA-1
Received: by mail-wm1-f72.google.com with SMTP id h205so923329wmf.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 00:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DubP2PHuYgedFkG9BnFDW3kZHoveZWoPNSRntSxbcE8=;
 b=nWrzi+B5GDLNeHMQnTeDqsRx9htuYXJyUTRyTzpmwfPJO5Yz/nt75/3wHE9zXNxcCP
 8/O8QKIByPMML11UIliGpp+EWU2oq9sIZzM/OchKJJyfo2PVY2B0GNC37XgEM2Cf9vbZ
 ratGwkVq1lqzcNCLLem/ayCebzgu9wKtWzqhM49j2g2EpJ+Eq7Z3tV5CeVxeqwbXLc36
 6JiFoKnY15qGNLyeNAZCXzLi+s4PIPxstYI71tt3JLqdhIqGEwEdlpyn/Z18TcekGrB9
 GMXoshPbhGPPhJLxrdA/pPb5n8Jq46InWFGfIuXxROTmbEsGCABUBtTbYJ5o2Fjt6qoi
 aMLA==
X-Gm-Message-State: AOAM532XsW4sx3lOig29HyLgBluHdaM2d+LIg8BU50C2LbTiNcgf6XrZ
 sNdMT39yDhZQnovuRP1p6ijlVNCeSAn18aOhNiO8UWfvO8pE8+NZROaSWahzdRHzp8YGBucONqD
 lzbXTVwQ4FcpzlhHx2LIQaQKRGP8=
X-Received: by 2002:a1c:7e02:: with SMTP id z2mr2831211wmc.138.1596527377724; 
 Tue, 04 Aug 2020 00:49:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNZ4uQ4vB8a5aJh7I4ZPsgC9K6vuCsuWWzRpjP2pDwPhZtBykcSfO33F9dwpNAm2EMiOXt+A==
X-Received: by 2002:a1c:7e02:: with SMTP id z2mr2831191wmc.138.1596527377467; 
 Tue, 04 Aug 2020 00:49:37 -0700 (PDT)
Received: from localhost.localdomain (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id 8sm30384185wrl.7.2020.08.04.00.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 00:49:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v2 1/1] accel/xen: Fix xen_enabled() behavior on
 target-agnostic objects
Date: Tue,  4 Aug 2020 09:49:30 +0200
Message-Id: <20200804074930.13104-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200804074930.13104-1-philmd@redhat.com>
References: <20200804074930.13104-1-philmd@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Paul Durrant <pdurrant@amazon.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CONFIG_XEN is generated by configure and stored in "config-target.h",
which is (obviously) only include for target-specific objects.
This is a problem for target-agnostic objects as CONFIG_XEN is never
defined and xen_enabled() is always inlined as 'false'.

Fix by following the KVM schema, defining CONFIG_XEN_IS_POSSIBLE
when we don't know to force the call of the non-inlined function,
returning the xen_allowed boolean.

Fixes: da278d58a092 ("accel: Move Xen accelerator code under accel/xen/")
Reported-by: Paul Durrant <pdurrant@amazon.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/xen.h   | 18 ++++++++++++++----
 accel/stubs/xen-stub.c |  2 ++
 accel/xen/xen-all.c    |  7 +------
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
index 1ca292715e..2c2c429ea8 100644
--- a/include/sysemu/xen.h
+++ b/include/sysemu/xen.h
@@ -8,9 +8,19 @@
 #ifndef SYSEMU_XEN_H
 #define SYSEMU_XEN_H
 
-#ifdef CONFIG_XEN
+#ifdef NEED_CPU_H
+# ifdef CONFIG_XEN
+#  define CONFIG_XEN_IS_POSSIBLE
+# endif
+#else
+# define CONFIG_XEN_IS_POSSIBLE
+#endif
 
-bool xen_enabled(void);
+#ifdef CONFIG_XEN_IS_POSSIBLE
+
+extern bool xen_allowed;
+
+#define xen_enabled()           (xen_allowed)
 
 #ifndef CONFIG_USER_ONLY
 void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
@@ -18,7 +28,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
                    struct MemoryRegion *mr, Error **errp);
 #endif
 
-#else /* !CONFIG_XEN */
+#else /* !CONFIG_XEN_IS_POSSIBLE */
 
 #define xen_enabled() 0
 #ifndef CONFIG_USER_ONLY
@@ -33,6 +43,6 @@ static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
 }
 #endif
 
-#endif /* CONFIG_XEN */
+#endif /* CONFIG_XEN_IS_POSSIBLE */
 
 #endif
diff --git a/accel/stubs/xen-stub.c b/accel/stubs/xen-stub.c
index dcca4e678a..8ae658acff 100644
--- a/accel/stubs/xen-stub.c
+++ b/accel/stubs/xen-stub.c
@@ -9,6 +9,8 @@
 #include "hw/xen/xen.h"
 #include "qapi/qapi-commands-misc.h"
 
+bool xen_allowed;
+
 void xenstore_store_pv_console_info(int i, Chardev *chr)
 {
 }
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 0c24d4b191..60b971d0a8 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -32,12 +32,7 @@
     do { } while (0)
 #endif
 
-static bool xen_allowed;
-
-bool xen_enabled(void)
-{
-    return xen_allowed;
-}
+bool xen_allowed;
 
 xc_interface *xen_xc;
 xenforeignmemory_handle *xen_fmem;
-- 
2.21.3



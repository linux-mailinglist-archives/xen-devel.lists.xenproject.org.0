Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A69E7E9FCC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:21:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631697.985315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Yl0-0007tC-8a; Mon, 13 Nov 2023 15:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631697.985315; Mon, 13 Nov 2023 15:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Yl0-0007qi-56; Mon, 13 Nov 2023 15:21:46 +0000
Received: by outflank-mailman (input) for mailman id 631697;
 Mon, 13 Nov 2023 15:21:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DPbO=G2=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2Yky-0007fE-NM
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:21:44 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59b59792-8238-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 16:21:43 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9e2838bcb5eso672348266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 07:21:43 -0800 (PST)
Received: from m1x-phil.lan ([176.164.221.204])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a17090648d100b009e6cedc8bf5sm4165051ejt.29.2023.11.13.07.21.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Nov 2023 07:21:42 -0800 (PST)
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
X-Inumbo-ID: 59b59792-8238-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888902; x=1700493702; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAZk+3Dse8rl86kxKUGHVuPZUfUpHgJaPljFBSi46HI=;
        b=Dm8Bg4/Mn5BSImYcP7u268GzoYOpZ1eZIVw/97Bznf6cFTLfTTXaRmeh8ZwQpYHhhx
         +G/hBe2xuvlD/bSQhEFdmG12qmj95r1uNzhDIw1cTBxmuXtZzlPPzY/TKKpaan3dZaDJ
         ImkcrfTyRFTFVKZCYSGnuRGj6qyDoJht2X0cWNPQIZ6dFCy949qHjIgL4O07VW0uN+aK
         TZtL+zKce2cCoHHybUi2KQoBpA8KHTudwpyxi7Wk/d3/+FfPv882VuVJ9Oc/ioAXTTt7
         GRM8vIeew4iRaA6mpUqR2hZqCfTNHIjdOldhd1e9OM/XhXj59nfK+OKuoVoku9MGanQb
         bNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888902; x=1700493702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAZk+3Dse8rl86kxKUGHVuPZUfUpHgJaPljFBSi46HI=;
        b=kewo1LXzFGtQ/9hOS/0nzbMyetZNLjY1XNSe1E2uCtsvnCirXvZixTS9+I1qlkSw5R
         hyMyW2H4xcwRxou4Z1mklVE7ADIqOYfbFQL9HjP8Ci4H5xof11eU//ZRCfyyVsJMetcl
         25yKskKFAttFTtEpBEvYo730FNNxSlQHYeMoiJkfvRqI4+ik49RIRiYw2HXoVH1ISW4s
         UXBrvCPLY0d8jTw9xNINvAgUJlzmMJodtvcL84EsxeA0cHkaMN7xsZxk9SR1o282ji7d
         lZmcv1MBg+83Nsdf0YHYTJzUYKfyeBO4vJFqqPhPueTrvjPCOHxByZAWLwb/y5MCpdYI
         4HkA==
X-Gm-Message-State: AOJu0YwTmj2lU2OimpivH34hLp59vUUja2fCEhiEafOHHQU1RFu0gDJ9
	hmQWHMjAsOE+MDWOHYf0XO9RSg==
X-Google-Smtp-Source: AGHT+IGj6dXGN5MguahUCcbomoo2q2R5bpml51YnyeqNpSNRHHGNbaVXW8b4IH/nqJe1/joi6MIM1w==
X-Received: by 2002:a17:906:84c:b0:9ae:6da8:1819 with SMTP id f12-20020a170906084c00b009ae6da81819mr4194118ejd.48.1699888902783;
        Mon, 13 Nov 2023 07:21:42 -0800 (PST)
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
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 04/10] hw/xen: Factor xen_arch_align_ioreq_data() out of handle_ioreq()
Date: Mon, 13 Nov 2023 16:21:07 +0100
Message-ID: <20231113152114.47916-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Per commit f17068c1c7 ("xen-hvm: reorganize xen-hvm and move common
function to xen-hvm-common"), handle_ioreq() is expected to be
target-agnostic. However it uses 'target_ulong', which is a target
specific definition.

In order to compile this file once for all targets, factor the
target-specific code out of handle_ioreq() as a per-target handler
called xen_arch_align_ioreq_data().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Should we have a 'unsigned qemu_target_long_bits();' helper
such qemu_target_page_foo() API and target_words_bigendian()?
---
 include/hw/xen/xen-hvm-common.h | 1 +
 hw/arm/xen_arm.c                | 8 ++++++++
 hw/i386/xen/xen-hvm.c           | 8 ++++++++
 hw/xen/xen-hvm-common.c         | 5 +----
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 27e938d268..734bfa3183 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -97,6 +97,7 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
 
 void cpu_ioreq_pio(ioreq_t *req);
 
+void xen_arch_align_ioreq_data(ioreq_t *req);
 void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
 void xen_arch_set_memory(XenIOState *state,
                          MemoryRegionSection *section,
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 6a1d7719e9..c646fd70d0 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -128,6 +128,14 @@ static void xen_init_ram(MachineState *machine)
     }
 }
 
+void xen_arch_align_ioreq_data(ioreq_t *req)
+{
+    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE)
+            && (req->size < sizeof(target_ulong))) {
+        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
+    }
+}
+
 void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req)
 {
     hw_error("Invalid ioreq type 0x%x\n", req->type);
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index f8a195270a..aff5c5b81d 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -699,6 +699,14 @@ void xen_arch_set_memory(XenIOState *state, MemoryRegionSection *section,
     }
 }
 
+void xen_arch_align_ioreq_data(ioreq_t *req)
+{
+    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE)
+            && (req->size < sizeof(target_ulong))) {
+        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
+    }
+}
+
 void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req)
 {
     switch (req->type) {
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index c028c1b541..03f9417e7e 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -426,10 +426,7 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
     trace_handle_ioreq(req, req->type, req->dir, req->df, req->data_is_ptr,
                        req->addr, req->data, req->count, req->size);
 
-    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
-            (req->size < sizeof (target_ulong))) {
-        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
-    }
+    xen_arch_align_ioreq_data(req);
 
     if (req->dir == IOREQ_WRITE)
         trace_handle_ioreq_write(req, req->type, req->df, req->data_is_ptr,
-- 
2.41.0



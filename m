Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C66832A59
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 14:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669037.1041622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQorn-0005mT-7e; Fri, 19 Jan 2024 13:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669037.1041622; Fri, 19 Jan 2024 13:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQorn-0005jv-3h; Fri, 19 Jan 2024 13:25:03 +0000
Received: by outflank-mailman (input) for mailman id 669037;
 Fri, 19 Jan 2024 13:25:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NYCc=I5=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1rQork-0005H3-W0
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 13:25:00 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24bdcc89-b6ce-11ee-9b0f-b553b5be7939;
 Fri, 19 Jan 2024 14:24:59 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55a43f9a6c1so759207a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 05:24:59 -0800 (PST)
Received: from localhost.localdomain (adsl-138.37.6.1.tellas.gr. [37.6.1.138])
 by smtp.gmail.com with ESMTPSA id
 b11-20020aa7dc0b000000b00558fc426affsm8568310edu.88.2024.01.19.05.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 05:24:58 -0800 (PST)
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
X-Inumbo-ID: 24bdcc89-b6ce-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705670699; x=1706275499; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfuQXxmvX9JAP4TN/xfu2dZ/IwBEFTowVO1pKbfDK8M=;
        b=AudWNYIX0EFJ4nKLpl/fYnsBq54ikKaLIxlSjWPmwsVENckm7gjMJ7dH61FnH+oLSc
         FY5BUaxeFfjog+UKg2X8pt1UBFPStmBEI4zHJZ/86GQUqo2Rq3c6vmWufca3T0NNhooD
         lUuaHIs5KnBXZOoy+zJ01tGLpCNLHbeQ6I4aYjlJOQ/ec9A1UoouK07UEgZFzmlOYreU
         9fX3CqtreFzu9kAB0piwK8dn6ySGl4leT9tJcDOlJf76V/nt0cRWYEVL1yBaeQw/2MCX
         HZiy0DcYf5Vc3at46wU7xbHrCEo0r777ngXVrLKboeM+nVziGOOVvgGfkIvFZizrN9gl
         zl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705670699; x=1706275499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfuQXxmvX9JAP4TN/xfu2dZ/IwBEFTowVO1pKbfDK8M=;
        b=TKjM0QCX+CmxGVnf8i/qjW0smo5dupacDCDAR9VY4aoOAhMkt2qJu2F73PKWLEjIiA
         rRmi74ESXuUqFAG6z+4M+PO1T/2esoAqNlI7YGAyyfTZAKC94pZmra6hdqaqN/bnBvXY
         zQcQQaeIZB+4Zq3JRpnHW0Kg2WMTeUuGPToYA2/NIbcOfdHz3VzHzZYN/z7vgbxyL5rY
         JcuEq3JJhQI33u8yavPpei6zNu8t+DdQ276AT8maSFUjGEQhWPE+plUZS2fRdTTQ18H+
         zxl0DJpaWXWN6/a6k5RswmWmdsmCv3B0aL9lW/ZFKffmn4RBQBIMKAB3sCv/B+qpazUn
         Nrnw==
X-Gm-Message-State: AOJu0YwZ+zI6lq05RrN2qDohQfSi/6/jkETeO0uDRX1QmS44X432qwhd
	2tW1hWAyKAStMTc/kZo6HGHSwdlVDg3+uMqJdQclkDml+XShtqdUP+/mjTDZoWHuo2lufCQUACv
	RDjc=
X-Google-Smtp-Source: AGHT+IGSoNv5INVnSqko5OrH7zTf+jb7pBx9jX4flwfLWo+bpMWVQxBgd75egqiSm83wZgZZW9SGQA==
X-Received: by 2002:a05:6402:c16:b0:55a:6086:7e1e with SMTP id co22-20020a0564020c1600b0055a60867e1emr457236edb.75.1705670698789;
        Fri, 19 Jan 2024 05:24:58 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 5/5] hw/xen: convert stderr prints to error/warn reports
Date: Fri, 19 Jan 2024 15:24:47 +0200
Message-Id: <bf5504369023dc115f0d7a756c4c5254fa9cd10d.1705670342.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705670342.git.manos.pitsidianakis@linaro.org>
References: <cover.1705670342.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit

According to the QEMU Coding Style document:

> Do not use printf(), fprintf() or monitor_printf(). Instead, use
> error_report() or error_vreport() from error-report.h. This ensures the
> error is reported in the right place (current monitor or stderr), and in
> a uniform format.
> Use error_printf() & friends to print additional information.

This commit changes fprintfs that report warnings and errors to the
appropriate report functions.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/xen/xen-hvm-common.c | 12 ++++++------
 hw/xen/xen-mapcache.c   |  5 ++---
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 05a29c6f11..baa1adb9f2 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -20,8 +20,8 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
 
     if (runstate_check(RUN_STATE_INMIGRATE)) {
         /* RAM already populated in Xen */
-        fprintf(stderr, "%s: do not alloc "RAM_ADDR_FMT
-                " bytes of ram at "RAM_ADDR_FMT" when runstate is INMIGRATE\n",
+        warn_report("%s: do not alloc "RAM_ADDR_FMT
+                " bytes of ram at "RAM_ADDR_FMT" when runstate is INMIGRATE",
                 __func__, size, ram_addr);
         return;
     }
@@ -552,9 +552,9 @@ static void cpu_handle_ioreq(void *opaque)
         req->data = copy.data;
 
         if (req->state != STATE_IOREQ_INPROCESS) {
-            fprintf(stderr, "Badness in I/O request ... not in service?!: "
+            warn_report("Badness in I/O request ... not in service?!: "
                     "%x, ptr: %x, port: %"PRIx64", "
-                    "data: %"PRIx64", count: %u, size: %u, type: %u\n",
+                    "data: %"PRIx64", count: %u, size: %u, type: %u",
                     req->state, req->data_is_ptr, req->addr,
                     req->data, req->count, req->size, req->type);
             destroy_hvm_domain(false);
@@ -758,9 +758,9 @@ void xen_shutdown_fatal_error(const char *fmt, ...)
     va_list ap;
 
     va_start(ap, fmt);
-    vfprintf(stderr, fmt, ap);
+    error_vreport(fmt, ap);
     va_end(ap);
-    fprintf(stderr, "Will destroy the domain.\n");
+    error_report("Will destroy the domain.");
     /* destroy the domain */
     qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_ERROR);
 }
diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 336c212376..4f956d048e 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -347,9 +347,8 @@ tryagain:
         MapCacheRev *reventry = g_new0(MapCacheRev, 1);
         entry->lock++;
         if (entry->lock == 0) {
-            fprintf(stderr,
-                    "mapcache entry lock overflow: "HWADDR_FMT_plx" -> %p\n",
-                    entry->paddr_index, entry->vaddr_base);
+            error_report("mapcache entry lock overflow: "HWADDR_FMT_plx" -> %p",
+                         entry->paddr_index, entry->vaddr_base);
             abort();
         }
         reventry->dma = dma;
-- 
γαῖα πυρί μιχθήτω



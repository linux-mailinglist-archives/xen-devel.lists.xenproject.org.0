Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95846840AED
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 17:11:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673019.1047115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUUE0-0004p7-MG; Mon, 29 Jan 2024 16:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673019.1047115; Mon, 29 Jan 2024 16:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUUE0-0004nK-JX; Mon, 29 Jan 2024 16:11:08 +0000
Received: by outflank-mailman (input) for mailman id 673019;
 Mon, 29 Jan 2024 16:11:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VQ+3=JH=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1rUUDz-0004XU-NA
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 16:11:07 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 022c3eae-bec1-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 17:11:07 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33ae3cc8a70so1534938f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 08:11:07 -0800 (PST)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 co6-20020a0560000a0600b0033af4df8e1esm1219957wrb.47.2024.01.29.08.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 08:11:06 -0800 (PST)
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
X-Inumbo-ID: 022c3eae-bec1-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706544666; x=1707149466; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+5SvWKJw3Pcq7y4wFA0yrN1E0wDdYRB5LHPrLR2R5E=;
        b=nfO0Iltf/90uCly2EGNLegLUG4DuRnoyQZJtOcM0+9ZEjC5wAhxjG02PVOLiSOptIi
         P+F8IYItn2CfDoOY8roC+065XEgvD9+GHVCotkqAzukhhcQH1//puBGHwexFOQ2iMrkC
         lTaAfv3ZGTTkMB1CTwC92Nrx/W4Y8A+5lbHCHEG9cxaLpite60l3VZSsCvJ8fF3aXowk
         8V2clhOiUY1jXLiMPxoK5890wFT+wfOWHoFQu4fqhn5gXNju0TXqA/K3lYeM+Z+pOtVW
         Wf6/0pwH5i/oqANcyEMzHDnqv5g22BU72IbumiqRukeRXu5rNWCJFQxucfTbKThgfGou
         SRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706544666; x=1707149466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+5SvWKJw3Pcq7y4wFA0yrN1E0wDdYRB5LHPrLR2R5E=;
        b=uuhtwSBCXvAeK4jI2P9SEiFQrn73Drjsse6folDDaKCWPyIFsFo1d10dpzf8wNN8ql
         TUbnDW4l663veXyOZvynGys+SURrrHn6bJb+tDkAdduwgvOR7W5ahVWrvjwIXaBy96pz
         6Phzwp1ZJVP5NIyCy5W3dI5E57QMfevq84Xa87GAUDpfaVC/dfd3Ic988k95aNVz2hQR
         eerWsVaRn1E48TxO69S7pI4aSULMyp4tZ756PiaXE8TOPDngBhYKzfPINQgrJRZBOrGN
         sRCgbENYKppyprjYii/MHuBiy8bJIp2bPlIeAIB/212J1N628n3pczJ9+xg+NK/EmnGQ
         9H0A==
X-Gm-Message-State: AOJu0YzwcFoQsbdaxdjpfoLmpeDu5TqDYzSvlm2WvVquXioMF7B/CfYR
	gyTblUdaUUwX9AH/SO8FmkEuyIhKr4S0IzHSCOXWYo0j6sQNsz0ZpAnXNi5i7aQ=
X-Google-Smtp-Source: AGHT+IGZtrvB+zkUJjsAVGqIveytOHVyHqI8Q/vjlorX6vfjVFxTfYDnogBdEEvF9xxE2lcmt0PKdw==
X-Received: by 2002:adf:cc91:0:b0:33a:f340:d09d with SMTP id p17-20020adfcc91000000b0033af340d09dmr1784015wrj.49.1706544666613;
        Mon, 29 Jan 2024 08:11:06 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: peter.maydell@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 6/6] hw/xen: convert stderr prints to error/warn reports
Date: Mon, 29 Jan 2024 18:09:42 +0200
Message-Id: <42a8953553cf68e8bacada966f93af4fbce45919.1706544115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
References: <cover.1706544115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

According to the QEMU Coding Style document:

> Do not use printf(), fprintf() or monitor_printf(). Instead, use
> error_report() or error_vreport() from error-report.h. This ensures the
> error is reported in the right place (current monitor or stderr), and in
> a uniform format.
> Use error_printf() & friends to print additional information.

This commit changes fprintfs that report warnings and errors to the
appropriate report functions.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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



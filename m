Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B3398A840
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807459.1218955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI5X-0006ij-4s; Mon, 30 Sep 2024 15:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807459.1218955; Mon, 30 Sep 2024 15:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI5X-0006fL-1z; Mon, 30 Sep 2024 15:13:27 +0000
Received: by outflank-mailman (input) for mailman id 807459;
 Mon, 30 Sep 2024 15:13:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdoV=Q4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svI5V-0006B5-Bx
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:13:25 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88c7501b-7f3e-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 17:13:23 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53994aadb66so1118189e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:13:23 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5398fd3533asm677366e87.133.2024.09.30.08.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 08:13:22 -0700 (PDT)
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
X-Inumbo-ID: 88c7501b-7f3e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727709202; x=1728314002; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQPlcp4J7UY3xUa4Yir9mgOyu5m5demVYWlTB9RFCqs=;
        b=VgYi9AocfmVJPJvAB7FWqKnIL9MXsBbAzq+oZiH0U208luttz3sIz0JrYUSddSOWql
         XjCy0Tt8cXnyggaW8wIJfxWLhyfe3V6AarQCtlwPphvZdXxR9kk3XFem3pL5nnbB0HNr
         EK9JhDbg2fjZHkrpk1Kgdc/WWYQVZFKAV5TkEzV0YSphbN6FY7/p2kghpje7KSb2lAz8
         xL6E1mQOiIFrv21qQi05JIncCC9clUHvpP+HcVZWlw8ad+ZFBLIGV90VKIPvJ0HAt+bM
         HN47V1v9xJOBvPf+9xhVYpgTufQQRyNTwMTuVXpB+jwabfaoR4lXzo+e1p3zF7oE7+lc
         702w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727709202; x=1728314002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQPlcp4J7UY3xUa4Yir9mgOyu5m5demVYWlTB9RFCqs=;
        b=RzygBTpNL59U5kDyNS5Wgu4fuP+RT63uCu9z/7MPpD2vtUE7gu9hrQGENRRT8OG9dv
         i9JLCk0wMyrbIRBy3BT3bc0Hh8B1bGYPQ+6ajpcgdm74N9KEzm0h8ikH4k82lnuefdiv
         a54OcLcD8TAbutNZIcpF6h5rBV3vYih4WSoYgZtc1cXYektT7YSZk0D1sYgj0/DyKKWi
         9kNn3DplO2/yn2K2C02QD5ddrnRVlXMR3qVdJAxXPQVT0WR7YkmxKKNoRdw25ZdTN1Hv
         lrOkUBczn5nelU+ejls47VPQIj3LcOyRYLEn1FvRU33lVvvrVOCin1oQry1pxFqYOeq1
         2t6Q==
X-Gm-Message-State: AOJu0Yxq1xdsTx7YrDvs5x9WEAG48AObu76SXBCfn20w1pIPCPTEtwF1
	HJAygi67KGSC+xykJxMjsZzVOlKphgUTBnk5l7fdv2T8IUchKn/tJJep2g==
X-Google-Smtp-Source: AGHT+IEqsZoErr5jyG7/truV0AzL2SRFb19JmtQNA7qX3TFeC/odWGrlBjGHU1H4atjX8cBT4zrYyw==
X-Received: by 2002:a05:6512:281e:b0:539:93ef:9ed9 with SMTP id 2adb3069b0e04-53993efa007mr2253850e87.36.1727709202274;
        Mon, 30 Sep 2024 08:13:22 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 2/2] xen/riscv: parse and handle fdt command line
Date: Mon, 30 Sep 2024 17:13:18 +0200
Message-ID: <e914d15b82d2a28fcd1690dd68af9a61c4cb272e.1727708956.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727708956.git.oleksii.kurochko@gmail.com>
References: <cover.1727708956.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Receive Xen's command line passed by DTB using boot_fdt_cmdline()
and passed it to cmdline_parse() for further procesinng and setup
of Xen-specific parameters.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/setup.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index a8d8ef793d..0d1b52f8d0 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -29,6 +29,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     struct bootmodule *xen_bootmodule;
     size_t fdt_size;
+    const char *cmdline;
 
     remove_identity_mapping();
 
@@ -58,6 +59,10 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
     fdt_size = boot_fdt_info(device_tree_flattened, dtb_addr);
     BUG_ON(!fdt_size);
 
+    cmdline = boot_fdt_cmdline(device_tree_flattened);
+    printk("Command line: %s\n", cmdline);
+    cmdline_parse(cmdline);
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.46.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEAE998BA9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 17:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816300.1230511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syv85-00056Z-QR; Thu, 10 Oct 2024 15:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816300.1230511; Thu, 10 Oct 2024 15:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syv85-00054A-NL; Thu, 10 Oct 2024 15:31:05 +0000
Received: by outflank-mailman (input) for mailman id 816300;
 Thu, 10 Oct 2024 15:31:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Irsw=RG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1syv84-0004pC-EL
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 15:31:04 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a85d5f8e-871c-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 17:31:02 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5399041167cso1716089e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 08:31:02 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80f2593sm101640366b.215.2024.10.10.08.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 08:31:01 -0700 (PDT)
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
X-Inumbo-ID: a85d5f8e-871c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728574262; x=1729179062; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgHLb6a8rK9LRJcvDKwo/7FaVaC9VQAiF9qEPMZagfY=;
        b=KAc/DkXPT1WG3xAvM4PPthXPshsDz7zfHf4Ha1biBAxTFxsEsQl2RJA19eqWi9mbqQ
         dvI+PvtxaiIl5GGyXnR9q0Gb5FUmsu5yLfP+F/c5wdG+p65zdvTkOdzp0SqCa9tD0Bgi
         qFdJB2YrtPpHVyi09R7f+lOjBAkmRs+TSRzWJ7dxy0YEOeR5oDR811QSslqol6h1tNsn
         LHxShywJAhymgOWf4tKlwzGHeyBCjhTQaoKYMOwiHrbonr8qAXxSjusegzRQl16IjaSL
         ULYvm2sPe0mMwZmPmPW1T6Vg+d1g9kRalAWNW9OLSvPH0t7St0VBGAGawONTbCA62AbK
         XB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728574262; x=1729179062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgHLb6a8rK9LRJcvDKwo/7FaVaC9VQAiF9qEPMZagfY=;
        b=Py5Hmc+Us7M0RuyUS/OCCya998vt7GSK2Dk4sqcVpum4r4RyZyXjwvZux1iUo6QNnt
         U2/KwdsdvKsoOIht++aqWYVlk+K+tDsiXKVp8T595eMH2byJN98r6XgSjlT679FnroYb
         GypIWpZnReob5DMpcFKA/3H5/xeorxtX4TQGcTDeajugAr+kGVi52zAZ1cSiRVw6B5gR
         VU+EP37WII4K1fFrHfln7IqB5rXXUUIkKOMYAz3Du2BD4P6Kp/KjGBQwU+KTxpyXzfD9
         IJiKORZGB6JCP5fz5VqMPQoCDEhmbzlOZw9bGncN4PC+5+y7Kl2S/dRpibTdokm8nRlL
         iOzQ==
X-Gm-Message-State: AOJu0Yysqylko0eoAq8A8E5tb4u/2Mn/kiuv5XoBJax5Iw1KCa0CGRcH
	WIX6NQB63aD+ZwOZPDYjWF3BezlApzv+oo8B9uNN8fqeMKqR0WS5DNhKqw==
X-Google-Smtp-Source: AGHT+IHgD+hRPUqQynZLN31cD5Nst5OYteRZf41C8TZMwTcjOvt5ku+h5W/QnAbMqhofH07G9qf9oQ==
X-Received: by 2002:a05:6512:2216:b0:536:5625:511f with SMTP id 2adb3069b0e04-539c495264fmr6164034e87.45.1728574261574;
        Thu, 10 Oct 2024 08:31:01 -0700 (PDT)
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
Subject: [PATCH v2 2/2] xen/riscv: parse and handle fdt command line
Date: Thu, 10 Oct 2024 17:30:54 +0200
Message-ID: <3d5d646b052dd996d9ee83dfc0f6b13eab8231f3.1728481578.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <cover.1728481578.git.oleksii.kurochko@gmail.com>
References: <cover.1728481578.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Receive Xen's command line passed by DTB using boot_fdt_cmdline()
and passed it to cmdline_parse() for further procesinng and setup
of Xen-specific parameters.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V2:
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/setup.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index a345dbafeb..cd33fab6a0 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -27,6 +27,8 @@ unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
+    const char *cmdline;
+
     remove_identity_mapping();
 
     set_processor_id(0);
@@ -52,6 +54,10 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     BUG_ON(!boot_fdt_info(device_tree_flattened, dtb_addr));
 
+    cmdline = boot_fdt_cmdline(device_tree_flattened);
+    printk("Command line: %s\n", cmdline);
+    cmdline_parse(cmdline);
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.46.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F8E9ACF6F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 17:51:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824769.1238979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3de7-0006Mn-KS; Wed, 23 Oct 2024 15:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824769.1238979; Wed, 23 Oct 2024 15:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3de7-0006JN-HI; Wed, 23 Oct 2024 15:51:39 +0000
Received: by outflank-mailman (input) for mailman id 824769;
 Wed, 23 Oct 2024 15:51:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cWG=RT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t3de5-0005bd-UE
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 15:51:37 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af98d0cd-9156-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 17:51:37 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c9850ae22eso8794206a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 08:51:37 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912ee592sm493214466b.79.2024.10.23.08.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 08:51:35 -0700 (PDT)
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
X-Inumbo-ID: af98d0cd-9156-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729698696; x=1730303496; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyBwaOLFCgdNslW+ijXmTOFeKlk0y+Q5wJ9cIoxUkRA=;
        b=FOr230G5a5TK18y4jSS5vpoDrvJZEnTgwTxHA9YeuZ6AD1Piq1SVzCgWrkAfV0NjWl
         QnZhIWpeyl2lM+2RL7v2Uqev7IJ6VoM1wMda6CLdWopTITeqzMTe0g9bEqcdtc8B67u9
         fUr7+1KDt4bB0Yogqbaaajo6Syned++6ZRHIgF7FP282TvR50l28WWMu57nwc3V1kRVA
         V0xiU7zb2kUd6s3itL9CMDn+UjCovD4xAxJXd9Zj1DBAo6ziEzEE9lOJTAE/iBXO6+tQ
         +Rnzo8OI8NAXcoZGzyDcHiCWptGI0RqmrRqC532xwUyIwWl/yoZWTOeHF7gFxqN8q7uG
         jyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729698696; x=1730303496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyBwaOLFCgdNslW+ijXmTOFeKlk0y+Q5wJ9cIoxUkRA=;
        b=Zd2W4xystNr+n/axFfnTiMNMadEEP6XSTgeJ5RD8z4vbKTc/7fsnXYQBm1kJ87/AoN
         dzugegsnzR/Qj/dk+Xfs3yOzFUiKUbYnHxcVZ2J2mw6T3RdbCVp0XIMrw0kfdTgUNDHH
         2O8Thwj9pU0LB0nT+A2UblZX24sOFzzl6LXfuX7oS5YMMrG1gz8iBl+tat8u4eJexNUo
         NlHez5mi2c4lLAgCK9dL8JcPP2fGTvnWQgH70rgR6Y3l92j8Hk7sQHRD+qYFLMNITHxE
         UwJYG98mazOC1XxXKqXPOYvCAi2rmPb77lDqxs385U/HiGVhxUmSSiyfY7z4SWxZeHt4
         1xkQ==
X-Gm-Message-State: AOJu0YxB/qZ00LkVwCcmCu0YH0X6jRGjMbpqsOPtXN6ZWCR3tjvhvlTe
	+/eS/rhTReZIqgElFHxHrSVioo/iSLoJ+TIWNcJYrzNUDF3NSmuQJNUiUg==
X-Google-Smtp-Source: AGHT+IFR0DKvwk+yRKTHpgDVUpZ2peg9bCMsB1UnkX8Ai+O4dSBPWaMRSby8JjufyQYx5dy5AVosIA==
X-Received: by 2002:a17:907:1ca3:b0:a9a:6477:bd03 with SMTP id a640c23a62f3a-a9abf8a5023mr230107266b.38.1729698695787;
        Wed, 23 Oct 2024 08:51:35 -0700 (PDT)
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
Subject: [PATCH v2 3/3] xen/riscv: finalize boot allocator and transition to boot state
Date: Wed, 23 Oct 2024 17:50:24 +0200
Message-ID: <f54c3ee4288a23cd3275e156993acd893ac38a36.1729697111.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729697111.git.oleksii.kurochko@gmail.com>
References: <cover.1729697111.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a call to end_boot_allocator() in start_xen() to finalize the
boot memory allocator, moving free pages to the domain sub-allocator.

After initializing the memory subsystem, update `system_state` from
`SYS_STATE_early_boot` to `SYS_STATE_boot`, signifying the end of the
early boot phase.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Change in V2:
 - Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/setup.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 3652cb056d..9680332fee 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -65,6 +65,14 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     vm_init();
 
+    end_boot_allocator();
+
+    /*
+     * The memory subsystem has been initialized, we can now switch from
+     * early_boot -> boot.
+     */
+    system_state = SYS_STATE_boot;
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.47.0



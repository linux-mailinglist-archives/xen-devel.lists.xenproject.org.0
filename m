Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CB49C1D5C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 13:52:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832552.1247866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9OT8-0004jH-QR; Fri, 08 Nov 2024 12:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832552.1247866; Fri, 08 Nov 2024 12:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9OT8-0004h8-Mr; Fri, 08 Nov 2024 12:52:06 +0000
Received: by outflank-mailman (input) for mailman id 832552;
 Fri, 08 Nov 2024 12:52:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pwxj=SD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t9OT6-0004KV-RT
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 12:52:04 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f34b8f3-9dd0-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 13:52:01 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-539f8490856so2486272e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 04:52:01 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff179d1cd3sm6441261fa.94.2024.11.08.04.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 04:51:59 -0800 (PST)
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
X-Inumbo-ID: 3f34b8f3-9dd0-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzEiLCJoZWxvIjoibWFpbC1sZjEteDEzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNmMzRiOGYzLTlkZDAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDcwMzIxLjIxMzkyMywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731070320; x=1731675120; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RBOzLKW+Lk5l1HfU2OOOR0TzYe+7zWVSmx7Lwgwr/s=;
        b=bWkumRgq1DZ0Oud0NQW3xTJxwD/auyLXY3kaD6tB+zz3Ow0NE9bkoCbmL/18CzVXAF
         lDmvf5cFQ8FtTcwUMTfTp8lRMpi8ygNtSRro/re7l8unshWay3uI3GuLBSujrV60yyNH
         Cz5cdsYZ5SiNJa+Nyew4Q+AJgCHVRjCmpVBnSjAuFwo4w/ktsgmpoDfWR/A1NX27yd0N
         guI4NrRdJvWy2h7irx4SNPbvnaxj3Mgrqifn/PmyxOTA9+HQPrztVPVG9x/9Xeb0TIJZ
         zuhPmwu5K89By155WIYFg8CwFjHKCbEryHtMuURLEUzP8bz71Ft/+g83ogXXtNbVcQK3
         0lhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731070320; x=1731675120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RBOzLKW+Lk5l1HfU2OOOR0TzYe+7zWVSmx7Lwgwr/s=;
        b=L60VUO/m0f7n519daXKeTGLArOOkJ1jGxQldgOEvmIHoNFiwezjs7fhjf5Y8byhZ36
         /jvwdzn2nOnWeeAEELa0pFsZW9oxtF1rkvqvRdDK6iEN3uQwvm6g2Um6uVvHoAQjQ0Ea
         RS8VeZmHyGAVPCwZ+W+kDHXMI9zrBWmCaR53ykabAta/26oM2p0/ciAaMwnSZEcI/v1/
         0VQ+Jqi51sLtmQjxku/kTkIbhKwI8gw+Hayf4AAr4GGpL88wx413s5bBZ5d0OOJ2ZwEJ
         JptKNqJ8mQ+dUaUk5TimvUH/iEjIN3bOoQtCtz5ZCE9gs+ds3AxlR1pijEk77G41EyST
         XlMg==
X-Gm-Message-State: AOJu0YwLRB/ICHm2Bd57l2XBcp2ihBR6mawb7zdj5lFNUDdFHYjU9imf
	8D2uoCH2ZY9xJUbWJFtbLMK4sLKZni2qcEVChVQwFpcIjrEHq82qJWu6Z7vO
X-Google-Smtp-Source: AGHT+IEt4Wpy+8yhnbg3fv3FC8KTAT8VSu28ply8GZ5ZZMEFkWTs3sDKX+Upjulv1x3VR40ubLzh1w==
X-Received: by 2002:a05:651c:544:b0:2fb:6027:7c0a with SMTP id 38308e7fff4ca-2ff201e734amr12350001fa.8.1731070319976;
        Fri, 08 Nov 2024 04:51:59 -0800 (PST)
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
Subject: [PATCH v4 3/3] xen/riscv: finalize boot allocator and transition to boot state
Date: Fri,  8 Nov 2024 13:51:54 +0100
Message-ID: <f616818c38f65e0d59e9caa9bb922bf12238a109.1731069334.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731069334.git.oleksii.kurochko@gmail.com>
References: <cover.1731069334.git.oleksii.kurochko@gmail.com>
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
Change in V2-V4:
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



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0837A93B3B3
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764290.1174719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdy2-0007l3-Jz; Wed, 24 Jul 2024 15:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764290.1174719; Wed, 24 Jul 2024 15:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdy2-0007ig-GJ; Wed, 24 Jul 2024 15:31:50 +0000
Received: by outflank-mailman (input) for mailman id 764290;
 Wed, 24 Jul 2024 15:31:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJNX=OY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWdy0-0005Oj-Sc
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:31:48 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7640d8e-49d1-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 17:31:48 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ef2fbf1d14so10882981fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:31:48 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef2b568858sm13237311fa.35.2024.07.24.08.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 08:31:47 -0700 (PDT)
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
X-Inumbo-ID: d7640d8e-49d1-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835108; x=1722439908; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrU347Bqi/Mu5IIuJa5WjXX+En829gmjRRoMWLS+Csc=;
        b=ddiHMFdWMSCTVkB6zrwBLO0pHNn4qr00CnXV3VEJKfToXhQr336fQ2ec5PbDrz5pN9
         R8W9n0hmHBUcev7oWOeXptDnHOWHlkw1njkG+85wKhmt+u/yyLlzbGuagFV0b0RFlswn
         RQqszwu/MJxlYXKKjQTufDyFIrvH5k8IQidikbVvINTruESh0i5oSJC7bWU49mSmwNsz
         s+BBCVvia3jd8TkR9EjrKXXmzZN4H+Z4zammH9ghYMpI5Xh9KJBSELZXNbvYvfXXrUpp
         Tiu+0EFVn0gjK8gZXL9a0eaUV4dtqOJjQcxl1SSPUQ7xuGFLXaqs3nXl1rqg2xVLgvWL
         qTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835108; x=1722439908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CrU347Bqi/Mu5IIuJa5WjXX+En829gmjRRoMWLS+Csc=;
        b=H4oQyWtZ2maJPXu37rZBfgJyRC0Xgf405XGfatThrD+o93XbPUsovz2SfwNmbmUtJT
         sdamzgpqdMLr6LZ08+GjO1n9LTp3Y9jJs5dUp81zagGybDtm92czZGRpDGElHGBpZyvv
         ope95HM1uEVdgVXncU7rbPTVSuU5qPxFhUsqVIW6DxXEzSJ6L6LKg0x+RBnRdzG8Auxc
         ob5XOtYXuBc6iFoi2El1jt9SprSPnEH9RbMwUASlT+vYd6zqj4yvreAsjXnHZn/oLYjR
         h/iHv3S0qS4gO5r0TyDfWah38JSkNG0P8K+DKmE7tvI6ejdSWBpARB5ULF7pn51Qm2Hx
         Trmw==
X-Gm-Message-State: AOJu0YypdaKcD2+3zAS5XZnXjIYwF41CGDmtNefcABN2caoseIncg2A0
	VyBJMWqfT+G4wimWuObu17jScUz88Nx9085uV11ZAcbqerp71XqxGsncV8vn
X-Google-Smtp-Source: AGHT+IHmrh5MngxfCF1/++20FMQDwLx/3y8MXaraZVYqWCKJmI7Rg1+nFzCxgcikvq+dniNrPZDDtA==
X-Received: by 2002:a2e:9c8c:0:b0:2ef:2b70:5372 with SMTP id 38308e7fff4ca-2f032cd28a9mr6620981fa.12.1721835107655;
        Wed, 24 Jul 2024 08:31:47 -0700 (PDT)
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
Subject: [PATCH v3 3/9] xen/riscv: enable CONFIG_HAS_DEVICE_TREE
Date: Wed, 24 Jul 2024 17:31:34 +0200
Message-ID: <c1397f0701766be34d79d8dbc9db51ef3a5c5779.1721834549.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721834549.git.oleksii.kurochko@gmail.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable build of generic functionality for working with device
tree for RISC-V.
Also, a collection of functions for parsing memory map and other
boot information from a device tree are available now.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
 - update the commit message
---
Changes in V2:
 - move 'select HAS_DEVICE_TREE' to CONFIG_RISCV.
---
Changes in V1:
 - new patch
---
 xen/arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index f531e96657..259eea8d3b 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -2,6 +2,7 @@ config RISCV
 	def_bool y
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
+	select HAS_DEVICE_TREE
 
 config RISCV_64
 	def_bool y
-- 
2.45.2



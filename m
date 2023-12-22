Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE881CBE7
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659409.1029022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDN-00082y-3d; Fri, 22 Dec 2023 15:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659409.1029022; Fri, 22 Dec 2023 15:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDN-00080z-0O; Fri, 22 Dec 2023 15:13:29 +0000
Received: by outflank-mailman (input) for mailman id 659409;
 Fri, 22 Dec 2023 15:13:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDL-0007Ie-IS
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:27 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7fa042d-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:26 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50e23a4df33so2371240e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:26 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:25 -0800 (PST)
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
X-Inumbo-ID: a7fa042d-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258005; x=1703862805; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7SmAyTwycWnBFtqziUqjlJBihdnpppcqA9m96DtbMc=;
        b=X72ZtPpqeoDZ2pUtAuANe0QNbVsnMrqL+jbGyABGV4tw2cyeBMLXjqQWn06m9Iy9FB
         WUZ3J2yHHra32EK1L+hSx9am4EyFfU2v6Brmskh2a9WxtioE6uDnycod8ug5/2eoDF5T
         L78vJfs2fRigNLPxGAOKL/+wDBLa8ViifOVVvaXXqV6G6Xr6R64D2066bPWWkhGPdqfP
         bsMlvSHwb+Y3xx6bVENcQZWw3qm25fu+w+p37Cmh8Shs3Jdi+swfv1p28rbHKG89O3rP
         FrFM87RX3EuZbPOvqP87NQASpN8g4ayWXDlJp4TRIitd770RXfqzO2ZYHIXMMX8EK3ci
         USEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258005; x=1703862805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7SmAyTwycWnBFtqziUqjlJBihdnpppcqA9m96DtbMc=;
        b=g7ZaNyRFFJZERS8G75vOn1/7kscLv2pUAzFtDeTC3UPqKTJSih05LG/Tme4vAjIgzz
         M+wMIYs4OcCkwoddkKl2q7ASTxtNn0nbGRJxOEyhQQxTAJnuDQJ+HVznwJ2jv0GhiF6i
         gVkg8tF++QrI088+PliJ+e1aBwUuJljBYIHjHsJF8lC4n0W78u1IMWai8cqSZsyf9QK3
         JnXkxizpcvUx73zAc7W2SX9nBBV0GLWkSI+GzatNmn8HfpJ0fUE0jgyE///CtSVvP5fd
         wYctLBRjBMdU77TkhlBj7l8Zbuu7i74C4nsB4CX1+HRLDkBsZCWWym91pJOcQdT8KrLb
         Y05A==
X-Gm-Message-State: AOJu0YyJHfdu8UDLs190ELJkyVn8JKewLrGLxc/DUj5ee0XOmEZr7qkM
	vPeUc4GSkGPNxWOj5uuWfnsgroSYyZM=
X-Google-Smtp-Source: AGHT+IHgHxM1xGEAQQ67wYezLFGntkZN9EtMYGLYuehj4OEH1qMoVySq3ReRud6cSsGny182TC0PBw==
X-Received: by 2002:a05:6512:473:b0:50e:70b1:9544 with SMTP id x19-20020a056512047300b0050e70b19544mr33033lfd.111.1703258005428;
        Fri, 22 Dec 2023 07:13:25 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 03/34] xen: add support in public/hvm/save.h for PPC and RISC-V
Date: Fri, 22 Dec 2023 17:12:47 +0200
Message-ID: <365d4ab4591129af3a52176d991146b2f64f944b.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - update the commit message.
 - For PPC and RISC-V nothing to include in public/hvm/save.h, so just comment was
   added.
---
Changes in V2:
 - remove copyright an the top of hvm/save.h as the header write now is a newly
   introduced empty header.
---
 xen/include/public/hvm/save.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/public/hvm/save.h b/xen/include/public/hvm/save.h
index ff0048e5f8..31b5cd163b 100644
--- a/xen/include/public/hvm/save.h
+++ b/xen/include/public/hvm/save.h
@@ -89,8 +89,8 @@ DECLARE_HVM_SAVE_TYPE(END, 0, struct hvm_save_end);
 #include "../arch-x86/hvm/save.h"
 #elif defined(__arm__) || defined(__aarch64__)
 #include "../arch-arm/hvm/save.h"
-#elif defined(__powerpc64__)
-#include "../arch-ppc.h"
+#elif defined(__powerpc64__) || defined(__riscv)
+/* no specific header to include */
 #else
 #error "unsupported architecture"
 #endif
-- 
2.43.0



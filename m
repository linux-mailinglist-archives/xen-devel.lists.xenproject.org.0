Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DC8916969
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 15:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747739.1155278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6ag-0000Mm-RF; Tue, 25 Jun 2024 13:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747739.1155278; Tue, 25 Jun 2024 13:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6ag-0000GG-Lv; Tue, 25 Jun 2024 13:52:10 +0000
Received: by outflank-mailman (input) for mailman id 747739;
 Tue, 25 Jun 2024 13:52:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM6ae-00086j-Ea
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 13:52:08 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b7f9aad-32fa-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 15:52:05 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a724e067017so308415166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 06:52:05 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf560627sm521042666b.148.2024.06.25.06.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 06:52:04 -0700 (PDT)
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
X-Inumbo-ID: 1b7f9aad-32fa-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719323525; x=1719928325; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZfUGC+tX8O1jFymRKQ2X7spFAFGeVW+jPczb/zOpP0=;
        b=LZn64CFjnNLiiIU4UPs0BJ021NAUV/2PuLK9rPC5P8ntMmhv4bv956BR1sb+Zg4VDY
         Ie7tVcQqwPq1QdeI4GiJld7ndbSwa4ZITGLtaUMRXNA5GTdmvAAO2exeyVgX2eOpyUVt
         /69xVKoQqKc/cbfGr+2TtR2I8t1xar4O4FEZtTlisCnMET3+KaaqT0nO77V6W8zwL/S1
         HzYzcKzTUDAIXsyq9UXIRZTy47yAk389IyEsGbHjFWcIJqwz9B5v2JDFYqE3kiGv4cyt
         s53A7ApWCzO7I8PKcayXWXeTujNCUb9xS0qplLuf5J2D44Pf3aCkWvlkiITtmLHUlru3
         ktKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719323525; x=1719928325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZfUGC+tX8O1jFymRKQ2X7spFAFGeVW+jPczb/zOpP0=;
        b=XQPK+Gz6r+wiUTLMwUCZC51kkYM3YB8bnCmL57+hWkpsIsggWhB6lLfuhA4l50nNPq
         2zfd3mAnm8QcG0KMu+24KNMKzJcEFIIoYavfIZLz0Hy8FfC3lG8v8gfFhtw7eV15qtQ+
         f7gAyXzBTXTjReK3ySzjpO+jkV1XjOnxUh7FZsWtqLQ5kYyIDxFjRHGJ/bmtSrm8CmLp
         yG0zT4RhMw3jVFsGAvqVaEMYHB4IZUF69fiuHV9REI4q4H1ig+4n7nPYPnh3GCS8HnHj
         waQGsI5WJ16icW66b8B35JVNi8pkngDD+WUahCcAwhmZPa3llgDPhcylIsNgWki17Bwd
         PpIQ==
X-Gm-Message-State: AOJu0YxCJuY3SqEhAkQm0H5RMJV9NsvAqCrW7nbrh7zahPT3TlneXmz/
	8+hlh83fe4z9xtWVkiyQQXzqZg9LZ8PlrydMovaFTP7x58q160G+EBV7LBHt
X-Google-Smtp-Source: AGHT+IHz/ZYNtgTkJsv0BVnNvTM1CLXjySox1AgodMNHJgxRag5Z9zT2mKtBQHGaiAFiLwZfgZZivg==
X-Received: by 2002:a17:907:d40d:b0:a72:5adb:f40d with SMTP id a640c23a62f3a-a725adbfdb9mr356099566b.61.1719323524891;
        Tue, 25 Jun 2024 06:52:04 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v13 07/10] xen/common: fix build issue for common/trace.c
Date: Tue, 25 Jun 2024 15:51:49 +0200
Message-ID: <f14f2c5629a75856f4bafdbff3cc165c373f8dc2.1719319093.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719319093.git.oleksii.kurochko@gmail.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During Gitlab CI randconfig job for RISC-V failed witn an error:
 common/trace.c:57:22: error: expected '=', ',', ';', 'asm' or
                              '__attribute__' before '__read_mostly'
   57 | static u32 data_size __read_mostly;

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Changes in V13:
  - new patch
---
 xen/common/trace.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/trace.c b/xen/common/trace.c
index c9c555094b..c33f115b6c 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -29,6 +29,7 @@
 #include <xen/mm.h>
 #include <xen/percpu.h>
 #include <xen/pfn.h>
+#include <xen/sections.h>
 #include <xen/cpu.h>
 #include <asm/atomic.h>
 #include <public/sysctl.h>
-- 
2.45.2



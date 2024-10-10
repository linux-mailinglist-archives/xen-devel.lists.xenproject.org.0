Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F1E998BA8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 17:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816299.1230500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syv84-0004sM-JE; Thu, 10 Oct 2024 15:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816299.1230500; Thu, 10 Oct 2024 15:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syv84-0004pL-G1; Thu, 10 Oct 2024 15:31:04 +0000
Received: by outflank-mailman (input) for mailman id 816299;
 Thu, 10 Oct 2024 15:31:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Irsw=RG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1syv82-0004b2-LG
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 15:31:02 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7f5be9e-871c-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 17:31:01 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2fad100dd9fso16554321fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 08:31:01 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80f2593sm101640366b.215.2024.10.10.08.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 08:31:00 -0700 (PDT)
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
X-Inumbo-ID: a7f5be9e-871c-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728574261; x=1729179061; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyssrSM0RuGn5wfZsY82Ll7VACleFxqgJDU1vZJJ50A=;
        b=WAa2knGTlWkNQlrcSkDobU/UTsaH6OBFhk7vxM3z0An4UqcSB2QWuvl5oSyXmpg0t0
         r4FTWI7j1O9Ttdqo2rQaEmXevPHS8g4LAF0MrgKCVAQVQSb/FUG6YXRa/kdn9zBGVJqI
         T9zKCtQNngi/AO5qKJluF1Hj039q8r21ICUh2vUunBDf3JetfvtS0eGmfJ9v2X1zsgni
         sTSVkQNCQmjAoa9DMBL1d6VQv0ANxdaWPsy0rNm8qLI2aUkUnwOKh4Gyc+XJvJm9M+7B
         AuIjpCPz9GRXD/lWqPq3WJHhPxa6vlL0sCrbfuPNeeVUa04dVSQrPVA6ZIo2ohpEoQ6h
         1rzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728574261; x=1729179061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyssrSM0RuGn5wfZsY82Ll7VACleFxqgJDU1vZJJ50A=;
        b=k2m7+OYE7yKsQn8a+Aq0qrTRX6Bx1fahd/0IM0NHIk7wcAd/XR5Pk6YH51TRjMeHHR
         2FR0EZ7yoMLuuU9ceG9WuRmoZQiEk+Uw8wod8ZNQ99CGE4Ei1abWVyFpXZ//Ce5tomdy
         0Txi/sr57gjAn4NS/cISH0a9o8v10XQQGYrVu/wpmWneSlfHSnovenf+QoToHIMON5Ja
         lzHgxTRH9wfGrOLN19FkHq8ymGE3hRsLzHcjS83yT4lDYhnsPOjyA6q5eEOwfB800Y0S
         oc+paId/nccLpFAizvFrz8mtKagGjJHybhojcDcuDR73kRljHbgige+dowS0cEjP7IMV
         Lymg==
X-Gm-Message-State: AOJu0YxVaUFt6IxKBcN58Fne2mp0TreL4S484lb+OsXJuivCuXKjE4rv
	FJbEpjmE8gYAC7feZCEXoOXHsPaztiMmasDtiM0uA9hfO3mqMHjH7UcV6Q==
X-Google-Smtp-Source: AGHT+IGXoV+pQuqiYvXzbgfXSt+s+w9C0zYab5uLiu8xzrc4HPDS4kp6lkPvBrwkL9lgUkQ1jJztTg==
X-Received: by 2002:a05:651c:222a:b0:2f0:27da:6864 with SMTP id 38308e7fff4ca-2fb1873ceadmr58106841fa.17.1728574260688;
        Thu, 10 Oct 2024 08:31:00 -0700 (PDT)
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
Subject: [PATCH v2 1/2] xen/riscv: initialize bootinfo from dtb
Date: Thu, 10 Oct 2024 17:30:53 +0200
Message-ID: <70c98147d7f977649ca3eb1a82cd76aeb0df1b14.1728481578.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <cover.1728481578.git.oleksii.kurochko@gmail.com>
References: <cover.1728481578.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parse DTB during startup, allowing memory banks and reserved
memory regions to be set up, along with early device tree node
( chosen, "xen,domain", "reserved-memory", etc  ) handling.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Drop local variable fdt_size as it is going to be used only once.
---
 xen/arch/riscv/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index f531ca38ee..a345dbafeb 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -50,6 +50,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
                           _end - _start, false) )
         panic("Failed to add BOOTMOD_XEN\n");
 
+    BUG_ON(!boot_fdt_info(device_tree_flattened, dtb_addr));
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.46.2



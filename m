Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C493A9849E4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:42:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803181.1213692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cf-0008J7-8q; Tue, 24 Sep 2024 16:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803181.1213692; Tue, 24 Sep 2024 16:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cf-0008GQ-26; Tue, 24 Sep 2024 16:42:45 +0000
Received: by outflank-mailman (input) for mailman id 803181;
 Tue, 24 Sep 2024 16:42:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vi3U=QW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1st8cd-0006ag-7j
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:42:43 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04cf4623-7a94-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 18:42:42 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c4146c7b28so7279322a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 09:42:42 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4972f8sm925880a12.36.2024.09.24.09.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 09:42:41 -0700 (PDT)
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
X-Inumbo-ID: 04cf4623-7a94-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727196162; x=1727800962; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIfX/djb1o7xVS3XP5z4GDh2TaBNEkfpUUAYhcycsgI=;
        b=aIyNvEc94YTZd8hSrE1+jLXVM4eJm2xC3qIbD+JgS7A1WqAExh0+/NbUQyxRM5r8dY
         ZQPbSfc3AGhIaj0ReSecrYoQgbJfOq3jKN+ileHLBJotwlgc7eZqo13ZyYy3WjcQrKsg
         wVLTXdG+xNDlXnOZZD/PYeHtSHt4wUfFjpE+DC4jVsJqJfZfIaMpMIwSq6eP+y85TvCW
         hG9pdZ2oMTRVuDOij06GsO7Y9rqXRHP2jhsTbKV6gxTXJp+q7g8QQpMPjdO+wHV8uDQA
         fRl83yKrlw0VxZDP/SevG5/HKHD8U93hYnPFR5u+AJ4w6zppJEyufI/mPZlbsma4NUXY
         IMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727196162; x=1727800962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIfX/djb1o7xVS3XP5z4GDh2TaBNEkfpUUAYhcycsgI=;
        b=RjKxjdCdv43RqcFrbCxoQ6jusoNd+pwXC8Xd+Rj1/mJe7LZjWnb79XXlZvyvUV4b3d
         adiFSIBxRVkB0OuB1frSM/c3z8vVqG3Pq6aLPi0lj7mf3R/5RSrpwn3cttuFPwE7AE8B
         D9c3EYcmr96HSNh1qJuXWbXK8uvdQfgm2ddLmEOCXP31MMNJ2IHJ5Gq+VYrkr1ndRH97
         tw7BwlGzi9kN9QavO67VFx5FpjCknaTHfjzAdJaGj3O2CUMkWn7D+1GDZpjG1V5YHmWw
         6P/2RyDcaAKXW2Ml0SZA8zpIdI2fbqttzzbtevsAhdSOp7veBpYErX0qQ6Rnydkwan6I
         kUbg==
X-Gm-Message-State: AOJu0Yzl2+9ksWb1jRroyElx2GUSIKDIAIwlCxQ3Myo7f2aDifXysBZg
	3OucCrWR8/Pf5vnl7D+i8l57w50uvSohm+7EbpbuApWPnkpakwxHrP0FCA==
X-Google-Smtp-Source: AGHT+IFH13sm72E1R02O+vECbDO75b1rt+pFKcYeFs2ufdbVwFz/djvVfTzytxPcp9v+jEFnCjI0DQ==
X-Received: by 2002:a05:6402:321b:b0:5c4:6568:735f with SMTP id 4fb4d7f45d1cf-5c4656873b0mr16801095a12.25.1727196161925;
        Tue, 24 Sep 2024 09:42:41 -0700 (PDT)
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
Subject: [PATCH v3 4/5] xen/riscv: add section for device information in linker script
Date: Tue, 24 Sep 2024 18:42:33 +0200
Message-ID: <c2b13a512eea608e93f6f101bf51bd856077e1f1.1727193766.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727193766.git.oleksii.kurochko@gmail.com>
References: <cover.1727193766.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new `.dev.info` section in the RISC-V linker script to
handle device-specific information. This section is required by
common code (common/device.c: device_init(), device_get_class() ).
This section is aligned to `POINTER_ALIGN`, with `_sdevice` and `_edevice`
marking the start and end of the section, respectively.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - use refactored DT_DEV_INFO macros.
---
 xen/arch/riscv/xen.lds.S | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 070b19d915..549c869922 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -91,6 +91,11 @@ SECTIONS
         CONSTRUCTORS
     } :text
 
+    . = ALIGN(POINTER_ALIGN);         /* Devicetree based device info */
+    .dev.info : {
+        DT_DEV_INFO
+    } :text
+
     . = ALIGN(PAGE_SIZE);             /* Init code and data */
     __init_begin = .;
     .init.text : {
-- 
2.46.1



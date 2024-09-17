Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFA797B2DA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 18:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800028.1209984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqas1-0002LQ-GG; Tue, 17 Sep 2024 16:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800028.1209984; Tue, 17 Sep 2024 16:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqas1-0002EH-8x; Tue, 17 Sep 2024 16:16:05 +0000
Received: by outflank-mailman (input) for mailman id 800028;
 Tue, 17 Sep 2024 16:16:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqUh=QP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sqarz-0001Pu-VU
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2024 16:16:03 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21dea7bf-7510-11ef-99a2-01e77a169b0f;
 Tue, 17 Sep 2024 18:16:02 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5365b71a6bdso5039220e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Sep 2024 09:16:02 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704da27sm1234574e87.83.2024.09.17.09.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 09:16:00 -0700 (PDT)
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
X-Inumbo-ID: 21dea7bf-7510-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726589761; x=1727194561; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQTb+FsyN+TP1FUoLarmMCU9MXHOsu5FDxRh9xEM0sk=;
        b=fY9tOeb0hLtx82/fHUe3AxsTuZJb6KPoZ1c/UR1bmg6tptYWvQ1zAmsz4HKS9lnkR8
         1p7fBaXMoBgcdIRscS6BLZdOYqbE4Z18mEfqhsfjOQ4jm3ksaw0+ihn10lmUcenpFV5P
         9PyrR/iR/YF2P3Z2Cl8n/CJN95f37Cmg9y2yfJpwP6xGoAyLTVhoFeQ0SjmQ7Dg/8gGb
         xKwKBZqzc1UNjuD+XHIUgIOIwPoeC7IET5/tDbMu8AGuDHXCT/AmJEa0r7c4hT4+kajU
         WctnLBr9eOlCoIUT93mNLQmhxFrw5Eca9prJjoIb7mU3O8dAyCYwcXP3d3xN7++ynEvA
         h+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726589761; x=1727194561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQTb+FsyN+TP1FUoLarmMCU9MXHOsu5FDxRh9xEM0sk=;
        b=xP8rdklXAiasDyDEeExldA4KB/ycuQ1W7FmtL4nJZRK7g2UkEjRFdI0PtdLJQKl+Pn
         EgToptgHS4OYD0sqBGNIiAC8tI2M16YZT9KhIfo+Jlu3ds8CMggeZdS1bEDB7ShHTb5y
         fo+P89oMb8jDncArJk5ZUm8igdPqyB1xJ73NsXsvOUfu0LuJkxCpXwZSw3JFBgPqf4nX
         JFRLh//aqtVpcRJdH3YuQ3DqiPj1pDIcCD6fVDpdZb89uJ8/Fq3fmvvo7gSZUoDznzXl
         NWr3AqwmSUAh1yBj/crR5htFhV40VZ98p+f7S2oPNzJUMdcUhqy4pETak0EALGh987/I
         lOmA==
X-Gm-Message-State: AOJu0YwlulYyr+fJsgvpv88TtCJxqoRE8XecvSy8HBYs7DqGOSpvUz3N
	kowO1rQ2ZzfmGHCrtPbVVNzDtqgUC5ihSzHHgB4c64y1+gufdLdILWxU/w==
X-Google-Smtp-Source: AGHT+IFA5ewUt/bSya28z2iCve4lXFKWItRmKNI5D4i+IvmmHiJ0lsrKJzGtOhO8J6n5vG55AJbeTQ==
X-Received: by 2002:a05:6512:2345:b0:52e:9b2f:c313 with SMTP id 2adb3069b0e04-5367fed6fd4mr9152415e87.22.1726589760914;
        Tue, 17 Sep 2024 09:16:00 -0700 (PDT)
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
Subject: [PATCH v2 4/5] xen/riscv: add section for device information in linker script
Date: Tue, 17 Sep 2024 18:15:54 +0200
Message-ID: <5e8bec88e4839fc6fa49b6c46e697553f5ca9145.1726579819.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726579819.git.oleksii.kurochko@gmail.com>
References: <cover.1726579819.git.oleksii.kurochko@gmail.com>
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
 - reuse DT_DEV_INFO_SEC introduced earlier in this patch series.
---
 xen/arch/riscv/xen.lds.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 070b19d915..cdc975a49d 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -91,6 +91,9 @@ SECTIONS
         CONSTRUCTORS
     } :text
 
+    . = ALIGN(POINTER_ALIGN);         /* Devicetree based device info */
+    DT_DEV_INFO_SEC(.dev.info, NOUSE_DECL_SECTION)
+
     . = ALIGN(PAGE_SIZE);             /* Init code and data */
     __init_begin = .;
     .init.text : {
-- 
2.46.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBA29849E2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:42:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803182.1213699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cf-0008Of-TA; Tue, 24 Sep 2024 16:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803182.1213699; Tue, 24 Sep 2024 16:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8cf-0008Ix-Et; Tue, 24 Sep 2024 16:42:45 +0000
Received: by outflank-mailman (input) for mailman id 803182;
 Tue, 24 Sep 2024 16:42:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vi3U=QW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1st8cd-0006l4-FH
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:42:43 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04412154-7a94-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 18:42:41 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c26815e174so7230421a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 09:42:41 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4972f8sm925880a12.36.2024.09.24.09.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 09:42:39 -0700 (PDT)
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
X-Inumbo-ID: 04412154-7a94-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727196161; x=1727800961; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwsMqH+vxZYDyNEsWH1sd5LxztB46M2iGBmwnAqg9js=;
        b=BH+VvGxHnjlwcwGxyjEY4i8ZvXVN+9BpFu/uRBwXPKPdEn1Hp+H2yP7b4ldqXMZCFw
         /90owJYRdvl/8zrD977AW1mEO5WntVCNd8xBAFb8hW/0tGDafLBuZ32h5v7WtQKZYEDc
         JuWhlbIRxzx3iS3hGRr+NrbKdbmZeAkj4OtNKSpJrLu8CkB9tvjfJsmFMUVq19QfR1bM
         xUtkI6Yt6ajAVzHKntl2QXe0aPyqDjHscI5sDwnBhkexw+aCRwuoWaM5n/tiLtHTmfZ5
         oqFmapVywCvB/a380pfL92rTzMKK+yGKZtugUYCPb/x9LL4thruj6fU31mmTnzuNVvn7
         LNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727196161; x=1727800961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwsMqH+vxZYDyNEsWH1sd5LxztB46M2iGBmwnAqg9js=;
        b=YCLbBqVsPG+BJr70m5Xe+wyrb585g4BTp/x7FZ2+de+Q1JzqlsjdlnGnYMW5YHOO+O
         MADQfguhRqETZGu6WLN1KJDVcrQxPuTM/bd3TsFbPVE/IHdF+SmuWAKj6GYB1eSgBBw7
         3KwUGQRfnW2zgVkJHRO3FfqmS3GS34l8F1uDf+TYE+esFNk4stdqcPyYuWW4WnKnZgWb
         Khs9M2fm+csUGZ3YvM/eb8Y8ZblSv+fzliAwE8eoQufQf3tuIKH7CzaxQ50TDQ0t+oQf
         R83IljsM0biLlXdbY/yhEmxemIzGg8RHazPbt2YsRvQ2YZvpLY+zAy0F+ZOeCNn9MxqK
         0Ugw==
X-Gm-Message-State: AOJu0YypVuycYOKu/1YhYQQJTHnJtp9u5BrT5Mcz/lSsP1aRS9RlE0sP
	cmfaG7zB0qULkAKqnmYbN+pOVLQA5i39pWKAcQMbVUcGiuzjYV28nXohdw==
X-Google-Smtp-Source: AGHT+IHB8hT+6MsHt5VSeesC8+CxLmnF5vq1SHabPcyfUYt4kcbkgOi9U/Owow2HAETlXaqawk6IFQ==
X-Received: by 2002:a05:6402:3548:b0:5c4:4e15:872b with SMTP id 4fb4d7f45d1cf-5c464a584bemr12014767a12.28.1727196160605;
        Tue, 24 Sep 2024 09:42:40 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 3/5] xen/ppc: add section for device information in linker script
Date: Tue, 24 Sep 2024 18:42:32 +0200
Message-ID: <e3ae621586ddee1e428e50d9f817f005de531d8d.1727193766.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727193766.git.oleksii.kurochko@gmail.com>
References: <cover.1727193766.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new `.dev.info` section in the PPC linker script to
handle device-specific information. This section is required by
common code (common/device.c: device_init(), device_get_class() ).
This section is aligned to `POINTER_ALIGN`, with `_sdevice` and `_edevice`
marking the start and end of the section, respectively.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changes in V2:
 - use refactored DT_DEV_INFO macros.
 - Add Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/xen.lds.S | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 38cd857187..fb8f7703d4 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -94,6 +94,11 @@ SECTIONS
         CONSTRUCTORS
     } :text
 
+    . = ALIGN(POINTER_ALIGN);         /* Devicetree based device info */
+    DECL_SECTION(.dev.info) {
+        DT_DEV_INFO
+    } :text
+
     . = ALIGN(PAGE_SIZE);             /* Init code and data */
     __init_begin = .;
     DECL_SECTION(.init.text) {
-- 
2.46.1



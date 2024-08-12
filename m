Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D749B94EDAB
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 15:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775491.1185737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUkj-0008K3-9J; Mon, 12 Aug 2024 13:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775491.1185737; Mon, 12 Aug 2024 13:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUkj-0008EF-48; Mon, 12 Aug 2024 13:06:25 +0000
Received: by outflank-mailman (input) for mailman id 775491;
 Mon, 12 Aug 2024 13:06:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FAji=PL=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sdUkh-00074b-A5
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 13:06:23 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac6bf2df-58ab-11ef-bc05-fd08da9f4363;
 Mon, 12 Aug 2024 15:06:22 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52f025bc147so4940312e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 06:06:22 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53200f42164sm727333e87.256.2024.08.12.06.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:06:21 -0700 (PDT)
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
X-Inumbo-ID: ac6bf2df-58ab-11ef-bc05-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723467982; x=1724072782; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwk/c9fy7uMLWpwC3gxJL5qXeUXnd09Co6O9sN+JUhY=;
        b=EPRh7bPHpCtQWDUPLeqHCBhpJ52JHLw6aAH/j15phCMC7ROV1Aq4nh1xc47UfH05ZQ
         zIw8rnIa+PE26tdEgPhGncjosn1IRsTC4mJhTRkaww7uUkeU7Z+HwyhaOmReVuomWM4z
         VlS095k+6RUg1+jy9J5gz50AOFQHRjqlKcFgo4zRfMBfwCBTbUpoFu/k/6iaRZXQ3EXk
         8qxNNR/Rnim0gnueC4Vn/kZiSfJutAxLzy0fQZ9yybMVlNbr223nGC1YlrlOXciKOoz1
         JTTxhNziHFRdSIS9X4E8T6Kal5ZAXlaq8WgbEx0TQcopEaPMxjzaH9sak0BLrZfaKgDv
         GRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723467982; x=1724072782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwk/c9fy7uMLWpwC3gxJL5qXeUXnd09Co6O9sN+JUhY=;
        b=ccHoqxbAmpnrNDQdSeaakV0iJ6DUv6/vrHhrhSuagmM1eYT40L1efh9xp8cb/VdXRW
         QEhBmgomxwdmz41+uk/FwxtaI8FTnE0loJh1BiwdCviAJSISWXdBSZ/fLM9RWcZ+athH
         UrBCQK1I2kYfWeGsVSFG5P3XDMU+y0aBxVs7aZZzJ6eMlXRAHk6xybKl9nDKtMs+xjre
         iUrh7raOpxRjuYidheeDuYNANHQMl79FU4IpocmcdNIoeF5SrFuqYXmzUQuuakR/N4KG
         eUQNs39ZozHUFyrzK7krGQZc2F3/VVtBWifsY9kS1S3iRVuXcioUiziOQeJJ3rwh7BOS
         NCfg==
X-Forwarded-Encrypted: i=1; AJvYcCX9pfpLTzcHmcuv90mId2qZ+xxu93vGxHMhHd59yHgKWn24Z8jKcxMxeKVqj7FSr/LKMOScj3HAr8b/OUkpo1B5DAXr1DTRMJs2HnN/5Gs=
X-Gm-Message-State: AOJu0YziOSpNYe9Fcbb54xGPCqMhBO4B4bTfkwoK8eFZBcrkE5fR8ItA
	j4LmFaAsyFRwH7HaWZVEz9C+l14aK24w+2WDRe7GOjcvjqzdgrYQPe1f75fd
X-Google-Smtp-Source: AGHT+IFqodcbXvvGQbYAmgjAlCjjHyzPPhL/5h6u/IlGoF6PnqI7PI9+Ax4L4kxnxBVCA+PqtUfB/w==
X-Received: by 2002:a05:6512:10d1:b0:52e:76e8:e18e with SMTP id 2adb3069b0e04-5321364a598mr46079e87.7.1723467981708;
        Mon, 12 Aug 2024 06:06:21 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PATCH v1 04/10] hw/arm: xenpvh: Add support for SMP guests
Date: Mon, 12 Aug 2024 15:05:59 +0200
Message-ID: <20240812130606.90410-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812130606.90410-1-edgar.iglesias@gmail.com>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add SMP support for Xen PVH ARM guests. Create max_cpus ioreq
servers to handle hotplug.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xen_arm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 5f75cc3779..ef8315969c 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
 
     xen_init_ram(machine);
 
-    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
+    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
 
     xen_create_virtio_mmio_devices(xam);
 
@@ -218,7 +218,8 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     mc->desc = "Xen PVH ARM machine";
     mc->init = xen_arm_init;
-    mc->max_cpus = 1;
+    /* MAX number of vcpus supported by Xen.  */
+    mc->max_cpus = GUEST_MAX_VCPUS;
     mc->default_machine_opts = "accel=xen";
     /* Set explicitly here to make sure that real ram_size is passed */
     mc->default_ram_size = 0;
-- 
2.43.0



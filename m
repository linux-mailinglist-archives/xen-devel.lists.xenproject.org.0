Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C0494EDAC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 15:06:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775490.1185724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUki-0007ok-17; Mon, 12 Aug 2024 13:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775490.1185724; Mon, 12 Aug 2024 13:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUkh-0007iZ-RC; Mon, 12 Aug 2024 13:06:23 +0000
Received: by outflank-mailman (input) for mailman id 775490;
 Mon, 12 Aug 2024 13:06:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FAji=PL=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sdUkg-00074b-6o
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 13:06:22 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abd74066-58ab-11ef-bc05-fd08da9f4363;
 Mon, 12 Aug 2024 15:06:21 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52f042c15e3so3631306e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 06:06:21 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53200f4227csm730447e87.279.2024.08.12.06.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:06:19 -0700 (PDT)
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
X-Inumbo-ID: abd74066-58ab-11ef-bc05-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723467981; x=1724072781; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOLz6jSGUU8Xiq4wmRd5lgikGGH6JiIyvQ0oMaht6JA=;
        b=RXc/ZrfYte0uKHALdoE6QbgS6W8b9qdxmnWl4+PjFaIKMaRjUH8dl82toTaJeYfor/
         ZmBDYHP3mwGz0xxVCcXuTbh02escqGLxXEqZrRU2kAsOTuQDqLG4eVlCv/VHFIubq3BV
         rXlBGkZA0Gc0tvXeXfLlsafNEro/+2XAxyl91LRjAow8kJ8NQ+zfGzx5VkcILjXxc52U
         h+ltwf1eB+PjYq0SAxuhjoFnF0V9Rx5rk0STknLi7J1NVcQW/qTXExEWIsDw9jmnK7H2
         ZAWsKkALQxcWbwBHH8PUN/eFvm9i1LrhMVNWAdYvP3wBa/kcSf5JxgRAYQpKyoNk+Wu3
         ugcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723467981; x=1724072781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOLz6jSGUU8Xiq4wmRd5lgikGGH6JiIyvQ0oMaht6JA=;
        b=akjC+NKpOyjnuJH4dXxBWfOTjTRhqsBvptaqLOb2lcjxcAzhAfQVPO5yfhdQTgP3o7
         nKtfd7DgqdpmQjKe/Q9dUwgKVOuU3iVFRSIIjOLrpS8zXeg16xT83XxirR1sS/5BLyv+
         Vg4YOOVSefGc3dFmFw1V650XYxIi5pQzIfRNzp6azHqAuTWp3lxQRZMrSsuoQ0xMdGVl
         oSFWCy0vV/woZ5HZW76S4YyaCjGqjRMbntq+l7tockdEiAgHCQOTG0PGywKKxAnOOM8v
         NuWc0w4Ol8LCWEjnIG/EFOaLLEJ2mVdKkwOohZQ5fc7JkvYL/W8spHVuG9vH62R7bvAc
         u7iw==
X-Forwarded-Encrypted: i=1; AJvYcCUp585U+anvsYLPdfaUcizgcUNNm/trhWMVFIsXkJRGoPSFksBS9YNruVrIDz/iLaCvtfymEcWeTPI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUItlUQOQMDfkA9LqvdqKEHbel1pDLS4Av4ecm3VINuTgmum4o
	lUVDgoLYEKJ+3lGO8fIo5uNEDcXUSvxJXx+69yGrpZpFVqSZUP49
X-Google-Smtp-Source: AGHT+IFVFpgUsSJvoRktx9P5RahE3NL+hK1oSSRb0VxLTivi6mQbcvmAYVxkizJenzqOQTjrR9idAw==
X-Received: by 2002:a05:6512:4020:b0:531:5b03:b1f7 with SMTP id 2adb3069b0e04-5321367c4ecmr11696e87.10.1723467980688;
        Mon, 12 Aug 2024 06:06:20 -0700 (PDT)
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
Subject: [PATCH v1 03/10] hw/arm: xenpvh: Tweak machine description
Date: Mon, 12 Aug 2024 15:05:58 +0200
Message-ID: <20240812130606.90410-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812130606.90410-1-edgar.iglesias@gmail.com>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Tweak machine description to better express that this is
a Xen PVH machine for ARM.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xen_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 766a194fa1..5f75cc3779 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -216,7 +216,7 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
 {
 
     MachineClass *mc = MACHINE_CLASS(oc);
-    mc->desc = "Xen Para-virtualized PC";
+    mc->desc = "Xen PVH ARM machine";
     mc->init = xen_arm_init;
     mc->max_cpus = 1;
     mc->default_machine_opts = "accel=xen";
-- 
2.43.0



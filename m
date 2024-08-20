Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F61D958947
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 16:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780531.1190177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPs0-00013E-1P; Tue, 20 Aug 2024 14:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780531.1190177; Tue, 20 Aug 2024 14:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPrz-0000w8-Rg; Tue, 20 Aug 2024 14:29:59 +0000
Received: by outflank-mailman (input) for mailman id 780531;
 Tue, 20 Aug 2024 14:29:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prYO=PT=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sgPrz-0000m9-13
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 14:29:59 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad1e8d9c-5f00-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 16:29:58 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53301d46c54so7426939e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 07:29:58 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d3b8f77sm1773996e87.72.2024.08.20.07.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 07:29:55 -0700 (PDT)
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
X-Inumbo-ID: ad1e8d9c-5f00-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164198; x=1724768998; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXrv0E3MFlFU+ItFyAOjyjeGygFPyj9i38Ckg44wQ0M=;
        b=Nu2N2XY+WF9tUCwXYCgru11G/xtCPKfp9GjgwSFLKsJnRFwqYDFmZxDkkGcq5aEXus
         fiP3xnQHxxz2fphTEaS4tNrCVgGF0amQvUQvOV1g40jEfeLVjh34gKMWTKyFUMVqBvt+
         FRIdAr5uixjHlRlyDnUGZWzx8vdcHxtyfZzJuwBAkQvEBhzRbGS6cgc9JbVknD1//leD
         f8LeH5/t133CGiN9dtYFR4IvPL+D37d6JMjRhQwJgPOAqAbaeu1vf4xIJJCsEj4GU38r
         ODSBLxQcKi+A1trYdbqQFAA8RhfKRMXliDjFNA8iOHMZVyyT7sR9c/6Ee4VYGYdOCRTn
         PXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164198; x=1724768998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXrv0E3MFlFU+ItFyAOjyjeGygFPyj9i38Ckg44wQ0M=;
        b=nCBil1vaOn6nqn7qcGkjcvG+2x/yf7qU2VAfpQzibzQQUNfb71G3nP5zJq64KMXYfi
         kR4JtrINqI5/Y0Et1MuA6GRekyRD10sCbyH+ymXoyBAb3wIZVvEC93Ta5MrCW6SD9dEL
         OcJ5nkYwB7yb1ddk7SdIK1NsLU1GRB2j1sJwdqaJE+nPVcLgPa0cpp/uasIJFpjc4Jv/
         w4EFO17DRbzEsjsXK9B2QL8q/6NR1dpflNuxE/Lhz9D4o94D72kRDRhUe9j5ReUFSZ2b
         NUYIGAlFELZGMMT7OYWxsq+T5wv9C5JzUJsAqScnaR80XIKcw9ukgEaKY9BuQic0kJmr
         LRNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ+8PQWYExI2srxGPRGov+UJWM7djqcuMhJyHtPMWbnCgd+tLuUY++6gaBh9gM44irkpIV+ssQBP4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7DX4VQpww7nelu6dK7YKd67/loUo+wyxmhYiFjtI8BCRPE2LA
	J2K5EyHgmxgnFurNbtx+kiGxu4i8IZLwd8HiUxjYAIvfEoi1xY8ZHJ+MCl2H
X-Google-Smtp-Source: AGHT+IEUHrJ/SYDaIj+10HjdHpBx8iCW0Ws8VM3nxx/08/Kowr+gNMxcGQJYD8Ll+OK5SPcAIO861w==
X-Received: by 2002:a05:6512:1085:b0:52f:413:7e8c with SMTP id 2adb3069b0e04-5331c6a2a5bmr10786717e87.14.1724164196933;
        Tue, 20 Aug 2024 07:29:56 -0700 (PDT)
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
Subject: [PATCH v2 03/12] hw/arm: xenpvh: Tweak machine description
Date: Tue, 20 Aug 2024 16:29:40 +0200
Message-ID: <20240820142949.533381-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820142949.533381-1-edgar.iglesias@gmail.com>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Tweak machine description to better express that this is
a Xen PVH machine for ARM.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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



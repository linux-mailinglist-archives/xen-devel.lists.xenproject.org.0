Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544D098891B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 18:33:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806402.1217788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDty-0002UI-UH; Fri, 27 Sep 2024 16:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806402.1217788; Fri, 27 Sep 2024 16:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDty-0002PZ-Ph; Fri, 27 Sep 2024 16:33:06 +0000
Received: by outflank-mailman (input) for mailman id 806402;
 Fri, 27 Sep 2024 16:33:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1suDtx-0001aC-Jl
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 16:33:05 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b205ecf-7cee-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 18:33:04 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so314425866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 09:33:04 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c59bdsm150607166b.50.2024.09.27.09.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 09:33:02 -0700 (PDT)
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
X-Inumbo-ID: 2b205ecf-7cee-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727454783; x=1728059583; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leAxxJzl+409UfrEd5qPVybrX2oZQDzIq1f2vuG+PV8=;
        b=JjBtGapZoeZ3wCYhIN+19UEhytAvEaN0nBt40rtkiZZ8rVC2PJhbGGcWp3jzPnoAhp
         scpBJgaAwpTYgSRL3xDkz7ftIexw7SVH/YBKmc7L2wIz1zs4hN3VBcexs6cm+vO5jZx+
         WijeK1Vf3U66t4KcMaDfS3JSG7aaa+ml43Ysj9F0DCqSnh8E11QVR+tjNnIn6sMnPfXP
         AAwtWRa0kyihGHg5tkGMQp/2lmS4w8fm971IYWB9f7wmgxUGgu8DeQ6u0vSYjDKx4s2C
         Lc0A/oZ3yibhLq945392f7pnYF0mSzI30PRmZ+dHwaEhxenMOUvrepH2nXzryxO9FPvs
         lfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727454783; x=1728059583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leAxxJzl+409UfrEd5qPVybrX2oZQDzIq1f2vuG+PV8=;
        b=C+JGpIUpGdXNfNffr+8lxMynqKm5IJ6QJu+kSt8BFiplAR/+Enyq7tHwB1Caj1QoNn
         vvFjkybhoh3vaDhu/5Un24l5awdhHk6rizfJjNwoas7L0T6a5G9RWP7iu5OTVag8FAPQ
         xlgrYUAP8yX2SU0nZedJkZsTXO4RWJDXGrvrpg0gprh+b5kdxfiENB9CdUhXTdVM0Btg
         o3PwLwmt9/ZY/ppkBLp9Cpka8cQj37LO6dxyCkhuQoRxhzAi8LL7o0z1y0t34vHAGKMs
         Ik01vJ9woCwBcwyhfKjALkh4J3rmskyzV/vH+xxdQqoQdILYe0rmXpcaBzwXzmDbOr0L
         GXvA==
X-Gm-Message-State: AOJu0YxYiCiM1zQxhw5jNy5OgQoz0zTP1YWK1+XT7my7JjGHbbX0YSX5
	BIC2dMoyw3prx/+je9AVfQWZRivQ9xUEf3PmBi+9v3zVhygsdMJrz2sYsQ==
X-Google-Smtp-Source: AGHT+IG3CIopgO+5VFJyIZI70q+ryIQxhz3RGf6b5mdoV8H8FuYr8cYwn/WrPxwqE/VlWI+JSsXy+w==
X-Received: by 2002:a17:907:e91:b0:a7d:c148:ec85 with SMTP id a640c23a62f3a-a93c4aa6b89mr366505766b.62.1727454782941;
        Fri, 27 Sep 2024 09:33:02 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v5 4/6] xen/ppc: add section for device information in linker script
Date: Fri, 27 Sep 2024 18:32:54 +0200
Message-ID: <c97940d1a81dd9007b4d20dea204fbc1db6d7394.1727452451.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727452451.git.oleksii.kurochko@gmail.com>
References: <cover.1727452451.git.oleksii.kurochko@gmail.com>
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
Changes in V5:
 - use newly refactored DT_DEV_INFO ( drop macros argument )
---
Changes in V4:
 - use newly refactored DT_DEV_INFO
---
Changes in V3:
 - use refactored DT_DEV_INFO macros.
 - Add Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/xen.lds.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 30b4a6ced8..3f2a7676ec 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -96,6 +96,8 @@ SECTIONS
         CONSTRUCTORS
     } :text
 
+    DT_DEV_INFO                       /* Devicetree based device info */
+
     . = ALIGN(PAGE_SIZE);             /* Init code and data */
     __init_begin = .;
     DECL_SECTION(.init.text) {
-- 
2.46.1



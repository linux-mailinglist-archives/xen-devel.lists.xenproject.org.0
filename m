Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8C396C3C4
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 18:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790547.1200346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfZ-0000Z1-32; Wed, 04 Sep 2024 16:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790547.1200346; Wed, 04 Sep 2024 16:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfY-0000WY-W4; Wed, 04 Sep 2024 16:15:44 +0000
Received: by outflank-mailman (input) for mailman id 790547;
 Wed, 04 Sep 2024 16:15:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ufny=QC=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1slsfY-0000LO-5q
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 16:15:44 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeb42cf3-6ad8-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 18:15:42 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5344ab30508so878074e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 09:15:42 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5356827b716sm205130e87.240.2024.09.04.09.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 09:15:41 -0700 (PDT)
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
X-Inumbo-ID: eeb42cf3-6ad8-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466542; x=1726071342; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FTAVDz3Cw1uxIbhjmeqEYJqdjw34VbylOmDWLTwvx4=;
        b=kE56FOHGkJ2f/+QmFlXIQrb3P2CBidY+hb9fFrkJYtDs4VemXdRhEJqNaOwUYG+u3n
         QdfUZC6JtM+jpu7+RoG0/zDSSXPDuFRlmHNqkl2Lvbydsln4LICMUzX0PZQLtJvLmx3F
         6aDUaHxsgJyTGPk4EZtblOgYDheKq+cPDof/CMOiUyYIfoNdFXYHhpzJ/yR5QjyUjxtJ
         00eE87JnDscG7WGzq9dplK6n53xrRPz9xxYu8X2huHdQiLpRa12ohG1iCUHX3s2wr1NH
         0tTJvEWMMNkhS60Rhr2dpngtIqmAVwnKg3hPUbeOV8sYfoSgMhDSrepbAuiD/YiIQANT
         YnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466542; x=1726071342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0FTAVDz3Cw1uxIbhjmeqEYJqdjw34VbylOmDWLTwvx4=;
        b=JByuEM3wSYJJo5CQmgx7O1gLBTw/P8bGTxdYguw3jwhFanHRv3l+Ymuvf2oZtpQlmv
         2XmOs84fAXKs7kf9WkQAtGHInNc9JuNs7aEQouagAWpjQFjKNANDWL98fyJGWRFy4ibQ
         95Bha24Yf7hOCkfxfwuk+1JTgeY/uUi8AHMtcEh28TZ2OQZiHB+1o3VSiU7wVXLrivn5
         IbmHTZIL/q8HyTDBgc8gHWCu+OLtAn7flT0rz3tSmwCOGU4SFqRynhmLQJXgy37yLV4T
         10eatEYER6ISfr8+3AwDXLwcpLOh2GEBRLzjA10dRDy5Od594O2bL9nSkcSjI4/l060b
         BI1A==
X-Forwarded-Encrypted: i=1; AJvYcCUHuxd+wNr+a5X/rIm+twW6RiDLYfmyzE0IadWR0U4lo9N4uFgpqXe7ihjGFDKZ74wHVfYzf6c04IU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyan0GUj/kMNcTxhg39+KQvSzYu/D1VqY5gIeKkEbno/JRUOgq3
	dWzNoB18BjQvsyeIXAsz+gDD7yAUgAYbo0SJyOeQeIUI1PYA0szg
X-Google-Smtp-Source: AGHT+IHC0J9+zgjr7h0VEYt97jGSExgSr1FAsQqqdgyp0zbhmgvQIcgxO+eUjmYELzyzyL1eJMTb6Q==
X-Received: by 2002:a05:6512:4004:b0:52f:336:e846 with SMTP id 2adb3069b0e04-53567790120mr922274e87.14.1725466541521;
        Wed, 04 Sep 2024 09:15:41 -0700 (PDT)
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
	xen-devel@lists.xenproject.org
Subject: [PULL v1 01/12] MAINTAINERS: Add docs/system/arm/xenpvh.rst
Date: Wed,  4 Sep 2024 18:15:25 +0200
Message-ID: <20240904161537.664189-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3584d6a6c6..c2fb0c2f42 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -559,6 +559,7 @@ F: include/hw/xen/
 F: include/sysemu/xen.h
 F: include/sysemu/xen-mapcache.h
 F: stubs/xen-hw-stub.c
+F: docs/system/arm/xenpvh.rst
 
 Guest CPU Cores (NVMM)
 ----------------------
-- 
2.43.0



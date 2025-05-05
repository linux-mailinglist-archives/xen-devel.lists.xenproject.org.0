Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4518AA9B3A
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 20:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976206.1363413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC0H6-00060T-RI; Mon, 05 May 2025 18:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976206.1363413; Mon, 05 May 2025 18:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC0H6-0005yX-Oa; Mon, 05 May 2025 18:10:44 +0000
Received: by outflank-mailman (input) for mailman id 976206;
 Mon, 05 May 2025 18:10:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdRb=XV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uC0H5-0005wU-0F
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 18:10:43 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4197770e-29dc-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 20:10:42 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ad1a87d93f7so306978866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 11:10:42 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad189146fcbsm530372366b.34.2025.05.05.11.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 11:10:40 -0700 (PDT)
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
X-Inumbo-ID: 4197770e-29dc-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746468641; x=1747073441; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7TtHnmj/5FH2NS/byj2XTa9Q7kgraZ74IRrvmZxlqM=;
        b=WkqtxcZr2Or2c8cms/0ltqyD3aGEWqQsxezEaAGfxSUEV1rzpljKa2ZPxUakuVdlKG
         3nJPSHrDFRq6jf9BZofdGzvNPjWL+85t4QYRffNmQ3mj3xJqKzXcxipO+akjqGAjrS6d
         jLZ7lLAt1mpka0DPIZqVpnkJSCuo6tyR151r/Anw0MU8cmTbhDRl6GN4wS4qWYujNl7x
         VJ/EzCwZCc4eFmLY9Nuhn7zc+0oo6Dy27IZ9D7JV2df98datB5jjydh4zdb5GI/GG6JR
         +mdJYhrnxzNByVv3UGFZ44UyUIQjTmYV+O9k4BfQ3HECHt2WWQggpcmijDiLH3bE68Hk
         jsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746468641; x=1747073441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7TtHnmj/5FH2NS/byj2XTa9Q7kgraZ74IRrvmZxlqM=;
        b=G51MrEIYV4sGpxxZdyLoD8IJM19PIDQRa/7tcSuq/l2t0PWe/tvd1wY2Ayy2oBEOEf
         BPp7o1AS8jIGX4OhHdYtOmXpB+brvXK7WqxkKKKpTgTvQHstSK4dwwqaRvLQz2NCyuOh
         NF8Upv/bmmiyHR0VnU4n+kHo0Nc84JODnaudfOuk1mm7NPpN6GSmuUofAVcrm36rPIeK
         dEi9J3DwGAm8MNrFd7SiFhzaxukDaFhbqArM9nVGGCTWp6sgIUR0qNrfMwiXPAo9Sq9T
         yjoY6VCmCSQGKo7APaSndFYe/4srXTupoXGPRL8uhFH461+v6b+8BLZYwBcJ7eBXu7PZ
         BMcg==
X-Gm-Message-State: AOJu0YyB+GfV4hxR02l6MXuPmQuSfn/x3FwRyOVI6h+uwOV5It5Syhg+
	Y8aEzpCyaCCi7fwaNsqbuN7W5HrZsoJ1AK9g6Gk5tdZN6xtsCL7jsmKfcQ==
X-Gm-Gg: ASbGncsghN7tYdiIVZiL3nFX0wkNSfYUv90E0yeSXweLwLHxdTJGSw2YSETyq6diRBp
	kyD3XuEFl3phITRtHTW+E3UooPswakzBbO6OncIkxYEezpWR/0f8G+wxmlafozrUMAHnxGsVNhv
	9jqJ88+TjbD/a/RVRJuMUOJ43Rij/jXdCEf5VL3wrviFIffJTbdmB4c+ROuV7H17QQEjCbx0OIx
	hEkgKmN8jBrQFikTi2YOhFeB+JPx0QQp9gDlXx8nx//vmKALqlaBVI4I+1Uzw7xqyd6KyNUnuCX
	Om8KLBJue5L1tWkih6KJPzgy0t3BggaxDv8UKt50bkVbUne3zNQjBtalzaHZmtC6j8PM8H+a/AH
	E+J6VsaiNQQ==
X-Google-Smtp-Source: AGHT+IFD2fkk0khKwFhTmebLcoTKYeyVppAqrQVO+tbjTiaBVUwoTeZYiCf+3BRsnhWQ4Ahv6bhrYQ==
X-Received: by 2002:a17:907:7f05:b0:aca:d6f2:5d5 with SMTP id a640c23a62f3a-ad1d355c9f1mr24033866b.39.1746468641001;
        Mon, 05 May 2025 11:10:41 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 1/8] xen/arm: drop declaration of handle_device_interrupts()
Date: Mon,  5 May 2025 20:10:31 +0200
Message-ID: <f821efeef274bb0cd371c9bd06d39b9924c8d7ef.1746468003.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746468003.git.oleksii.kurochko@gmail.com>
References: <cover.1746468003.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no definition of handle_device_interrupts() thereby it
could be dropped.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Change in v4:
 - Nothing changed. Only rebase.
---
Change in v3:
 - Update commit message
 - Add Reviewed-by: Michal Orzel <michal.orzel@amd.com>.
---
 xen/arch/arm/include/asm/domain_build.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 17619c875d..378c10cc98 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -28,17 +28,6 @@ void evtchn_allocate(struct domain *d);
 
 unsigned int get_allocation_size(paddr_t size);
 
-/*
- * handle_device_interrupts retrieves the interrupts configuration from
- * a device tree node and maps those interrupts to the target domain.
- *
- * Returns:
- *   < 0 error
- *   0   success
- */
-int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
-                             bool need_mapping);
-
 /*
  * Helper to write an interrupts with the GIC format
  * This code is assuming the irq is an PPI.
-- 
2.49.0



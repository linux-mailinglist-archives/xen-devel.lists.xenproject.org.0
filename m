Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 758C794EDA9
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 15:06:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775488.1185703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUke-0007CQ-9q; Mon, 12 Aug 2024 13:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775488.1185703; Mon, 12 Aug 2024 13:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUke-00077c-5I; Mon, 12 Aug 2024 13:06:20 +0000
Received: by outflank-mailman (input) for mailman id 775488;
 Mon, 12 Aug 2024 13:06:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FAji=PL=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sdUkc-00074b-Ss
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 13:06:18 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9d20988-58ab-11ef-bc05-fd08da9f4363;
 Mon, 12 Aug 2024 15:06:18 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2eeb1ba040aso58542581fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 06:06:18 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f29203d817sm8573481fa.99.2024.08.12.06.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:06:16 -0700 (PDT)
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
X-Inumbo-ID: a9d20988-58ab-11ef-bc05-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723467978; x=1724072778; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnvsVFgAwwQYqvVPxF+lYxfpYXdBbERxwoGEJpJUJUI=;
        b=VNUXtoyXxFeQlfzRQujuWTNEWNDBK4+r8lCcvyE94P6T69/+izCk04ZsdYYCvuf6XZ
         w2zvox0fZUY/mMmxzzhtSoijQP5HaOuT6T+1CW+v0JtPUl6u8S33U1o095yLy+4+SHmf
         CDLqczOsstpMFnO6d6ofUQkcMfu1d1WA0oZd7skyQSr+hKGIeJq1fKeckB1lUD0wdgRJ
         7UR5nUblFA0ftuKR6QswhIbuCsy3yi3Lt4ObIR6UBCKwo6k3REiXf8oNyDNyMqU6hsdV
         qOBdO4qfKIZ5iz2A2wV1nM3Gp7JQyo17zNvT1CBFse4Psilp8tuPt96wSqsQYSNLSRG1
         rijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723467978; x=1724072778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnvsVFgAwwQYqvVPxF+lYxfpYXdBbERxwoGEJpJUJUI=;
        b=c8KMtCIKlelOfWneO5Z3xVcRpewFd99Wu4FSVCdVOAatmvcmW4XByU0AaW+m3L4uz0
         DLHvD/kwd04RTdQ7NoFYYSvgTfbbsGna9l738qS9rSavM/S2tIT8xrur98UiwAVrC2GE
         YjI/4WYFCiStCcH31fWu8cEwI4HBwR/OeliHpF4XECA1jtbeas8zhgvhrWN41uoInhwp
         fxM7XFnQFwWsi/L2eUL13AZbieW3CXZo2ufDcZsJsMVdiJ0Pcy7qDvggbLeu8y7SW0CO
         +EDYXDmi3ns25FKMD7iM+Op04PojDRenv8h31WCfsrLwArSMGnJB0wP8jj1xExj0J0T5
         RsMw==
X-Forwarded-Encrypted: i=1; AJvYcCVkjDmGjqH2VD+pvhwDPoYnV//v4qvUHKyG4g0ArqFmeUtehrwvLAh+6Ak07fdZnRDblnqPjLdVTDcfAMyDc0Li9CVnFXP1zs9YALh/w58=
X-Gm-Message-State: AOJu0YxE0m0KOjh9cbMFZDW2E1r0W8z8u0eLiLo5uqcwyAqoIFMGQRyC
	l1ayyFHyf0LHiDZqeldVGgoiilRbg+FePNZxHLe/Lwh4SpftOdae
X-Google-Smtp-Source: AGHT+IEH+rt8R3wDG+QKY36k4z1epabtE0qsH5Q2v+VF3qRP2OiK5eGbpOcoKlfiNpSaMtmPoTatVw==
X-Received: by 2002:a2e:721a:0:b0:2ef:1d79:cae7 with SMTP id 38308e7fff4ca-2f2b714cfddmr1523661fa.14.1723467977110;
        Mon, 12 Aug 2024 06:06:17 -0700 (PDT)
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
Subject: [PATCH v1 01/10] MAINTAINERS: Add docs/system/arm/xenpvh.rst
Date: Mon, 12 Aug 2024 15:05:56 +0200
Message-ID: <20240812130606.90410-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812130606.90410-1-edgar.iglesias@gmail.com>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10af212632..a24c2e14d9 100644
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



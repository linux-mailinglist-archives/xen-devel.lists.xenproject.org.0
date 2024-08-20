Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C981295894C
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 16:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780529.1190165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPrz-0000qP-DO; Tue, 20 Aug 2024 14:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780529.1190165; Tue, 20 Aug 2024 14:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPrz-0000om-9C; Tue, 20 Aug 2024 14:29:59 +0000
Received: by outflank-mailman (input) for mailman id 780529;
 Tue, 20 Aug 2024 14:29:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prYO=PT=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sgPrx-0000aG-HF
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 14:29:57 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab6092fd-5f00-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 16:29:55 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52f042c15e3so5074670e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 07:29:55 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d3afa66sm1772714e87.7.2024.08.20.07.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 07:29:53 -0700 (PDT)
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
X-Inumbo-ID: ab6092fd-5f00-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164195; x=1724768995; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FTAVDz3Cw1uxIbhjmeqEYJqdjw34VbylOmDWLTwvx4=;
        b=Pv+9M6vVEbSwAJuAlkobDMMPJtHMCYxzhqrOAsgnyJIf1ThWa4pvvoiFgxWqEsDJPC
         sASGLUjxrLp51zxWLTSjXUFyVqUHVQYIBY/RBl3eYpxl0lbuOWAeTYB6QIPKUyh+dBuP
         6itpLGM3+968I25iJTrwMRm27MvG6qQLVnsTHPkPNUU1LlB5BoyM/DynSxrHnWha3xOJ
         A6yPChTQ594IqsBJbUDaghSyv5wkr8svAdPHpIP+7al0FlizdpVjcidmXPW016nEmzpL
         CF+Da9RUxtngVgg25M26xzPbxqNuHfcJObPK1VMQiC+fC9wOdlO0h2prtDL4Sbdb8ZIW
         tcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164195; x=1724768995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0FTAVDz3Cw1uxIbhjmeqEYJqdjw34VbylOmDWLTwvx4=;
        b=uQ5/B7pkbgFfGVPfx4TKZYdWKz2CzD4gkuyRbky2iBkDMjAUbnIP4ysL1mYcM3lUpC
         aXZ1WrG6GAJ7/b46FClMWuqrqRDGon1bsTPKbX2QHIo9Ltq8zbKSmGTumBjHdlNFYgbt
         Y9p1925vjXxiJjbL4gUn4tRHITum/NnNybf1OGHDTHvgLTN3yMCYImMFdWpapZakUlPC
         BuiVM8IsxWLIJ5Y9hc4qPf4jxDN/lshHc3dJTWTv+EV+K97neCR4daJEU3CNBHS5yo85
         /J1qKVDTPs+EvtNX509RyOv72wr3Ekrdrp6Q0G38BK/Uu+kMF/Nq7FUo1+WwHMVe5Tof
         vSuA==
X-Forwarded-Encrypted: i=1; AJvYcCUm4GsCKPeMs8N3oX2nvrIfI8q+OPwoA/gt4nRXERYwK2zpCmGENVoJN8hAIeneFvHMd2H2N5QWGxnYXy+Y7HWVKaLgnZmvTHb9HIz4nyQ=
X-Gm-Message-State: AOJu0YyZUw8srg1J4YxqpW62dTK8gqykQckxiL1r4Mu/MPDD1OiroRtl
	syKmruSuBm3pU3gitH4oXE0I7ICFlzpZCZKUPtFBU5AUeVxZ+GTG
X-Google-Smtp-Source: AGHT+IFrPcDRBYvfqjcvKbmWjLtw+0FlYqh8Z0iVHC/dcsRC/BqjVUCiAdvRhyukGAYN9Iw59X5/Ew==
X-Received: by 2002:a05:6512:2824:b0:533:415e:cd9a with SMTP id 2adb3069b0e04-533415ee2demr694896e87.23.1724164194086;
        Tue, 20 Aug 2024 07:29:54 -0700 (PDT)
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
Subject: [PATCH v2 01/12] MAINTAINERS: Add docs/system/arm/xenpvh.rst
Date: Tue, 20 Aug 2024 16:29:38 +0200
Message-ID: <20240820142949.533381-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820142949.533381-1-edgar.iglesias@gmail.com>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com>
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



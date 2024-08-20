Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BDA95894A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 16:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780536.1190235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPsB-0003iW-TV; Tue, 20 Aug 2024 14:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780536.1190235; Tue, 20 Aug 2024 14:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPsB-0003gc-Nl; Tue, 20 Aug 2024 14:30:11 +0000
Received: by outflank-mailman (input) for mailman id 780536;
 Tue, 20 Aug 2024 14:30:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prYO=PT=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sgPs9-0000m9-Ay
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 14:30:09 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3806914-5f00-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 16:30:08 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ef2d96164aso64441481fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 07:30:08 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f3b7729ca3sm17564031fa.124.2024.08.20.07.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 07:30:06 -0700 (PDT)
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
X-Inumbo-ID: b3806914-5f00-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164208; x=1724769008; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nym7Vpc1+HcpD0fJwqv749eMWZaaEovUQaBKn9/MOQM=;
        b=YYTK3sEbVSmHEhPrn2VXA2RyVEV88RXdnwDULLdptgIgdGnf7GWP3FGDp/lMKZQkhC
         O8tQySTLUxofq1N3msTcTjjXW7nMz2vSCYycygX7ru+BBV+etBHY9PnAJGkB8XvcCqdf
         p87izn6np1P3qOK/+yCz7Za71QPPxpLjuhHpBLe77F72qdPyX7hvkV+9qgGDdsuRwk0o
         suSiDJeLgIPJpDta7it6Xbdyqszc4Ix5GLunFkiJUhofKEt0OW5I1XSxvH8jHwRPbbn3
         E96KobmOV9tZ8z8i/D+WaLP8aREJda79zn4I6D65mPQZ8RJB7lRGP9PlFK8U06d+mlAw
         Sc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164208; x=1724769008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nym7Vpc1+HcpD0fJwqv749eMWZaaEovUQaBKn9/MOQM=;
        b=oN2a8N4oUfJmBi3RRedniKsURYeuu0xsrBpLGuf06HDbi5cMHgO67ihBkd6vYr51Uh
         +ow6EK5o8Zu/bXBS54crM+i3nb/XESnstU58hH8+bBvJL8BZcqXPDlTBor8qzYacPtKv
         smTVEpMj039er6sKA+rhWyS5MaAbpCptoBZ0zFmc92s5Tum/rMUA+ksHjBqWBYJ1OsAE
         QrBxWkQS0uabjPkZ0kbw1wlDsFQ6eYoDPmy/0hfZnOnG6XIsGyDuXjvh26rOUdyKXq40
         x0oylAXfVamh+k5G46GijaoxbKjGSlJrjNPuDhCWcdqS2BfRhbLh+YntdH4BGuTqDWAc
         a0yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf5WUHDJq28Y3K4JgtFltgS34iioaxLZqvl84d7fcPSbQNxY7sf54Y3q+9ueCJXKTQKQuIeF1om6Yu+MP6zmbc7Ifogws0M755TuCuWyI=
X-Gm-Message-State: AOJu0YwZit246yw8Ak/9T2xgOCq0XMUs9ttRN23Si7OJp7U3HPZicf+z
	h7GgdTS/HQLffAK8Aqgvp3j3AmAu1mdZOJRR1Ro1eS+S7k3t64eK
X-Google-Smtp-Source: AGHT+IGvYq0XUQaDgo2b1zhaMjoLQlam8cibWHn5GgbCoSKj72iq1ZAvahi0NkyE48N8bfPt4YQ3Fg==
X-Received: by 2002:a05:651c:b10:b0:2ef:26f2:d3e2 with SMTP id 38308e7fff4ca-2f3be574b20mr115566071fa.2.1724164207760;
        Tue, 20 Aug 2024 07:30:07 -0700 (PDT)
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
Subject: [PATCH v2 08/12] hw/arm: xenpvh: Rename xen_arm.c -> xen-pvh.c
Date: Tue, 20 Aug 2024 16:29:45 +0200
Message-ID: <20240820142949.533381-9-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820142949.533381-1-edgar.iglesias@gmail.com>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Rename xen_arm.c -> xen-pvh.c to better express that this
is a PVH machine and to align with x86 HVM and future PVH
machine filenames:
hw/i386/xen/xen-hvm.c
hw/i386/xen/xen-pvh.c (in preparation)

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/arm/meson.build              | 2 +-
 hw/arm/{xen_arm.c => xen-pvh.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/arm/{xen_arm.c => xen-pvh.c} (100%)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 074612b40c..4059d0be2e 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -61,7 +61,7 @@ arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-e
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 arm_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-stubs.c',
-  'xen_arm.c',
+  'xen-pvh.c',
 ))
 
 system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen-pvh.c
similarity index 100%
rename from hw/arm/xen_arm.c
rename to hw/arm/xen-pvh.c
-- 
2.43.0



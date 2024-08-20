Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB26958945
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 16:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780533.1190204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPs5-0002Gy-EJ; Tue, 20 Aug 2024 14:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780533.1190204; Tue, 20 Aug 2024 14:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPs5-0002EG-9s; Tue, 20 Aug 2024 14:30:05 +0000
Received: by outflank-mailman (input) for mailman id 780533;
 Tue, 20 Aug 2024 14:30:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prYO=PT=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sgPs3-0000m9-CS
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 14:30:03 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0023ad1-5f00-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 16:30:03 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2f3f0a31ab2so6154331fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 07:30:02 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f3b771ebe5sm17418331fa.116.2024.08.20.07.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 07:30:01 -0700 (PDT)
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
X-Inumbo-ID: b0023ad1-5f00-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164202; x=1724769002; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2BvZYxCNM329YOtugIJJq27AP0DG+3t72psalP89h8=;
        b=FYrF7/vhsEKJ6H4dnL4yvAklO2+Rw2U3uNut8BE132QS5ibwGMROvazQmepFDMlOZ+
         ulMD1QsetLv847o2rTMjD8mbMckxy4bcVUtCmRG8xxTLrbNajrmR2OakJttkRDNiY8dN
         rHXCBRRGQxnTKCVn09aU28svtU34UoVAg2ZLkudl3walhFarkjzY1NvwdEYZKcLPAVyI
         bVCFao2+YTkD9swyapNlGeW242WWKHRi2TfbVHhR5rhF/8LcJ2rvB8+pQYU8n8VohLC7
         61su2svDoZr4AOkrnq1mffMOY4yOkkMSbbvWvcmEuvFEFMbuVk7PExsF1bHe4Cm7IoZC
         s5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164202; x=1724769002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2BvZYxCNM329YOtugIJJq27AP0DG+3t72psalP89h8=;
        b=PMYOEhFq8a/yUa1nbOVjj48rvsVPvyvbIonUfQ5HjSmNPR/0n6ZYDAjAB67xOx72V2
         D7Dy4sQLbvia+BKggGbruhDhPts5Xtw3uc8CJYWI8sVplDGUxOm42sAW+/NDIgRerzZu
         +s4RMNXcJwXCxWM8fREqBcdH2YFdpOnSpiUCgbvNDCwzZPU6e0XddwndFbjbnzqyR1gl
         7h+/C9c+rBulV2gSlBHGHIU7dnBttCOR9ypHCj8FKNd2tzg9hE0fX5ntA3OZwrSz+uyX
         1fh7u2KZLzYPujyy2iaT2kI/7rX2U71SYcIlN7Fp9hmiQ6ufJcfvJvHNJY5zbIY6ccMA
         8pQg==
X-Forwarded-Encrypted: i=1; AJvYcCW6Gkha8tgZFgmUuZqOhutoRhJElwAl3OAXDKH6XhlZVE83ILYDmXi3+TZpxyRWKwFZUehZAiKeZPk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxm1i12+UZe9E4Suk/BvCKDLVusdbeTjrENtiRaHj7K+MxeaLLM
	tumjNqJieyY5plXyhw8YkQZKA1NClo/YlOK64TtdpNykp3qXzzTG
X-Google-Smtp-Source: AGHT+IHrRwz7HWObwUTGagmH+INCDwhlgY6mEOdY8uIF9sicK4D/lPSZOM/URWXKGfy0q0Gg5vOZAg==
X-Received: by 2002:a2e:9119:0:b0:2ef:2b45:b71d with SMTP id 38308e7fff4ca-2f3be5afc99mr87868481fa.24.1724164201963;
        Tue, 20 Aug 2024 07:30:01 -0700 (PDT)
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
Subject: [PATCH v2 05/12] hw/arm: xenpvh: Remove double-negation in warning
Date: Tue, 20 Aug 2024 16:29:42 +0200
Message-ID: <20240820142949.533381-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820142949.533381-1-edgar.iglesias@gmail.com>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xen_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index fda65d0d8d..16b3f00992 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -165,7 +165,7 @@ static void xen_arm_init(MachineState *machine)
     xam->state =  g_new0(XenIOState, 1);
 
     if (machine->ram_size == 0) {
-        warn_report("%s non-zero ram size not specified. QEMU machine started"
+        warn_report("%s: ram size not specified. QEMU machine started"
                     " without IOREQ (no emulated devices including virtio)",
                     MACHINE_CLASS(object_get_class(OBJECT(machine)))->desc);
         return;
-- 
2.43.0



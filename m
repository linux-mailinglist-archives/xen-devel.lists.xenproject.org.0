Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEF3ACAB20
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:05:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002946.1382407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16L-0000cs-2k; Mon, 02 Jun 2025 09:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002946.1382407; Mon, 02 Jun 2025 09:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16K-0000Y6-UM; Mon, 02 Jun 2025 09:05:00 +0000
Received: by outflank-mailman (input) for mailman id 1002946;
 Mon, 02 Jun 2025 09:05:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qKV=YR=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uM16J-0007kh-Vr
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:04:59 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a89ace8b-3f90-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 11:04:58 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-54e816aeca6so5395978e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:04:58 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533791cdc3sm1507541e87.176.2025.06.02.02.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 02:04:57 -0700 (PDT)
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
X-Inumbo-ID: a89ace8b-3f90-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748855098; x=1749459898; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiaE/YXxsWcT0rjjz9SjADvJ7JVMLOm41080TZwDgkw=;
        b=ijoWbsD1V7y9lQ+/gVXTVzayAMW0UlokSVUX5g0WZWbRyn7/IBHqyW24dqdqt1RJ1m
         18mt4BEbYEwbSV/EoqG8mls6BinlCTVVsJdaz0dKsRg0ZDfwxxzGe3XgtG7U2lQO1GTH
         O9kGaIkZ9kpTPw+RbAMDPFzMFQm4hUYQgx2QlMsXwPpkD5RDYmjoIzww8lqFWdoaOUpg
         kX2TJsP1Tq2sBmU59TqSDmMweb9ZHGub7Ed9irWQKidYHIGS0yFx45FyO45YvHw4V6pR
         /uTuyuIEPV0G4FFMhbO3gQADVgjCR+f/S+dfYlNHSQs6/8zWknrpoVisqiV34hvoDF/4
         PVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748855098; x=1749459898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RiaE/YXxsWcT0rjjz9SjADvJ7JVMLOm41080TZwDgkw=;
        b=fTnz3cz+ptbfj0hGuf1sTJdkADw1986Trd3CMPRlNleCXvz+rzG++EbE8eCYwnm0Qj
         /4/MRN2ITTgRqJuAMjHg704mGzsIJP3SV5A03fZ6Pcfay2gPCPmkrA0bJomF8Bx/BB1d
         NhgEcE4qglpodO9Eq5TXBGVTzLxALMMg3iXf7uNS4/05+nIvYG/20n4/RiMt2CtSBSRS
         YIGN6LCW9GwfZ99gMVEpBIVj8D/qj87jSQUYE7uAs+WDbaR4MjKSnbV40mzqw+Js1cho
         10QeKG0+VpdzKiTHhvUwI3NEYDsaYuW8U3M9HBBrTf9eFG+WFkA7AWKckTijvRTQ0d85
         zGpw==
X-Gm-Message-State: AOJu0Yzr8AgXJ6UH9oVRvBhgkaz000wNhD7nWzj2rG6EAhHWIC05fEbb
	RqCe9duk8Dt/F5lRJBHNv3v+7ntIghi9Zp0PedTAOlqh3g2icCKE6B/V56QNwsui
X-Gm-Gg: ASbGncuswR0OiqA+UP2YrCI2ci5hTSzk2gA5/iivrvYZjbK9KIb61o0uEjKJ1cv6SU8
	6ixFT4wT0140n+m8M26wcymuSrUFmABA7k3Ni8AkBxg/5rdY0ULXUKg/jJYO/oZXM5YRZTMrgyT
	/XfWtdto4aE//qHz3/x3mrIdgT2/p1aec4Q/BhDxjlFDq/r2E/yW0k+MnC9YqxOYctQCBSn1jmx
	4pdIakiKLDJAUYb/G8/M58da7fccgTCL9cXfXPIkqxYV9BRJcrf3pyNTcGcNUKNchuyzdEqRbdD
	/et4p2Y9FLaMejqqDx4QsbZV4Gi8bZllBezQDfveJobCeYhBxkiGlvIXornVWok82WFJq94qF7Q
	zte7FpuO9sUtP8eQ=
X-Google-Smtp-Source: AGHT+IHT93ClrOVTknOM+Ss/N0Bog9/86dU4UzyGwalCHDLaSj4MeQjn7jNqW8uBN0iRuRnBK45f8w==
X-Received: by 2002:a05:6512:a91:b0:553:3654:3319 with SMTP id 2adb3069b0e04-5533b930abamr4209993e87.43.1748855097582;
        Mon, 02 Jun 2025 02:04:57 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: xakep.amatop@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4][PART 2 05/10] xen/arm: irq: avoid local IRQ descriptors reinit on system resume
Date: Mon,  2 Jun 2025 12:04:16 +0300
Message-ID: <36ef314ff29957fb9fa727319535a0479b80ca28.1748848482.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1748848482.git.mykola_kvach@epam.com>
References: <cover.1748848482.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

On ARM, during system resume, CPUs are brought online again. This normally
triggers init_local_irq_data, which reinitializes IRQ descriptors for
banked interrupts (SGIs and PPIs).

These descriptors are statically allocated per CPU and retain valid
state across suspend/resume cycles. Re-initializing them on resume is
unnecessary and may result in loss of interrupt configuration or
restored state.

This patch skips init_local_irq_data when system_state is set to
SYS_STATE_resume to preserve banked IRQ descs state during resume.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/irq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 03fbb90c6c..372716a73b 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -122,6 +122,10 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
     switch ( action )
     {
     case CPU_UP_PREPARE:
+        /* Skip local IRQ cleanup on resume */
+        if ( system_state == SYS_STATE_resume )
+            break;
+
         rc = init_local_irq_data(cpu);
         if ( rc )
             printk(XENLOG_ERR "Unable to allocate local IRQ for CPU%u\n",
-- 
2.48.1



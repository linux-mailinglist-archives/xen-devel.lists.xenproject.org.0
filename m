Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809AAB3F0D6
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 00:10:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105401.1456356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjO-0005rF-Go; Mon, 01 Sep 2025 22:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105401.1456356; Mon, 01 Sep 2025 22:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjO-0005iZ-AZ; Mon, 01 Sep 2025 22:10:30 +0000
Received: by outflank-mailman (input) for mailman id 1105401;
 Mon, 01 Sep 2025 22:10:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPXY=3M=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utCjM-0005XP-O4
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 22:10:28 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77a58396-8780-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 00:10:28 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-55f78f32580so1211845e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 15:10:28 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279307asm123038e87.75.2025.09.01.15.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 15:10:26 -0700 (PDT)
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
X-Inumbo-ID: 77a58396-8780-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756764627; x=1757369427; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Imh9qPLbn5GldmbHLssYKpBvOdimEk2erOhkD1ZB1X8=;
        b=la9/h4wyXouvgPLBUiIb+PFQZaA45R6xOBbtN4m5II8VC1xAlw/sWb3NjgQtnkD5pD
         90aisZLNF9fZnxtDuD5wtofyTWfP9UaJKrHSstT4ja/gVDIl0tLTmwozNQSbfcDg2xRv
         /MJDalRCcA2Qq/cMxkL1FAV/EmCA+QneMsPIMrOrXHvOcrYmVfPVijrAbcEi9r/bFs5q
         OR1DJXr7f9W7CHs2kt30rJ1payZaEOsoM1jyZetqqUrFTnxgStnWRUvxu1D15DSXcy+c
         R+oxUOt8NHtem+mtWuHF5zbzi0XDXDXurm4qOpEzIbmBZJJhyyKmA8KvqHsWMqPanoEt
         mrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756764627; x=1757369427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Imh9qPLbn5GldmbHLssYKpBvOdimEk2erOhkD1ZB1X8=;
        b=DTuGhUIXLcToMy6Qgo5XdlwYJkmXTf8XtOuYlG4wiFw5810G5pbGeBy2NjEbSK1XZF
         LFzrPf7wur0RF/BVWiUsE+2g5mMOuLFf9hci5gjdJt5asmoyvYTxlISovSoWnJa7GmbU
         2axd8kn38uSyz2Aqsy1icKuexqacB4KxqBZU9xtkl8z8T6frcuAcQ0iaLka6y7N7xlZ+
         w09F3bzcTwZ6JPOB4cUWr/CPpZv4msSaB4SZ+f+IzYBrMvGM/Z5Oq9SZ+S0FT/7yERP4
         M+3f1K5o6FCTGteQz5jl9+ykAv3969sWQvOeDBWwPIeVr+ViDi/g7/db/H2wAOZEbybH
         4E4w==
X-Gm-Message-State: AOJu0Ywd3M5ROClHBIx89fCVlJ6l614G1cUNbwHDCUn6OdwRwvmoIFPE
	LQRSlSRO/I/aer3jDfnzUL1i0dsC/dJhz8sfM/UymTp4/AGq0jiwh3BKu+0Rum0l
X-Gm-Gg: ASbGncuWAQtCPgMwZLfrpEm2fzX9E5YPH9bI5tg4WhEzEhPKS1VH03t5roP6Rw8YDaL
	EFLo2D1uQ3MpkdrYLdVxMs8QIlEA6skAndZrVJArhiodhh0XKWwZmJ0Pty5vSZOh7P5XJFziasL
	MHoZAyGCsmqDSzwo4V4NrE1lF6FvgIrsqcXKVX7J978T7MkfaQbvyN7az+dM0AofSBtrTvfB3oa
	wgD8dWpAFDmmkZAIZ0yYQ5FTmfTyB2KyFH/v81OZJeIrYvzw2FbD5yYBAn+n+hB9wHWZlYi/ECA
	uUanhG8EA2bd45IIvFkQOHkm5pCRtzR1U5KlZpjVeap5ELlmPmcwxFAPJnyQsrHN/mJlG/pdrgi
	qFE89X00YVz8tmeoEqWSx3QVGB1rTEbg9Ct6U3oSDi1aqHJknj7Qw1zqBOZJj+878PcRlp0vC
X-Google-Smtp-Source: AGHT+IGv4DeyaoILJLzD1OzBQ513bzoPPJ1uc4pXtpi4SvI8+NvOPK8grxlS2JGjHTs+MQgDr7xIIw==
X-Received: by 2002:a05:6512:2248:b0:55f:5195:9251 with SMTP id 2adb3069b0e04-55f708ec42bmr2709277e87.28.1756764627392;
        Mon, 01 Sep 2025 15:10:27 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [PATCH v6 05/13] xen/arm: irq: avoid local IRQ descriptors reinit on system resume
Date: Tue,  2 Sep 2025 01:10:09 +0300
Message-ID: <84acac884fa1df0ea64eef2253e75918d4b9245f.1756763487.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756763487.git.mykola_kvach@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
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
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/irq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 361496a6d0..6c899347ca 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -125,6 +125,10 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
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



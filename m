Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAE7B20225
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 10:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077105.1438197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulO9r-0006Gc-Lu; Mon, 11 Aug 2025 08:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077105.1438197; Mon, 11 Aug 2025 08:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulO9r-0006E4-J5; Mon, 11 Aug 2025 08:45:31 +0000
Received: by outflank-mailman (input) for mailman id 1077105;
 Mon, 11 Aug 2025 08:45:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21ui=2X=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ulO9q-0006Dw-0Q
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 08:45:30 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8867c500-768f-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 10:45:29 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6180b9e4e74so3409385a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 01:45:29 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.Dlink ([77.52.179.37])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3e80sm1995121866b.47.2025.08.11.01.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 01:45:26 -0700 (PDT)
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
X-Inumbo-ID: 8867c500-768f-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754901928; x=1755506728; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gOdShwPIr5kiLYik+t8QMnDr8E3Is5wCiMPgD2hGSeM=;
        b=UR4gSywtT2i9cL3hiuKIKc/B1cWkP7TLTpfuEwI8gL7qgivhy3jP21Jo/X5imsydDY
         LE/uKj1CWbnMszWXD2v9oiy+sLK7SsPO9jfzzWdLbFGuD/t/AYO0yXaH395IW0cT9yPp
         ZeZLS5KYB0ORNNu5WPdmUuJw5xQwRUBT/aPrOHASPo/Awholk34jGY8Q7B85LrKkIYUC
         5WefiJVY7BG+viKYadbvJ0fF/uzXg2uR4wU9Umbq2fgr99dqvIUfWrBF7n0LCShDBpcH
         kPcFuJkhfIwRTNW0Wr2Q+Ndob6iKQp6DQbyejmfyB9eFAccccG00N8dEHNTRvlS8UPRn
         9vEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754901928; x=1755506728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOdShwPIr5kiLYik+t8QMnDr8E3Is5wCiMPgD2hGSeM=;
        b=nLfrXFTZU5NMOe+4aUcStG7U6VQsZzskW3ORGL6rsJ9sIImcsRdrPNLP01YKlw5k/Z
         OCyZKbvgWaW0Vq0N2MoHE2NiFsX5jg2VJoW4hvRa+rwLON8WyvhCTGTX3/cegV0AvURd
         7MRtRPv69iIHX0IL1cXmm+N+TQzhHmtyqaVbpFF5dTMjINVTZ0SkCzP7G1hromAWkIl/
         gvtMOvTHDXATKZxUbRMN1wnJD6RHYZfI8BhPuozlqQHnhX07nArkObX+NNwNGO8CGVdK
         3XF5VBpDvCDtOr8CfLidrPWR7THxNeKBvftsDDaRpHIYdAPDOWkzGnBAgbrm8g0Cochk
         aLhg==
X-Gm-Message-State: AOJu0YxG305OEgNrha6vJYxKTuXGOGPi7+BHk7ppNOfnKcUG59Mxyc7V
	m6J2EByHD48/97ZQSAra1P5IGAsoL1riCKxyuz4aw9nNcNq6tcyx690sl7MwHQ==
X-Gm-Gg: ASbGncsDFN1h5+VTeLgS89ttyj0X/FFz9+Cvxo1+KNvGjITCzryihuxcG88qsdrmdTR
	YEHcPKarhUfjURIchRBD1gaBE+fpNEVcWRLFti3bb6kAzJ6rSN3JmzKDlVKO87zDKypI+yGIu6+
	ihh9hNNwWAzL3tRKwsUWyjloR2aSwJfnttI1rV6WvlskPZXd6BOFHdm0BU8T65dkQ6rdPKtrxHX
	6HbPTfu+9CIecrPv2PYAY2XeiZgj42eRfaRK7HGr0RPrytTD5s0bbYERrOjD+0fQQO5CL5M13Yj
	sCIpZzNzje7HCHSuKrtQDMiC6Lly17qQsXK9Xa45IWqilVFl8KpQpfncQT5ruc/61ZGBziwqoOT
	nTOO2X1cFiL6pshqlNQmC0xvD7jYsfuUdmdy2bm3fayql2f+CnOEJzK2VmeuTfx6JbxRse+8sRD
	3nkA==
X-Google-Smtp-Source: AGHT+IGUlIxSW/LjM+RZqJFYDftesPxQGIv1eDYD5ommX9a3Vaa6gtSD5P6RCX2uVd6PP4UC4nCv/g==
X-Received: by 2002:a17:907:971f:b0:ae3:cc60:8ce7 with SMTP id a640c23a62f3a-af9c64545admr1117750466b.19.1754901928057;
        Mon, 11 Aug 2025 01:45:28 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v2] xen/arm: irq: add missing spin_unlock() in init_local_irq_data() error path
Date: Mon, 11 Aug 2025 11:45:20 +0300
Message-ID: <f983bb7c3c9f0912da7e7f2fc22384ce1081a7a3.1754901835.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

If init_one_irq_desc() fails, init_local_irq_data() returns without
releasing local_irqs_type_lock, leading to a possible deadlock.

Release the lock before returning to ensure proper cleanup.

Fixes: 2bb32b809250 ("xen/irq: Propagate the error from init_one_desc_irq() in init_*_irq_data()")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/irq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 4bbf0b0664..02ca82c089 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -94,7 +94,10 @@ static int init_local_irq_data(unsigned int cpu)
         int rc = init_one_irq_desc(desc);
 
         if ( rc )
+        {
+            spin_unlock(&local_irqs_type_lock);
             return rc;
+        }
 
         desc->irq = irq;
         desc->action  = NULL;
-- 
2.48.1



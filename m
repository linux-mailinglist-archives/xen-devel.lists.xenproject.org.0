Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2EE968C92
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 19:01:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788305.1197803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQj-0002g9-JR; Mon, 02 Sep 2024 17:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788305.1197803; Mon, 02 Sep 2024 17:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQj-0002eG-Ft; Mon, 02 Sep 2024 17:01:29 +0000
Received: by outflank-mailman (input) for mailman id 788305;
 Mon, 02 Sep 2024 17:01:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uz6k=QA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1slAQi-0002dz-Cu
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 17:01:28 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe403d9b-694c-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 19:01:27 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53436e04447so4613540e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 10:01:27 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535408410f5sm1677618e87.211.2024.09.02.10.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 10:01:25 -0700 (PDT)
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
X-Inumbo-ID: fe403d9b-694c-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725296487; x=1725901287; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/b1txUous5i+ktHMfo/0HKYCErL3rShkCjh7dtbJiE=;
        b=Slr/TEIKKoZtE06F88c/dVlFaPvDsezSj4CMJjRqkzpx1K6NqJZHYtrQXcvC/vcxHs
         Oew/9EEuryjbM4j95lDYSNwqjUkW1Qm+e5/EtTMKRNCzG4GiYXpNXj+7K8DBuy9/G+vK
         uEr+ZSNkBdPhT9Q0pC1QBHSFEAGsAFFMLBBX4xx1rYFi5smYSkk/nvhjnzWUrevsp4v+
         8qbsLjfWSG+G6nJBTdekTGk0W4+qMuwxl3rR54DJL1K+c1zCsFGO03p5y8nEovbAy1JY
         GuJlrlgOd9aO8qr9QSlDJm3L+TvsskMsLLSV34umkjyzsgQtpPzqzQHC+WfZ9mnwLfLh
         DHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725296487; x=1725901287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/b1txUous5i+ktHMfo/0HKYCErL3rShkCjh7dtbJiE=;
        b=oyFhxBn7AZOqCMgXc7q3oM1P78RanpsRW4iqITneTf78TaDnqDgmALAcBsMVTjpIFN
         xi0fUosYPJgyeFn2JL8ehtiQoYjf3Bt7Frn66lZ9lIg433CJwikWmfamk+TJJcLZ4TTp
         K/lzkU16V9IUrAbWecb5lSwQyjIfgPokH6zuQ6rpEAqtSwTWzFLSvr8HJ+tpA00KVYm8
         APtIt6TIHjZAK0xeJnJqKJpWb5KX/nnboeKZAwloGEFqCxdUCwcCnn0BNiuFxwfSP1Gw
         1eK3r9tHYYkaVEouBMboWcp4xeCmFPZoBmJFInPQeKtscOlSBUKrG6oCzKFKlNvX5A56
         SLAQ==
X-Gm-Message-State: AOJu0YxCKEjd76l2rZkLHK1ZM7rtN+ZKnoBK9C4dTmImU4roBeOksrZt
	9/GAomJ9oecvcfScyM3M7l3NCLFjz5+kk+P8JhcAeFB5UiuAKWcFJQXVjg==
X-Google-Smtp-Source: AGHT+IG8COlsZudurRdZLf0fwMR2oSLrGHdqv2PQP19ChwinCJKmmfDuqTHIs+LY1BCd+RiOlSr0ag==
X-Received: by 2002:ac2:4f01:0:b0:533:447b:94f0 with SMTP id 2adb3069b0e04-535462f773emr3845371e87.10.1725296486110;
        Mon, 02 Sep 2024 10:01:26 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 1/9] xen/riscv: prevent recursion when ASSERT(), BUG*(), or panic() are called
Date: Mon,  2 Sep 2024 19:01:14 +0200
Message-ID: <3d32a952c7cc77fd759e211c3b60427485a75582.1725295716.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725295716.git.oleksii.kurochko@gmail.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement machine_restart() using printk() to prevent recursion that
occurs when ASSERT(), BUG*(), or panic() are invoked.
All these macros (except panic() which could be called directly)
eventually call panic(), which then calls machine_restart(),
leading to a recursive loop.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v6:
 - new patch.
---
 xen/arch/riscv/stubs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 3285d18899..144f1250e1 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -53,7 +53,7 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
 
 void machine_restart(unsigned int delay_millisecs)
 {
-    BUG_ON("unimplemented");
+    printk("%s: unimplemented\n", __func__);
 }
 
 void machine_halt(void)
-- 
2.46.0



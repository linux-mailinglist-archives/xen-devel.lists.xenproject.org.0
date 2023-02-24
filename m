Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8196A1DC5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 15:49:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501086.772678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZNY-0007kq-Au; Fri, 24 Feb 2023 14:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501086.772678; Fri, 24 Feb 2023 14:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZNY-0007i0-7a; Fri, 24 Feb 2023 14:48:56 +0000
Received: by outflank-mailman (input) for mailman id 501086;
 Fri, 24 Feb 2023 14:48:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVZNX-0007IB-4m
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 14:48:55 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c43c133-b452-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 15:48:54 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id n2so14923450lfb.12
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 06:48:54 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 b4-20020ac25624000000b004a6f66eed7fsm1571158lff.165.2023.02.24.06.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 06:48:53 -0800 (PST)
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
X-Inumbo-ID: 5c43c133-b452-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Hs9xct8hb/nlXAK7Nyc2whENbhfxbFpjP6SpILZy2o=;
        b=FPNQbAO9m/t3pUb9Qq4/M/P+igikEs6zD8PA2Ec+U1BmOqn0F44xgZIuYxHUrsNr8u
         lZm1KUwOPTzrStl/+XXPcUaNkPV2BMHaMhfBB0CSp9N5X8APiChTuHvkp6uMjimIJFoG
         pZvcGXgft91aAd6F8bEWNC540FFGjwxqO8X8fkFuMpLwg8T638ymRnBp6KYUXE/S5who
         Kb664/anteIkDPTHIi67LKVOz4kgx9BVz/CFXT2IXbIfW0X4JMBEpi7XVlR0Bd0SxPsF
         /NoBqTZtnmG23UUPNd0+0mSG9pGzT+9xGGKXY1sG/NwLE2j30Mf+gZa9FhxLPk9CIFZ/
         tvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Hs9xct8hb/nlXAK7Nyc2whENbhfxbFpjP6SpILZy2o=;
        b=vdRE81T/oGX6b8jlL0VJV4kAKpfdBg9m+lWpxTR7pRVema7kB++d0Z8ELV1zkfAz1M
         SVJCOXzU3pVmrYonAzcCOWddcYKyoNLp92avkLm8khpOfbPuXjSsqeWTT92a8AOYsg/c
         q0n6v6Tg86+ZUf84tuUy9Xfr/j4CTFCLYcb/+meKb19+3xxQd+xHWssBLqraGuCSnVaz
         RpzzBvYHGqnDVSOMq9tD5S6/J52bgED1L7w/G/O+xj086VSS84C/cJ/yJw4pZIYDd325
         XUsYrDOTUuFvK0YENiWnR1XPyfroni4HcA+bNCy/Z36pV/wk72dOv+IYzmMEX8tGLh1U
         RjrQ==
X-Gm-Message-State: AO0yUKVE7Lkzo1g2sNrltUH3B5XoyYYYT+60YIjHGLcaxLJP36szYPzW
	ictR7OXj+3LpBi/0MshCvtm1VoYIqzQ=
X-Google-Smtp-Source: AK7set8XUbyS+x4trNUwRHRaJheIJVa3nylABL8kQj57GkzJC17ug5YeZT4f4LbHhu/zXi5WMySxiA==
X-Received: by 2002:ac2:4f10:0:b0:4dd:840d:462 with SMTP id k16-20020ac24f10000000b004dd840d0462mr5633142lfr.21.1677250134025;
        Fri, 24 Feb 2023 06:48:54 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH] xen/riscv: disable fpu
Date: Fri, 24 Feb 2023 16:48:50 +0200
Message-Id: <63c797ba52f6d7edc64f9d2e41b460c7d64330ae.1677249707.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable FPU to detect illegal usage of floating point in kernel
space.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/setup.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 593bb471a4..b7cd438a1d 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -36,6 +36,11 @@ static void __init init_bss(void)
     }
 }
 
+static void __init disable_fpu(void)
+{
+    csr_write(CSR_SSTATUS, SSTATUS_FS);
+}
+
 void __init noreturn start_xen(void)
 {
     /*
@@ -52,6 +57,8 @@ void __init noreturn start_xen(void)
 
     init_bss();
 
+    disable_fpu();
+
     early_printk("Hello from C env\n");
 
     trap_init();
-- 
2.39.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 278299432B1
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 17:07:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768883.1179770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZAvC-0005o7-BV; Wed, 31 Jul 2024 15:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768883.1179770; Wed, 31 Jul 2024 15:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZAvC-0005lL-8j; Wed, 31 Jul 2024 15:07:22 +0000
Received: by outflank-mailman (input) for mailman id 768883;
 Wed, 31 Jul 2024 15:07:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8n5P=O7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sZAvB-0005lF-AJ
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 15:07:21 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94c25375-4f4e-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 17:07:19 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ee920b0781so64563391fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 08:07:19 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03cf30a53sm19367471fa.36.2024.07.31.08.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 08:07:18 -0700 (PDT)
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
X-Inumbo-ID: 94c25375-4f4e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722438439; x=1723043239; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JFTPpkUXnHw26frZhG98sBSbGhl3tzyrEalE9FXQgcM=;
        b=e0RIF7KgnioOK9c4aL5lAX0YRTpUVIQGhGL/59cPvW5sPGxEJ6tkO45okJ7KofCri9
         v4eY2Wgij4bDYTgl1cYmQGzGw/9tkxmiJUe9tfJh1ySt3g8ctA1tWsiXFrvWfhj2QDen
         Fc0vify29zkUsWwwfTwuScQvi6pXVE+7gD2PKCnanWbfAOa0kGqWc8z+aoXLiDZWqRwh
         Zm9RkcR3I7rSIohnWnlRkGHWOlyETcQS+sr/kupfFJ68KT0UHlsmzroSAB2+yfgYcn1W
         lKdZzU3yAKhpBiO8XKSNG9MYWzq0ehRx6CTrlv38/Ru8P9pUOq3bUpoTysDyB1/rhtXa
         j7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722438439; x=1723043239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFTPpkUXnHw26frZhG98sBSbGhl3tzyrEalE9FXQgcM=;
        b=MmdqyX2dFSPf3ciVNtuHEtXO/CSVqysD9jzHKng5WBoaNK0YMtZaC8dr9g5tjhHMTY
         Dgrff4S8cv9LArG6kWXiYOcZVe5wsRD7C5KkcD1HCRYbHluE+mMQmSNRHwyk6htUOJns
         OpSiFVPxz7VfJT82x940XiXSaa88hCdkkoJYrIgIGlj8aSSJte8Wkzc9/x/eZtEwbrv8
         eP9IBOV2bjc7AaClUY4vnUCwUb1yqgKcQlt5ZGO1ME8V0TrZaah+flU7VB74+BADUeCf
         nTGWLXYm00bO5QSYMG5KAvcEPqJz7zb2X6CCe/0e/L0Cc4tHjhSLfjPQy/FfkKcTdHBu
         Uxdg==
X-Gm-Message-State: AOJu0YwroWvya9y/4x0XeFK07goe9J1+x4HvyHqixZ8cqrSHwGpPIoID
	XgrXANz4ElunpCHPlBAQ4zlGCBQvdoPrAW+wXjMh3s3+hrRBPHmPrg1Egg==
X-Google-Smtp-Source: AGHT+IHT0nkuXrf3hGWqeRSHxDcD4LzIvu4eolwxHG/7xM/qFi6MVc3u0jxtz8BGGksHY7MQ2gVGtA==
X-Received: by 2002:a2e:91d4:0:b0:2ef:1f68:eae1 with SMTP id 38308e7fff4ca-2f12ee077famr97272921fa.17.1722438438207;
        Wed, 31 Jul 2024 08:07:18 -0700 (PDT)
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
Subject: [PATCH] xen/riscv: fix build issue for bullseye-riscv64 container
Date: Wed, 31 Jul 2024 17:07:08 +0200
Message-ID: <20240731150708.122778-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address compilation error on bullseye-riscv64 container:
   undefined reference to `guest_physmap_remove_page`

Since there is no current implementation of `guest_physmap_remove_page()`,
a stub function has been added.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/arch/riscv/stubs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index b67d99729f..3285d18899 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -381,6 +381,12 @@ int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
     BUG_ON("unimplemented");
 }
 
+int guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
+                              unsigned int page_order)
+{
+    BUG_ON("unimplemented");
+}
+
 /* delay.c */
 
 void udelay(unsigned long usecs)
-- 
2.45.2



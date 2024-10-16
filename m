Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D809A0530
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819726.1233189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t108Y-00068q-GX; Wed, 16 Oct 2024 09:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819726.1233189; Wed, 16 Oct 2024 09:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t108Y-00065H-A1; Wed, 16 Oct 2024 09:16:10 +0000
Received: by outflank-mailman (input) for mailman id 819726;
 Wed, 16 Oct 2024 09:16:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8GJ6=RM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t108W-0005Dr-9j
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:16:08 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 464a56a6-8b9f-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 11:16:06 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-539fbbadf83so3650876e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 02:16:06 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a000129eesm391451e87.259.2024.10.16.02.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 02:16:05 -0700 (PDT)
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
X-Inumbo-ID: 464a56a6-8b9f-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729070166; x=1729674966; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq1Ji0h1S5Dw2PEhn0+S62eckwVA0WVyWGndSlD+Pe0=;
        b=LpondwmI2+PhEDMQBJFrAL4cBU9ir79eVPXLnvmxhrrQmPkN0Umj7jksn3+hTjqyDl
         S7X+ExE9M3QPziSXfm6cFi+JTSq/5EaFy+oqpNeTlfELvqR7gQJdQr+yWE5XFvUYKqR8
         PNbificNlG4guCVl+FwnYvOd2Qhm5oBvYAGk6y6WRnEcS/VpQREqKJFOheabCq9mBgES
         xWqwsrhIM8DGsHxrbrpf+vbrl8EGV7KbG3mWWWGddH7maUkEw4GQpuYiEg02GE2t5ACC
         td/SQMA/nKp8RnZoAeIZ2Pk/gJY8zFTZNY01u8Xjg+w2xqtjsW7JQLGVtCQgOUt6/d9R
         VIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070166; x=1729674966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uq1Ji0h1S5Dw2PEhn0+S62eckwVA0WVyWGndSlD+Pe0=;
        b=ofIHNf2XHbR3jONHaZg2Sb0hQokUt/6IlCL9mJPeJUTgVPPKy8tWaqy6mfMdpC79mE
         ZKzLGdx3gNoq8itqn/X3xPiZtMdCpanzsrqQbxMX4nX3vK2+jmV72UpvFzEx1Gkt2Ega
         9jim8Cs7uvJE9vulaWiC0bXy0vvnzZv0FUDf7jdHSIsWcQHHWiCpK47HgilMXB7qXUlR
         86dkt4+n/3xQHu4+F+ccrZBQZ4ctel5haKbx+/ZBN83rUY0pWTrQ0nAJ6wBuX/WSl83q
         5Kw9xDRMl3VwmLzuc19JCfvlRphb3IKiXQzybzqf9kTZx2R6xY4rkI2HfZokDT03Zhwd
         aNmA==
X-Gm-Message-State: AOJu0Yxkuc1M/LmsTsviJcPvPJct59f3we3+fkgDkUHWMRKlv2y+0Z2U
	4pE4VBl1WoNWLs1iJb7zXGx5XoqvPSz+ReJZLIWDEQT7C2WliucaPjB1+w==
X-Google-Smtp-Source: AGHT+IGO+hyNoyG8ho2yeBme03+6EdXfXPmLx1WZxdmZiZeFAIbiv88WI4R0FDSR9TzuYZZ5fIxFCw==
X-Received: by 2002:a05:6512:3d23:b0:536:568f:c5ed with SMTP id 2adb3069b0e04-539da3b41c0mr8592917e87.1.1729070165984;
        Wed, 16 Oct 2024 02:16:05 -0700 (PDT)
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
Subject: [PATCH v1 5/5] xen/riscv: finalize boot allocator and transition to boot state
Date: Wed, 16 Oct 2024 11:15:57 +0200
Message-ID: <d3f3108653b7ad42c085118cee3a6634b3227c86.1729068334.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729068334.git.oleksii.kurochko@gmail.com>
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a call to end_boot_allocator() in start_xen() to finalize the
boot memory allocator, moving free pages to the domain sub-allocator.

After initializing the memory subsystem, update `system_state` from
`SYS_STATE_early_boot` to `SYS_STATE_boot`, signifying the end of the
early boot phase.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/setup.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 3652cb056d..9680332fee 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -65,6 +65,14 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     vm_init();
 
+    end_boot_allocator();
+
+    /*
+     * The memory subsystem has been initialized, we can now switch from
+     * early_boot -> boot.
+     */
+    system_state = SYS_STATE_boot;
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.47.0



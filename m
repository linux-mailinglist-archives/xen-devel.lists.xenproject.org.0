Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F8B6A1DFE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 16:06:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501137.772749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZek-0006RC-GS; Fri, 24 Feb 2023 15:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501137.772749; Fri, 24 Feb 2023 15:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZek-0006P5-DQ; Fri, 24 Feb 2023 15:06:42 +0000
Received: by outflank-mailman (input) for mailman id 501137;
 Fri, 24 Feb 2023 15:06:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVZej-0006Ou-8l
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 15:06:41 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d78ae3bd-b454-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 16:06:40 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id b13so15435084ljf.6
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 07:06:40 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 d23-20020ac25457000000b004d863fa8681sm1492443lfn.173.2023.02.24.07.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 07:06:39 -0800 (PST)
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
X-Inumbo-ID: d78ae3bd-b454-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=15r4qNmq9J3Ng12XQxf1KofVc3mLAOcGQ5mfhCiR/cs=;
        b=MHsG/oBZGPtXAwgyVfUwHZBMNIqzbWZ1kW/XW2zOimWNruUNtDMrHk1DmeEeJ1KnOI
         psTM+AtLOE1JilOdmmMpqMzR4KZSY4XwXZ1gNFEk2XHIQUuGVANuN6JB9iKlr34AGUfL
         NlMsOysODTRbqhO7g3HRt/bjrP/KIUn0GXuA9rTu85I/G6v4UpzO1mOdURWHT32Uhy/R
         tzeXJLoNt8OOOAPtFmaxYGKOSkmeVq0Bh4RRxa7a+e+yjz8qrtQa5kunaH7UyzfzwW9N
         RWWQ342y+1QkyzufPlQNGt4T0qeCTJvHFXLHlJEqqGC8xuizl32dp6Fr3yh7XJxA6iGw
         Euuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15r4qNmq9J3Ng12XQxf1KofVc3mLAOcGQ5mfhCiR/cs=;
        b=xgtSlgPFNovNeVPIUZssRbz9ZTqm9FbJk64LVRPCxFpRHrXJzhQugTnV3uxAsKC6fe
         Uwx3uCvVuHfoLPs8SWeHZA0Gud86DvIf9SbW2JxzDqmXNxE7eNqqDmK4H7tP8EGdzmv+
         umjUYZ5asw7xdusjt10PLDj50r2rLY4D1tZpZ5Siw3T2Ls4HaR3/xItdD7OyhtyaFv5F
         1ZFu8R7yzRgoJtzHgjR9a+bypVB3qBfNst9aNrLd+pDu+co8dGb+qbKhL/sCwFlMvtMq
         xgFLtrmRi7BhqSaICnFiabzvwMtjjkyvaJ/VSb/zuyI44sCx/PLsUumA38M+cBHV3Dkt
         uG6Q==
X-Gm-Message-State: AO0yUKUIE9BepEEMvREwaH4CjnurDchSS2M3y86z3WpgRFYwlT8X1QPf
	byO7zeXlvIdZwP/s0RwD5C0DQLbDAHY=
X-Google-Smtp-Source: AK7set/5BmrZmVHTpT5zPx9cW2CXbZRcOsbPDOiPcYrXrwc6NxZVi90IbQsJni8SGPff05K8pGN8Xg==
X-Received: by 2002:a2e:7310:0:b0:295:9659:fba5 with SMTP id o16-20020a2e7310000000b002959659fba5mr4011795ljc.37.1677251199776;
        Fri, 24 Feb 2023 07:06:39 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1 0/3] enable MMU for RISC-V
Date: Fri, 24 Feb 2023 17:06:32 +0200
Message-Id: <cover.1677250203.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series introduces the following things:
1. Functionality to build the page tables for Xen that map the
   following:
     * The physical location of Xen (where the bootloader loaded it)
     * The link-time location of Xen (where the linker expected Xen's
       addresses to be.
2. Load the built page table into the SATP
3. Enables MMU.
4. Updates smoke test to grep message which should be printed after
   MMU is enabled.

Oleksii Kurochko (3):
  xen/riscv: introduce setup_initial_pages
  xen/riscv: setup initial pagetables
  automation: update RISC-V smoke test

 automation/scripts/qemu-smoke-riscv64.sh |   2 +-
 xen/arch/riscv/Makefile                  |   1 +
 xen/arch/riscv/include/asm/mm.h          |   9 +
 xen/arch/riscv/include/asm/page.h        |  90 +++++++++
 xen/arch/riscv/mm.c                      | 223 +++++++++++++++++++++++
 xen/arch/riscv/setup.c                   |  11 ++
 6 files changed, 335 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/include/asm/mm.h
 create mode 100644 xen/arch/riscv/include/asm/page.h
 create mode 100644 xen/arch/riscv/mm.c

-- 
2.39.0



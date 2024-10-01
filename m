Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F9198BAE9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 13:22:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808010.1219800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svax8-0006M5-MX; Tue, 01 Oct 2024 11:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808010.1219800; Tue, 01 Oct 2024 11:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svax8-0006Ka-JG; Tue, 01 Oct 2024 11:22:02 +0000
Received: by outflank-mailman (input) for mailman id 808010;
 Tue, 01 Oct 2024 11:22:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Um4/=Q5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svax7-0006KJ-5j
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 11:22:01 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f9cd9c8-7fe7-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 13:21:59 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5398996acbeso4572534e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 04:21:59 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53980fcdcd6sm1445087e87.153.2024.10.01.04.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 04:21:57 -0700 (PDT)
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
X-Inumbo-ID: 5f9cd9c8-7fe7-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727781718; x=1728386518; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Plfr71v2bxYhURdWj2jJFNZX3VR3MQK5x6JBIYFkLTk=;
        b=R/P4UFOOW2vBvW/qOcIl0TuEso3iHwknTrc4H4wKBvn5qO0ML1Uh2sWqa2zgCK3hVl
         uxIKi+nEOp8W6qn2qVUAlrioO68X3viIqwOJXUj+vRlVbogOGq2CalhiF94ElGsrRrsm
         KnEXzlsT4ex673bdQomuVfkj0wBp7+DLjbgHfajFXuAyeNkPbWTasSVMpYheI4lgPxa1
         7S3sZ/ouI+xKD11yHoC47YXx5zJWUED7hq1uQrxYDYq7ZDi65hx9i0DAyi/tWnfAUysA
         u4T6D4PJTznSausGbGU1CULrfZ0o5MEMNtUvH2aXLfzM3rCwtMiBNTiEFo5pec5Ep8O5
         c3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727781718; x=1728386518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Plfr71v2bxYhURdWj2jJFNZX3VR3MQK5x6JBIYFkLTk=;
        b=OwVZEuprgiW0Hm4wugjVb5rUGf8mnoQf1J7JFVkyBC69pNtIHJ+bSx4t63THnbTlbO
         prAL38XKRTfLNTCQOUWzeB+MuBK1ygqSXoxacw8023Xx7AjQ9YvBOBLZKDWoHPkedGm1
         RL6Yxbb4bMiZfoUHncXFn5E+t189zfEzO9XglGnRPN9CFPYfFkxJssITRW65Qu4ns5iB
         M/QWimuY4bIMcOa7D1fyiVPggkN0kcyzLywWssTS/lN/sVzvn4fp2JHqXfHPLiHOffyY
         MYjeAbnHi9oLAjZAckR9Ty1Px80byAB8BPCZEDd0hp5xZo9p86isXpvG1k42Wk1ZgdAR
         XUzQ==
X-Gm-Message-State: AOJu0YwaQdFf1pwDAg/hKGuIeN9ZQ3mqd2NbLntxM9qG2pWBTWQ8Jsqr
	U4Pv/JJeM3jrmsJE87e8/uoFDV6a0uiQL9EuE3Mb88vMuPLsP5l5HpOs1A==
X-Google-Smtp-Source: AGHT+IGNi4hAvrt+/eJtatVzYfC0hbEH8cw/laLW2MdjOnTm8D1IHIx8fdl0eThCt5PVq/AJTPX+qA==
X-Received: by 2002:a05:6512:10c6:b0:539:8e77:9129 with SMTP id 2adb3069b0e04-5398e7791c7mr4908877e87.44.1727781717948;
        Tue, 01 Oct 2024 04:21:57 -0700 (PDT)
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
Subject: [PATCH v9 0/2] device tree mapping
Date: Tue,  1 Oct 2024 13:21:20 +0200
Message-ID: <cover.1727781468.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current patch series introduces device tree mapping for RISC-V
and necessary things for that such as:
- Fixmap mapping
- pmap
- Xen page table processing

---
Changes in v9:
 - The following patch was merged to staging:
   - [PATCH v6 2/8] xen/riscv: allow write_atomic() to work with non-scalar type
   - [PATCH v2 4/8] xen/riscv: setup fixmap mapping
   - [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
   - [PATCH v3 6/9] xen/riscv: introduce functionality to work with cpu info
   - [PATCH v3 7/9] xen/riscv: introduce and init SBI RFENCE extension
 - All other changes are patch specific so please look at the patch.
---
Changes in v8:
 - The following patch was merged to staging:
     [PATCH v5 1/7] xen/riscv: use {read,write}{b,w,l,q}_cpu() to define {read,write}_atomic()
 - All other changes are patch specific so please look at the patch.
---
Changes in v7:
 - Drop the patch "xen/riscv: prevent recursion when ASSERT(), BUG*(), or panic() are called"
 - All other changes are patch specific so please look at the patch.
---
Changes in v6:
 - Add patch to fix recursion when ASSERT(), BUG*(), panic() are called.
 - Add patch to allow write_atomic() to work with  non-scalar types for consistence
   with read_atomic().
 - All other changes are patch specific so please look at the patch. 
---
Changes in v5:
 - The following patch was merged to staging:
     [PATCH v3 3/9] xen/riscv: enable CONFIG_HAS_DEVICE_TREE
 - Drop depedency from "RISCV basic exception handling implementation" as
   it was meged to staging branch.
 - All other changes are patch specific so please look at the patch.
---
Changes in v4:
 - Drop depedency from common devicre tree patch series as it was merged to
   staging.
 - Update the cover letter message.
 - All other changes are patch specific so please look at the patch.
---
Changes in v3:
 - Introduce SBI RFENCE extension support.
 - Introduce and initialize pcpu_info[] and __cpuid_to_hartid_map[] and functionality
   to work with this arrays.
 - Make page table handling arch specific instead of trying to make it generic.
 - All other changes are patch specific so please look at the patch.
---
Changes in v2:
 - Update the cover letter message
 - introduce fixmap mapping
 - introduce pmap
 - introduce CONFIG_GENREIC_PT
 - update use early_fdt_map() after MMU is enabled.
---

Oleksii Kurochko (2):
  xen/riscv: page table handling
  xen/riscv: introduce early_fdt_map()

 xen/arch/riscv/Makefile                     |   1 +
 xen/arch/riscv/include/asm/flushtlb.h       |   9 +
 xen/arch/riscv/include/asm/mm.h             |   4 +
 xen/arch/riscv/include/asm/page.h           |  80 ++++
 xen/arch/riscv/include/asm/riscv_encoding.h |   2 +
 xen/arch/riscv/mm.c                         |  58 ++-
 xen/arch/riscv/pt.c                         | 421 ++++++++++++++++++++
 xen/arch/riscv/setup.c                      |   7 +
 8 files changed, 576 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/riscv/pt.c

-- 
2.46.1



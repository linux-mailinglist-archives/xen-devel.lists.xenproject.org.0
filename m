Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0722A25A77
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 14:12:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880589.1290670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tewFL-0003n8-Ts; Mon, 03 Feb 2025 13:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880589.1290670; Mon, 03 Feb 2025 13:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tewFL-0003ke-Ql; Mon, 03 Feb 2025 13:12:15 +0000
Received: by outflank-mailman (input) for mailman id 880589;
 Mon, 03 Feb 2025 13:12:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2EM=U2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tewFK-0003kT-Gg
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 13:12:14 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bac043f-e230-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 14:12:13 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38634c35129so3436433f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 05:12:13 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-190-108.w90-112.abo.wanadoo.fr. [90.112.153.108])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b574fsm12737179f8f.70.2025.02.03.05.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 05:12:11 -0800 (PST)
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
X-Inumbo-ID: 7bac043f-e230-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738588332; x=1739193132; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QpXuXHF0no0Bfhrm+59JJLv56WTQ22yuCTrpf9aOKFc=;
        b=SrtTDQY5go24wOEJqqwTClLK+rVRAEMG13cpXuEc4mtr4f5spQE2OaONphpATr/iPr
         v38/Y02YkNWYc9CB9sT2qgXzbarMoN60rSyW8kx/cveNDLfaqqQ27ex7QXGnpf+Ykhzh
         glOViOD3+RcHWKd5wUvPgPMkU4nwkTkm7uVRBS2WvotnbYBpZZjCgnXoE7Gf0Jn+8+uT
         nKqfGEZ7n4t6+kfsb85j5curJ2gYF6Ramss5I+RDnWTqONhEbHnIRboPIiCPs+asdhdw
         kKSWFJBbEz5EwV1EJWqLzuW/fctG5/ADQOZsWbr2OxqUqtNtWbXB4Hgm2QY5QvQFHbHo
         tz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738588332; x=1739193132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpXuXHF0no0Bfhrm+59JJLv56WTQ22yuCTrpf9aOKFc=;
        b=FZt8dJajv4DXGj+adW+AUunplFneE0IgT0plq+KCirlofAP1R17mIgWtZRcH5oqu24
         lBvbiLMXb1c23N63x8nRicZ0hnjGfYwhvVMYh39DGCPHMx0CqZjIe1hiSCIjUR0aiBJe
         Hl08zI/RUNwnKSb0c/VjW9QOwJaentME+cNgt5IL4dzS3aAFnqbbGzdyW+Ze0VbeKzd4
         idhENA6cvWZ8+IUMDi8ewxuXUBpU2uIPtgKe3hb5Qb+hJ/Zln2n09GY7eFEEoIOmjyUT
         A2GExmWlbJXo3/DWwOkSY+c5V1Rm+BJxHR375euq1e1joxquJIOtLOmu0ddCBGsSBpDT
         9F+A==
X-Gm-Message-State: AOJu0YxGBV5FH2sMGtQN1K3SWKLE2jWDCpVr2H0vxJP95tNzOBdR9vs2
	keSN79cf78zmO+I8tTh3r6RF26W72qAY4G5enBhurdVzdQ/TYaOzhg9PxWM0
X-Gm-Gg: ASbGnctgriEDipx7AvDGOoB6GF4qbhEoIoi9u5mAwgjYFK0N6XHcIbW9XgZSH5N1ups
	rXgtMBooq/rfxc/R5qScJjMeLUOrJxp7NeGwOGkyMHYE7GmnnGX1vVuafoAku2kZ90EQDOgkA9O
	nxju75lz9u1hPn4oN4CjcJwRmSnXCdt7fjv2lkFT1CtnICH3GiadVwjkjEiOe0oHd2eL+XDPndT
	2a3fDKR3RMNAcgtmAdwdd7sIbniPRXYyHwqPG+3NsyeOHa5B1V15J0Zvhz7k8IktGoz2aChI3xa
	x8EL8G3d5ReCUb7nfncgKHqnHZOsF8hWzwRPX9Dx0j5d5xjodnCNb9Jw3UJoGbSY5lvXOKGQmMa
	Z2wjH2sQo
X-Google-Smtp-Source: AGHT+IHAzlp/vlx0Xtb+A9Unh58btmXPW3tDQ1yuG6deq4a9f/iWHPBrBJwYIZr1HoMirTXxqZzG4A==
X-Received: by 2002:a5d:64e2:0:b0:38a:8c9f:dd61 with SMTP id ffacd0b85a97d-38c520b9c55mr18173126f8f.46.1738588332268;
        Mon, 03 Feb 2025 05:12:12 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 for 4.20? 0/3] Fixes for vmap_to_mfn() and pt_mapping_level
Date: Mon,  3 Feb 2025 14:12:01 +0100
Message-ID: <cover.1738587493.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce pt_walk(), which does software page table walking to resolve the
following issues:
1. vmap_to_mfn() uses virt_to_maddr(), which is designed to work with VA
   from either the direct map region or Xen's linkage region (XEN_VIRT_START),
   thereby an assertion will occur if it is used with other regions, in
   particular for the VMAP region. The solution is usage of pt_walk() for
   vmap_to_mfn().
2. pt_mapping_level() returns incorrect page table level in the case when
   mfn==INVALID_MFN when, for example, VA was mapped to PA using 4k mapping,
   but during destroying/modification pt_mapping_level() could return incorrect
   page table level as when mfn==INVALID_MFN then only VA is taking into account
   for page table level calculation and so if VA is page table level 1 aligned
   then page_mapping_level() will return level 1 ( instead of level 0 as VA was
   mapped to PA using 4k mapping so there is incostinency here ).
   The solution is an introduction of PTE_LEAF_SEACH bit to tell pt_update() algo
   that it should use pt_walk() to find proper page table entry instead of
   using for searching of page table entry based on precalculated by
   pt_mapping_level() `level` and `order` values.

It would be nice  to have these fixes in Xen 4.20 but isn't really critical as
there is no any users for RISC-V port at this moment.

---
Changes in v2:
 - update the commit message.
 - other changes look in specific patch.

Oleksii Kurochko (3):
  xen/riscv: implement software page table walking
  xen/riscv: update defintion of vmap_to_mfn()
  xen/riscv: update mfn calculation in pt_mapping_level()

 xen/arch/riscv/include/asm/cmpxchg.h |   1 +
 xen/arch/riscv/include/asm/mm.h      |  18 +++-
 xen/arch/riscv/include/asm/page.h    |  30 +++---
 xen/arch/riscv/mm.c                  |  14 +++
 xen/arch/riscv/pt.c                  | 142 ++++++++++++++++++++-------
 5 files changed, 156 insertions(+), 49 deletions(-)

-- 
2.48.1



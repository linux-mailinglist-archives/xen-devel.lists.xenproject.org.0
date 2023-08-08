Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EABF0773AE6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 17:14:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580029.908287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOPw-0004WZ-8x; Tue, 08 Aug 2023 15:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580029.908287; Tue, 08 Aug 2023 15:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOPw-0004Uc-63; Tue, 08 Aug 2023 15:14:40 +0000
Received: by outflank-mailman (input) for mailman id 580029;
 Tue, 08 Aug 2023 15:14:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IVOA=DZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qTOPu-0004UR-VJ
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 15:14:39 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a5a618d-35fe-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 17:14:38 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b9d3dacb33so93632001fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Aug 2023 08:14:38 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 i19-20020a2e8093000000b002ba053e1f9bsm2319794ljg.35.2023.08.08.08.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 08:14:36 -0700 (PDT)
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
X-Inumbo-ID: 4a5a618d-35fe-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691507677; x=1692112477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WnbMFsw2xJyZrC0SKfFmGk7wApTlrJZ562TuRi7g2Ug=;
        b=LbjK4PUzxnKJZdrQZK+/vINCygJMsr+1UNpkwzkSuI83/mCu+BAQcQimIS9FzxCdkO
         GIZvx4RMXHudGYoOpZonwUwabDvib9KTNEd0D4QPjii318mKQIbdQjEMl/J9yfGGAg/F
         TUUvG5ir1jcmpj4wvVH3SKcA190xu6COyNbIw3Qm13j4kZ9767a2cMede92qHsnE7b1R
         tcieZAxKe7pq5RbOBeOV+Wj1d7yYTc7hiNXDVuyZVf7kuFdlYLUeYfvwIdkVLdio9JrE
         3p7EHFs5vlRJiWvegz7XxDs/kczHkowOj8TM3qTTey6u425jEQifrxJUp5hoC6Tl/GA4
         gnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691507677; x=1692112477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnbMFsw2xJyZrC0SKfFmGk7wApTlrJZ562TuRi7g2Ug=;
        b=e44FlfSSV6LldQ7DIDqblOt/sBqbxxh+H/Jc0ih8AdBHB6tgZWK3N3k9LLh6vl6VZR
         Dgf5yaH/9prCbhJitOcNqb5AmXduBc9ci13I9qlrOC8Ve9zIZBT5DsLsWNd7GokvCOue
         9IeZVjypOOuV/gq+7++Efm0L3Guh1q2BWigQbjWVoR6M+XTGhN4ulNsCYAfJpnBWqZRR
         a3o2B5WBzDfc/18fQ+ZKDh4DE9Q47384TZuqfDs9mpl2akWCwSzwAeMkmV5xJfxcYCBU
         OAsRiAWw6d6097VtuSrOTKMEzwJYrB+sBupZ3WcFL17NcH1gwWuMfTMpaYXpPVxp/pm7
         Ulxw==
X-Gm-Message-State: AOJu0YzJixQh4mitRcEKs8I1F8dN/iL++VdmDj07NPMAQ7hRYyy8BqBl
	wodpGSzBy1N8qIpH5AA4KvRUCcRR8Eo=
X-Google-Smtp-Source: AGHT+IG6XoenVJGnOoi1kpLKAM55KifzOuJ3fg9FeOma9pKXOGiDSbaMLijCj0QQp6g92dMtGjYLSw==
X-Received: by 2002:a2e:968d:0:b0:2b6:c528:4940 with SMTP id q13-20020a2e968d000000b002b6c5284940mr10504116lji.3.1691507677036;
        Tue, 08 Aug 2023 08:14:37 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v7 0/2] xen/riscv: introduce identity mapping
Date: Tue,  8 Aug 2023 18:14:32 +0300
Message-ID: <cover.1691507564.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series introduces things necessary to implement identity mapping:
  1. Make identity mapping for the entire Xen.
  2. Enable MMU.
  3. Jump to the virtual address world
  4. Remove identity mapping.

Also current patch series introduces the calculation of physical offset before
MMU is enabled as access to physical offset will be calculated wrong after
MMU will be enabled because access to phys_off variable is PC-relative and
in the case when linker address != load address, it will cause MMU fault.

The reason for this patch series can be found here:
https://lore.kernel.org/xen-devel/4e336121-fc0c-b007-bf7b-430352563d55@citrix.com/

---
Changes in V7:
 - use srli instruction to be consistent with slli instruction in turn_on_mmu()
---
Changes in V6:
  - Update calc_phys_offset() after rebase.
  - Refactor turn_on_mmu() and a way how an argument of turn_on_mmu() is
    calculated.
---
Changes in V5:
	- update the algo of identity mapping removing.
	- introduce IDENT_AREA_SIZE.
	- introduce turn_on_mmu() function to enable and switch from 1:1 mapping.
	- fix typo in PGTBL_INITIAL_COUNT define.
	- update the comment above PGTBL_INITIAL_COUNT.
	- update prototype of calc_phys_offset(). now it returns phys_offset.
	- declare phys_offset as static.
	- save returned value of calc_phys_offset to register s2.
---
Changes in V4:
  - drop patch 	[PATCH v3 1/3] xen/riscv: add SPDX tag to config.h as it was
    merged to staging
  - remove definition of ARRAY_SIZE and ROUNDUP as <xen/macors.h> was introduced where these macros are located now.
	- update definition of PGTBL_INITIAL_COUNT
	- update the commit message for patch 'xen/riscv: introduce identity mapping'
	- update the comments in head.S
  - update the algo of identity mapping removing 
---
Changes in V3:
 - Update the patch series message.
 - The following patches were merged to staging so droped from the patch series:
   * xen/riscv: add .sbss section to .bss
   * xen/riscv: introduce reset_stack() function
   * xen/riscv: move extern of cpu0_boot_stack to header
   * xen/riscv: add SPDX tags
 - move save/restore of a0/a1 registers from patch 4 to patch 2 ( numbers are
   from the previous patch series version )
 - add SPDX tag in config.h
 - update definition of PGTBL_INITIAL_COUNT taking into account identity mapping.
 - refactor remove_identity_mapping() function.
 - add explanatory comments in xen.lds.S and mm.c.
---
Changes in V2:
 - update the patch series message.
 - drop patches from the previous version of the patch series:
   * xen/riscv: add __ASSEMBLY__ guards". ( merged )
   * xen/riscv: make sure that identity mapping isn't bigger then page size
     ( entire Xen is 1:1 mapped so there is no need for the checks from the patch )
 - add .sbss.* and put it befor .bss* .
 - move out reset_stack() to .text section.
 - add '__ro_after_init' for phys_offset variable.
 - add '__init' for calc_phys_offset().
 - declaring variable phys_off as non static as it will be used in head.S.
 - update definition of PGTBL_INITIAL_COUNT and the comment above.
 - code style fixes.
 - remove id_addrs array becase entire Xen is mapped.
 - reverse condition for cycle inside remove_identity_mapping().
 - fix page table walk in remove_identity_mapping().
 - save hart_id and dtb_addr before call MMU related C functions
 - use phys_offset variable instead of doing calcultations to get phys offset
   in head.S file. ( it can be easily done as entire Xen is 1:1 mapped now )
 - declare enable_muu() as __init.
 - Update SPDX tags.
 - Add Review-By/Suggested-By for some patches.
 - code style fixes.

Oleksii Kurochko (2):
  xen/riscv: introduce function for physical offset calculation
  xen/riscv: introduce identity mapping

 xen/arch/riscv/include/asm/acpi.h   |   6 ++
 xen/arch/riscv/include/asm/config.h |   2 +
 xen/arch/riscv/include/asm/mm.h     |   7 +-
 xen/arch/riscv/mm.c                 | 109 +++++++++++++++++-----------
 xen/arch/riscv/riscv64/head.S       |  44 +++++++++++
 xen/arch/riscv/setup.c              |  14 +---
 xen/arch/riscv/xen.lds.S            |  11 +++
 7 files changed, 136 insertions(+), 57 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/acpi.h

-- 
2.41.0



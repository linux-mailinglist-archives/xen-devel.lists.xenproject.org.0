Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1439CDE9B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 13:48:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837501.1253428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvjr-0005On-Up; Fri, 15 Nov 2024 12:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837501.1253428; Fri, 15 Nov 2024 12:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvjr-0005NH-Re; Fri, 15 Nov 2024 12:47:51 +0000
Received: by outflank-mailman (input) for mailman id 837501;
 Fri, 15 Nov 2024 12:47:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TwMO=SK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tBvjq-0004n9-Lm
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 12:47:50 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d16f202f-a34f-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 13:47:48 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c96b2a10e1so2976478a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 04:47:48 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e08617esm177517666b.182.2024.11.15.04.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 04:47:46 -0800 (PST)
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
X-Inumbo-ID: d16f202f-a34f-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzEiLCJoZWxvIjoibWFpbC1lZDEteDUzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQxNmYyMDJmLWEzNGYtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjc0ODY4LjQ3OTg0Nywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731674867; x=1732279667; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rEAdQHOht+sXlaWNLwPdJaPMbdoj6AeiqmUtGFUERz0=;
        b=LEVJ8tMuzS9dYvxO9/oCP/dgidtZQc1K+goxGMIPpi5pLCN26plSO0ytUl2Nf+8khQ
         CT6fAuHILW1uogx4CS/7AqYuwKZ5PLADDF2EZqKUxaBdCocMmdv4cjqCZ9JbG9gD6UW0
         YD24dZomfNROTJ1epOaoDAfF5eCGpZS/zY7NSsqqU/pTNJ8VQoHlpFbNtTkJsfAo6ZL2
         W9X7nWjeK3jaAvZJ9T+EL2savq7pKjwk4LFraWUP2LAhiG+lhYtivfVcZ1uTQQZgLwk9
         eIuTXvxB5tdPNYU2jRY2F0TvaAKOr6tllpSnUjqutO1yU8NrV91XD1ss0SXqncMd/XTP
         S8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731674867; x=1732279667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEAdQHOht+sXlaWNLwPdJaPMbdoj6AeiqmUtGFUERz0=;
        b=BisyVN7c5Y3a5WbJhOUK/dA9Vau2FGUyfo48kvcoqJXJexepR+cHZimXuxsf8Xmegq
         udQ3uTLVPgGFs3F9qGe8STUwSy3971hhe8yxyR1SsJCLCNqOuSJxnZrfsoQ12WpoiTQo
         SPfn68mX3nrjTzwg9VWHeL8U5+EhEt0TWB26cn7+nQiHcRas2eZEjP4qKnfMn63TRcXF
         yzpRNpqu+f280mbJApY3OUIzX22Li3IlreWeyvCNeRr9EAMRvu6rfS4IZSJCmbJcbkK6
         RZxkQCyl6Bj/fzg4frIDAclYlkyj1WeY1Db4cDSOBMDHw3nEw8BYVhllQlnlDBrp4uCu
         4npA==
X-Gm-Message-State: AOJu0YxlgVjmc7aFHlJjUpkJtKudoI9KG11P8HOBm3d8OUxv7ERy75b7
	z4R3sR1ZQjy5aXjECK+uHVuGr9SIuA9nvhyKAD8N2kuA/B45pa2ldn1cQA==
X-Google-Smtp-Source: AGHT+IG9UQYbSwpwDptxKtpu6y/RjNBv83Kme1MrkKK3zmN+2FgyjP5xqNwm7eu87OAlU/Ck0hXbbQ==
X-Received: by 2002:a17:907:9288:b0:a9a:bbcc:508c with SMTP id a640c23a62f3a-aa4833f708cmr216150466b.2.1731674867026;
        Fri, 15 Nov 2024 04:47:47 -0800 (PST)
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
Subject: [PATCH v6 0/3]  Setup memory management for RISC-V
Date: Fri, 15 Nov 2024 13:47:41 +0100
Message-ID: <cover.1731672668.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Finish initializing the memory subsystem by mapping the direct map and
frame table.

The frametable_virt_start variable is introduced with substracting
of an offest ( taking into account that RAM start could be not 0 ) to save
virtual address space of FRAMETABLE. Also it simplifies the
calculations and thereby improves performance for page_to_mfn(), mfn_to_page()
as there is no frametable_base_pdx or frametable_base_mfn ( if CONFIG_PDX_COMPRESSION=n);

The directmap_virt_start is introduced and shifted lower in the VA space to
(DIRECTMAP_VIRT_START - masked_low_bits_of_ram_start_address) to avoid
wasting a large portion of the directmap space, this also allows for simple
VA <-> PA translations. Also aligns DIRECTMAP_VIRT_START to a GB boundary
(for Sv39; for other MMU mode boundaries will be bigger ) by masking the
bits of the RAM start address to enable the use of superpages in
map_pages_to_xen().

In addition, initialize the VMAP_DEFAULT region, finalize the boot allocator,
and update the system state from early_boot to boot.

Introduce share_xen_page_with_guest() to deal with linkage error which occurs
because of DCE:
  riscv64-linux-gnu-ld: prelink.o: in function `tasklet_kill':
  /build/xen/common/tasklet.c:176: undefined reference to
     `share_xen_page_with_guest'
  riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `share_xen_page_with_guest'
    isn't defined riscv64-linux-gnu-ld: final link failed: bad value

The function maddr_to_virt() is introduced as part of this patch series.

virt_to_maddr() is updated as it is started to use direct_virt_start which is
introduced in this patch series.

Introduce DIRECTMAP_VIRT_END to have a convient way to do some basic
checks of address ranges.

---
Changes in V6:
 - Rebase on top of current staging.
 - Update the cover letter message.
 - Other changes are only connected to path 1 of the current patch series some
   please look at the changes there.
---
Changes in V5:
 - Rebase on top of current staging.
 - Drop unnecessary local variables.
 - Fix issue with virt_to_maddr() ( used DIRECTMAP_VIRT_START in if-condition
   instead of direct_virt_start ).
 - Update setup_directmap_mappings() and setup_frametable_mappings() ( details
   look in patch 1).
---
Changes in V4:
 - Rebase on top of current staging.
 - Fix issues with setup_frametable_mappings() and setup_directmap_mappings().
 - Drop unnecessary local variables.
 - Minor log messsages fixes.
---
Changes in V3:
 - Update the cover letter message as DIRECTMAP connected things were changed.
 - Update setup_mm(), setup_{directmap,frametable}_mappings.
 - Introduce ROUNDDOWN in <xen/macros.h>
 - All other details please look at the specific patch.
---
Changes in V2:
 - update the cover letter message.
 - merge first 3 patches to "introduce setup_mm()" patch as after setup_mm()
   rework all the things in first two patches of v1 started to use changes
   introduced in "introduce setup_mm()" patch.
 - add Acked-by for some patch series.
 - All other details please look at the specific patch.
---

Oleksii Kurochko (3):
  xen/riscv: introduce setup_mm()
  xen/riscv: initialize the VMAP_DEFAULT virtual range
  xen/riscv: finalize boot allocator and transition to boot state

 xen/arch/riscv/include/asm/config.h |   1 +
 xen/arch/riscv/include/asm/mm.h     |  20 ++--
 xen/arch/riscv/include/asm/setup.h  |   2 +
 xen/arch/riscv/mm.c                 | 159 ++++++++++++++++++++++++++--
 xen/arch/riscv/pt.c                 |   6 ++
 xen/arch/riscv/setup.c              |  14 +++
 xen/include/xen/macros.h            |   1 +
 7 files changed, 191 insertions(+), 12 deletions(-)

-- 
2.47.0



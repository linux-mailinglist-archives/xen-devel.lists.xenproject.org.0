Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE58AD3806
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010782.1388982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfe-0004kP-5v; Tue, 10 Jun 2025 13:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010782.1388982; Tue, 10 Jun 2025 13:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfe-0004ik-2X; Tue, 10 Jun 2025 13:05:42 +0000
Received: by outflank-mailman (input) for mailman id 1010782;
 Tue, 10 Jun 2025 13:05:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyfd-0004iH-3B
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:05:41 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b9dad31-45fb-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:05:40 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-607ec30df2bso4394220a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:39 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:38 -0700 (PDT)
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
X-Inumbo-ID: 9b9dad31-45fb-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560739; x=1750165539; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=emcWPlpqUTn7SorKViuI8m/xRSenM0PZhKHrrEHn8Bc=;
        b=XtHot2oIKeMXeP5yXH/sNS31ir15t57PQWCVnzvfQWjtmx3XXRuZBYuH/2yvT7bODd
         PjcON5SX4qqPerBVbj11wXctSrfzeJH6SsEcwkp8h8JWuMfzg7IY/mN12TpO0Upb4oBm
         fu+R3hO6wDKzeryuCuvpCj6M777JvxKcas9U3v1XvJhY8mBmRitKguKhqEfTLeZjNwYo
         3b9dIHI0RUQco4I9QvkQiwY1D/jWLfan4pwXgVoihowSEU1c2WjvHbb8BkN+5KRybaOQ
         Wupv2wtHmqEtUV+8ujR6NVRb5ZqHSTMKsuvhdmm8MGqS2bUeaki4RmO+HgxKTiu2iQRt
         PS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560739; x=1750165539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=emcWPlpqUTn7SorKViuI8m/xRSenM0PZhKHrrEHn8Bc=;
        b=Z90ZSrVgOewaWcDqNIwIEfnaJVi6PaktGATDykJzwLV/5ILdFtGDc+iES77ymacbRD
         gNwsv931amwwnaVKqgSFitZEJDGWVYQjx0YZ0GN12I27CoJDWsakEmfsyNlHLNckdHyH
         xTcdyAXibfj7Ui7eNLZiKnxEirafaRnIEdWb0I4KXj+69DdCyMmfEEu2rXPq8IEEg4kp
         aUuDiUMZCVbG7kFCe5GcKWDOJsyeWsb1u0FqtwWBJ1k2Lr0cC1NIWXvPZLKPcp0wm0I0
         OP8PcbwFpi1TgukxbiUeG3WZg2LIVHt2eL++YK3sjMhwgf+b85iSiFdyL1gwirW6o6hz
         B1sA==
X-Gm-Message-State: AOJu0YwLHxyjknMbfR56DQ0LXGlNAoUYSe1aFpXq8CHWvr6u7TnRvYfT
	JzaxIRcZqOIjVeg78MBLhemdrBUvoPDXsHfh5NnHiyLaV6aAsYhjMmT30Ta3UA==
X-Gm-Gg: ASbGncv3zwzC/hdSU2/rk/SWHd2l6m2gE/0YxL9L0B36qCbcXmQ29QRFm6+gAXWB68g
	f6XVm0DvizKwqyuDE5R0EXtbZo/4oln0xzBE4dBslvGOSXVwIefOHMJmMQZDDWx3j06dxdKbY6o
	EcXdRMe32r9xwEHwHKaFP4SXrjTd5kPQDIZUBwK2pH9/ZmDcjEGZdXOWCUSuLTqO+gAslIiWY+t
	2IUuY+DpkMMRT0UhzuoWlB89xGWTBLHWDi/17vc64SeRspNmhxp/ILjLLKKIzaUkxMW18ZUq/QM
	x821Q0E4BFmcFS4XoKE7tnnWa4Ea8W+VmUR2ncgKU1+W7WUZ3D3KZbuVLtnkSZgepySCW/7eMa3
	3Negdr2DW5qZItqCL4OKEPZlfJKZ3xJhdhb8vJp4=
X-Google-Smtp-Source: AGHT+IHhwmZuryyfvylJjn3ZzNEohJbPYdrSUe952R/STsAXEExGw42aMovUCDb7ZiwV7/OUve6XEw==
X-Received: by 2002:a17:907:d06:b0:add:f2c8:7d3f with SMTP id a640c23a62f3a-ade7acf304emr223119866b.33.1749560738815;
        Tue, 10 Jun 2025 06:05:38 -0700 (PDT)
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
Subject: [PATCH v2 00/17] xen/riscv: introduce p2m functionality
Date: Tue, 10 Jun 2025 15:05:15 +0200
Message-ID: <cover.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In this patch series are introduced necessary functions to build and manage
RISC-V guest page tables and MMIO/RAM mappings.

CI tests:
  https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1862284573

---
Changes in V2:
 - Merged to staging:
   - [PATCH v1 1/6] xen/riscv: add inclusion of xen/bitops.h to asm/cmpxchg.h
 - New patches:
   - xen/riscv: implement sbi_remote_hfence_gvma{_vmid}().
 - Split patch "xen/riscv: implement p2m mapping functionality" into smaller
   one patches:
   - xen/riscv: introduce page_set_xenheap_gfn()
   - xen/riscv: implement guest_physmap_add_entry() for mapping GFNs to MFNs
   - xen/riscv: implement p2m_set_entry() and __p2m_set_entry()
   - xen/riscv: Implement p2m_free_entry() and related helpers
   - xen/riscv: Implement superpage splitting for p2m mappings
   - xen/riscv: implement p2m_next_level()
   - xen/riscv: Implement p2m_entry_from_mfn() and support PBMT configuration
 - Move root p2m table allocation to separate patch:
   xen/riscv: add root page table allocation
 - Drop dependency of this patch series from the patch witn an introduction of
   SvPBMT as it was merged.
 - Patch "[PATCH v1 4/6] xen/riscv: define pt_t and pt_walk_t structures" was
   renamed to xen/riscv: introduce pte_{set,get}_mfn() as after dropping of
   bitfields for PTE structure, this patch introduce only pte_{set,get}_mfn().
 - Rename "xen/riscv: define pt_t and pt_walk_t structures" to
   "xen/riscv: introduce pte_{set,get}_mfn()" as pt_t and pt_walk_t were
   dropped.
 - Introduce guest domain's VMID allocation and manegement.
 - Add patches necessary to implement p2m lookup:
   - xen/riscv: implement mfn_valid() and page reference, ownership handling helpers
   - xen/riscv: add support of page lookup by GFN
 - Re-sort patch series.
 - Add link to CI tests.
 - All other changes are patch-specific. Please check them.
---

Oleksii Kurochko (17):
  xen/riscv: implement sbi_remote_hfence_gvma()
  xen/riscv: introduce sbi_remote_hfence_gvma_vmid()
  xen/riscv: introduce guest domain's VMID allocation and manegement
  xen/riscv: construct the P2M pages pool for guests
  xen/riscv: introduce things necessary for p2m initialization
  xen/riscv: add root page table allocation
  xen/riscv: introduce pte_{set,get}_mfn()
  xen/riscv: add new p2m types and helper macros for type classification
  xen/riscv: introduce page_set_xenheap_gfn()
  xen/riscv: implement guest_physmap_add_entry() for mapping GFNs to
    MFNs
  xen/riscv: implement p2m_set_entry() and __p2m_set_entry()
  xen/riscv: Implement p2m_free_entry() and related helpers
  xen/riscv: Implement p2m_entry_from_mfn() and support PBMT
    configuration
  xen/riscv: implement p2m_next_level()
  xen/riscv: Implement superpage splitting for p2m mappings
  xen/riscv: implement mfn_valid() and page reference, ownership
    handling helpers
  xen/riscv: add support of page lookup by GFN

 xen/arch/riscv/Makefile                     |    1 +
 xen/arch/riscv/include/asm/domain.h         |   16 +
 xen/arch/riscv/include/asm/mm.h             |   45 +-
 xen/arch/riscv/include/asm/p2m.h            |  125 +-
 xen/arch/riscv/include/asm/page.h           |   33 +
 xen/arch/riscv/include/asm/riscv_encoding.h |    4 +
 xen/arch/riscv/include/asm/sbi.h            |   38 +
 xen/arch/riscv/mm.c                         |   97 +-
 xen/arch/riscv/p2m.c                        | 1188 +++++++++++++++++++
 xen/arch/riscv/sbi.c                        |   18 +
 xen/arch/riscv/setup.c                      |    3 +
 11 files changed, 1550 insertions(+), 18 deletions(-)
 create mode 100644 xen/arch/riscv/p2m.c

-- 
2.49.0



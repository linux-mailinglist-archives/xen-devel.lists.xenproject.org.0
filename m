Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE50CD6AE5
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 17:38:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192167.1511503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXiv5-0001HX-AP; Mon, 22 Dec 2025 16:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192167.1511503; Mon, 22 Dec 2025 16:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXiv5-0001FI-5s; Mon, 22 Dec 2025 16:38:03 +0000
Received: by outflank-mailman (input) for mailman id 1192167;
 Mon, 22 Dec 2025 16:38:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACBk=64=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vXiv4-00085h-C2
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 16:38:02 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94351e5d-df54-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 17:38:00 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-64b4f730a02so6643139a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 08:38:00 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037de004fsm1149128166b.45.2025.12.22.08.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 08:37:59 -0800 (PST)
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
X-Inumbo-ID: 94351e5d-df54-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766421480; x=1767026280; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3CZ7UGa1iggeXvvKtkf16U5OQ58dYEMb75iwj0evo68=;
        b=JtFMnKyQxvyfvBmuOKoKehM/rL1EFRM0CNaj9RCT+aK/tlnwGmHRpIhJnArghjQrHS
         dWMrnF4XlveVRaVwjXZCG7fw4FJLxS/Q/8J1wPyMTIxze5we2JrpIQmtzxR+wscpf2wZ
         kmYJHJo2w7uitb0trdNPCAJAzFwqNM1gSBkkeR6XQqViY1VzQA8rjIR1nBRUYdPao/z/
         23tI63Gw2M3f2W8krn7G4PSo7H/bO1sDDX+2p3PR83xyfHJUgKZOKGBBaX/SSw/R2qUy
         a0hO/IPsiyBKuH8kbcUV+xV5MT3FWN5nDh4lxjcB0+dPNsMc5Hipi38+FRZiyRtkEESm
         UQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421480; x=1767026280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CZ7UGa1iggeXvvKtkf16U5OQ58dYEMb75iwj0evo68=;
        b=snoVQe7rfv5+/8vWhG3tnMQHuBP/u4qnnzqM/eFs4ztQXbBGgzuQqA2g67fBB48YpF
         lh0IdCfCqHHGoBGwJ+7iS8/yMqfAU6G6qT93jIJV6AEl0EagaQYqw1ZSaWMgE9qHATWO
         47qyJsf+OiLjeEGM2KWRZZQJ8xLcogjFa/ky1nW40Uh6ymCB5+KDDTJVi9ECvhgW0VAA
         L6r15TKdaHiEWuFSHZnWhdgh+QKlBS5rTSmxfA9ybhQeH75uk5cPWLcMcc10Cf7apQlF
         Z8+LwFIDNWhjNTPoe5qDVknOHFTjS8Ef9tiBKXW08C/hLAp16/D732F3dUnzbHraMWv2
         vO2A==
X-Gm-Message-State: AOJu0YwLCpkq5hH70N7aS4A17yzZSWMk4TqLivXUfaGRKmAQx4fUQo/w
	LnSlRpM0Ksos5bhJe7VweJBc73kYw7pU8oYvpu7VIRzIq7rBAdnlhaJMrYSjaA==
X-Gm-Gg: AY/fxX4Qm7Qb39R384hgffqVktbj1gt/afABD7rB9F/UQ64rKJ9fEZ5wLwVHUtQptmU
	pegNM+5Gh4BLbQoTHlTZcxAaTVMQUrymiQq32/MQ86VTxyN080rXJHjdVtHFp8f09tk65qbFbNk
	AtQ1TMsqZ+BYpvIHSQWjEOJVb24rp/2S1iUf5IgJ/DRTou3emSqw+OJQXCD0gUUnnI28yIzk+xN
	mLTYe5+2HSfXmdPTyx9/c+ydnxLz3Vua6f/SBsbYv3afcBrteeh7d37Yczou9VimE7dOpMxpRMw
	ykUIR1WHgWDR1VaNHDGyej2pQcho2ObrEzh5cd9EY1Ku6fkkvTOhgWSQdxXQlZu9RIAmZq0eMi5
	DKWVLmz/Ko1iUjcJV1SWl4gqRZGuQ5M2tersseR2L3Z/+w70lPQAFWEPmNJ2gPsj0t0/Cp+Iq6L
	h4QPW6lLgl5ydn8o1CE0FtFP0ud4JTIJdOev5sL5F4km21JERLyttdfio=
X-Google-Smtp-Source: AGHT+IE8SyxP7GyqcWK/PXY+npcU8qVIDTYzi3k+fvU28CK6WN83OOoaG9oowWZNx1rm/flYqSo+qg==
X-Received: by 2002:a17:907:c02:b0:b73:7184:b7d3 with SMTP id a640c23a62f3a-b80371f3a9bmr1324486566b.58.1766421479669;
        Mon, 22 Dec 2025 08:37:59 -0800 (PST)
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
Subject: [PATCH v8 0/3] xen/riscv: introduce p2m functionality
Date: Mon, 22 Dec 2025 17:37:46 +0100
Message-ID: <cover.1766406895.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In this patch series are introduced necessary functions to build and manage
RISC-V guest page tables and MMIO/RAM mappings.

CI tests:
  https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2224311393

---
Changes in V8:
 - All patches (except last three ones) are merged to staging.
 - Addressed comments for v7.
---
Changes in V7:
 - Merged to staging:
   - xen/riscv: avoid redundant HGATP*_MODE_SHIFT and HGATP*_VMID_SHIFT
 - Introduce new patch:
   - xen/riscv: update p2m_set_entry to free unused metadata page
   (could be merged with previous one: xen/riscv: introduce metadata table to
    store P2M type )
 - Addressed comments for v6.
---
Changes in V6:
 - Addressed coment for v5.
---
Changes in V5:
 - Addressed comments for v4.
---
Changes in V4:
 - Merged to staging:
   - xen/riscv: introduce sbi_remote_hfence_gvma()
   - xen/riscv: introduce sbi_remote_hfence_gvma_vmid()
 - Drop "xen/riscv: introduce page_{get,set}_xenheap_gfn()" as grant tables aren't going to be introduced for the moment. Also, drops other parts connected to grant tables support.
 - All other changes are patch specific.
---
Changes in V3:
 - Introduce metadata table to store P2M types.
 - Use x86's way to allocate VMID.
 - Abstract Arm-specific p2m type name for device MMIO mappings.
 - All other updates please look at specific patch.
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
 - All other changes are patch-specific. Please check them.
---

Oleksii Kurochko (3):
  xen/riscv: add support of page lookup by GFN
  xen/riscv: introduce metadata table to store P2M type
  xen/riscv: update p2m_set_entry() to free unused metadata pages

 xen/arch/riscv/include/asm/flushtlb.h |   2 +-
 xen/arch/riscv/include/asm/mm.h       |  21 ++
 xen/arch/riscv/include/asm/p2m.h      |  21 ++
 xen/arch/riscv/mm.c                   |  13 +
 xen/arch/riscv/p2m.c                  | 437 ++++++++++++++++++++++++--
 5 files changed, 464 insertions(+), 30 deletions(-)

-- 
2.52.0



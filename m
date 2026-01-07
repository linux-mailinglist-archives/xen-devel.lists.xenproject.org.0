Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0C1CFEE3D
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 17:33:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196925.1514639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWTC-000363-3X; Wed, 07 Jan 2026 16:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196925.1514639; Wed, 07 Jan 2026 16:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWTC-00033R-0S; Wed, 07 Jan 2026 16:33:14 +0000
Received: by outflank-mailman (input) for mailman id 1196925;
 Wed, 07 Jan 2026 16:33:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ufZv=7M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vdWTA-00033L-Tn
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 16:33:12 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e728775-ebe6-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 17:33:11 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b79e7112398so392962366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 08:33:11 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a27c755sm561592366b.18.2026.01.07.08.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 08:33:10 -0800 (PST)
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
X-Inumbo-ID: 8e728775-ebe6-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767803591; x=1768408391; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qjPHMQuKlnfLBXFTnLWQkQyQnlc57KzaWq7A4+i6d78=;
        b=lN3rEqD71q+3zaiDAuAseU58wcZ6kJrnOmidgbFmvwi7eF9xMGYqe1a4HTNOj0VIGA
         Zq62mRo7f7yuomn5MjJ518+sFoxcRxJHXJjr8co+FT+GaDtv46NPj1vDHv72SxoIGb8t
         yxl5CHbHYrgSVhzKbKYxshtfuwouMhXDW/yogFFzsZ5k/lNOdga1E+VI63zTlKOj1IDZ
         MFJ9fYiJ45e3tuY/d1kVcV9GQUN+Zt+LNH1JprPc6vLMMTApQXVNcToxD61LbYsaTzkw
         CWyC75x4cRr+96Iw/h/RPXXrM02Q9eVwBmvhIplGRbQMW1ghWSMPLfGEwkkXWk+dWlWN
         z/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803591; x=1768408391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjPHMQuKlnfLBXFTnLWQkQyQnlc57KzaWq7A4+i6d78=;
        b=LbvWK3O0ATZOBoba9Edl0rIoFefEJ83sMy+NAdCe8ZIH2xlOCUnCMnuMdPw4oA2gMn
         V9r1gFDp8EHDJDVjlyigzc40q1uBXXeIhmPcpGZX+hh8aEwmuiJ/WHzR4mQwmWob5jaY
         FZYTy99GWf07WHFEiJeACmxS0+3z/+7+7x7xWEThE8ECh4EOG7LSmvaO3GlusNmpZJb0
         xPdNxpnC1F38gKQ3n78Z4CVjRl1ZlTogmd1r/lO8Q5Qk6o4VyQ2tNiCngVDJwGPYoy4P
         kDK7UmtzC/efvtQRa2KZVtGsx+6PlmNzzzVMtSuWhe8pC/J3t2cGaXV4jWQwQ4k2Tix5
         Am+A==
X-Gm-Message-State: AOJu0YyGwjYpVQyDpDQmfHLQsGfFK3ZzjrkIv0aEt27PWTTiWvm2NPm9
	UzEnwWSqDlLo7lQuq1NpfK5u2D+EUmKan41ExZF1xeVanainlshaQ0WYbKAnEA==
X-Gm-Gg: AY/fxX7cL1jhWPIfKmbwnzWLsJ9zWIf6BppmbtIVM+WBsBoC0RkUnpIp/h9bDj0BHHN
	baeuX2lugLZvR+ECSkWeFGOSCYj+Mn0k70GsXLpXTE84m7a8aGW700ECl3WCXW9XJJ/LfaaMFkr
	nupGlUmd6BPPKIjtwr/AWIeiNKpnG+DU5BvNmSX4SkE6jjWFv5Hwh5oQ+2p0J2QlnHZs5L2gaeJ
	l/yEpGMH2hoMgjTg0lb9vastfQIr6XHGIknXFbGiDsQ3sWiizpsgsYV4tx+/l+laXsCtaV1mueH
	Atj8r14M5ntRSB+KmLjru8V2f0gMY17NX8EyJdQGzK91/b1WBLAXNSYrLYK5rtjzQ1TUbW6J0CE
	EtftQclKepWD99vIAKHb1ItiLEWT60ioir7zt0CNTfZz0n1GWvxLg5G3Ukx1z2vtBOXFg7SZUbx
	LGbmQvvw4Q2ASOLp+gugNti3IL9+hT/Ht7gO5KVfyVTByP6Fs6ZV7xzA==
X-Google-Smtp-Source: AGHT+IHZos3W2HIpr7HwitWATiO/gTKAq6zV+3hKy2A0ciIj4REgO0GMhuAFH2EkBZUyg9v64OgXdA==
X-Received: by 2002:a17:907:c807:b0:b7a:18b3:7160 with SMTP id a640c23a62f3a-b84451fcfbfmr325476366b.27.1767803590726;
        Wed, 07 Jan 2026 08:33:10 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 0/3] xen/riscv: introduce p2m functionality
Date: Wed,  7 Jan 2026 17:32:56 +0100
Message-ID: <cover.1767803451.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In this patch series are introduced necessary functions to build and manage
RISC-V guest page tables and MMIO/RAM mappings.

CI tests:
  https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2247120521

---
Changes in V9:
 - Addressed comments for v8.
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
 xen/arch/riscv/p2m.c                  | 435 ++++++++++++++++++++++++--
 5 files changed, 462 insertions(+), 30 deletions(-)

-- 
2.52.0



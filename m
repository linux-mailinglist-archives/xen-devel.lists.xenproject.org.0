Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2243D93D622
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:32:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765508.1176110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMuq-00087U-8N; Fri, 26 Jul 2024 15:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765508.1176110; Fri, 26 Jul 2024 15:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMuq-00084f-52; Fri, 26 Jul 2024 15:31:32 +0000
Received: by outflank-mailman (input) for mailman id 765508;
 Fri, 26 Jul 2024 15:31:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMuo-00084T-7o
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:31:30 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fd2e656-4b64-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 17:31:28 +0200 (CEST)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6b79b93a4c9so6710386d6.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:31:28 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f8f63e7sm17685666d6.30.2024.07.26.08.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:31:25 -0700 (PDT)
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
X-Inumbo-ID: 1fd2e656-4b64-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007886; x=1722612686; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zPU3LlqrtwNZylg0zb4sk1TXfrsqUZcTdsqYRGiXSDU=;
        b=t0peZe+bVcVHy3LIjXmnGx17aa9LHEFIhf+fyliL7upywGD9s6sawdqD4jLtGmVbBX
         ZePAOlKUNJ3PXSC38oD3Kv+pMTMRhvQXsUHflnnlJhOFKBbdjR31EHkuprxlvYRNCdTi
         03uIgaIfj5xjc1wWt4j5biGvSZhFvkMQU90vM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007886; x=1722612686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPU3LlqrtwNZylg0zb4sk1TXfrsqUZcTdsqYRGiXSDU=;
        b=lZG94fOM4sZmHNboHSARAqfIWaNijjKp76M/u+XIdpBP+aktD6tmblr4Hz3D+j4Ujt
         PRf7F1k8EWHmpRSRccqNTqx6nBR3R0b9LKcAz5bnMN7pyDfYrQnukRICJH3PO8kfFVMU
         bFjSU2pHytMC3WlHbMi0i8juRIEzCXYEEN8VPzPnQVbKkG7A/z8kVFH2t1Z7ce9VHW+q
         2MRk2DtFBLESrNytsIlvFA2lP9PPPF0K1lc3f4VWQ2jdFpUCfTIoOjggxbrMmqqItSos
         RazIvinwZ7mLcEjhcORRWHT+BezMa543yqJL4Xa1BGlY2snoUfbXNqkCRp1UjlkRB4O3
         bz6w==
X-Gm-Message-State: AOJu0YypAj2ffkLdy2EG+Iat5reCIYEfa1GoFqEYIo5KgYJGPeVr7nvX
	lDgKZHx64VvVz0le7oYoaSpV/BSMI5xMwE4sZdytgaPujrzWd1k9aKM36gwOlzMJeTfDJRUM267
	t
X-Google-Smtp-Source: AGHT+IHU7Vjgt39cEspg360NKE/64h8BaUjvXaT9vcd6mGJ05cMtUQcSlTKWkq+XLt2Tkxsbz8cv+A==
X-Received: by 2002:ad4:5ece:0:b0:6b5:d95c:692d with SMTP id 6a1803df08f44-6bb3c8cd3b5mr115974516d6.13.1722007886272;
        Fri, 26 Jul 2024 08:31:26 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Tim Deegan <tim@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 00/22] x86: adventures in Address Space Isolation
Date: Fri, 26 Jul 2024 17:21:44 +0200
Message-ID: <20240726152206.28411-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The aim of this series is to introduce the functionality required to
create linear mappings visible to a single pCPU.

Doing so requires having a per-CPU root page-table (L4), and hence
requires changes to the HVM monitor tables and shadowing the guest
selected L4 on PV guests.  As follow ups (and partially to ensure the
per-CPU mappings work fine) the CPU stacks are switched to use per-CPU
mappings, so that remote stack contents are not by default mapped on all
page-tables (note: for this to be true the directmap entries for the
stack pages would need to be removed also).

Patches before patch 12 are either small fixes or preparatory
non-functional changes in order to accommodate the rest of the series.

Patch 12 introduces a new 'asi' spec-ctrl option, that's used to enable
Address Space Isolation.

Patches 13-15 and 20 introduce logic to use per-CPU L4 on HVM and PV
guests.

Patches 16-18 add support for creating per-CPU mappings to the existing
page-table management functions, map_pages_to_xen() and related
functions.  Patch 19 introduce helpers for creating per-CPU mappings
using a fixmap interface.

Finally patches 21-22 add support for mapping the CPU stack in a per-CPU
fixmap region, and zeroing the stacks on guest context switch.

I've been testing the patches quite a lot using XenRT, and so far they
seem to not cause regressions (either with spec-ctrl=asi or without it),
but XenRT no longer tests shadow paging or 32bit PV guests.

This proposal is also missing an interface similar to map_domain_page()
in order to create per-CPU mappings that don't use a fixmap entry.  I
thought however that the current content was fair enough for a first
posting, and that I would like to get feedback on this before building
further functionality on top of it.

Note that none of the logic introduced in the series removes entries for
the directmap, so evne when creating the per-CPU mappings the underlying
physical addresses are fully accessible when using it's linear direct
map entries.

I also haven't done any benchmarking.  Doesn't seem to cripple
performance up to the point that XenRT jobs would timeout before
finishing, that the only objective reference I can provide at the
moment.

It's likely to still have some rough edges, handle with care.

Thanks, Roger.

Roger Pau Monne (22):
  x86/mm: drop l{1,2,3,4}e_write_atomic()
  x86/mm: rename l{1,2,3,4}e_read_atomic()
  x86/dom0: only disable SMAP for the PV dom0 build
  x86/mm: ensure L4 idle_pg_table is not modified past boot
  x86/mm: make virt_to_xen_l1e() static
  x86/mm: introduce a local domain variable to write_ptbase()
  x86/spec-ctrl: initialize per-domain XPTI in spec_ctrl_init_domain()
  x86/mm: avoid passing a domain parameter to L4 init function
  x86/pv: untie issuing FLUSH_ROOT_PGTBL from XPTI
  x86/mm: move FLUSH_ROOT_PGTBL handling before TLB flush
  x86/mm: split setup of the per-domain slot on context switch
  x86/spec-ctrl: introduce Address Space Isolation command line option
  x86/hvm: use a per-pCPU monitor table in HAP mode
  x86/hvm: use a per-pCPU monitor table in shadow mode
  x86/idle: allow using a per-pCPU L4
  x86/mm: introduce a per-CPU L3 table for the per-domain slot
  x86/mm: introduce support to populate a per-CPU page-table region
  x86/mm: allow modifying per-CPU entries of remote page-tables
  x86/mm: introduce a per-CPU fixmap area
  x86/pv: allow using a unique per-pCPU root page table (L4)
  x86/mm: switch to a per-CPU mapped stack when using ASI
  x86/mm: zero stack on stack switch or reset

 docs/misc/xen-command-line.pandoc      |  15 +-
 xen/arch/x86/boot/x86_64.S             |  11 +
 xen/arch/x86/domain.c                  |  75 +++-
 xen/arch/x86/domain_page.c             |   2 +-
 xen/arch/x86/flushtlb.c                |  18 +-
 xen/arch/x86/hvm/hvm.c                 |  67 ++++
 xen/arch/x86/hvm/svm/svm.c             |   5 +
 xen/arch/x86/hvm/vmx/vmcs.c            |   1 +
 xen/arch/x86/hvm/vmx/vmx.c             |   4 +
 xen/arch/x86/include/asm/config.h      |   4 +
 xen/arch/x86/include/asm/current.h     |  38 +-
 xen/arch/x86/include/asm/domain.h      |   7 +
 xen/arch/x86/include/asm/fixmap.h      |  50 +++
 xen/arch/x86/include/asm/flushtlb.h    |   3 +-
 xen/arch/x86/include/asm/hap.h         |   1 -
 xen/arch/x86/include/asm/hvm/hvm.h     |   8 +
 xen/arch/x86/include/asm/hvm/vcpu.h    |   6 +-
 xen/arch/x86/include/asm/mm.h          |  34 +-
 xen/arch/x86/include/asm/page.h        |  37 +-
 xen/arch/x86/include/asm/paging.h      |  18 +
 xen/arch/x86/include/asm/pv/mm.h       |   8 +
 xen/arch/x86/include/asm/setup.h       |   1 +
 xen/arch/x86/include/asm/smp.h         |  12 +
 xen/arch/x86/include/asm/spec_ctrl.h   |   2 +
 xen/arch/x86/include/asm/x86_64/page.h |   4 -
 xen/arch/x86/mm.c                      | 484 ++++++++++++++++++++-----
 xen/arch/x86/mm/hap/hap.c              |  74 ----
 xen/arch/x86/mm/paging.c               |   4 +-
 xen/arch/x86/mm/shadow/common.c        |  42 +--
 xen/arch/x86/mm/shadow/hvm.c           |  64 ++--
 xen/arch/x86/mm/shadow/multi.c         |  73 ++--
 xen/arch/x86/mm/shadow/private.h       |   4 +-
 xen/arch/x86/pv/dom0_build.c           |  16 +-
 xen/arch/x86/pv/domain.c               |  28 +-
 xen/arch/x86/pv/mm.c                   |  52 +++
 xen/arch/x86/setup.c                   |  55 +--
 xen/arch/x86/smp.c                     |  29 ++
 xen/arch/x86/smpboot.c                 |  78 +++-
 xen/arch/x86/spec_ctrl.c               |  78 +++-
 xen/arch/x86/traps.c                   |  14 +-
 xen/common/efi/runtime.c               |  12 +
 xen/common/smp.c                       |  10 +
 xen/include/xen/smp.h                  |   5 +
 43 files changed, 1198 insertions(+), 355 deletions(-)

-- 
2.45.2



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C152A05E9A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:30:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867316.1278791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4h-0005sT-Tp; Wed, 08 Jan 2025 14:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867316.1278791; Wed, 08 Jan 2025 14:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4h-0005qA-Qz; Wed, 08 Jan 2025 14:30:23 +0000
Received: by outflank-mailman (input) for mailman id 867316;
 Wed, 08 Jan 2025 14:30:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX4g-0005q4-D8
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:22 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1699e336-cdcd-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 15:30:20 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fc01so6046536a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:20 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80676f218sm26160592a12.26.2025.01.08.06.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:19 -0800 (PST)
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
X-Inumbo-ID: 1699e336-cdcd-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346619; x=1736951419; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k9MQ0c7AAWp4dnuzrpxoUQPOajqVONYO8vVuEmo1UPo=;
        b=qvonbIBVgw83Tyy5yE2o+frHw9rMVFUOpf2RQGBmajq7hA0IiL/Lplz9uzSRa5LmsG
         dI9Q5cCNL5JmFGHIwvq+HR9FSaf9hSqPMQft36ZsiSlnRHDLPMeHz4XnmlZlrO3FCIO0
         dzNvvMKZMUo5CaOumtb5bNxYheFkxwrqRKKKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346619; x=1736951419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9MQ0c7AAWp4dnuzrpxoUQPOajqVONYO8vVuEmo1UPo=;
        b=nUHBkm5u9mk/usaGqj9PUalqx3WLkjaUuyZoChx1wCrZqrhwvZ71Bq/gJrQuRZQkh/
         7HN6frVbEVlNl7UZp+vtKpY2ywZIt5nRYknfqrbXfecNKM3wCpuC/nwhyHFHkOetLYTu
         A2xhdAHZlfagRoLR2sNpw0ZMsIWBeiEor2Mo7KRoFyVnGYREcoEMPyVV5QPq2WK4EOzO
         ZVYkzXul2pWAaDHBG6Q4UpfgcqQsEmnPSuzl2YWv4fXnOfu5u4ZUBopJNItVklP/ulUQ
         WA5n0josB/GTRyn4a1RLjbn8TkJ3emgp7KqLFdddCQUjcUghyjzdrXOOZ4/o0RIRLO1F
         JaIQ==
X-Gm-Message-State: AOJu0Yz/+EGlsHeHmmlJ0Wf1gW3qt0gmx15bFP8kiAzVUxRZXjFDBVKW
	tZtlHMqmCE1IrL2RLdzoo0hcL1JGGM60J/T3c5/1nf/cz/U1QH0EaZLGcZtn4qhId52IvZzvchW
	J
X-Gm-Gg: ASbGncv4/P+ugsBL89OI5+Ikw4vw68uuuzi+oQwcuwwVXAWcN7f3stq+Sj0Xibi3lNl
	4nlyyuy5trOphH6oNWxTzPI2l3Um2q5u7MwFPRkOZ7l9Bjaj213ukGyebh8qa4AoI5wA5W9tkC+
	mQ/K5l2vg9ZsmrC4wrAGXu2BGUb3sbYXPmvQ73Bz1/8mh/lB00xskKyI6mzQ4++BPE8Q3h9LeT1
	ahbIDeqtrvqDYnEHewvoQIVyKTwSv/KS1gdLH0Tm1b0gQJedPU0bt9WzUeDXFmnQpw=
X-Google-Smtp-Source: AGHT+IG+pJsIlGG+aftHU0ZDrCXF+ci65TLyVF/33jBtrK1smwH4TMXg5kvElL53NT0pX4ZKfnI3+w==
X-Received: by 2002:a05:6402:50d0:b0:5d3:d917:dd90 with SMTP id 4fb4d7f45d1cf-5d972dfb3d9mr2611862a12.6.1736346619468;
        Wed, 08 Jan 2025 06:30:19 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v2 00/18] x86: adventures in Address Space Isolation
Date: Wed,  8 Jan 2025 15:26:40 +0100
Message-ID: <20250108142659.99490-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The aim of this series is to introduce the functionality required to
create linear mappings visible to a single pCPU.

Doing so requires having a per-vCPU root page-table (L4), and hence
requires shadowing the guest selected L4 on PV guests.  As follow ups
(and partially to ensure the per-CPU mappings work fine) the CPU stacks
are switched to use per-CPU mappings, so that remote stack contents are
not by default mapped on all page-tables (note: for this to be true the
directmap entries for the stack pages would need to be removed also).

There's one known shortcoming with the presented code: migration of PV
guests using per-vCPU root page-tables is not working.  I need to
introduce extra logic to deal with PV shadow mode when using unique root
page-tables.  I don't think this should block the series however, such
missing functionality can always be added as follow up work.
paging_domctl() is adjusted to reflect this restriction.

The main differences compared to v1 are the usage of per-vCPU root page
tables (as opposed to per-pCPU), and the usage of the existing perdomain
family of functions to manage the mappings in the per-domain slot, that
now becomes per-vCPU.

All patches until 17 are mostly preparatory, I think there's a nice
cleanup and generalization of the creation and managing of per-domain
mappings, by no longer storing references to L1 page-tables in the vCPU
or domain struct.

Patch 13 introduces the command line option, and would need discussion
and integration with the sparse direct map series.  IMO we should get
consensus on how we want the command line to look ASAP, so that we can
basic parsing logic in place to be used by both the work here and the
direct map removal series.

As part of this series the map_domain_page() helpers are also switched
to create per-vCPU mappings (see patch 15), which converts an existing
interface into creating per-vCPU mappings.  Such interface can be used
to hide (map per-vCPU) further data that we don't want to be part of the
direct map, or even shared between vCPUs of the same domain.  Also all
existing users of the interface will already create per-vCPU mappings
without needing additional changes.

Note that none of the logic introduced in the series removes entries for
the directmap, so even when creating the per-CPU mappings the underlying
physical addresses are fully accessible when using it's direct map
entries.

I also haven't done any benchmarking.  Doesn't seem to cripple
performance up to the point that XenRT jobs would timeout before
finishing, that the only objective reference I can provide at the
moment.

The series has been extensively tested on XenRT, but that doesn't cover
all possible use-cases, so it's likely to still have some rough edges,
handle with care.

Thanks, Roger.

Roger Pau Monne (18):
  x86/mm: purge unneeded destroy_perdomain_mapping()
  x86/domain: limit window where curr_vcpu != current on context switch
  x86/mm: introduce helper to detect per-domain L1 entries that need
    freeing
  x86/pv: introduce function to populate perdomain area and use it to
    map Xen GDT
  x86/mm: switch destroy_perdomain_mapping() parameter from domain to
    vCPU
  x86/pv: set/clear guest GDT mappings using
    {populate,destroy}_perdomain_mapping()
  x86/pv: update guest LDT mappings using the linear entries
  x86/pv: remove stashing of GDT/LDT L1 page-tables
  x86/mm: simplify create_perdomain_mapping() interface
  x86/mm: switch {create,destroy}_perdomain_mapping() domain parameter
    to vCPU
  x86/pv: untie issuing FLUSH_ROOT_PGTBL from XPTI
  x86/mm: move FLUSH_ROOT_PGTBL handling before TLB flush
  x86/spec-ctrl: introduce Address Space Isolation command line option
  x86/mm: introduce per-vCPU L3 page-table
  x86/mm: introduce a per-vCPU mapcache when using ASI
  x86/pv: allow using a unique per-pCPU root page table (L4)
  x86/mm: switch to a per-CPU mapped stack when using ASI
  x86/mm: zero stack on context switch

 docs/misc/xen-command-line.pandoc    |  24 +++
 xen/arch/x86/cpu/mcheck/mce.c        |   4 +
 xen/arch/x86/domain.c                | 157 +++++++++++----
 xen/arch/x86/domain_page.c           | 105 ++++++----
 xen/arch/x86/flushtlb.c              |  28 ++-
 xen/arch/x86/hvm/hvm.c               |   6 -
 xen/arch/x86/include/asm/config.h    |  16 +-
 xen/arch/x86/include/asm/current.h   |  58 +++++-
 xen/arch/x86/include/asm/desc.h      |   6 +-
 xen/arch/x86/include/asm/domain.h    |  50 +++--
 xen/arch/x86/include/asm/flushtlb.h  |   2 +-
 xen/arch/x86/include/asm/mm.h        |  15 +-
 xen/arch/x86/include/asm/processor.h |   5 +
 xen/arch/x86/include/asm/pv/mm.h     |   5 +
 xen/arch/x86/include/asm/smp.h       |  12 ++
 xen/arch/x86/include/asm/spec_ctrl.h |   4 +
 xen/arch/x86/mm.c                    | 291 +++++++++++++++++++++------
 xen/arch/x86/mm/hap/hap.c            |   2 +-
 xen/arch/x86/mm/paging.c             |   6 +
 xen/arch/x86/mm/shadow/hvm.c         |   2 +-
 xen/arch/x86/mm/shadow/multi.c       |   2 +-
 xen/arch/x86/pv/descriptor-tables.c  |  47 ++---
 xen/arch/x86/pv/dom0_build.c         |  12 +-
 xen/arch/x86/pv/domain.c             |  57 ++++--
 xen/arch/x86/pv/mm.c                 |  43 +++-
 xen/arch/x86/setup.c                 |  32 ++-
 xen/arch/x86/smp.c                   |  39 ++++
 xen/arch/x86/smpboot.c               |  26 ++-
 xen/arch/x86/spec_ctrl.c             | 205 ++++++++++++++++++-
 xen/arch/x86/traps.c                 |  25 ++-
 xen/arch/x86/x86_64/mm.c             |   7 +-
 xen/common/smp.c                     |  10 +
 xen/common/stop_machine.c            |  10 +
 xen/include/xen/smp.h                |   8 +
 34 files changed, 1052 insertions(+), 269 deletions(-)

-- 
2.46.0



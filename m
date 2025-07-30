Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5B5B15E59
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 12:39:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063726.1429446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4D8-0007y4-4k; Wed, 30 Jul 2025 10:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063726.1429446; Wed, 30 Jul 2025 10:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4D8-0007vI-1T; Wed, 30 Jul 2025 10:39:02 +0000
Received: by outflank-mailman (input) for mailman id 1063726;
 Wed, 30 Jul 2025 10:39:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06yH=2L=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uh4D6-0007vC-Rc
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 10:39:00 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6668dd03-6d31-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 12:38:59 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ae3521a129aso131004966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 03:38:59 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af8f1b17364sm183230166b.66.2025.07.30.03.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 03:38:57 -0700 (PDT)
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
X-Inumbo-ID: 6668dd03-6d31-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753871938; x=1754476738; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zm5G5jeoHnUB9idtnZ1zI+dtOaPizv3q3GS6pmyREdQ=;
        b=HuMEAczkKTqKHQes0bZrNuRWRSjaNXVV3SRPEM2BzO0WxPbiFD4uVb4P58AdKMhak4
         Lio4z1GiqxcEPsXMQhgXn+PWXZ10zqWZODraZklLRxOlZOXD0TV8V1EyTsWNino5jj/5
         oWimkjqu1dhokzgxMyVAkV/O6vy0QkbwGSLa9t+LlXJZL+YVw0m5S+VPSdX/0E38pSkM
         Q7cmnQT2HGWigHv6rjVyT6hEXW1QUgWV9Bv6ZZgLfFp9Py/rvVfnZAZF8aLv5NvqIxgV
         h9nOekRnvBh7fiBsyuCPkjpHWbNYBcjooH8UltfYwdo5ayOof2iaexGvABRqEg8w4cd8
         1N8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753871938; x=1754476738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zm5G5jeoHnUB9idtnZ1zI+dtOaPizv3q3GS6pmyREdQ=;
        b=DRUeh0eLxYatg+EpVGQzkgFpPZKWdA4y2X4w2YTJyqRZR89rMgBE78bQ0opaN28sDn
         wMm07NtIdoashoJslqXmDZL+rBTrbLoKhyrESu1/92Rt437D3JjMVVCxDYIAtqkcapqo
         x/V66Szfi/cRFYdBvhAyjudv8myd9BMo1qBhoyWW302Dj67T/pbHh1XlZ3y0SAxZV7Py
         dC5aqoh21ioXIR+/XzPtookUfTuUN5qKckV0AG1XkRsFOtztuB1ssJGFybnaSxTzcUd9
         MVXAQdJ3FwW5VAph7T8d3TA1RYV06gQPwi10rpI2VociBWqHBgh2Z5b41I8Del422bnM
         U9Fw==
X-Gm-Message-State: AOJu0YwQtX+1O8dSUSJLPaOmm3W6b8EqOraij3nKea490HjM3aEo3hIn
	rXM63XzoSY682A3Owd2Fe6Lia2jXAWnLaPEOEzHv0nEXb4pPF5LvEgYD53rk+xZ6C8w=
X-Gm-Gg: ASbGnctaeme/TnrjUJQzB42QXPmzIm3Pk7NFb0jCktBwghCWsl+qcrvehU1t/6rHa+T
	wotC/lO/beVtJu0TwoN23Sv+k49HHaw0inQe/2nUk3BCo03T0qZ+aYnMsF18Kq0ynDHi9Sy0+ig
	iMZuvVuxZFY8Mi5h6qLxfkaRDiMLzzkfEPgdMDMTflHLI9QnjJ7tqoiLAJ5NtAW0P1Jegr8WwqR
	FL82aJzaETfxJRZVa5VETGIZfDiJOnl4XcxGpzo/HEOlUwxTEQhRVrmQAEuJvYmU7cB7pqddav8
	0TPlNA4Es14oEIZb8x7cdVoe2VWimXypqm+H/KBsGnDvu39sGaY+vMbEe9DftoObs80ePxvPzDX
	6LXIq1fpM+v+DxAIsumXhvN/v8V+a/KgX8wgda+5iTu8vRwBBFmjUqb+XjhnsPWS10baEC4Npt2
	wP62u8Z2PvAZOWUkvu8ea1dTnACwoU3c+1
X-Google-Smtp-Source: AGHT+IGp09JaeOX3yVBTvcZhfON4YdhSK+GkJ/mme+KPBBheML9oD4BkUrEXcZw5qsDKtKxewmTUxg==
X-Received: by 2002:a17:907:9620:b0:ae0:cff8:5717 with SMTP id a640c23a62f3a-af8fd71ee4fmr47605866b.4.1753871937827;
        Wed, 30 Jul 2025 03:38:57 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v11 0/6] x86: Make MAX_ALTP2M configurable
Date: Wed, 30 Jul 2025 10:38:44 +0000
Message-Id: <cover.1753871755.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

This series introduces the ability to configure the maximum number of altp2m
tables during domain creation. Previously, the limits were hardcoded to a
maximum of 10. This change allows for greater flexibility in environments that
require more or fewer altp2m views.

This enhancement is particularly relevant for users leveraging Xen's features
for virtual machine introspection.

Changes since v10:
- x86/altp2m: Remove p2m_altp2m_check stubs from unsupported architectures
    - (now "altp2m: drop p2m_altp2m_check() stubs on non-x86, move prototype,
       and guard uses").
    - Changed commit message to reflect new changes.
    - Removed p2m_altp2m_check from x86/include/asm/p2m.h.
    - Introduced p2m_altp2m_check in xen/include/xen/p2m-common.h.
    - Replaced #ifdef CONFIG_ALTP2M with IS_ENABLED(CONFIG_ALTP2M) in
      vm_event.c.

- x86/altp2m: Wrap altp2m-specific code in #ifdef CONFIG_ALTP2M
    - Added `else if ( IS_ENABLED(CONFIG_ALTP2M) )` before calling
      hvm_fast_singlestep in vm_event_toggle_singlestep, to make sure that
      hvm_fast_singlestep is unreachable when ALTP2M=n.
        
      Also, the #ifdef CONFIG_ALTP2M inside hvm_fast_singlestep was moved to be
      _outside_ the function (wrapping it entirely).

    - Removed formatting of the hvmemul_vmfunc function header + moved
      the #ifdef to be inside the function body.

    - Removed altp2m_vcpu_update_{p2m,vmfunc_ve}() declarations
      from hvm.h, since they are not used when CONFIG_ALTP2M is not set.

- xen: Make the maximum number of altp2m views configurable for x86
    - In do_altp2m_op, -EOPNOTSUPP is now returned when nr_altp2m == 0, instead
      of -EINVAL.

    - Removed stray empty lines that were introduced in
      p2m_mem_access_emulate_check & p2m_mem_access_check.

Changes since v9:
- Introduced 3 more patches:
  - x86/p2m: Short-circuit p2m_is_altp2m() when CONFIG_ALTP2M=n
    - Needed to optimize out `if ( p2m_is_altp2m(p2m) )` when CONFIG_ALTP2M=n.
  - x86/altp2m: Remove p2m_altp2m_check stubs from unsupported architectures
    - Removes p2m_altp2m_check stubs from archs that don't support altp2m.
  - x86/altp2m: Wrap altp2m-specific code in #ifdef CONFIG_ALTP2M
    - Self-explanatory - based on Jans review suggestion
- Small changes based on review:
  - if ( v->domain->nr_altp2m == 0 ) -> if ( !v->domain->nr_altp2m ) 
  - removed unnecessary condition in p2m_teardown_altp2m
  - Added ASSERT(!config->altp2m.nr) when CONFIG_ALTP2M=n in domain_create

Changes since v8:
- Removed 1st patch, which was already applied.
- Removed Reviewed-by from "tools/xl: Add altp2m_count parameter" patch.
- (No code changes)

Changes since v7:
- Fix condition in libxl_create.c that caused assertions in CI.
- Removed incorrect mention of introduction of hvm_altp2m_supported() in commit
  message of patch 0004.
- Adjust comments in altp2m_is_eptp_valid().
- Guard ALTP2M features with CONFIG_ALTP2M where appropriate. I made my best to
  ensure that the following configurations compile correctly:
  * CONFIG_HVM=n (CONFIG_ALTP2M=n implied)
  * CONFIG_HVM=y CONFIG_ALTP2M=n
  * CONFIG_HVM=y CONFIG_ALTP2M=y
  * Note: Besides taking inspiration from CONFIG_MEM_SHARING &
    CONFIG_MEM_PAGING, the reason for guards instead of wrapper methods is that
    all ALTP2M features and fields became guarded by CONFIG_ALTP2M - therefore,
    lots of code inside ALTP2M blocks would be touching inexisting fields.

    This could be solved by introducing wrapped functions for each ALTP2M
    field, but I believe that would be overkill.

Changes since v6:
- Rebased on top of staging
- Added missing Acks/Reviewed-bys where appropriate.
- No changes in patches since v6, with the exception of 0004: xen: Make the
  maximum number of altp2m views configurable for x86... which was the only
  patch that was left unacked/not reviewed
  - In that patch, I made changes suggested by Jan - that is:
    - Create altp2m_is_eptp_valid function and use it in places where
      we don't control the index
    - Fixed a nit: "Number of altp2ms to allocate." -> "... to permit."
    - Cosmetic: moved altp2m_vcpu_idx() in altp2m.h up, so the order of
      functions matches with the order in the #else block

Changes since v5:
- Reverted "Introduction of accessor functions for altp2m arrays and
  refactoring the code to use them."
  - Reason is minimizing the code changes, and save the code consistency.
  - I've addressed (hopefully all) issues with long lines and mismatched
    _nospec replacements mentioned in previous reviews.
- Removed "struct domain *d" from altp2m_vcpu_initialise/destroy.

Changes since v4:
- Rebased on top of staging (applying Roger's changes).
- Fix mixed tabs/spaces in xenctrl_stubs.c.
- Add missing OCaml bindings for altp2m_opts.
- Substitute altp2m_opts into an unnamed structure. (This is a preparation for
  the next patch that will introduce the `nr` field.)
- altp2m.opts is then shortened to uint16_t and a new field altp2m.nr is added -
  also uint16_t. This value is then verified by libxl to not exceed the maximum
  uint16_t value.

  This puts a hard limit to number of altp2m to 65535, which is enough, at least
  for the time being. Also, altp2m.opts currently uses only 2 bits. Therefore
  I believe this change is justified.
- Introduction of accessor functions for altp2m arrays and refactoring the code
  to use them.
- Added a check to arm/arch_sanitise_domain_config() to disallow creating
  domains with altp2m.nr != 0.
- Added dummy hvm_altp2m_supported() to avoid build errors when CONFIG_HVM is
  disabled.
- Finally, expose altp2m_count to OCaml bindings (and verify both altp2m_opts
  and altp2m_count fit uint16_t).
- I also removed Christian Lindig from the Acked-by, since I think this change
  is significant enough to require a re-review.

Changes since v3:
- Rebased on top of staging (some functions were moved to altp2m.c).
- Re-added the array_index_nospec() where it was removed.

Changes since v2:
- Changed max_altp2m to nr_altp2m.
- Moved arch-dependent check from xen/common/domain.c to xen/arch/x86/domain.c.
- Replaced min(d->nr_altp2m, MAX_EPTP) occurences for just d->nr_altp2m.
- Replaced array_index_nospec(altp2m_idx, ...) for just altp2m_idx.
- Shortened long lines.
- Removed unnecessary comments in altp2m_vcpu_initialise/destroy.
- Moved nr_altp2m field after max_ fields in xen_domctl_createdomain.
- Removed the commit that adjusted the initial allocation of pages from 256
  to 1024. This means that after these patches, technically, the nr_altp2m will
  be capped to (256 - 1 - vcpus - MAX_NESTEDP2M) instead of MAX_EPTP (512).
  Future work will be needed to fix this.

Petr Beneš (6):
  altp2m: Drop p2m_altp2m_check() stubs on non-x86, move prototype, and
    guard uses
  x86/altp2m: Wrap altp2m-specific code in #ifdef CONFIG_ALTP2M
  xen: Make the maximum number of altp2m views configurable for x86
  tools/libxl: Activate the altp2m_count feature
  xen/x86: Disallow creating domains with altp2m enabled and altp2m.nr
    == 0
  tools/ocaml: Add altp2m_count parameter

 tools/libs/light/libxl_create.c     |  4 ++
 tools/ocaml/libs/xc/xenctrl.ml      |  1 +
 tools/ocaml/libs/xc/xenctrl.mli     |  1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c | 19 ++++++--
 xen/arch/arm/domain.c               |  2 +-
 xen/arch/arm/include/asm/p2m.h      |  6 ---
 xen/arch/ppc/include/asm/p2m.h      |  5 --
 xen/arch/riscv/include/asm/p2m.h    |  5 --
 xen/arch/x86/domain.c               | 41 +++++++++++++---
 xen/arch/x86/hvm/emulate.c          |  4 ++
 xen/arch/x86/hvm/hvm.c              | 18 +++++++-
 xen/arch/x86/hvm/monitor.c          |  2 +
 xen/arch/x86/hvm/vmx/vmx.c          | 10 +++-
 xen/arch/x86/include/asm/altp2m.h   | 28 +++++++++--
 xen/arch/x86/include/asm/domain.h   | 11 +++--
 xen/arch/x86/include/asm/hvm/hvm.h  |  6 +++
 xen/arch/x86/include/asm/hvm/vcpu.h |  4 ++
 xen/arch/x86/include/asm/p2m.h      | 24 ++++++----
 xen/arch/x86/mm/altp2m.c            | 72 +++++++++++++++--------------
 xen/arch/x86/mm/hap/hap.c           | 12 +++--
 xen/arch/x86/mm/mem_access.c        | 28 +++++------
 xen/arch/x86/mm/mem_sharing.c       |  4 +-
 xen/arch/x86/mm/p2m-ept.c           | 11 +++--
 xen/arch/x86/mm/p2m-pt.c            |  2 +
 xen/arch/x86/mm/p2m.c               | 17 +++++--
 xen/arch/x86/vm_event.c             |  2 +-
 xen/common/domain.c                 |  6 +++
 xen/common/vm_event.c               |  3 +-
 xen/include/public/domctl.h         |  5 +-
 xen/include/xen/p2m-common.h        |  3 ++
 xen/include/xen/sched.h             |  4 ++
 31 files changed, 253 insertions(+), 107 deletions(-)

-- 
2.34.1



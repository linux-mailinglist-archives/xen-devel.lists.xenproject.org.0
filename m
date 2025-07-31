Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF72B16E9F
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:28:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065149.1430492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPa8-0000LF-NW; Thu, 31 Jul 2025 09:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065149.1430492; Thu, 31 Jul 2025 09:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPa8-0000Jm-KM; Thu, 31 Jul 2025 09:28:12 +0000
Received: by outflank-mailman (input) for mailman id 1065149;
 Thu, 31 Jul 2025 09:28:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X87O=2M=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uhPa6-0000Jb-KM
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:28:10 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab77c173-6df0-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 11:28:08 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4589c1f55aeso1083725e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 02:28:08 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953cfcc1sm60905485e9.17.2025.07.31.02.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 02:28:06 -0700 (PDT)
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
X-Inumbo-ID: ab77c173-6df0-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753954088; x=1754558888; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S7fPKztGTJFTGy19DyoAl99Mf8Qa8u3RbUKrS2xuoU4=;
        b=Da473el09+c5VxdNkWvtL161KlKy9p+SS0vd9wfAkO05VgQB6Y9rbFqKyIZY7LEFlb
         WaZu/5nqMhY3tSlwS6EMYxcjf2C/eD/WknR+935DmOxYqAWHS767WcPg6qKdRVkYftL9
         g3SekW5XGU/4KGl1DeCRkHwF4Ly+8rNnjBQZ1ovMLr6fb6dZhGFt2pexw0vrhqDqWYYI
         ZY/okzCadG49P6jArO4aKPc5biCQABkfn9V06uGIVX9byR3fSwOEWc0iM7DrQitwgnPg
         Q8z992gkXvbW+T0GpT+rRpnrGxZdigisdqamnd/yAZbCSGOgTAkIyvYK6h/IWX+L3vqs
         DqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753954088; x=1754558888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7fPKztGTJFTGy19DyoAl99Mf8Qa8u3RbUKrS2xuoU4=;
        b=DIh2uZ2ybuzqy7h0Li1QpQDB6Oz1djTrJoz1fc9OJ4xBi8sYFP3SGauKBkS4SvVekU
         gAzPHAMucBSeE24vs3V1D2oCdwZ+ZcKZc7SiPHR01F5YZv0F0gNyrVsI/bZkdGbZhvQn
         Bt9vZaE/TM5P1HwbdfwVySjlI5hkY7ts7S9A0K/Y5ALJWuaNH3iX6E8IynuGC5jboKJl
         Ih6B88lelqNWvMCYdL1hE0X6U74HP80PvQ1kTROuE6g3bhWyHntJFqd54OqqzbptNztj
         Phx6QNe5QM8HXB1ryE/cKwnoZiipOz1oG+A5lwyDLMohs8VhBXYAPLzQLIGEKpIsG5Dr
         849g==
X-Gm-Message-State: AOJu0YySy0w/TT9pi2iPS07stulLlLgD7zdnRCpHDInsxSS7eI8v4WiX
	CFnt4zBbd+yQPU+NOWCkFSubXzfj+dzxcSCkJxjp2PmukeRlrNMIR4TXOiGK7qbl
X-Gm-Gg: ASbGncumpaZgjs41f9YMUN5AOHq/khIRU9IqRm30Th7phdlchYHUgAHx+RQDCBiAkjX
	eZYovjNS4z+AVpUIxpNiwD0rHSeajW0lzi1z0avzBwE/r6xM30tBiB4ZpYRNyNecwUYMINwRa8E
	+BiIZn+SSlTQsA4Mb76vHrJVgJ0uPHf/Newf8kwkTvq7eT163sdpoYwByiTj2v1TqwIYZw1Aofp
	jih07WZO+CJjxn26iyH7TogDgyWzNbBxt8XtYjs3UmannTuBJ0M3qNy3g5MTa9NWj4E4uDyfDj4
	KBeHLoc46eh6kjGH7HQogcORnvDf/sIvqrlWEWmcCro3MVcYNNZni35sTAa9QnjJJBphXPIaTtr
	1LQZO8Jp45kKOo5zgLwSaIM3qTgQAPkOw2WnWrWtM4XPZj2Ng8DDF30FOvIVahiDBBKB8MYVp9H
	EWDDlSopSHm7xlDxtew1gH4Q==
X-Google-Smtp-Source: AGHT+IHjxc2bLDvqPUt9h09mrFMD5WQ/Cf4PkqJTUrGnJWeEFMXi85BF2yXbQMKXB5EXjOcwqiqd0w==
X-Received: by 2002:a05:600c:c04b:20b0:458:a754:dd72 with SMTP id 5b1f17b1804b1-458a754e0a0mr1126085e9.8.1753954087246;
        Thu, 31 Jul 2025 02:28:07 -0700 (PDT)
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
Subject: [PATCH v12 0/6] x86: Make MAX_ALTP2M configurable
Date: Thu, 31 Jul 2025 09:27:55 +0000
Message-Id: <cover.1753953832.git.w1benny@gmail.com>
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

Changes since v11:
- altp2m: Drop p2m_altp2m_check() stubs on non-x86, move prototype, and guard
  uses
    - s/following/subsequent/ in the commit message + Reviewed-by: Jan Beulich
    - Despite agreeing to let Jan make this change, this commit wasn't still in
      the staging branch at the time of sending this patch.

- x86/altp2m: Wrap altp2m-specific code in #ifdef CONFIG_ALTP2M
    - Change typo #else /* !CONFIG_HVM */ -> #else /* !CONFIG_ALTP2M */ in p2m.h
    - Move p2m_altp2m_get_or_propagate & p2m_altp2m_propagate_change outside of
      #ifdef CONFIG_ALTP2M / #else / #endif and added comment mentioning that
      these altp2m declarations are outside of the #ifdef scope intentionally.

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
 xen/arch/x86/include/asm/p2m.h      | 43 +++++++++--------
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
 31 files changed, 261 insertions(+), 118 deletions(-)

-- 
2.34.1



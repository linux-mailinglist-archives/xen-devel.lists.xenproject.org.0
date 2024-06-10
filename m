Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CC2902787
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 19:11:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737469.1143810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXr-00015h-7B; Mon, 10 Jun 2024 17:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737469.1143810; Mon, 10 Jun 2024 17:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXr-000117-0G; Mon, 10 Jun 2024 17:10:59 +0000
Received: by outflank-mailman (input) for mailman id 737469;
 Mon, 10 Jun 2024 17:10:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7qHj=NM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sGiXo-0000kq-Vg
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 17:10:56 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64b0cc57-274c-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 19:10:53 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57c72d6d5f3so2646558a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 10:10:53 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c76740d6asm3233169a12.7.2024.06.10.10.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 10:10:51 -0700 (PDT)
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
X-Inumbo-ID: 64b0cc57-274c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718039452; x=1718644252; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4jqdzkutA78dZetgHBumqJPxJP/89ei7jWnyGl0WcyM=;
        b=WdKjH2rGEzKAw2hG1xalrhfbyfd1um2vWkg3EMXjuxtf28K1o7KfdVVQIjIdb3svVh
         uKMEUKlWGabQ0HULdWCnvL3LARuYxIo85vdybYK2Zpf7wxftIxcZoZrfrJBPC12HQv6X
         ooYqmPNwqkmVSIbVuDz2oR9IY1wn6ttyAR/rm7t499mezj7dNXggKjaslVUEO38EsfwP
         Zt19RO99pjiE00bnLUcN9lmwU6/S2V39I/dRiu+Xmb7cXLHVqeVJlZoeG1KAbbzN78BX
         xjOhh9RMESBvf6dl10DCW9kd8TU5ZeGUb2PnufrjgFYhBf+rXYE9l0Q8wMcVLRqfoFQK
         5vaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718039452; x=1718644252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jqdzkutA78dZetgHBumqJPxJP/89ei7jWnyGl0WcyM=;
        b=xL+20do+Ta9VjEaAPzdUavEaDuyTrTlGo+qVH34x6rvJqhYCxPhF4nkKly/ZqNtLpx
         yoMPG6KACFmckQCS37XvrdetNxY5Zhyt8TSV18CrVm+VCAtEZZuF2BjhJ4BkRb+8kE84
         OzCrNNF4gAvISHJq6IINNVCVhYICi2tw3Y7sggWySsThoDG/YOwyofLeEqf8yOTogID0
         V1Wxc8mA+V7gPWdIsBsEqqa5kx/66gGKfNseYmpvwHudQeG9SqV2Ham5W2YzeKkcWP0b
         57KIKx0ZdR9XMbTnZyEeo9qCx8vU29s2Ip9sdi8E1UXzzhw4N6zU0AMxzHgIyKogs1gU
         1kIw==
X-Gm-Message-State: AOJu0YzdJ1TaeoU1Gu6XcG5l6ot/TqqoUjVVs2D++GXrXTqRRBkGJ+eh
	fG/uux+p/S9Hm23ae80hbGMh4EPieFSVneCMvxg/gARg8ab1fkdNjqUroLO9
X-Google-Smtp-Source: AGHT+IFcAQE0CgOwAfUFe3Sjm9ajlMWqD6HI9MKGe8zcS2xaqcczKqJoMl0L3DUKtGGal6WgMPCjyQ==
X-Received: by 2002:a50:9f22:0:b0:57c:6e94:a1a9 with SMTP id 4fb4d7f45d1cf-57c6e94a66emr3501246a12.17.1718039452143;
        Mon, 10 Jun 2024 10:10:52 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH for-4.19? v6 0/9] x86: Make MAX_ALTP2M configurable
Date: Mon, 10 Jun 2024 17:10:38 +0000
Message-Id: <cover.1718038855.git.w1benny@gmail.com>
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

Petr Beneš (9):
  tools/ocaml: Fix mixed tabs/spaces
  tools/ocaml: Add missing ocaml bindings for altp2m_opts
  xen: Refactor altp2m options into a structured format
  tools/xl: Add altp2m_count parameter
  docs/man: Add altp2m_count parameter to the xl.cfg manual
  xen: Make the maximum number of altp2m views configurable for x86
  tools/libxl: Activate the altp2m_count feature
  xen/x86: Disallow creating domains with altp2m enabled and altp2m.nr
    == 0
  tools/ocaml: Add altp2m_count parameter

 docs/man/xl.cfg.5.pod.in             | 14 ++++++
 tools/golang/xenlight/helpers.gen.go |  2 +
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/include/libxl.h                |  8 ++++
 tools/libs/light/libxl_create.c      | 19 +++++++--
 tools/libs/light/libxl_types.idl     |  1 +
 tools/ocaml/libs/xc/xenctrl.ml       |  2 +
 tools/ocaml/libs/xc/xenctrl.mli      |  2 +
 tools/ocaml/libs/xc/xenctrl_stubs.c  | 40 +++++++++++------
 tools/xl/xl_parse.c                  |  9 ++++
 xen/arch/arm/domain.c                |  2 +-
 xen/arch/x86/domain.c                | 45 +++++++++++++++----
 xen/arch/x86/hvm/hvm.c               | 10 ++++-
 xen/arch/x86/hvm/vmx/vmx.c           |  2 +-
 xen/arch/x86/include/asm/domain.h    |  9 ++--
 xen/arch/x86/include/asm/hvm/hvm.h   |  5 +++
 xen/arch/x86/include/asm/p2m.h       |  4 +-
 xen/arch/x86/mm/altp2m.c             | 64 ++++++++++++++++++----------
 xen/arch/x86/mm/hap/hap.c            |  6 +--
 xen/arch/x86/mm/mem_access.c         | 14 +++---
 xen/arch/x86/mm/mem_sharing.c        |  2 +-
 xen/arch/x86/mm/p2m-ept.c            |  7 +--
 xen/arch/x86/mm/p2m.c                |  8 ++--
 xen/common/domain.c                  |  1 +
 xen/include/public/domctl.h          |  7 ++-
 xen/include/xen/sched.h              |  2 +
 26 files changed, 210 insertions(+), 76 deletions(-)

--
2.34.1



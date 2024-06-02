Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E6D8D77AF
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2024 22:05:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734554.1140650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRT-000838-RC; Sun, 02 Jun 2024 20:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734554.1140650; Sun, 02 Jun 2024 20:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRT-00081L-Nm; Sun, 02 Jun 2024 20:04:35 +0000
Received: by outflank-mailman (input) for mailman id 734554;
 Sun, 02 Jun 2024 20:04:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nKxc=NE=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sDrRS-0007mz-4u
 for xen-devel@lists.xenproject.org; Sun, 02 Jun 2024 20:04:34 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52e1da37-211b-11ef-90a1-e314d9c70b13;
 Sun, 02 Jun 2024 22:04:32 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-421392b8156so5404115e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Jun 2024 13:04:31 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064bb21sm6879280f8f.102.2024.06.02.13.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:04:29 -0700 (PDT)
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
X-Inumbo-ID: 52e1da37-211b-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717358670; x=1717963470; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NtMJq0HQrMIOCY6/RlBy7+7HJutlZ/23G2I1odKXddQ=;
        b=K77xtUdMY/8f2OhtHkThXyaeqknW2D98dcSFvxRZGsZ/GnBv0DdjaFrmWpOMiyESYP
         pUL/WIC024bwj8z0SuvtrPrw1t5zciW5synZTRaP65DJCkGW5do2zaFcKFBKLcw9vzji
         puNI7TTX7QaW3fWTp+0UnbsIGhAbu+uWYinWZKr1IVwE7r7Q1Q7w0IUQvp34tdpchGrn
         t3+1PBSwkD7uT6QT+LIVz2r/X1x/MTSdJ+xYN5KobdAeJC3/FsyvGcbQwVmyZbgGjmOO
         jpP/NY87mOFuWndZqusCfs8W85wphQD0TY5szaBtCH6nv6TEE/Zq1RwksxnSZjWmb5s0
         nujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717358670; x=1717963470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtMJq0HQrMIOCY6/RlBy7+7HJutlZ/23G2I1odKXddQ=;
        b=ZDEjgJG1CCo2CUrxIumHW6xEoJIQFYEIS4ERMgF1xHuLoEO7D/F0bmNwRBzMzMJFXR
         N76QaYsEY8sku0FcwhWQ/6g0n5AlMnzvECM1XXEZffOgfTw6XVo/FxDydFfmRE0Xr+M3
         BFAl1HYY5DOswsvOlspjNwcC9Cjs5DEHCxLJyjJjkBIGVdXFyx4ci+SpE2UOeWZDEY1r
         LfbDF8G/mO1Jhw+XyGURHThDilLlfeJzP07JXTJP71i9DZ8HqIrVyAFURmDr6w6ZtPVa
         x5kuEMdmnPSsaCS9sp5yPIRmR7R97oERYDvRQQ63WHqhi5eLlid6fI9xvrcAcso2HIPm
         F63w==
X-Gm-Message-State: AOJu0Yyww4Chfq/oUPyN0U6X0Jwhy7+xzaMiwouRiW12PS1j/ZgAsZ1P
	I5B4P9PzL/buLCAFVEQRLJVLwpSrJ8xhIvMmrKmc8z4itEWtZcOI16kw7Dfc
X-Google-Smtp-Source: AGHT+IGB9GGD5JCZDraG4IjTDMuXO8bGbqNhaH7hkOsz7s39LzRzOLfDHLcFWO9MGKbXCQzLJugIDg==
X-Received: by 2002:a05:600c:4347:b0:41c:3e1:9db9 with SMTP id 5b1f17b1804b1-4212e09ccfcmr54691575e9.27.1717358669927;
        Sun, 02 Jun 2024 13:04:29 -0700 (PDT)
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
Subject: [PATCH for-4.19? v5 00/10] x86: Make MAX_ALTP2M configurable
Date: Sun,  2 Jun 2024 20:04:13 +0000
Message-Id: <cover.1717356829.git.w1benny@gmail.com>
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

Petr Beneš (10):
  tools/ocaml: Fix mixed tabs/spaces
  tools/ocaml: Add missing ocaml bindings for altp2m_opts
  xen: Refactor altp2m options into a structured format
  tools/xl: Add altp2m_count parameter
  docs/man: Add altp2m_count parameter to the xl.cfg manual
  x86/altp2m: Introduce accessor functions for safer array indexing
  xen: Make the maximum number of altp2m views configurable for x86
  tools/libxl: Activate the altp2m_count feature
  xen/x86: Disallow creating domains with altp2m enabled and altp2m.nr
    == 0
  tools/ocaml: Add altp2m_count parameter

 docs/man/xl.cfg.5.pod.in             |  14 ++++
 tools/golang/xenlight/helpers.gen.go |   2 +
 tools/golang/xenlight/types.gen.go   |   1 +
 tools/include/libxl.h                |   8 ++
 tools/libs/light/libxl_create.c      |  19 ++++-
 tools/libs/light/libxl_types.idl     |   1 +
 tools/ocaml/libs/xc/xenctrl.ml       |   2 +
 tools/ocaml/libs/xc/xenctrl.mli      |   2 +
 tools/ocaml/libs/xc/xenctrl_stubs.c  |  40 +++++++---
 tools/xl/xl_parse.c                  |   9 +++
 xen/arch/arm/domain.c                |   2 +-
 xen/arch/x86/domain.c                |  45 ++++++++---
 xen/arch/x86/hvm/hvm.c               |  10 ++-
 xen/arch/x86/hvm/vmx/vmx.c           |   6 +-
 xen/arch/x86/include/asm/altp2m.h    |  32 ++++++++
 xen/arch/x86/include/asm/domain.h    |   9 ++-
 xen/arch/x86/include/asm/hvm/hvm.h   |   5 ++
 xen/arch/x86/include/asm/p2m.h       |  11 ++-
 xen/arch/x86/mm/altp2m.c             | 110 ++++++++++++++-------------
 xen/arch/x86/mm/hap/hap.c            |  16 ++--
 xen/arch/x86/mm/mem_access.c         |  25 +++---
 xen/arch/x86/mm/mem_sharing.c        |   4 +-
 xen/arch/x86/mm/p2m-ept.c            |  18 ++---
 xen/arch/x86/mm/p2m.c                |  24 +++---
 xen/common/domain.c                  |   1 +
 xen/include/public/domctl.h          |   7 +-
 xen/include/xen/sched.h              |   2 +
 27 files changed, 290 insertions(+), 135 deletions(-)

--
2.34.1



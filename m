Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6695BB054EA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043766.1413798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubb4M-0005aX-0l; Tue, 15 Jul 2025 08:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043766.1413798; Tue, 15 Jul 2025 08:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubb4L-0005Yc-T3; Tue, 15 Jul 2025 08:31:21 +0000
Received: by outflank-mailman (input) for mailman id 1043766;
 Tue, 15 Jul 2025 08:31:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V4bE=Z4=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubb4L-0005YW-5C
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:31:21 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1492ac2c-6156-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 10:31:19 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45611d82f2eso1919495e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 01:31:19 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560f22cd14sm84787075e9.30.2025.07.15.01.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 01:31:17 -0700 (PDT)
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
X-Inumbo-ID: 1492ac2c-6156-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752568278; x=1753173078; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S5eM6fE6R6aTkABxh4TtTt7kyC6DLeQKey+Bp7OBosM=;
        b=VghmI2YOPcdVZW/HQkV1CFnd78pHSFQ7chglxSRyhxGKYVsNw/+3Wvcqe2Ow7t8axE
         yl+uWXrKqdEMqc/NdxqLmaDLrtYWtNCN/5qw8rOTz0D+EF1j5qQWbRoXFng3SCPi4j6p
         TkDTKMyJbWVSwkSNnN/sjJ7kC9zW1oseaP6t0ng+MO9fwKfa0ATFyGZcZ9oAs4jeRqbk
         Oo+GuYO9TenZ2ERryc6pWDnoPkrvPfYIkabqfb32dB5Tgkow37mwqp54ApocMoyOHvTB
         YHN/5FpXxM+iSKeMiFYj8FVviZHxcHaKf8D5eiMZ+Pa4e/aJGsDhTMBWeaUSLhHtbEpP
         CDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752568278; x=1753173078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S5eM6fE6R6aTkABxh4TtTt7kyC6DLeQKey+Bp7OBosM=;
        b=kpfVe27GHSj54QOjjOxt/O9joZPrR4XuPXeo/0F3WJ6yo0UnjVOYSwxbQgQgDJjhpD
         ZC3BwE3zeLnL3h/O/+/s/NSgigfVgWKDUx/OWZPq8r5jk1nfzy+4JY7c02fIa4v5JDKP
         P0ja0YEQ8KaQG8iMALcvimPHgAwLaiOMDZ+GxunkbeQ1y9u8ey40TjNfm+feUtIDqvNA
         LSpSIygxVx/9Af4epuQoL8nT9Rth3ah68P10Pc0NTra/BSQ744297SxrRgovaM+uWut7
         3/TURbhyhHmiFNutoBNG/iHoVjZ6gz+Jz2RYmS/51drc9BCHBzALDZ8OtGFEnzcempam
         fNSA==
X-Gm-Message-State: AOJu0YzJBIFi/5ifZya9PCi874/LWU/6v2O1Z1jsfmMJqA2gInC/xfSD
	DcsEIZl1c99pCYlGKFMJMB0lJwgbPGdfLAXUh9XQSZH9Sn4m6UZuFwIJW9IUPw==
X-Gm-Gg: ASbGncu3EFJB/eEywDg11IdtZTOk3hc78E7hH8JaXKL/AN+GXc0uWMO4kiMDHO4BFep
	3l2zvfTNVZYY1v5kuJK/+tv9+29v1Sl/J+cbgo4R92d9wFAQC/LsIPxAKkLEhis0sPTQzvX/0NR
	bdtpcZSu4yu61nQv8fHaW5Lmr2uYe9bcC03O3OPFPvD43hjTN6xcu6ycvaz0MDKT3lnO9ste9DU
	5gQwFYYF7JWk4JgF9rkWGo6p4JOgyHvrVGqcVtpg7sCjTPwAgA7zjgjhJgq6ddENqZTFgV4xtw8
	r9xFryGvwTZeax8bqTnM+RC+LRjhbygX1e4CHLYDeob9uLEM8qoXztZO3RcYDDZKX2As2jmjJ/1
	p/XcZ2M88nMGLT/sFZ2OAN64uN99aGBkkdwd05oliGo+612heTbmNFMIoKXO0HSO2H+gaWXNA4y
	d9PJLm5Rqar6/fM5ZbZvagHA==
X-Google-Smtp-Source: AGHT+IFXNWTxzyOubrjDElGeId2fPZjjnkn40DTZf4Fd8T9RfFRLHB4qloK1gKxAuaQ5Z3WfTjYyZw==
X-Received: by 2002:a05:6000:1789:b0:3a4:f912:861f with SMTP id ffacd0b85a97d-3b60b319f2amr221953f8f.2.1752568277634;
        Tue, 15 Jul 2025 01:31:17 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v9 0/6] x86: Make MAX_ALTP2M configurable
Date: Tue, 15 Jul 2025 08:31:08 +0000
Message-Id: <cover.1752568020.git.w1benny@gmail.com>
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
 tools/include/libxl.h                |  7 +++
 tools/libs/light/libxl_create.c      | 14 ++++++
 tools/libs/light/libxl_internal.h    |  1 +
 tools/libs/light/libxl_types.idl     |  1 +
 tools/ocaml/libs/xc/xenctrl.ml       |  1 +
 tools/ocaml/libs/xc/xenctrl.mli      |  1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c  | 19 +++++--
 tools/xl/xl_parse.c                  |  9 ++++
 xen/arch/arm/domain.c                |  2 +-
 xen/arch/x86/domain.c                | 41 ++++++++++++---
 xen/arch/x86/hvm/hvm.c               | 20 +++++++-
 xen/arch/x86/hvm/monitor.c           |  2 +
 xen/arch/x86/hvm/vmx/vmx.c           | 12 ++++-
 xen/arch/x86/include/asm/altp2m.h    | 28 +++++++++--
 xen/arch/x86/include/asm/domain.h    | 11 ++--
 xen/arch/x86/include/asm/hvm/vcpu.h  |  4 ++
 xen/arch/x86/include/asm/p2m.h       | 26 +++++++---
 xen/arch/x86/mm/altp2m.c             | 75 +++++++++++++++-------------
 xen/arch/x86/mm/hap/hap.c            | 12 +++--
 xen/arch/x86/mm/mem_access.c         | 34 ++++++++-----
 xen/arch/x86/mm/mem_sharing.c        |  4 +-
 xen/arch/x86/mm/p2m-ept.c            | 15 ++++--
 xen/arch/x86/mm/p2m-pt.c             |  2 +
 xen/arch/x86/mm/p2m.c                | 17 +++++--
 xen/common/domain.c                  |  3 ++
 xen/include/public/domctl.h          |  5 +-
 xen/include/xen/sched.h              |  4 ++
 30 files changed, 299 insertions(+), 88 deletions(-)

-- 
2.34.1



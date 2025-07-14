Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC170B04AFE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 00:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043175.1413285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRyo-00049J-0a; Mon, 14 Jul 2025 22:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043175.1413285; Mon, 14 Jul 2025 22:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRyn-00047I-Td; Mon, 14 Jul 2025 22:49:01 +0000
Received: by outflank-mailman (input) for mailman id 1043175;
 Mon, 14 Jul 2025 22:49:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c3lH=Z3=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubRym-00047A-8B
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 22:49:00 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bae7b1ba-6104-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 00:48:59 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4eb4acf29so263940f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 15:48:59 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd18ffsm13288903f8f.9.2025.07.14.15.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:48:57 -0700 (PDT)
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
X-Inumbo-ID: bae7b1ba-6104-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752533338; x=1753138138; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHh+lrlc/sHpWlMkXDPjoxqQIjtiKebzI0zpzQb79QQ=;
        b=d+K8ZxuBLZYe/NGzMMtO/O/pNw974SRzfL3N6ZbQI/6U/4UZCoDC4eM+1dUKF9bLFQ
         vW7TX8mwAq33SIqDrL35B4DOSVTqvsodtCckzeG/WmehKoT55469CQk3Z7ACiEcPpm9M
         NNb4YL+82N3KIAP6eMcFhMmjdplXMnPDZWbogJ+wRRwCbvTiJ1Ngp4CUGYIpsLqe8KA/
         XeFcmViXssl/MZ3ahXKV0D9dLh+9oYFp1E/BdoORq3ZnpEFgb8yLTfbBEANsRwVHVB8S
         g2R7ufPp2lBREflLJ2rJ8vI83hyA9SdLzKgJKnhE3mMWZgvWWiThUu0WZxml4X2BuwyC
         ZJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533338; x=1753138138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHh+lrlc/sHpWlMkXDPjoxqQIjtiKebzI0zpzQb79QQ=;
        b=VUKKZKgOoZzsWHwIn2AGaPXqI5dXFoFMDFUGLuWxtQMQk7iqSkGu6n4ToQ16wgqi4n
         LTjdAEVJDrNB1yUNG47erNVWOCWKNJVr5eJpfgNNuFdLh0Vj1Ood/tLWzaEChWd8ZOAI
         V3E0Qfi9lTOC+/fYgf+X8JZm0bVJgyT435SCFA8TttiE/hQGeNg0xzopmSKfZN1242fa
         8LfdZah+r1T7HfZgXaQ4MGgiiPU9vk7gQ2nld7G78/Q41Dhegle6Uylkry2A7X/IBD/o
         BKA8KPthTA1yG61oJZ3PTZHWbgr82nc5aq+yEWf65V6weE9X07JCKh/yr0DKr3rxGqAZ
         Fjjw==
X-Gm-Message-State: AOJu0YwLwWXIuo9VVsWazb5mZYZnd+/1RHsLox75b3pgR/MIQFBja25J
	6BnqASGgJ1m2cFqhT/LeKZRecu1t3lyrdRARGdywAw8QKxs8MKFM2VyRqqx05Q==
X-Gm-Gg: ASbGncuUS0fyqnqGwKdUqKEVrwiW1QSBpjP8YtbLIdWoJNj/nTh+WqM1m/9UnPfwbgw
	ZS4vyltrTGr9x5OnqcU1bB7tOH6W8TodME7MjkIZATK0CgSsCeht2NbvLgUHpaGTKHyuso0IAx/
	bXG/YxV73knyhpeL4BJ+Th/3ufmAkldaHBHm8XuE7TJgFzWtWEGxLPKTV4iErTtdrZSW/fzHAZT
	dI1dzzIBDyCby4S8C3m/abyVQtMA9D1QoRhv13cwULEg9wDC5yjCv2s8v0qcz2ytPkRbbg6Af7/
	2oY9Ibh1G4dAF6f/TKKacv/odL26mUMMhun5HBlNmKJgPzkSIM/QMPKP14mOIQVpbWdoVQo0EGG
	Ma5qTbvIaglQvC4cC3vv5pxuw1eO3BCwVrdHLRQT0jC4iqLEWXQAeyFRUuLgPyckxnOYv/k+gqM
	aO6BOS2ex2ZUbi1FN0MnIr3/UOYaR+pn8Y
X-Google-Smtp-Source: AGHT+IE/mlKGuBcY6n2Yebn3n2aQcV3XybETFt8DK1T26vhVXet+Md4NN3ZNPPHXqZckOhcLXXHGHQ==
X-Received: by 2002:a05:6000:1ac6:b0:3a4:e193:e6e7 with SMTP id ffacd0b85a97d-3b5f2df1b4amr4175447f8f.5.1752533338193;
        Mon, 14 Jul 2025 15:48:58 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v8 0/7] x86: Make MAX_ALTP2M configurable
Date: Mon, 14 Jul 2025 22:48:47 +0000
Message-Id: <cover.1752531797.git.w1benny@gmail.com>
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

Petr Beneš (7):
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
 tools/include/libxl.h                |  7 +++
 tools/libs/light/libxl_create.c      | 20 ++++++--
 tools/libs/light/libxl_internal.h    |  1 +
 tools/libs/light/libxl_types.idl     |  1 +
 tools/ocaml/libs/xc/xenctrl.ml       |  1 +
 tools/ocaml/libs/xc/xenctrl.mli      |  1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c  | 21 ++++++--
 tools/xl/xl_parse.c                  |  9 ++++
 xen/arch/arm/domain.c                |  2 +-
 xen/arch/x86/domain.c                | 45 +++++++++++++----
 xen/arch/x86/hvm/hvm.c               | 22 +++++++-
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
 xen/include/public/domctl.h          |  7 ++-
 xen/include/xen/sched.h              |  4 ++
 30 files changed, 309 insertions(+), 94 deletions(-)

-- 
2.34.1



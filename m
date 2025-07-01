Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F7AAF042E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 21:54:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029942.1403644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWh3v-0008TC-UX; Tue, 01 Jul 2025 19:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029942.1403644; Tue, 01 Jul 2025 19:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWh3v-0008QX-RB; Tue, 01 Jul 2025 19:54:39 +0000
Received: by outflank-mailman (input) for mailman id 1029942;
 Tue, 01 Jul 2025 19:54:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u5am=ZO=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uWh3v-0008QR-7U
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 19:54:39 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38372193-56b5-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 21:54:38 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4e749d7b2so1029499f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 12:54:38 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e9d1csm14291644f8f.13.2025.07.01.12.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 12:54:36 -0700 (PDT)
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
X-Inumbo-ID: 38372193-56b5-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751399677; x=1752004477; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H+GkkYPn+ZUYEt1fAz26HqfyvmT7OOarY819nfs3ecw=;
        b=APmeZH9kqYR1keOotFBVkcbwyNFLaAfgbuElXlBN399JrmuG09h3DA1nXPX4VDKriZ
         uv3cOXOKdaUkyK/wqZ6SS4WQC4yzIlvTJ4crH65oHha9jVtH+Of0VH5X3dNU+YdpiopQ
         GFKGaAcmIVoQvc4J4360AG+IHNv24M84qPu68tsJ1+sAKnuV5oO6kR547J31OzVrWUKU
         D7Cx+VnC1CJexo0/rHQ4joe1v7rLoE5fvfSa3RCmbBXaRt80UzwJLKodHBkhc/6h/b2e
         4gWSV4vd3xQ2bkSaC8f5CrA8woTbodMcOFOOXNrVKdF0q/gFq5KgjpuhGmBu2Ze0XVlF
         oHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751399677; x=1752004477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+GkkYPn+ZUYEt1fAz26HqfyvmT7OOarY819nfs3ecw=;
        b=CujhGvpMXtU6z0mIKSuv/vPpIIeENBBwcnl5nrurjZl19w1ECFgtvfrpN8BbD7vHZg
         dpq6mV0Zs5go4JS+n+kY9fkMEdqqzz/Ari+IPQIAaZoEHZmVKXu5YNdOReW9yWnfUzwk
         Ok1umrn9dDTxE0+Czc+tfEuoDJ8QC7OFTjBNBjMrifVvJgwwk1uVHzVyLD944YQGKdY5
         zceoOMoBLtuxFPhuF9ggT/zRQCADPFEWou92MlC26qanNN5BwZj+LW15J2oLm1jgDsRX
         dS2ptCZY9WGfSV9/0Z0p+sr1c+a/9sTWfIxuL7opSMj0fjq/GHs3jv/Rd2bTnwu7iKaq
         NacQ==
X-Gm-Message-State: AOJu0YxQHXoD+xllOr+NA96usS/Lw6m61u6dDOqPnt7sM7ts0fCpTmVg
	ZO0TFWXsoq78dLTwiE8gNOwVN3G2udO4bI4/rLmc/MNhGIspBq2d7gRdZ/gYAQ==
X-Gm-Gg: ASbGncv+/TSqLM73uGvrCcrWq5YyurM7gFoO00a2I12EsCCayPwjWpwmioIWIC5HfL3
	7T81OH7+qSbPRBR5L3XWt60h1+6mK3Cj0RVmLkQsc0vQ7lM95KepRHVHlQcX/39swIrzEiY8whE
	HCoEFk741kPpuYEBu+9I/DZ4yGdKLkRZ20TYqCnB/kSBbIrZd4Nhm5TT/ydpkvzzvYo+55QnP0E
	IFTMD6Ru2PJwgYap2Yg3CZX/e8eCe/0wiFr0+ODSuU07gaOQYu0cmgHPCqVMvSIH192tARIobMP
	tc2gAmKEuWi1UdlVENHByut4uu3M5M4rkvN1K4bQGBycO47jz08zJsoVfQ7S/GmbmdDjVMVuZWY
	59bY+PbZFqMy6NECDoLHONH8gyQSoQ/TT8l6D4ZI3FyFvJrZ7bnVaXSgkg8ifOw==
X-Google-Smtp-Source: AGHT+IFNv1YIkjYRSRxjujIlRLgD5qQAlK9HYYAL/tvbQ0IA8BOYIbwb7YJ+TgQR+zSZltJXrRFmVw==
X-Received: by 2002:a05:6000:288f:b0:3a4:f7ea:a638 with SMTP id ffacd0b85a97d-3af485b1f1dmr1303587f8f.3.1751399676877;
        Tue, 01 Jul 2025 12:54:36 -0700 (PDT)
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
Subject: [PATCH v7 0/7] x86: Make MAX_ALTP2M configurable
Date: Tue,  1 Jul 2025 19:54:22 +0000
Message-Id: <cover.1751397919.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

(This is continuation of the v6 series posted a year ago - apologies for the
delay.)

This series introduces the ability to configure the maximum number of altp2m
tables during domain creation. Previously, the limits were hardcoded to a
maximum of 10. This change allows for greater flexibility in environments that
require more or fewer altp2m views.

This enhancement is particularly relevant for users leveraging Xen's features
for virtual machine introspection.

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
 tools/libs/light/libxl_create.c      | 19 +++++--
 tools/libs/light/libxl_internal.h    |  1 +
 tools/libs/light/libxl_types.idl     |  1 +
 tools/ocaml/libs/xc/xenctrl.ml       |  1 +
 tools/ocaml/libs/xc/xenctrl.mli      |  1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c  | 21 ++++++--
 tools/xl/xl_parse.c                  |  9 ++++
 xen/arch/arm/domain.c                |  2 +-
 xen/arch/x86/domain.c                | 45 +++++++++++++----
 xen/arch/x86/hvm/hvm.c               | 10 +++-
 xen/arch/x86/hvm/vmx/vmx.c           |  2 +-
 xen/arch/x86/include/asm/altp2m.h    | 28 +++++++++--
 xen/arch/x86/include/asm/domain.h    |  9 ++--
 xen/arch/x86/include/asm/p2m.h       |  4 +-
 xen/arch/x86/mm/altp2m.c             | 74 +++++++++++++++-------------
 xen/arch/x86/mm/hap/hap.c            |  6 +--
 xen/arch/x86/mm/mem_access.c         | 20 +++-----
 xen/arch/x86/mm/mem_sharing.c        |  2 +-
 xen/arch/x86/mm/p2m-ept.c            |  7 +--
 xen/arch/x86/mm/p2m.c                |  8 +--
 xen/common/domain.c                  |  1 +
 xen/include/public/domctl.h          |  7 ++-
 xen/include/xen/sched.h              |  2 +
 27 files changed, 216 insertions(+), 88 deletions(-)

-- 
2.34.1



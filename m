Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6D1B07EA8
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:16:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045624.1415773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8Xk-00040A-VQ; Wed, 16 Jul 2025 20:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045624.1415773; Wed, 16 Jul 2025 20:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8Xk-0003wY-QZ; Wed, 16 Jul 2025 20:15:56 +0000
Received: by outflank-mailman (input) for mailman id 1045624;
 Wed, 16 Jul 2025 20:15:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2WS3=Z5=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uc8Xj-0003uY-4j
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:15:55 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abe95993-6281-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 22:15:52 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a577ab8c34so27678f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 13:15:52 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2e8csm30504145e9.5.2025.07.16.13.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 13:15:50 -0700 (PDT)
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
X-Inumbo-ID: abe95993-6281-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752696951; x=1753301751; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h/pIIzcVAAUozwFivB0xHQqp5nxrjWfhTPJ5YwO+UjI=;
        b=iXHrXB+aUbo5HTOeDAtTjMtuRYT4idb/dyhyTmzroFmK6rOJO6Tuj8DVX4MGgXplze
         R65k+jbsLQYKgOSCRHPwQ/B9FxBiZ8q+voK2e4AbyA6ixtOuQXGIDzX7FJ/Zzc1LQSuY
         Y6avo3I1lwGCuFLJuEC0l9qht1ANAVv0R7vbzVLfsXaeWptsHD12KloW0dTwNsVF7S+P
         LCoAvAXVaHxSY+1HIdnLQ2EC+Kyeu/5DSSWnaCUStvhVipmLjMgIY6kSRtgouCMUeCGu
         Lcet/e3M6+ra0yYRsaTs8I8oq5BHz1E97yJICqy9fu0B5wXvL83L0QIogPKYqEm32J2X
         1vGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752696951; x=1753301751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/pIIzcVAAUozwFivB0xHQqp5nxrjWfhTPJ5YwO+UjI=;
        b=bH7gyGfbi3WWodgpNvHpfGuB9uoLd2uZ32pMztrMMi9z29sYY3HfHZfSHqtHeYl5lZ
         xmq57cvj+DjpjiKPMrrpfHW4omw3/xo511k2n08NgNr3pu1SgiCbN273MCrkGJlsKal6
         vMEs3/m+faVdk7FZiRuZEcnXW5QtAnZUeKL+//AB2I6Bj/btCrM7FLDGH0xgNjjx2Ow8
         ymLQ7obgO57FnYTy9/N5nrMMae14ru1DsNDk2JM18BPWRrO6Q/F2cfKhjWZSIHQoz7P/
         NG/WwmWkF5nKcHEo8kAn1L28ETPcXECngAHq6OhsfiucUKgLxv7zYkVA3TyrKCS1NR2u
         xH8A==
X-Gm-Message-State: AOJu0YzgM8svce4AIjjPX6V4we/3RF2Dl8NF90RGJAHxxza4a4KGiK4A
	haKknGOP5q6j8ZYmyDca7IbLkg0PILVk15cispxfqh/nIJJkitrY8VSTxu/fkw==
X-Gm-Gg: ASbGnctGsLoJeAaZBQ0OOosJCACWeqaqc0WZN1qNda/aTyk2910H/6e5Q4hFlTce1sy
	0hn6XUoSENSFSvO1Xi9xnDuw9t90Fu5aEZD/MwEqES8X1F3h2KkvfTt22LE8mKFpLs5GjupQsE+
	uWbRWqlkvj6dCP0xlgqGYXgUcbkF7KQy983ZFppTfvKao7Rw+PR0QS+ejFK7SOIItil/NyXywgu
	fzTssZrZZLMF7VCu34O9Z37REW9BJuI9R+XjI8hPT0NRYWYFaZNTaWKunEaAbEOxqaxQNt9y4le
	dFJF3HoGwimp29zu0uwDgeWiK0PjdaWewYaKEEV/wrGyH0lNGDe0/xj6E2M/gYFHDzpJ70H7hMs
	Qla3B7uBggv47JXgY/XWxsLknD6NBCefLgOBmB4M5mNXqMhi3m2IQ0t0/8Ky6FuoTlSvqq1v1u5
	yBX6tAfCXGfGKS7/4W25M7Xg==
X-Google-Smtp-Source: AGHT+IG4k3f3+vm6ehD5JJImvgYLUpH/0HTL30lbWbcrJ8FnvTVVlYscYf13LYlY1Quw/WUnAkWpYQ==
X-Received: by 2002:a05:600c:548b:b0:456:285b:db25 with SMTP id 5b1f17b1804b1-4562e04710amr19204305e9.6.1752696951143;
        Wed, 16 Jul 2025 13:15:51 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v10 0/9] x86: Make MAX_ALTP2M configurable
Date: Wed, 16 Jul 2025 20:15:30 +0000
Message-Id: <cover.1752691429.git.w1benny@gmail.com>
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

Petr Beneš (9):
  tools/xl: Add altp2m_count parameter
  docs/man: Add altp2m_count parameter to the xl.cfg manual
  x86/p2m: Short-circuit p2m_is_altp2m() when CONFIG_ALTP2M=n
  x86/altp2m: Remove p2m_altp2m_check stubs from unsupported
    architectures
  x86/altp2m: Wrap altp2m-specific code in #ifdef CONFIG_ALTP2M
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
 tools/ocaml/libs/xc/xenctrl_stubs.c  | 19 ++++++--
 tools/xl/xl_parse.c                  |  9 ++++
 xen/arch/arm/domain.c                |  2 +-
 xen/arch/arm/include/asm/p2m.h       |  6 ---
 xen/arch/ppc/include/asm/p2m.h       |  5 --
 xen/arch/riscv/include/asm/p2m.h     |  5 --
 xen/arch/x86/domain.c                | 41 +++++++++++++---
 xen/arch/x86/hvm/emulate.c           | 10 +++-
 xen/arch/x86/hvm/hvm.c               | 18 ++++++-
 xen/arch/x86/hvm/monitor.c           |  2 +
 xen/arch/x86/hvm/vmx/vmx.c           | 10 +++-
 xen/arch/x86/include/asm/altp2m.h    | 28 +++++++++--
 xen/arch/x86/include/asm/domain.h    | 11 +++--
 xen/arch/x86/include/asm/hvm/hvm.h   |  8 ++++
 xen/arch/x86/include/asm/hvm/vcpu.h  |  4 ++
 xen/arch/x86/include/asm/p2m.h       | 30 ++++++++----
 xen/arch/x86/mm/altp2m.c             | 72 +++++++++++++++-------------
 xen/arch/x86/mm/hap/hap.c            | 12 +++--
 xen/arch/x86/mm/mem_access.c         | 30 +++++++-----
 xen/arch/x86/mm/mem_sharing.c        |  4 +-
 xen/arch/x86/mm/p2m-ept.c            | 11 +++--
 xen/arch/x86/mm/p2m-pt.c             |  2 +
 xen/arch/x86/mm/p2m.c                | 17 +++++--
 xen/common/domain.c                  |  6 +++
 xen/common/vm_event.c                |  2 +
 xen/include/public/domctl.h          |  5 +-
 xen/include/xen/sched.h              |  4 ++
 36 files changed, 307 insertions(+), 108 deletions(-)

-- 
2.34.1



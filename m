Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAteNm8d2WnVmQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 582623D9E08
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279413.1563835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECO-0006of-IM; Fri, 10 Apr 2026 15:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279413.1563835; Fri, 10 Apr 2026 15:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECO-0006mC-FN; Fri, 10 Apr 2026 15:55:12 +0000
Received: by outflank-mailman (input) for mailman id 1279413;
 Fri, 10 Apr 2026 15:55:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wBECN-0006m5-5K
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:55:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBECM-00Cgo0-Cw
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:55:10 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d56-e002-0a2a0a5209dd-0a2a4507d84e-24
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:10 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d5e-ba2d-0a2a45070019-d1558030cd6f-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:10 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso23595275e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:55:10 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b3c597sm78285605e9.12.2026.04.10.08.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 08:55:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775836510; x=1776441310; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MaIju3ZsnFkp3Rq7IEFk2DGoNytbf6zEuSir2q0ipWY=;
        b=eT6vCf3tZbMJsEtQzjsOxAQJUcXmSbFhRQYe25XqJdsEQ6Zz3UfFiW+sWwvLnvpVSd
         qK9+hdsFVyO5z3AsjUmXlWhyuXwg5iDXsM1olkVzIjwJaOorySBtDVz3Qp859BQvqSLL
         ySt6c8nscwXfXXOuZIV99xqHLpJGutqQ55tAsnF8Ubwk3qD7F5C7INSwMNIX08joDxBg
         emsJbKlLW5O+5cAGHQlOMbC0+WXkiHEb47OJP6v36uu0/OzLBM3trh2dAZouEj4KJjm+
         y/1lqs+D/acd2+oc8GlXplLSu/aVYGhf8ygYhvSHtEygSSsMvqWMZcfxyDdSitlbwLhr
         lXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836510; x=1776441310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaIju3ZsnFkp3Rq7IEFk2DGoNytbf6zEuSir2q0ipWY=;
        b=V5oDIrPYcTHjdnwwlbp5fNJMOmNdlyIxKJ9xtFOdSioUx66kuK039FUmZNY3YKFtIg
         o7oCsxgbIvcM92oggrxldG2LT60sU5E+tWpebCImX0JQz6jR3Bf7Pip9tJENwoADRpyS
         RoP2e2vmNRbhMY3Ca+GB368f6i106MpU6WjBNkgXLyhu/ryBhLAUPiFuCBtSMcPwz+O7
         EzQ8EJNtglCeqBaPY0bSluOhRvFskd3ReMTcLSBDxeLfQIcxZuF+FTCH0ptJEo1FKpuh
         4tHmZPHwX1jWdf5J4k/tQ9JwBbRJ3svKNl/K62RetmIVAAtLS9sRnAaBEGsjiEKbom0H
         VFYw==
X-Gm-Message-State: AOJu0YwIvqG477vGFlJJaiRZXWwXCjR1nPcF8sWvDmZzvuA0Yi4mIRAy
	ZP1QZ4dQ/zxjVVzEeeB62gEU+mpBcnATYz2xZIEToZ0WYcyLF6+eQ2lVwouWAg==
X-Gm-Gg: AeBDieu9Op4XwR05w4icD/ZLFodVxqR+rgIiavdJXXhrP33cQo5DyjKNL/Y1W+G1zK+
	EzlxR4YBo7PLTn2KYUiq7yB05tNEh/xHmTqq2QjkOEivA1EnNZ+m3SBmMKIgG3RuGvXHQciAAhd
	cPDcERBDxyuO6t5ncbsqwhZmsWBQsEdAsLJvlftg1AcHnbdT5tYQPfcP/mAh8VzY9qmxxIJycps
	s09kQP3zpKjRewWTUf80o1Ufb7Oe3xu4N7+gTf4Kw8MM1SDHjZi+fs8giVF1UhovYV1t6AbVjSr
	sW37ECpQ0ay4Vr++ArWs9a8SXXLlJ7DZTt1q8aFunQDmOelpOh0Z8r8raSptqXf5GUTqhwkKNgd
	shywIlaAmBl2J5Ycss/ULQj5reBxBaoQpIOyjkWSItAvaEprz5voJvfc1f6qdgAnqKb46+p4xX1
	atdp6Dnr/k0DVl1qUNzvNBHA/nGlCHyrN4bOR1nuVTqKG4VYpUa5Tui/a9EDwYlabQQw==
X-Received: by 2002:a05:600c:a413:b0:488:a639:b787 with SMTP id 5b1f17b1804b1-488d67f39admr37562325e9.11.1775836509469;
        Fri, 10 Apr 2026 08:55:09 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 00/12] RISCV: enable DOMAIN_BUILD_HELPERS
Date: Fri, 10 Apr 2026 17:54:46 +0200
Message-ID: <cover.1775836193.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1775836510-1039741E-9F89EDB6/10/73395122804
X-purgate-type: spam
X-purgate-size: 3110
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,arm.com,epam.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 582623D9E08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Introduce necessary things to enable DOMAIN_BUILD_HELPERS config for RISC-V.

Generally it is indepenent patch series from [1] but depends on which
patches will go first it could be some merge conflicts.

[1] https://lore.kernel.org/xen-devel/eba232ac5a338332ddedc2cb084e0c04ee8744c2.1775835741.git.oleksii.kurochko@gmail.com/T/#u

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2444698148

---
Changes in v3:
 - Address the comments from ML.
---
Changes in v2:
 - Address the comments from ML.
 - Introduce some new patches to make dom0less solution more architecture
   indepenent from terminology point of view.
 - Minor fixes.
---

Oleksii Kurochko (12):
  xen/riscv: implement get_page_from_gfn()
  xen: fix len type for guest copy functions
  xen/riscv: implement copy_to_guest_phys()
  xen/dom0less: rename kernel_zimage_probe() to kernel_image_probe()
  xen/riscv: add kernel loading support
  xen: move declaration of fw_unreserved_regions() to common header
  xen: introduce domain-layout.h with common domain_use_host_layout()
  xen/riscv: rework G-stage mode handling
  xen: rename p2m_ipa_bits to p2m_gpa_bits
  xen/riscv: introduce p2m_gpa_bits
  xen/riscv: add definition of guest RAM banks
  xen/riscv: enable DOMAIN_BUILD_HELPERS

 xen/arch/arm/domain_build.c               |   1 +
 xen/arch/arm/guestcopy.c                  |   6 +-
 xen/arch/arm/include/asm/domain.h         |  14 --
 xen/arch/arm/include/asm/guest_access.h   |   2 +-
 xen/arch/arm/include/asm/p2m.h            |   2 +
 xen/arch/arm/include/asm/setup.h          |   3 -
 xen/arch/arm/kernel.c                     |  48 ++---
 xen/arch/arm/vgic-v3.c                    |   1 +
 xen/arch/riscv/Kconfig                    |   1 +
 xen/arch/riscv/Makefile                   |   3 +
 xen/arch/riscv/dom0less-build.c           |  30 +++
 xen/arch/riscv/guestcopy.c                | 116 +++++++++++
 xen/arch/riscv/include/asm/config.h       |  13 ++
 xen/arch/riscv/include/asm/domain.h       |   1 +
 xen/arch/riscv/include/asm/guest-layout.h |  23 +++
 xen/arch/riscv/include/asm/guest_access.h |   7 +
 xen/arch/riscv/include/asm/p2m.h          |  29 +--
 xen/arch/riscv/kernel.c                   | 230 ++++++++++++++++++++++
 xen/arch/riscv/p2m.c                      | 141 +++++++++----
 xen/arch/riscv/vmid.c                     |   2 +-
 xen/common/device-tree/domain-build.c     |   3 +-
 xen/common/device-tree/kernel.c           |   2 +-
 xen/include/public/arch-riscv.h           |   5 +
 xen/include/xen/bootinfo.h                |   4 +
 xen/include/xen/domain-layout.h           |  28 +++
 xen/include/xen/fdt-domain-build.h        |   2 +-
 xen/include/xen/fdt-kernel.h              |  15 +-
 27 files changed, 631 insertions(+), 101 deletions(-)
 create mode 100644 xen/arch/riscv/dom0less-build.c
 create mode 100644 xen/arch/riscv/guestcopy.c
 create mode 100644 xen/arch/riscv/include/asm/guest-layout.h
 create mode 100644 xen/arch/riscv/kernel.c
 create mode 100644 xen/include/xen/domain-layout.h

-- 
2.53.0



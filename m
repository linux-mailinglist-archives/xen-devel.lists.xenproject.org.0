Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M2YPJgmfPmoUJQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96706CEA30
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NMif6dGy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346268.1604711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lS-0008UG-Ji; Fri, 26 Jun 2026 15:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346268.1604711; Fri, 26 Jun 2026 15:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lS-0008SU-H0; Fri, 26 Jun 2026 15:46:46 +0000
Received: by outflank-mailman (input) for mailman id 1346268;
 Fri, 26 Jun 2026 15:46:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lQ-0008SO-UL
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:46:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lQ-008hLT-44
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:46:44 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ebb-2eae-0a2a0a5409dd-0a2a450a98aa-34
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:44 +0200
Received: from [209.85.167.47] (helo=mail-lf1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ee3-e40e-0a2a450a0019-d155a72fc8a3-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:44 +0200
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5aea3417c6bso756933e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:46:43 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:46:42 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782488803; x=1783093603; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gYC0TLJPbODzgh4LCPmYHNGrM7+IoRopqU5fwkpYUjI=;
        b=NMif6dGyi4CcJWabliaTDoaQoAjc+Xl1EYHN4rXqXFjGATW1TUansvMG//65QZ2WkO
         3V6N4+NE5h4thGAYyzDRiZI3dq/Vr1KZIjj2SB5aYgg9ElpOS4FQX7lUp9b3ok67BSJM
         GvM64+B96Ml5bGrJzKCp9qXDDbfHqeCMbARs9Zu4VAgXGQtJV1D8bOxr+WPWC9Zm80LN
         iwcrkIwVfuzGbYfBGfJGZIGxX/VAJbHJPlRTf9vMZeHU/rDdvmigkGKgYcDlZsH0Oa3n
         RdYt9i1L8SEBO5gkVzkxzaz25yHa4z7B4bTtKiYK/58XTY/BtTMn/dmX9xoNNI5HPKCm
         vXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488803; x=1783093603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYC0TLJPbODzgh4LCPmYHNGrM7+IoRopqU5fwkpYUjI=;
        b=Uu+weiRg3RDJss8grvKI54h1fq1cyaSiEhMUn4lKZCoSAHj62HsLswAi0ACNVUs3D/
         3XVfdAZi0N9uzXEPBYGwRMUYOc2C5G0j55ljqWuel9WIgewxZgHUaRQmTD/ozTe+lfZi
         JCEcNxunvt+p/GC01ifmYKKflJfKChfRdAQzi2cHrmEVJIQlbuVXr5DqL9ZM5p2rc7Vf
         X3G64YgGNjZHOKPuG6TnjUPAsB4XpEFRDFjFRZEiqzRrB7HIKlpjgkLxLoOlS1dWgxa9
         c3W9L5euwxn8CCCTP9mQ9fiD1MKRRigX/I6GW/jZK0lUA5STYSBHdUGRh1eLJ/Dvgscd
         IIJQ==
X-Gm-Message-State: AOJu0YyVdX4x/l+0oBLW4R1ahjJZ480SP0LRdDqJSuBGas3n2ezKGL91
	nZUYCgqHjVqkC5DrWDL17pm1bI6+ZaYLOLy81kOPFIyydXlmNfcYRP1eJ8+nfg==
X-Gm-Gg: AfdE7cl9qZCPkStJTewi8LMHahom0l4lAPiFsRS1ZYTHf+in5EQgU8w1EgTy6IUd62I
	KPzJLDe8QAIr2bDtb6IFJ4GqEqbq6ZfDl69l5jh4UmbBjyHsRFRudksM6NUFDp3kY9OasxPPLwZ
	eKKGSK9lJuRRtJvCy45UC26xKdXkkFmCwWMKkpYQyMSPkPwLTKM7T1wU9TNg9eW4KsfiaZcmDtz
	Q2JZtQZKBQ5H51vdG8WPns0ZMo2xv8pZPHTkAu0ojxlUAPf057GhQrP9SOkMksnUn0hde8cQevv
	rm1+BuPaXDeRZxtu8gz0N6Ga1aMR3QQ/BnxPuUI5oh6whR31wrdkibZxH0kV1KYyNBvxiESOWPf
	zyiHuFsCZXLfy4tJiurODmj1k2QJerFO5HREIGv10pBiUkMziytx7OcezG+sYULVvrNo+kSTv3s
	6wjA2pKiMtfUfDDfosNZkC6eu39L13yoKrk+Q3ckFBoDc2OZLfk9uTd9bv8w==
X-Received: by 2002:a05:6512:3a89:b0:5aa:6c27:c44e with SMTP id 2adb3069b0e04-5aea1f47f76mr2023221e87.22.1782488803050;
        Fri, 26 Jun 2026 08:46:43 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v4 00/25] Introduce enablemenant of dom0less
Date: Fri, 26 Jun 2026 17:46:09 +0200
Message-ID: <cover.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1782488804-D5F22DDE-BC28BCF0/10/73395122804
X-purgate-type: spam
X-purgate-size: 5436
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:teddy.astie@vates.tech,m:dpsmith@apertussolutions.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,suse.com,raptorengineering.com,wdc.com,apertussolutions.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D96706CEA30

This patch series reprensent a bunch of patches necessary to enable common part
of Dom0less.
The stuff necessary to start/launch domains will be introduced separately.

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2632323911

---
Changes in v4:
 - Address comments from ML.
---
Changes in v3:
 - Drop dependency from other patch series
   ([1] https://lore.kernel.org/xen-devel/cover.1778140240.git.oleksii.kurochko@gmail.com/T/#t)
   as it was merged.
 - Reorder patches:
   - move common patches to the start.
   - Move some patches to separate patch series (will be introduced later)
 - Address comments from ML.
---
Changes in v2:
 - Move patch "[PATCH v1 04/27] xen/riscv: rework G-stage mode handling" to
   patch series [1]
 - Address the comments from ML.
 - The following patches were folded into one:
   # xen/riscv: implement init_intc_phandle()
   # xen/riscv: call do_initcalls() in start_xen()
   # xen/riscv: setup system domains
 - The following patch were folded into one:
   # xen/riscv: add vaplic access check
   # xen/riscv: emulate guest writes to virtual APLIC MMIO
   # xen/riscv: emulate guest reads from virtual APLIC MMIO
 - Add new bug fix, not really necessary to this patch series:
   xen/riscv: manage IRQ_DISABLED flag in APLIC irq enable/disable callbacks
---

Oleksii Kurochko (25):
  xen/dom0less: turn max_init_domid into a common variable
  xen: arm: move declaration of map_device_irqs_to_domain() to common
    header
  xen: arm: update p2m_set_allocation() prototype
  xen/Kconfig: introduce HAS_STATIC_MEMORY
  xen/riscv: Implement ARCH_PAGING_MEMPOOL
  xen/riscv: Implement construct_domain()
  xen/riscv: implement prerequisites for domain_create()
  xen/riscv: introduce guest riscv,isa string
  xen/riscv: implement make_cpus_node()
  xen/riscv: implement make_timer_node()
  xen/riscv: implement make_arch_nodes()
  xen/riscv: introduce init interrupt controller operations
  xen/riscv: implement make_intc_domU_node()
  xen/riscv: introduce aia_init() and aia_usable()
  xen/riscv: introduce per-vCPU IMSIC state
  xen/riscv: introduce minimal virtual APLIC (vAPLIC) infrastructure
  xen/riscv: rename enum intc_version to intc_variant
  xen/riscv: introduce (de)initialization helpers for vINTC
  xen/riscv: generate IMSIC DT node for guest domains
  xen/riscv: create APLIC DT node for guest domains
  xen/riscv: implement IRQ routing for device passthrough
  xen/riscv: implement init_intc_phandle()
  xen/riscv: initialize RCU, scheduler, and system domains in
    start_xen()
  xen/riscv: provide init_vuart()
  xen/riscv: add initial dom0less infrastructure support

 xen/arch/arm/Kconfig                      |   1 +
 xen/arch/arm/device.c                     |   9 +-
 xen/arch/arm/include/asm/p2m.h            |   1 -
 xen/arch/arm/include/asm/setup.h          |   5 -
 xen/arch/arm/mmu/p2m.c                    |  24 +--
 xen/arch/arm/setup.c                      |   2 -
 xen/arch/ppc/include/asm/setup.h          |   2 -
 xen/arch/riscv/Kconfig                    |   3 +
 xen/arch/riscv/Makefile                   |   4 +
 xen/arch/riscv/aia.c                      |  23 +++
 xen/arch/riscv/aplic.c                    |  14 +-
 xen/arch/riscv/cpufeature.c               |  88 ++++++++-
 xen/arch/riscv/device.c                   |  95 +++++++++
 xen/arch/riscv/dom0less-build.c           |  40 ++++
 xen/arch/riscv/domain-build.c             | 192 ++++++++++++++++++
 xen/arch/riscv/domain.c                   |  46 ++++-
 xen/arch/riscv/imsic.c                    | 172 ++++++++++++++++
 xen/arch/riscv/include/asm/aia.h          |  10 +
 xen/arch/riscv/include/asm/aplic.h        |  11 ++
 xen/arch/riscv/include/asm/cpufeature.h   |   4 +
 xen/arch/riscv/include/asm/domain.h       |   8 +
 xen/arch/riscv/include/asm/guest-layout.h |  24 +++
 xen/arch/riscv/include/asm/imsic.h        |  25 +++
 xen/arch/riscv/include/asm/intc.h         |  48 ++++-
 xen/arch/riscv/include/asm/irq.h          |   5 +
 xen/arch/riscv/include/asm/paging.h       |   2 +-
 xen/arch/riscv/include/asm/setup.h        |   2 -
 xen/arch/riscv/include/asm/vaplic.h       |  34 ++++
 xen/arch/riscv/intc.c                     | 101 +++++++++-
 xen/arch/riscv/irq.c                      | 230 ++++++++++++++++++++++
 xen/arch/riscv/p2m.c                      |  33 +++-
 xen/arch/riscv/paging.c                   |   7 +-
 xen/arch/riscv/setup.c                    |  12 ++
 xen/arch/riscv/stubs.c                    |  17 --
 xen/arch/riscv/vaplic.c                   | 141 +++++++++++++
 xen/arch/x86/include/asm/setup.h          |   2 -
 xen/common/Kconfig                        |   4 +
 xen/common/device-tree/dom0less-build.c   |   2 +-
 xen/common/domid.c                        |   5 +
 xen/drivers/char/console.c                |   1 +
 xen/include/xen/dom0less-build.h          |   7 +
 xen/include/xen/fdt-domain-build.h        |  13 ++
 xen/include/xen/p2m-common.h              |   8 +
 43 files changed, 1384 insertions(+), 93 deletions(-)
 create mode 100644 xen/arch/riscv/aia.c
 create mode 100644 xen/arch/riscv/device.c
 create mode 100644 xen/arch/riscv/domain-build.c
 create mode 100644 xen/arch/riscv/include/asm/aia.h
 create mode 100644 xen/arch/riscv/include/asm/vaplic.h
 create mode 100644 xen/arch/riscv/vaplic.c

-- 
2.54.0



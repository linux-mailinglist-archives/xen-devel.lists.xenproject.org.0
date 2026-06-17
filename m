Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EG4iJn6CMmqv1AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31888698EFC
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="QI/zj1wG";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340081.1601079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHU-0000gp-5y; Wed, 17 Jun 2026 11:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340081.1601079; Wed, 17 Jun 2026 11:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHU-0000ek-1c; Wed, 17 Jun 2026 11:18:04 +0000
Received: by outflank-mailman (input) for mailman id 1340081;
 Wed, 17 Jun 2026 11:18:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHS-0000eX-N4
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHQ-00CoEK-69
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:00 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328262-2eae-0a2a0a5409dd-0a2a45099d36-26
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:00 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328267-2497-0a2a45090019-d1558034c145-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:00 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49222b6e871so40791865e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:00 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:17:59 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695079; x=1782299879; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dYmKbLObk4yzFyhQi1phJkn1OuRfEQW0ErJbqKZrzs=;
        b=QI/zj1wGJiI3ZyNvFOxN8ir3vKzClQLZSOaOVz1LTGYD5EQd58EhlIdaOQLyDK3D9P
         +f7Cv+yk8XgNkGjBnMj4DTigDvMYQoZWI0zJxJ/0yoYJAvZK6OLml5dNCMgSKJ3r4KmF
         Ddn6tGtEtpcR68JKrat1uiS/hxY1/ABpXmXsXw1lfCldoMNKNqHNyCOt/w/3eZjKjSFw
         crCdPQMNo+VDjNPc4PI5XBUrfzhGLAAOAGPGj091HeDK6oe1nUXUxonqpPi+xSlA8I0u
         vuAMPSARTDd3rRLJBvrXxJ8DGZheatbzCMPLC4H3JjqBjQH3akRCyuN7Um2D4Uj/UYei
         GJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695079; x=1782299879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dYmKbLObk4yzFyhQi1phJkn1OuRfEQW0ErJbqKZrzs=;
        b=DgCu8f82jdT2H1OtR9LfebPaRuDjpf3JCt+Yq3P2vDD7sNBgxB61gDtxj78tZ6r/Js
         ZMdvl7KIEG18XfHZMTTTA/rf1AefEpA1K+oCTe3QPstjHlKOboTVzPtKViFHBVFNXl9Z
         gyvM7EDdb1ul6H8fjefZrk9gQc7DrZT3sY9NpwurY4RMRjRq5IM8Ow1VGcOfEDG1hbmt
         SbF2Uh9Qo3ujE1/L9ds5PCU3vz/zyRQsRDBwcE3OVCHMX/lqF/lqUiZSfYkXMrDLYnxo
         QgPV+Qe9fQdoUnU5uLFywB8rMqzkqni/ivKqn1socpguku9WEcP+85qk+GFwJjPqnPm/
         TA2w==
X-Gm-Message-State: AOJu0YxZkPyKbpU7+PDpqi0LatAZ0jtGbhfbwU9RIQDWQmZxI/Jhbqr2
	lOiXvSXbakIB/iljWHCtNyW5ZjIxSqGb1j+w+UDctu2lsOzHtJvzGiBgU1903Q==
X-Gm-Gg: Acq92OHqwACGJrbvZB+WQz6P8Ox6PLWPBygI7/KA7hI3qJ6L1Zp8hD7489DdPioofig
	djwt04mHTjl2l9Au64K7OJleEbdF1OMVxfROHeBfTMrVc/qEOUrUbKOecnuygGVjln25RLHNU7p
	VXCKqV7TlwxgxE65fzEMl+bDN/Yf2+S47+oJs7bJee80IOAwznvqBRBPak5ZC7ZuCRaHUfwQQTo
	VBic4y7mdH8WdID8yDD+2X/OJrkbIRDvWFB14o+yY7xWB0vh3z4ppJEz1VqRPW3TRBsN8qId5D6
	tVb5HSPgrgc9dI8cGw4q+F4MxpkFhlRp2C7405AmUudTct1/hYG2LWE9zll2tviUhevIk0FVT/n
	M4CYw7lAJu1PjTXRWn8ONMUgvctfBBfRa24uwJkaUxldXu1TipfFV9EVerfqHPD9L2ZVL6Y5qCd
	hR4vLk4hiGfV8+bbCCt78e1krc//Z/reh0BohIapK3VndLoVMbqgWidu8P9Q==
X-Received: by 2002:a7b:c041:0:b0:490:ea8a:32da with SMTP id 5b1f17b1804b1-49234139c2dmr30159245e9.26.1781695079372;
        Wed, 17 Jun 2026 04:17:59 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
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
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 00/23] Introduce enablemenant of dom0less
Date: Wed, 17 Jun 2026 13:17:28 +0200
Message-ID: <cover.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1781695080-43374A53-B900DFDF/10/73395122804
X-purgate-type: spam
X-purgate-size: 5086
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com,wdc.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 31888698EFC

This patch series reprensent a bunch of patches necessary to enable common part
of Dom0less.
The stuff necessary to start/launch domains will be introduced separately.

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

Oleksii Kurochko (23):
  xen: arm: move declaration of map_device_irqs_to_domain() to common
    header
  xen: arm: update p2m_set_allocation() prototype
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
  xen/riscv: add very early virtual APLIC (vAPLIC) initialization
    support
  xen/riscv: introduce (de)initialization helpers for vINTC
  xen/riscv: generate IMSIC DT node for guest domains
  xen/riscv: create APLIC DT node for guest domains
  xen/riscv: implement IRQ routing for device passthrough
  xen/riscv: implement init_intc_phandle()
  xen/riscv: initialize RCU, scheduler, and system domains in
    start_xen()
  xen/riscv: provide init_vuart()
  xen/Kconfig: introduce HAS_STATIC_MEMORY
  xen/riscv: add initial dom0less infrastructure support

 ...asic-VGEIN-management-for-AIA-guests.patch | 273 ++++++++++++++++++
 xen/arch/arm/Kconfig                          |   1 +
 xen/arch/arm/include/asm/p2m.h                |   1 -
 xen/arch/arm/include/asm/setup.h              |   3 -
 xen/arch/arm/mmu/p2m.c                        |  22 +-
 xen/arch/riscv/Kconfig                        |   3 +
 xen/arch/riscv/Makefile                       |   4 +
 xen/arch/riscv/aia.c                          |  23 ++
 xen/arch/riscv/aplic.c                        |  14 +-
 xen/arch/riscv/cpufeature.c                   |  85 +++++-
 xen/arch/riscv/device.c                       | 102 +++++++
 xen/arch/riscv/dom0less-build.c               |  40 +++
 xen/arch/riscv/domain-build.c                 | 177 ++++++++++++
 xen/arch/riscv/domain.c                       |  46 ++-
 xen/arch/riscv/imsic.c                        | 167 +++++++++++
 xen/arch/riscv/include/asm/aia.h              |  10 +
 xen/arch/riscv/include/asm/aplic.h            |   9 +
 xen/arch/riscv/include/asm/cpufeature.h       |   4 +
 xen/arch/riscv/include/asm/domain.h           |   8 +
 xen/arch/riscv/include/asm/guest-layout.h     |   7 +
 xen/arch/riscv/include/asm/imsic.h            |  25 ++
 xen/arch/riscv/include/asm/intc.h             |  46 ++-
 xen/arch/riscv/include/asm/irq.h              |   5 +
 xen/arch/riscv/include/asm/paging.h           |   2 +-
 xen/arch/riscv/include/asm/setup.h            |   4 +-
 xen/arch/riscv/include/asm/vaplic.h           |  34 +++
 xen/arch/riscv/intc.c                         | 103 ++++++-
 xen/arch/riscv/irq.c                          | 203 +++++++++++++
 xen/arch/riscv/p2m.c                          |  31 +-
 xen/arch/riscv/paging.c                       |   7 +-
 xen/arch/riscv/setup.c                        |  14 +
 xen/arch/riscv/stubs.c                        |  17 --
 xen/arch/riscv/vaplic.c                       | 141 +++++++++
 xen/common/Kconfig                            |   5 +-
 xen/common/device-tree/dom0less-build.c       |   2 +-
 xen/include/xen/fdt-domain-build.h            |  13 +
 xen/include/xen/p2m-common.h                  |   2 +
 37 files changed, 1587 insertions(+), 66 deletions(-)
 create mode 100644 0001-xen-riscv-add-basic-VGEIN-management-for-AIA-guests.patch
 create mode 100644 xen/arch/riscv/aia.c
 create mode 100644 xen/arch/riscv/device.c
 create mode 100644 xen/arch/riscv/domain-build.c
 create mode 100644 xen/arch/riscv/include/asm/aia.h
 create mode 100644 xen/arch/riscv/include/asm/vaplic.h
 create mode 100644 xen/arch/riscv/vaplic.c

-- 
2.54.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3rezNqbQS2oYawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E530712E93
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="rxhLi/9Q";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355480.1610268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgli9-0006QJ-6r; Mon, 06 Jul 2026 15:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355480.1610268; Mon, 06 Jul 2026 15:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgli9-0006Mo-3P; Mon, 06 Jul 2026 15:58:21 +0000
Received: by outflank-mailman (input) for mailman id 1355480;
 Mon, 06 Jul 2026 15:58:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgli7-0006K8-I8
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgli6-00AcTL-VD
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:18 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd070-5cb7-0a2a0a5109dd-0a2a4508e958-38
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:18 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd09a-edec-0a2a45080019-d1558036a431-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:18 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-493bab44440so17346925e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:18 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353498; x=1783958298; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6/PDQZ3VxDQuT8ca8krMapwVAoPTeiAchpcu67sNlkA=;
        b=rxhLi/9Qx94ifGMJKlu4SYkl0TkeEM2F631W8y0P/Rco/pOVEqMNqx35f0c30wB6zV
         Sa/mAuWtGXA1YmQjYcwm6fKIPbngwQuYONWViB6iWFbdL9wk1mub7DPVdgtFDxbyk89l
         taNmUaVhU+6K9lA/Mw5wKkDiYEIEiADoTVxuwAQeaNFMV7GNWg6/R8rU+H6xyAOviuMI
         MMCOp600XhJA3chaMLF22MZWfWLGkNHn35v/AGaFlxCr4Kc0I87P6+t/rDh0ZLHTo5p4
         JoXH3ovk59jIZMN4UjTvOGFPA9cIQznzMEcbKZKftiLff3tn+SDGj7wYvH0xbdkKQBZw
         PVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353498; x=1783958298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/PDQZ3VxDQuT8ca8krMapwVAoPTeiAchpcu67sNlkA=;
        b=jOFQ84VuwcOeN+NZJsp7TvuCTwSrFEacsJPdO3TBFvjM5ChbJyavXcI7+jsKXpeWbw
         WecedUq+hhricUiEo086mf1x/TkD80pnxnytX1UyzU36dSEIzMRAFBVQ2XJGlMKepaKb
         263HIVViHiHQR7NS/ey+3IGk9JACyaZ3D8RmOIGRs+rVfBsr9m3y8H1w1lUwEXS06e7E
         v6rmw78/doWdbIljGpXeYs5mdE3edt4sHokTYj9DD4SQeezFjxX5qr1JVvfV+ZHAcndE
         LKhFF998qwsvFvH48DrN1OKgm/vRer+5xa5Gn9UcRL+6t3iOTg/0do/8lgeNE+wa7dLJ
         ySsw==
X-Gm-Message-State: AOJu0YwndaqSWhG562nQM9JwE+0jNLZPjPjaalUdE7u5LYjEOYItwu+/
	zatjeWHuOqS549WCwjxAsoK/dzRJglBYrlH0IaWtT52cAXJLbOYKZFPDTdJMkQ==
X-Gm-Gg: AfdE7cmFso5aejaKLI3rO3MJP2HWSVEyaDbORCn1Q5613YwRClNzS33IfkEr7tsEcdo
	ALBdICM7HxUz38CbMeFkee15OeNEaYA602jbR8KBkDDjK/X3MShrsC++4KZuqAyX+jvNRL3v7h/
	GtWxWWsCwfkA+fE/87sqokB4tAx5/QBGQQ7A7RZO5pkDlokelNiAEzSZ2KYz9t2QsADEeEx2q5O
	d5XsmeyJkbQkIhEEeWF9NEvguuso5+oiHt1TZH/jlDSTskYIab7QkCvKill1i6cstGFXhq+rXUf
	CShAyGVVvZJaUdEbedn17nltw65gk4LflR0ptVm+ML+prVfBb4hMMe+pBqKDJydPAvrFaf4tlql
	Lx7bs2PoTfc5j7MqAd5kq2Fl51Nly2ehp/reCC9aXChqOdvFwDUKg9IukDI6I1tRgoDRmsnNhlk
	wQ4qV8cVLr/pSvGZszfnKQq30nIR39WR/4u52zFDOt0Z3DBTnMG6d3IEpRaA==
X-Received: by 2002:a05:600c:4e56:b0:492:7025:13fd with SMTP id 5b1f17b1804b1-493deb5de6amr16144795e9.0.1783353498198;
        Mon, 06 Jul 2026 08:58:18 -0700 (PDT)
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
Subject: [PATCH v5 00/26] Introduce enablemenant of dom0less
Date: Mon,  6 Jul 2026 17:57:41 +0200
Message-ID: <cover.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1783353498-48E6E3FC-31129E3E/10/73395122804
X-purgate-type: spam
X-purgate-size: 5803
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:teddy.astie@vates.tech,m:dpsmith@apertussolutions.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,suse.com,raptorengineering.com,wdc.com,apertussolutions.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 2E530712E93

This patch series reprensent a bunch of patches necessary to enable common part
of Dom0less.
The stuff necessary to start/launch domains will be introduced separately.

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2654761158

---
Changes in v5:
 - Add new patch (xen/riscv: do a 4th linking pass if necessary) which fixes
   randconfig job issue.
 - Address comments from ML.
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

Oleksii Kurochko (26):
  xen/dom0less: turn max_init_domid into a common variable
  xen: arm: move declaration of map_device_irqs_to_domain() to common
    header
  xen: arm: update p2m_set_allocation() prototype
  xen/Kconfig: introduce HAS_STATIC_MEMORY
  xen/riscv: rename enum intc_version to intc_variant
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
  xen/riscv: introduce (de)initialization helpers for vINTC
  xen/riscv: generate IMSIC DT node for guest domains
  xen/riscv: create APLIC DT node for guest domains
  xen/riscv: implement IRQ routing for device passthrough
  xen/riscv: implement init_intc_phandle()
  xen/riscv: initialize RCU, scheduler, and system domains in
    start_xen()
  xen/riscv: provide init_vuart()
  xen/riscv: add initial dom0less infrastructure support
  xen/riscv: do a 4th linking pass if necessary

 build/tools/fixdep                        | Bin 0 -> 13632 bytes
 xen/arch/arm/Kconfig                      |   1 +
 xen/arch/arm/device.c                     |   9 +-
 xen/arch/arm/include/asm/p2m.h            |   1 -
 xen/arch/arm/include/asm/setup.h          |   5 -
 xen/arch/arm/mmu/p2m.c                    |  24 +--
 xen/arch/arm/setup.c                      |   2 -
 xen/arch/ppc/include/asm/setup.h          |   2 -
 xen/arch/riscv/Kconfig                    |   3 +
 xen/arch/riscv/Makefile                   |  20 +-
 xen/arch/riscv/aia.c                      |  23 +++
 xen/arch/riscv/aplic-priv.h               |  14 ++
 xen/arch/riscv/aplic.c                    |  16 +-
 xen/arch/riscv/cpufeature.c               | 132 +++++++++---
 xen/arch/riscv/device.c                   |  94 +++++++++
 xen/arch/riscv/dom0less-build.c           |  40 ++++
 xen/arch/riscv/domain-build.c             | 211 +++++++++++++++++++
 xen/arch/riscv/domain.c                   |  45 +++-
 xen/arch/riscv/imsic.c                    | 179 +++++++++++++++-
 xen/arch/riscv/include/asm/aia.h          |  10 +
 xen/arch/riscv/include/asm/aplic.h        |  10 +
 xen/arch/riscv/include/asm/cpufeature.h   |   6 +
 xen/arch/riscv/include/asm/domain.h       |   7 +
 xen/arch/riscv/include/asm/guest-layout.h |  24 +++
 xen/arch/riscv/include/asm/imsic.h        |  25 +++
 xen/arch/riscv/include/asm/intc.h         |  48 ++++-
 xen/arch/riscv/include/asm/irq.h          |   5 +
 xen/arch/riscv/include/asm/paging.h       |   2 +-
 xen/arch/riscv/include/asm/setup.h        |   2 -
 xen/arch/riscv/include/asm/vaplic.h       |  34 ++++
 xen/arch/riscv/intc.c                     | 102 +++++++++-
 xen/arch/riscv/irq.c                      | 238 ++++++++++++++++++++++
 xen/arch/riscv/p2m.c                      |  33 ++-
 xen/arch/riscv/paging.c                   |   7 +-
 xen/arch/riscv/setup.c                    |  12 ++
 xen/arch/riscv/stubs.c                    |  17 --
 xen/arch/riscv/vaplic.c                   | 142 +++++++++++++
 xen/arch/x86/include/asm/setup.h          |   2 -
 xen/common/Kconfig                        |   4 +
 xen/common/device-tree/dom0less-build.c   |   2 +-
 xen/common/domid.c                        |   5 +
 xen/drivers/char/console.c                |   1 +
 xen/include/xen/dom0less-build.h          |   7 +
 xen/include/xen/fdt-domain-build.h        |  13 ++
 xen/include/xen/p2m-common.h              |   8 +
 45 files changed, 1470 insertions(+), 117 deletions(-)
 create mode 100755 build/tools/fixdep
 create mode 100644 xen/arch/riscv/aia.c
 create mode 100644 xen/arch/riscv/device.c
 create mode 100644 xen/arch/riscv/domain-build.c
 create mode 100644 xen/arch/riscv/include/asm/aia.h
 create mode 100644 xen/arch/riscv/include/asm/vaplic.h
 create mode 100644 xen/arch/riscv/vaplic.c

-- 
2.54.0



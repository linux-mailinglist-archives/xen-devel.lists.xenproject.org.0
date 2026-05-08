Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFB1O6n2/Wn5lAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:43:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1D94F7F47
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303733.1576987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQX-0004gr-Ur; Fri, 08 May 2026 14:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303733.1576987; Fri, 08 May 2026 14:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQX-0004es-S9; Fri, 08 May 2026 14:43:41 +0000
Received: by outflank-mailman (input) for mailman id 1303733;
 Fri, 08 May 2026 14:43:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQV-0004ea-OY
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:43:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQV-007XVC-5E
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:43:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf689-2eae-0a2a0a5409dd-0a2a45028638-32
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:39 +0200
Received: from [209.85.208.46] (helo=mail-ed1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf69b-af86-0a2a45020019-d155d02ea9a7-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:39 +0200
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-67b32c695efso5000726a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:43:39 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:43:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251418; x=1778856218; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oGLhFz1jSlTPVwto8PclGCFgYTA2rPlMCLEFtYZO5z8=;
        b=byPzCORoI5X1w7BoHYbvIvT+P/vyKGEgzZbo+Vq2Lu65d6+a46LXnwLOFCaYwtr4o+
         wT2WcNYb+ICcXstujjmPGwhou8WqDdRM/D5tlvTa5LmSqyJxQxfvECEYHDZfON8XT5e/
         HgvozMWNZEIdnGNbkqdg2iue38MHp9K3DsXDVSa4u+C7xWpwhIeO3KyZMS9RdxWnQYvC
         PASnJPqWAVSgoL44cmVQFHW5S0N/ysCPDoD2kNgmg3u6ceDxMYCrYSV0zqD359u3BuSS
         qwDmiIvQRFYa2i7BlBs94Wgd+aKbU2Jb98PW4LJ6v4GDkZzeioKFI4qake1F+lEuu64n
         QHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251418; x=1778856218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGLhFz1jSlTPVwto8PclGCFgYTA2rPlMCLEFtYZO5z8=;
        b=LrWJuchkHmJnn2CzX6VsJOPB/SqRNMw+aGTFqYt/9pOEMp81hN+6hv4bUc46BQgCXC
         NJ2dijDw5b4HxqLSV2RtaycqokiGwVIl5Lprjjsmv1PsN0oor0Ybo2eLQ6teSZ5khult
         xP+r6j5E6xH8Oxjn4d4+7UzVNEEzCZrxrx5yB5Y/Tvo32H1ezgVuINV/AAe0WHgj2tBN
         IS/vnw+D6i4U4KMVQ6UZldKDPKM969uEf2ZnNchsUzwXeKB2hd/YsfPYLAXUvqtK+Z6y
         gwMopwwZTrhNsHcCLXFOlFZI/402J9g7FlvVGEsZTCAWNzokzkwi6lNqJH+J9z7zvoIf
         pqjQ==
X-Gm-Message-State: AOJu0YzkR0YRDmQmhLoUtA7JsAhH79UAyKrhEFgUMHyZBDHivBJN9Mfe
	QKoc6CPV5izii1LvmBz3EXpHB9kjqg2zc93/nhVQs8r6jih66jjhUEAp6tTMlg==
X-Gm-Gg: AeBDieuj14S7FgAGp10XH0dtDdpvrq1eLlLRr+o38H3H/uVrqOOTvYF08xr2Il0bmpd
	bddTuAUzJqU34OUjVnHAQb7P19a9sDaw2X/5/kVlNfs/QkEtaDulKkwXA1DcyG71d/MCI3IjSVA
	GsTSoLtDS3ZmS/5cu5RcmySYyvNOCFaYcp2CdCuTbDFXhLQwLuwl5VQOVfss9mUxgKHX/HTLjAy
	vviwGu5pFJM2rygtOUoN/nEquMtB+40qvv1N+Kg0KtvaNbyHwMrdde/774VMNdQl6yc8HD5peWQ
	RddKsk/QcDYJffC5D/R1zjRGS7h32lR3+1/oT1ScYFpfUJNhjUz0aDBZmzFyzmMt0LMpKd93Qeg
	awpDRUTbzx/WnkSZ8jLou4huGAEiJg6NAGx7JTaWNsO6KYCVpYkQ1dUdYsoZXiVMlobRbFI/FPw
	vsTtPM7l1YrS4VwT9lZyaKU5TPCIiIUsxg+Cp0t31KpCRCVzHoDnlrTM9z1B69Lu978A==
X-Received: by 2002:a17:906:5185:10b0:bab:f568:38ea with SMTP id a640c23a62f3a-bc84ce740c1mr332498666b.7.1778251417953;
        Fri, 08 May 2026 07:43:37 -0700 (PDT)
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
	Connor Davis <connojdavis@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 00/26] Introduce enablemenant of dom0less
Date: Fri,  8 May 2026 16:43:02 +0200
Message-ID: <cover.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778251419-A9573161-E5974251/10/73395122804
X-purgate-type: spam
X-purgate-size: 4857
X-Rspamd-Queue-Id: 5F1D94F7F47
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:cardoe@cardoe.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com,wdc.com,cardoe.com];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This patch series reprensent a bunch of patches necessary to enable common part
of Dom0less.
The stuff necessary to start/launch domains will be introduced separately.

This patch series is based on [1], but a lot of patch could go even without
it.

[1] https://lore.kernel.org/xen-devel/cover.1778140240.git.oleksii.kurochko@gmail.com/T/#t

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2510638764

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
  xen/riscv: add basic VGEIN management for AIA guests
  xen/riscv: introduce per-vCPU IMSIC state
  xen/riscv: add very early virtual APLIC (vAPLIC) initialization
    support
  xen/riscv: introduce (de)initialization helpers for vINTC
  xen/riscv: create APLIC DT node for guest domains
  xen/riscv: generate IMSIC DT node for guest domains
  xen: move declaration of map_device_irqs_to_domain() to common header
  xen/riscv: implement IRQ routing for device passthrough
  xen/riscv: add missing APLIC register offsets, masks to asm/aplic.h.
  xen/riscv: implement virtual APLIC MMIO emulation
  xen/riscv: implement init_intc_phandle()
  xen/riscv: initialize RCU, scheduler, and system domains in
    start_xen()
  xen/riscv: provide init_vuart()
  xen/riscv: add initial dom0less infrastructure support
  xen/riscv: manage IRQ_DISABLED flag in APLIC irq enable/disable
    callbacks

 automation/gitlab-ci/build.yaml           |   1 +
 xen/arch/arm/include/asm/p2m.h            |   1 -
 xen/arch/arm/include/asm/setup.h          |   3 -
 xen/arch/arm/mmu/p2m.c                    |  22 +-
 xen/arch/riscv/Kconfig                    |   3 +
 xen/arch/riscv/Makefile                   |   4 +
 xen/arch/riscv/aia.c                      | 167 +++++++++
 xen/arch/riscv/aplic.c                    |  49 ++-
 xen/arch/riscv/cpufeature.c               |  59 ++-
 xen/arch/riscv/device.c                   | 108 ++++++
 xen/arch/riscv/dom0less-build.c           |  39 ++
 xen/arch/riscv/domain-build.c             | 179 +++++++++
 xen/arch/riscv/domain.c                   |  44 ++-
 xen/arch/riscv/imsic.c                    | 167 +++++++++
 xen/arch/riscv/include/asm/aia.h          |  18 +
 xen/arch/riscv/include/asm/aplic.h        |  53 +++
 xen/arch/riscv/include/asm/cpufeature.h   |   5 +
 xen/arch/riscv/include/asm/domain.h       |   8 +
 xen/arch/riscv/include/asm/guest-layout.h |   7 +
 xen/arch/riscv/include/asm/imsic.h        |  26 ++
 xen/arch/riscv/include/asm/intc.h         |  58 ++-
 xen/arch/riscv/include/asm/irq.h          |   3 +
 xen/arch/riscv/include/asm/paging.h       |   2 +-
 xen/arch/riscv/include/asm/setup.h        |   8 +-
 xen/arch/riscv/include/asm/vaplic.h       |  37 ++
 xen/arch/riscv/intc.c                     | 103 ++++-
 xen/arch/riscv/irq.c                      | 178 ++++++++-
 xen/arch/riscv/p2m.c                      |  31 +-
 xen/arch/riscv/paging.c                   |   7 +-
 xen/arch/riscv/setup.c                    |  14 +
 xen/arch/riscv/stubs.c                    |  12 -
 xen/arch/riscv/vaplic.c                   | 436 ++++++++++++++++++++++
 xen/common/device-tree/dom0less-build.c   |   2 +-
 xen/include/xen/fdt-domain-build.h        |  13 +
 xen/include/xen/p2m-common.h              |   2 +
 35 files changed, 1807 insertions(+), 62 deletions(-)
 create mode 100644 xen/arch/riscv/aia.c
 create mode 100644 xen/arch/riscv/device.c
 create mode 100644 xen/arch/riscv/domain-build.c
 create mode 100644 xen/arch/riscv/include/asm/aia.h
 create mode 100644 xen/arch/riscv/include/asm/vaplic.h
 create mode 100644 xen/arch/riscv/vaplic.c

-- 
2.54.0



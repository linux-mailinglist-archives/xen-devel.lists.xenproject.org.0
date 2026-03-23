Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP+0OKdqwWnVSwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:30:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC712F8321
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259433.1552738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iAN-0004gh-Dy; Mon, 23 Mar 2026 16:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259433.1552738; Mon, 23 Mar 2026 16:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4iAN-0004eT-AU; Mon, 23 Mar 2026 16:30:11 +0000
Received: by outflank-mailman (input) for mailman id 1259433;
 Mon, 23 Mar 2026 16:30:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <oleksii.kurochko@gmail.com>) id 1w4iAL-0004eN-LZ
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 16:30:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4iAK-00BTM1-Ds
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 17:30:08 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c16a8b-2eae-0a2a0a5409dd-0a2a4501c0b2-16
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 17:30:08 +0100
Received: from [209.85.208.43] (helo=mail-ed1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69c16a90-6400-0a2a45010019-d155d02bcc64-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 17:30:08 +0100
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-6689033d0c3so4720781a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 09:30:08 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8be14sm536248166b.17.2026.03.23.09.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:30:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20230601 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283408; x=1774888208; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SshUlreLuRggCuM2qnEr0Coi2A/k9Ipd+AgjYqcpRfE=;
        b=TrRURI/O6eeuHOzT7VlkGrYtI8DngTBkQFF5lcl5CTgbdAuTitGRTeeHIBBLMkQHON
         bdPJEZ9rd+P/d4Y96tfVYy81DYtJfByC9oe6VpLEqUfAZYnFhMcwwtYjmf9bybuKT0YL
         nIxa28gDae6OHb8/8BR70fcKZvVscLg8rkATHuZVTfovDPRBQ3VayB94BWH7rIw6iyPX
         lEqAhZTIgFsOuUW/fX7Gno7im7yCVl0fWybqWe2EEP9pA0K1WfRU75r2D8RO5Ot/34WV
         FWA1Z+8+ZmbrNZ6namVZRgmP7NjvZfnpccLRClCn20bmZB69S+xfodu/w3T3Ky0QURft
         awZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283408; x=1774888208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SshUlreLuRggCuM2qnEr0Coi2A/k9Ipd+AgjYqcpRfE=;
        b=baLqHXgi5W0kd68XeCf9+KyqMukP1qiq+1g5AehK/Otd3R7IWoaQJhWT0d9DFNPCUx
         /zo3aE+c76slns4LKvV60ZqCudBzM2rJmOgX7cHL5TtF281Ur/+W2Rnxqqz+k9jO3NTQ
         AQM6c5gfF+UdbOOH27qRPP5cloKlZXDluEC7XQ9zRSxETfkiv6wYVyYNNTwxDWngNtOI
         NvcOAPG+/0GaiUpYgzWEjV/6vzXqhdDaudolkJ4uQ0gjNLkADizdxr5yYDEh2pzP0dSR
         y78BVOc5l1Oo4mg49ZFwZhEHOAUKGTThZIyUGUjSeauZP1rAsBYaaUOKenHkdK3J2a1b
         sjIw==
X-Gm-Message-State: AOJu0YxYTQT67QfKif8ssbDtTwTCQLQastX9efGtCa5d7alfKekNkDqL
	wKwzvAYu79GS9izHJ8n6OvQlAZjEsJw8Gvph6YMANtzeYC3ojhxunwAjXOQVIg==
X-Gm-Gg: ATEYQzz98baw5mCbe3zPW86lENgEOAUegQFsdUYM0Ygd4Z40OkZQls05EzLNxHOcOPT
	dvbWL74ZYta2kztWkFMf+APEl0kGx3lrxZpNTA3xrzl+x8+EjnHCCBVKotDSDfaaz2AAA90Ji49
	tyTXVtU+UTWLuY+ZNRPJDUplEgoPxYDN1J+RTUKmTDlU3KerpJUL2/dn4b0W87p0ho9VWd0nFue
	kmiMz2ntWT52K6+5xFdbdgRhWFmHKr9IUHIb1YtnZCiAeNdhy0RKf5DTpJ8meIhv1ednCdSN4YT
	pZTFWu8yJGnvKAAfja6uTmGKPyhFbbK2KanSap+z0cgIystqIjLOWyIghUjZ78V3LsI6qErcbVm
	O/D/4XJuE+gg2bm6IDyygUxUsifqNDFkynpViVRw+nVe+hiGOBISxf3Luu1IwHqhIYcLMP3uM/s
	1ypjSEPp/fJlVQzUzHHt3ZuTupR7OqBWpepqzfCUriZV91e+wT7B/fUm5qzp1t3Sh1AQ==
X-Received: by 2002:a17:906:c097:b0:b97:d126:c01c with SMTP id a640c23a62f3a-b982f3975a4mr724622166b.50.1774283407268;
        Mon, 23 Mar 2026 09:30:07 -0700 (PDT)
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
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v2 00/11] RISCV: enable DOMAIN_BUILD_HELPERS
Date: Mon, 23 Mar 2026 17:29:41 +0100
Message-ID: <cover.1774281309.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1774283408-8F0E1DF3-11F84067/0/0
X-purgate-type: clean
X-purgate-size: 3018
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:tpearson@raptorengineering.com,m:rahul.singh@arm.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,arm.com,epam.com,raptorengineering.com];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3BC712F8321
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Introduce necessary things to enable DOMAIN_BUILD_HELPERS config for RISC-V.

Generally it is indepenent patch series from [1] but depends on which
patches will go first it could be some merge conflicts.

[1] https://lore.kernel.org/xen-devel/cover.1773419622.git.oleksii.kurochko@gmail.com/

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2403222832

---
Changes in v2:
 - Address the comments from ML.
 - Introduce some new patches to make dom0less solution more architecture
   indepenent from terminology point of view.
 - Minor fixes.
---

Oleksii Kurochko (11):
  xen/riscv: implement get_page_from_gfn()
  xen: return proper type for guest access functions
  xen/riscv: implement copy_to_guest_phys()
  xen/dom0less: rename kernel_zimage_probe() to kernel_image_probe()
  xen/riscv: add kernel loading support
  xen: move declaration of fw_unreserved_regions() to common header
  xen: move domain_use_host_layout() to common code
  xen: rename p2m_ipa_bits to p2m_gpa_bits
  xen/riscv: introduce p2m_gpa_bits
  xen/riscv: add definition of guest RAM banks
  xen/riscv: enable DOMAIN_BUILD_HELPERS

 xen/arch/arm/domain_build.c               |  12 +-
 xen/arch/arm/domctl.c                     |   2 +-
 xen/arch/arm/guestcopy.c                  |  24 ++--
 xen/arch/arm/include/asm/domain.h         |  14 --
 xen/arch/arm/include/asm/guest_access.h   |  18 +--
 xen/arch/arm/include/asm/p2m.h            |   4 +-
 xen/arch/arm/include/asm/setup.h          |   3 -
 xen/arch/arm/kernel.c                     |  48 +++----
 xen/arch/arm/mmu/p2m.c                    |  18 +--
 xen/arch/arm/p2m.c                        |   6 +-
 xen/arch/ppc/include/asm/guest_access.h   |  10 +-
 xen/arch/riscv/Kconfig                    |   1 +
 xen/arch/riscv/Makefile                   |   2 +
 xen/arch/riscv/guestcopy.c                | 116 ++++++++++++++++
 xen/arch/riscv/include/asm/config.h       |  13 ++
 xen/arch/riscv/include/asm/guest_access.h |  13 +-
 xen/arch/riscv/include/asm/p2m.h          |  18 +--
 xen/arch/riscv/kernel.c                   | 158 ++++++++++++++++++++++
 xen/arch/riscv/p2m.c                      |  63 ++++++++-
 xen/arch/riscv/stubs.c                    |   8 +-
 xen/common/device-tree/domain-build.c     |   2 +-
 xen/common/device-tree/kernel.c           |   2 +-
 xen/common/domain.c                       |   8 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c  |   4 +-
 xen/drivers/passthrough/arm/smmu-v3.c     |   2 +-
 xen/drivers/passthrough/arm/smmu.c        |   2 +-
 xen/include/public/arch-riscv.h           |  16 +++
 xen/include/xen/bootinfo.h                |   4 +
 xen/include/xen/domain.h                  |  16 +++
 xen/include/xen/fdt-domain-build.h        |   8 +-
 xen/include/xen/fdt-kernel.h              |   4 +-
 31 files changed, 499 insertions(+), 120 deletions(-)
 create mode 100644 xen/arch/riscv/guestcopy.c
 create mode 100644 xen/arch/riscv/kernel.c

-- 
2.53.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPAwKGNU/GlOOAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB934E55BC
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 10:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302326.1576280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZV-00029u-TH; Thu, 07 May 2026 08:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302326.1576280; Thu, 07 May 2026 08:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKuZV-000289-Pp; Thu, 07 May 2026 08:59:05 +0000
Received: by outflank-mailman (input) for mailman id 1302326;
 Thu, 07 May 2026 08:59:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKuZU-00027t-Bm
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 08:59:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKuZT-002y5h-Da
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:59:03 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc544c-2eae-0a2a0a5409dd-0a2a450c9c00-48
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:03 +0200
Received: from [209.85.218.48] (helo=mail-ej1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc5457-62f1-0a2a450c0019-d155da30a85d-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 10:59:03 +0200
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-bc1f0830f44so329020366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 01:59:03 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc81d5e9583sm57549966b.17.2026.05.07.01.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 01:59:01 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778144342; x=1778749142; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jqVzpio3qU+hCmWq+7iPEswSKDEZZHhciomYgDv8B/Q=;
        b=A3ccrVEFRR5cY+MIG+Taun0Wq8ZL/1cLZjmwG6LctGqCtZlaT9rki8+JXSMLm2yEll
         NrLUHZItTlqnR+HfL+l2ylFoHEPXDJs09d89dyFMEgO17v/fLy5VmoOAI2VzuWrTyN5m
         YGP4KRjIQaBoNJlv/vfsHdVb0khIgdNDWMUhBdvCmQhBrTjHrntye6A7t0Vt0ByAcwue
         gObguPDeYh7ZLHtN/fmvVe0RIC4U2dZmkbDQBN+iqDFbeEYt+sr1HK6QOUI+o9CBj/Iy
         TRq3DKSPUEtGhTKSHLgZ3wBICWfHTSoBCDTEi40w8AHfsz6E7pE1cIHBh571t5BcbZey
         wePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144342; x=1778749142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqVzpio3qU+hCmWq+7iPEswSKDEZZHhciomYgDv8B/Q=;
        b=FShpUVEnzqaDIjexhzmOnHLFHUsSzUjhf5zb32jn55itp6Y4alwL6+pXRm0mSESbX2
         GTqfc9I4wL5wmKkIWQE7x194XnL7hzvQpWKBVmxVeGtcnLgGgBbGOqOwnAGV+FQ62rjN
         bMwgT1uKTJu0dadLMixy1X+AFLTA5Ag3e7yfvncqztFQUu5SbilztZ81Dyp3dlDir4s3
         m5/Xln5d+et4pYq2dPedvrXqbB7JPzzlHRehVFsxFmKgkhFOMCs91O0yquci+LWTGcXe
         gY0yJETvBTVpqexMSnaHhrRwRFCxTBR/ovyPwNCGzFMK5ptr5vIjSkqHx/dN+AuTw2/P
         bphg==
X-Gm-Message-State: AOJu0Yx/vZeRPb9SqOzUbfo228VDgi50ZsA33bHGmLGBgaw4a3hcp8DX
	or4oJOMzJ4drCTCojC6vns/6fHroxR5iHF6PrzDFxIcRd9jAUMHvQT3CBQGv6Q==
X-Gm-Gg: AeBDietz1cCAseRCOBnHdCk1ZASLzWrQbfMNLNCo4sghYiUkCSw0l6JZCc8XXbgng5/
	5Ks/Hh9zfWe5WOlPxiVEgmuQou0tLUCu/+VEvtAjV6wQUXopNcFKTbama/lYsR9ta9zs/PwyMnh
	o43MJvlqYyD3TjLcpEO5GTjnVLEl/aAEkcWZEj2LSk9/YjfORjkkAu8Vrw5tXew+3ea3LRgl9ha
	xFO0rpfjj73GXpUPwHpjnjCwhNrcWbWDKJI2zGfFWT7pEGXTvsjD5WOJhIG8K73SeepoRA56bvi
	DpItqH8KhWkb0seo/MeDUFhYSIoRdt0yi3D+H4gnkg1uPxja40wti3JY61QfWJaPaSueDczhqeM
	iGeWkddhX49G+5s2kn5DHIssIE3a74Ip5GsJAAQgF7V4TdnMHhcXKleqLrJIhYJl/kosm9P7kqI
	A5RTiNEEhqBBCoDXSMsbb9RhJ0C4jTcwO8oJfJ8rQQhw58cyA4W0MU3LF3nJlY3xpxFQ0l8ixOG
	REs
X-Received: by 2002:a17:907:5cb:b0:bc6:76d:819e with SMTP id a640c23a62f3a-bc84c77f732mr119858466b.1.1778144342260;
        Thu, 07 May 2026 01:59:02 -0700 (PDT)
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
Subject: [PATCH v5 00/11]  RISCV: enable DOMAIN_BUILD_HELPERS
Date: Thu,  7 May 2026 10:58:39 +0200
Message-ID: <cover.1778140240.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1778144343-E2975CF5-2738A6D5/10/73395122804
X-purgate-type: spam
X-purgate-size: 3669
X-Rspamd-Queue-Id: CAB934E55BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com,wdc.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Introduce necessary things to enable DOMAIN_BUILD_HELPERS config for RISC-V.

This patch series is rebased on top of patch "xen: introduce CONFIG_HAS_DOMAIN_TYPE"
but there is no any technical dependency.

CI: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2506574229

---
Changes in v5:
 - Merged to upstream staging:
     xen/riscv: implement get_page_from_gfn()
 - Address other comments from ML.
---
Changes in v4:
 - Move patch up, closer to other common/Arm related patches:
   - xen/dom0less: rename kernel_zimage_probe() to  kernel_image_probe()
   - xen: move declaration of fw_unreserved_regions() to common header
   - xen: move domain_use_host_layout() to common header
   - xen: rename p2m_ipa_bits to p2m_gpa_bits

 - Merged to upstream/staging:
     xen/riscv: implement get_page_from_gfn()

 - Rebase this patch series on top of [PATCH v3 0/3] dom0less: various updates. 
 - Address the comments from ML.
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

Oleksii Kurochko (11):
  xen: arm: fix len type for guest copy functions
  xen/dom0less: rename kernel_zimage_probe() to kernel_image_probe()
  xen: move declaration of fw_unreserved_regions() to common header
  xen: introduce domain-layout.h with common domain_use_host_layout()
  xen/device-tree: use p2m_gpa_bits in common code
  xen/riscv: implement copy_to_guest_phys()
  xen/riscv: add Linux kernel loading support
  xen/riscv: rework G-stage mode handling
  xen/riscv: introduce p2m_gpa_bits
  xen/riscv: add definition of guest RAM banks
  xen/riscv: enable DOMAIN_BUILD_HELPERS

 xen/arch/arm/domain_build.c               |   1 +
 xen/arch/arm/guestcopy.c                  |   6 +-
 xen/arch/arm/include/asm/domain.h         |  14 --
 xen/arch/arm/include/asm/guest_access.h   |   2 +-
 xen/arch/arm/include/asm/p2m.h            |   2 +
 xen/arch/arm/include/asm/setup.h          |   3 -
 xen/arch/arm/kernel.c                     |  50 ++---
 xen/arch/arm/vgic-v3.c                    |   1 +
 xen/arch/riscv/Kconfig                    |   1 +
 xen/arch/riscv/Makefile                   |   3 +
 xen/arch/riscv/dom0less-build.c           |  71 ++++++
 xen/arch/riscv/guestcopy.c                | 116 ++++++++++
 xen/arch/riscv/include/asm/config.h       |  13 ++
 xen/arch/riscv/include/asm/domain.h       |   1 +
 xen/arch/riscv/include/asm/guest-layout.h |  23 ++
 xen/arch/riscv/include/asm/guest_access.h |   7 +
 xen/arch/riscv/include/asm/p2m.h          |  21 +-
 xen/arch/riscv/include/asm/paging.h       |   1 +
 xen/arch/riscv/kernel.c                   | 249 ++++++++++++++++++++++
 xen/arch/riscv/p2m.c                      | 134 ++++++++----
 xen/arch/riscv/vmid.c                     |   2 +-
 xen/common/device-tree/domain-build.c     |   3 +-
 xen/common/device-tree/kernel.c           |   2 +-
 xen/include/public/arch-riscv.h           |   5 +
 xen/include/xen/bootinfo.h                |   4 +
 xen/include/xen/domain-layout.h           |  28 +++
 xen/include/xen/fdt-domain-build.h        |   2 +-
 xen/include/xen/fdt-kernel.h              |  17 +-
 28 files changed, 683 insertions(+), 99 deletions(-)
 create mode 100644 xen/arch/riscv/dom0less-build.c
 create mode 100644 xen/arch/riscv/guestcopy.c
 create mode 100644 xen/arch/riscv/include/asm/guest-layout.h
 create mode 100644 xen/arch/riscv/kernel.c
 create mode 100644 xen/include/xen/domain-layout.h

-- 
2.54.0



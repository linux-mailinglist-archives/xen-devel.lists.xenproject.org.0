Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id y+/DEWvF8GkpYgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED974870B0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 16:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296327.1572745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVX-0005Ge-A0; Tue, 28 Apr 2026 14:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296327.1572745; Tue, 28 Apr 2026 14:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHjVX-0005EM-6o; Tue, 28 Apr 2026 14:33:51 +0000
Received: by outflank-mailman (input) for mailman id 1296327;
 Tue, 28 Apr 2026 14:33:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wHjVW-0005EG-Gj
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 14:33:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHjVV-000RTW-Nw
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 16:33:49 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c548-2eae-0a2a0a5409dd-0a2a4501d626-10
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:33:49 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69f0c54d-c1f2-0a2a45010019-d1558030ccf7-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 16:33:49 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so139789325e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 07:33:49 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a774b6300sm19302145e9.16.2026.04.28.07.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 07:33:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777386829; x=1777991629; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d87OtETY/HDHZSyvkF1z/eDjSpJPpBjmfUMMYJKhrzU=;
        b=IzvajUon0PUakXEs8cQSMv+OSt9ebkwGfR+JEp5FEzXg0W9PSl7P5FL9bM0qlDo9Ke
         OvZpqa+Lah/5wo70BVShFqqiu5+r4dd79GujVEL3/Ux2Kb25OU5sbUPieV6OfOvx9CDM
         XuC+SCgd/RDOSLyTQaAATqB1AbzhgnP9rq2GTWtk/at9COtJG6LCm+rRZtgZWNndYvU5
         VHXacwo+jbdh3lSEyjznQ45La0FXdMC0M7zsSLabui8j1rRZzELuPuvU/KYRFi3XwDjw
         XW3Zl9VG5bkrVwDxUYsXkC9HhureQJjGSp2LTYmxIs2MF05pPC9fFU42/Fm+7xYoaTAF
         PV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386829; x=1777991629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d87OtETY/HDHZSyvkF1z/eDjSpJPpBjmfUMMYJKhrzU=;
        b=YGXwJ8MhK11cZ9gYnjFxsNv77pch7N9cew6GtPs+K74ZWJBIqwdAZEfCfJhPZXI7SS
         ApuHlupmOjbJkZPPsx+bp5FwlhI95T2kmJ9sv8/MtkiaceH6RAGl5tjOeCExYoqCbpxq
         QSGAc7varzXr+OAnoVKEWY9cp5qgyZoMT71kTn9v3fUO5KtxNajjexkwxyPx4H+/6YI/
         6Fhuuej507GUZ5jBVBnuiXuR4ZG9GLvTgS5ywdVgcemh6dStTcrsj4R0eE/MBFLkPw05
         iS//haZYbTmWwdYOuvFNDXH2Hf2vlzQ1Hdr1ETZb2zATPV/wvkpnf08Z5OdGnEwfKXyj
         R8WA==
X-Gm-Message-State: AOJu0YxCf1Kd4RnL2sIiIhVwk906+a3TmVbqvbZPIZKRxkuWcoLDNHhv
	dP6OmK6Ap3u7dRARZbxPdj5m5BQpLIWFtGanq0Wk/N8lWid9pCvPCzA1emzKCQ==
X-Gm-Gg: AeBDieul+3fJ8oEXAGsS9batJyePEQiwm+6bOiZ329j98vKhu65t9mC3U8mM0ECmTcQ
	t8+jCJfx1zdcdYgpXuCZuDXe+J2MQ6Ll2x4jmjq/TsSehK8DuI17Gyiko3serjGztXCIaxOXFlQ
	fKreHIoWoEYnB5SIcRgsXjhwvtVWWt9Tvn0kLRcJJVoNjXsI5uQkz+fpSPffCaPwvptSIG2RxOK
	9qgkVK2yD2PKIedqKFIMFGwo1HRTIETkmcVCbEQ4k/Gp2ktwWBD1pmtNwXcYk1t3ho8PHxkgC0c
	HRuPjbsWaZXnzW+QY3UFn3tfiB4XAWDpGFYPOUtoLfGwIJDPn6aNfZXVmREO70XT4MTqgN8F5Rt
	pU5ljBfiiXojKLhVbTyJ3a2e/d5uPFQWMB+/mTL/Guz0TxgPtRp/8Azd6l8+4RCTXta/FqRuA24
	dA2EEa0dgXwR9Bx815+0NONeV8ZxRN25Blsfa+g3rvqPgGXQ30INZhN8rvWVa0g6yMVVUmfRiYa
	yCP
X-Received: by 2002:a05:600c:a013:b0:48a:563c:c8e0 with SMTP id 5b1f17b1804b1-48a77ad5a89mr56203045e9.1.1777386828803;
        Tue, 28 Apr 2026 07:33:48 -0700 (PDT)
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
Subject: [PATCH v4 00/11]  RISCV: enable DOMAIN_BUILD_HELPERS
Date: Tue, 28 Apr 2026 16:33:29 +0200
Message-ID: <cover.1777303844.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1777386829-B6E63FF4-1E69EAE1/10/73395122804
X-purgate-type: spam
X-purgate-size: 3509
X-Rspamd-Queue-Id: 4ED974870B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com,wdc.com];
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
	NEURAL_HAM(-0.00)[-0.174];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

Introduce necessary things to enable DOMAIN_BUILD_HELPERS config for RISC-V.

This patch series is rebased on top of [PATCH v3 0/3] dom0less: various updates
as it could be some merge conflicts depends on which patch series will go first.

CI: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2477740734

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
  xen: rename p2m_ipa_bits to p2m_gpa_bits
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
 xen/arch/arm/kernel.c                     |  48 ++---
 xen/arch/arm/vgic-v3.c                    |   1 +
 xen/arch/riscv/Kconfig                    |   1 +
 xen/arch/riscv/Makefile                   |   3 +
 xen/arch/riscv/dom0less-build.c           |  70 +++++++
 xen/arch/riscv/guestcopy.c                | 116 +++++++++++
 xen/arch/riscv/include/asm/config.h       |  13 ++
 xen/arch/riscv/include/asm/domain.h       |   1 +
 xen/arch/riscv/include/asm/guest-layout.h |  23 ++
 xen/arch/riscv/include/asm/guest_access.h |   7 +
 xen/arch/riscv/include/asm/p2m.h          |  21 +-
 xen/arch/riscv/kernel.c                   | 242 ++++++++++++++++++++++
 xen/arch/riscv/p2m.c                      | 133 ++++++++----
 xen/arch/riscv/vmid.c                     |   2 +-
 xen/common/device-tree/domain-build.c     |   3 +-
 xen/common/device-tree/kernel.c           |   2 +-
 xen/include/public/arch-riscv.h           |   5 +
 xen/include/xen/bootinfo.h                |   4 +
 xen/include/xen/domain-layout.h           |  27 +++
 xen/include/xen/fdt-domain-build.h        |   2 +-
 xen/include/xen/fdt-kernel.h              |  15 +-
 27 files changed, 670 insertions(+), 97 deletions(-)
 create mode 100644 xen/arch/riscv/dom0less-build.c
 create mode 100644 xen/arch/riscv/guestcopy.c
 create mode 100644 xen/arch/riscv/include/asm/guest-layout.h
 create mode 100644 xen/arch/riscv/kernel.c
 create mode 100644 xen/include/xen/domain-layout.h

-- 
2.53.0



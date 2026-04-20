Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OkQFWk35mkmtgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:25:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0621242D03A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:25:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286085.1567197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZ9-0004Ek-UW; Mon, 20 Apr 2026 14:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286085.1567197; Mon, 20 Apr 2026 14:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZ9-0004DN-S1; Mon, 20 Apr 2026 14:25:35 +0000
Received: by outflank-mailman (input) for mailman id 1286085;
 Mon, 20 Apr 2026 14:25:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wEpZ8-0004DG-5Y
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:25:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEpZ7-0049I1-Id
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:25:33 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e6375a-e002-0a2a0a5209dd-0a2a450481ee-10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:33 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e6375c-1dec-0a2a45040019-d98c6eacb83e-1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:33 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E7D61516;
 Mon, 20 Apr 2026 07:25:26 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 423B13F7B4;
 Mon, 20 Apr 2026 07:25:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776695132; bh=msE5zKqdYroR2i7+BMMRv2AgU+EIZ5jE7RxEL1s5uwo=;
	h=From:To:Cc:Subject:Date:From;
	b=M0lqefgAbq4Tm7Sx10KJ8putI+ayHK52E6dS8/S7b0fHKcukS5YSj1VONT4hcFn5s
	 qEvOiBh+R1yDiUCrd+pyyuGNyXRE4qUtI7bNdjwrM1/NP0XL49iBWRL7z4ip17KNoj
	 +wDoVXoDcc16yXwCKndkwp11DWDZAwUHbz2pdc4M=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Oleksii Kurochko" <oleksii.kurochko@gmail.com>
Subject: [PATCH 0/8] Armv8-R AArch64 MPU support (single core)
Date: Mon, 20 Apr 2026 15:25:16 +0100
Message-Id: <20260420142524.1804073-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1776695133-324733FF-C652B545/0/0
X-purgate-type: clean
X-purgate-size: 2291
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.789];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0621242D03A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

this serie complete the support for Armv8-R AArch64 MPU support for dom0less
DomU boot on single core, it also build for Armv8-R AArch32 but the support is
not complete.

The serie is based on another serie in the mailing list: "Fifth MPU Series".

I've spoken with Oleksii and the Arm maintainer to have the possibilty to have
this on the Xen release, of course provided that maintainers have enough
bandwidth and depending on the priority of the series to be in.

Asking for Oleksii Ack for the release, the changes in this serie are mostly
related to MPU apart from few patches that touches common Arm code.

Luca Fancellu (2):
  arm/mpu: Save/restore guest EL1 MPU-related context
  arm/mpu: Save/restore VTCR_EL2 on vCPU context switch

Penny Zheng (6):
  xen/arm: Implement p2m_set_entry for MPU systems
  xen/arm: Implement p2m_get_entry for MPU systems
  xen/mpu: enable device passthrough in MPU system
  arm/mpu: Support vCPU context switch on MPU systems
  xen/arm: enable MMIO region trap in MPU system
  xen/arm: dump debug message in MPU system

 xen/arch/arm/arm64/mpu/p2m.c                |  17 ++
 xen/arch/arm/domain.c                       |  51 +++-
 xen/arch/arm/include/asm/arm32/mpu.h        |   3 +-
 xen/arch/arm/include/asm/arm64/mpu.h        |   3 +-
 xen/arch/arm/include/asm/domain.h           |  10 +
 xen/arch/arm/include/asm/mm.h               |   3 +
 xen/arch/arm/include/asm/mmu/domain-build.h |   2 +
 xen/arch/arm/include/asm/mmu/mm.h           |  12 +
 xen/arch/arm/include/asm/mpu.h              |   3 +
 xen/arch/arm/include/asm/mpu/cpregs.h       |   7 +
 xen/arch/arm/include/asm/mpu/domain-build.h |   6 +
 xen/arch/arm/include/asm/mpu/mm.h           |  13 +-
 xen/arch/arm/include/asm/mpu/p2m.h          |  25 ++
 xen/arch/arm/include/asm/p2m.h              |   3 +
 xen/arch/arm/mpu/arm32/mm.c                 |  10 +
 xen/arch/arm/mpu/arm64/mm.c                 | 136 +++++++++
 xen/arch/arm/mpu/domain-build.c             |  17 ++
 xen/arch/arm/mpu/mm.c                       | 101 +++++--
 xen/arch/arm/mpu/p2m.c                      | 295 +++++++++++++++++++-
 xen/arch/arm/traps.c                        |  91 ++++--
 20 files changed, 739 insertions(+), 69 deletions(-)

-- 
2.34.1



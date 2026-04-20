Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BmHM9Y25mkmtgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:23:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3C442CF7F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:23:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286045.1567161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpWU-00029n-Ry; Mon, 20 Apr 2026 14:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286045.1567161; Mon, 20 Apr 2026 14:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpWU-00027I-P4; Mon, 20 Apr 2026 14:22:50 +0000
Received: by outflank-mailman (input) for mailman id 1286045;
 Mon, 20 Apr 2026 14:22:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wEpWT-000273-28
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:22:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEpWS-007nwH-BQ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:22:48 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e636a9-5cb7-0a2a0a5109dd-0a2a4503ade2-42
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:22:48 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e636b7-672d-0a2a45030019-d98c6eacb866-1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:22:47 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FED51516;
 Mon, 20 Apr 2026 07:22:41 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71F023F7B4;
 Mon, 20 Apr 2026 07:22:45 -0700 (PDT)
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
	t=1776694966; bh=uEiDQ0S/JRioWm+0hL1oiuLwlrOvukDwyNsY0rQwBYU=;
	h=From:To:Cc:Subject:Date:From;
	b=RBeHS28SayxivulRAXgeGaN2phri66YlWOlzJzxr548TvJOXY6beXc8qTibRzPuJS
	 K39hakzurB8mK3AVy0PxuPKQDKzVbf2FR1g7AiH8RmMBFff1bjIgcwytQE8zIZMLNZ
	 NqSY/ppo3SYR969pRrBCN5fXLSXlGKgoSpGpneg0=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Oleksii Kurochko" <oleksii.kurochko@gmail.com>
Subject: [PATCH v4 0/3] Fifth MPU Series
Date: Mon, 20 Apr 2026 15:22:21 +0100
Message-Id: <20260420142224.1802911-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1776694968-2AF62938-73E8B252/0/0
X-purgate-type: clean
X-purgate-size: 2019
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,suse.com,gmail.com];
	FORGED_SENDER(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.802];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7D3C442CF7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series continues to further the ongoing work to introduce support
for MPU systems in Xen.

The patches in this series aim to implement MPU specific p2m functions.

This serie is based on staging 99912d346009fda1e7fb1510c9501fbab17e92a0.

Harry Ramsey (2):
  arm/mpu: Introduce `v8r_el1_msa` device tree property for domains
  arm/mpu: Implement p2m tables

Penny Zheng (1):
  arm/mpu: implement setup_virt_paging for MPU systems

 docs/misc/arm/device-tree/booting.txt       | 14 ++++
 xen/arch/arm/arm64/mpu/p2m.c                | 80 ++++++++++++++++++++-
 xen/arch/arm/dom0less-build.c               |  3 +
 xen/arch/arm/domain.c                       |  4 ++
 xen/arch/arm/include/asm/arm32/mpu.h        |  2 +
 xen/arch/arm/include/asm/arm64/mpu.h        |  2 +
 xen/arch/arm/include/asm/arm64/sysregs.h    |  4 ++
 xen/arch/arm/include/asm/cpufeature.h       | 13 +++-
 xen/arch/arm/include/asm/domain.h           |  4 ++
 xen/arch/arm/include/asm/domain_build.h     |  8 +++
 xen/arch/arm/include/asm/mmu/domain-build.h | 46 ++++++++++++
 xen/arch/arm/include/asm/mpu.h              |  5 ++
 xen/arch/arm/include/asm/mpu/domain-build.h | 27 +++++++
 xen/arch/arm/include/asm/mpu/p2m.h          | 12 ++++
 xen/arch/arm/include/asm/p2m.h              |  5 ++
 xen/arch/arm/include/asm/processor.h        |  8 +++
 xen/arch/arm/mpu/Makefile                   |  1 +
 xen/arch/arm/mpu/arm32/mm.c                 |  5 ++
 xen/arch/arm/mpu/arm64/mm.c                 |  5 ++
 xen/arch/arm/mpu/domain-build.c             | 76 ++++++++++++++++++++
 xen/arch/arm/mpu/p2m.c                      | 78 +++++++++++++++++++-
 xen/include/public/arch-arm.h               |  7 ++
 xen/include/public/domctl.h                 |  4 +-
 23 files changed, 404 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/mmu/domain-build.h
 create mode 100644 xen/arch/arm/include/asm/mpu/domain-build.h
 create mode 100644 xen/arch/arm/mpu/domain-build.c

-- 
2.34.1



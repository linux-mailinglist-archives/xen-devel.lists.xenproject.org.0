Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Lh1CWf0/WlxlAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:34:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DA44F7C20
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:34:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303687.1576942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMHG-0000jr-1W; Fri, 08 May 2026 14:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303687.1576942; Fri, 08 May 2026 14:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMHF-0000he-Ui; Fri, 08 May 2026 14:34:05 +0000
Received: by outflank-mailman (input) for mailman id 1303687;
 Fri, 08 May 2026 14:34:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wLMHE-0000hU-Mb
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:34:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMHE-00A7Or-3q
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:34:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69fdf443-e002-0a2a0a5209dd-0a2a450290cc-46
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:34:04 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69fdf45a-af86-0a2a45020019-d98c6eace33e-1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:34:03 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 384F51D34;
 Fri,  8 May 2026 07:33:57 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CF9C3F763;
 Fri,  8 May 2026 07:34:00 -0700 (PDT)
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
	t=1778250842; bh=zq3DhQH4sl+9uv2VKEwOOwkj7NuXi59OI/wXqdtf3Pw=;
	h=From:To:Cc:Subject:Date:From;
	b=PF+FVPhbQG7HcoMKXQxp8e4yU+r+X/SaVca58YM4DmXRhB3Mo6Y8PgtrNiabyit72
	 HKxf7eoDnYW2k1ESfpi+WhEcyuyiOt4r0KKrRkjvcpdmose1njskqM9mMRqUjO6m4h
	 S6Zsjh/Dq1wCpvouNP/Vgzu1eyFHrKDpVvGcimSA=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 0/3] Fifth MPU Series
Date: Fri,  8 May 2026 15:33:50 +0100
Message-Id: <20260508143353.3512004-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778250844-AB36C161-ED15C89A/0/0
X-purgate-type: clean
X-purgate-size: 1518
X-Rspamd-Queue-Id: C5DA44F7C20
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This series continues to further the ongoing work to introduce support
for MPU systems in Xen.

The patches in this series aim to implement MPU specific p2m functions.

This serie is based on staging 10d417b8b62efa5093707c1dfe9bd48e0abeb331.

Harry Ramsey (2):
  arm/mpu: Introduce `v8r_el1_msa` device tree property for domains
  arm/mpu: Implement p2m tables

Penny Zheng (1):
  arm/mpu: implement setup_virt_paging for MPU systems

 docs/misc/arm/device-tree/booting.txt    | 14 +++++
 xen/arch/arm/arm64/mpu/p2m.c             | 80 +++++++++++++++++++++++-
 xen/arch/arm/dom0less-build.c            | 74 ++++++++++++++++++++++
 xen/arch/arm/domain.c                    | 11 ++++
 xen/arch/arm/include/asm/arm32/mpu.h     |  2 +
 xen/arch/arm/include/asm/arm64/mpu.h     |  2 +
 xen/arch/arm/include/asm/arm64/sysregs.h |  4 ++
 xen/arch/arm/include/asm/cpufeature.h    | 13 +++-
 xen/arch/arm/include/asm/domain.h        |  4 ++
 xen/arch/arm/include/asm/domain_build.h  | 21 +++++++
 xen/arch/arm/include/asm/mpu/p2m.h       |  7 +++
 xen/arch/arm/include/asm/p2m.h           |  5 ++
 xen/arch/arm/include/asm/processor.h     |  8 +++
 xen/arch/arm/mpu/arm32/mm.c              | 17 +++++
 xen/arch/arm/mpu/arm64/mm.c              | 18 ++++++
 xen/arch/arm/mpu/p2m.c                   | 72 ++++++++++++++++++++-
 xen/include/public/arch-arm.h            |  6 ++
 xen/include/public/domctl.h              |  4 +-
 18 files changed, 353 insertions(+), 9 deletions(-)

-- 
2.34.1



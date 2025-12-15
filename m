Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84CFCBE653
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 15:50:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187127.1508547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9tS-0003AG-Te; Mon, 15 Dec 2025 14:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187127.1508547; Mon, 15 Dec 2025 14:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9tS-00038g-PU; Mon, 15 Dec 2025 14:49:46 +0000
Received: by outflank-mailman (input) for mailman id 1187127;
 Mon, 15 Dec 2025 14:49:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pAKg=6V=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vV9tR-00038W-4c
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 14:49:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 49bf56d9-d9c5-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 15:49:42 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EF80497;
 Mon, 15 Dec 2025 06:49:34 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.46.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 492613F694;
 Mon, 15 Dec 2025 06:49:40 -0800 (PST)
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
X-Inumbo-ID: 49bf56d9-d9c5-11f0-9cce-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 00/12] xen/arm: ffa: FF-A v1.2 support
Date: Mon, 15 Dec 2025 15:49:17 +0100
Message-ID: <cover.1765807707.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series updates Xen’s FF-A mediator on Arm to implement the FF-A
v1.2 interface while keeping existing v1.0/v1.1 guests working.

Patches 1–7 rework the low-level plumbing:

  1) add the FF-A v1.2 function IDs and probe the new ABIs
  2) track per-VM FFA_VERSION state and enforce negotiation
  3) Fix is_64bit initialisation
  4) harden RX/TX mapping and validation
  5) rework SPMC RX/TX buffer management so access is serialized and
     RX buffers are always released back to the SPMC
  6) rework VM RX/TX buffer to have generic acquire/release function
     equivalent to SPMC access functions
  7) switch the mediator to spec-compliant signed 32-bit status codes

Patches 8–11 update the data structures and direct-call paths:

  8) add ffa_uuid helpers and rework partition-info handling
  9) add FFA_RUN support
  10) add the v1.1/v1.2 SEND2 header layout
  11) add MSG_SEND_DIRECT_REQ2/RESP2 support and marshal the extended
     register set for v1.2 guests

Patch 12 tightens the dispatcher and advertises FF-A v1.2:

  - reject SMCCC64 calls from AArch32 guests
  - expose RX/TX capacity fields
  - bump Xen's FF-A version to 1.2 once the implementation is complete

v1.0/v1.1 guests continue to use the v1.1 ABI without behaviour changes,
while v1.2 guests can negotiate the wider ABI and use RUN, SEND2, and
DIRECT_REQ2/RESP2 with the extended register set.

This serie was validated through gitlab-ci here:
https://gitlab.com/xen-project/people/bmarquis/xen-ffa-research/-/tree/ffa-v1.2/v2
Build pipeline for the serie:
https://gitlab.com/xen-project/people/bmarquis/xen-ffa-research/-/pipelines/2215466965

Changes since v1:
- Rebase on staging
- Remove invalid ASSERT in patch 5
- Add extra comment to use ACCESS_ONCE for guest_vers in patch 2
- Add Jens R-b in other patches

Changes since v0:
- Rework version negotiation to prevent concurrency issues
- Introduce patch 3 to fix an init bug
- Introduce patch 5 to make VM RX/TX buffer acquire/release working in
  the same way as SPMC RX/TX buffers
- minor fixes described in each patch changelog


Bertrand Marquis (12):
  xen/arm: ffa: add FF-A v1.2 function IDs
  xen/arm: ffa: per-VM FFA_VERSION negotiation state
  xen/arm: ffa: Fix is_64bit init
  xen/arm: ffa: harden RX/TX mapping
  xen/arm: ffa: rework SPMC RX/TX buffer management
  xen/arm: ffa: rework VM RX/TX buffer management
  xen/arm: ffa: use signed 32-bit status codes
  xen/arm: ffa: add UUID helpers for partition info
  xen/arm: ffa: Add FFA_RUN support
  xen/arm: ffa: add v1.2 SEND2 header layout
  xen/arm: ffa: add MSG_SEND_DIRECT_REQ2 support
  xen/arm: ffa: advertise FF-A v1.2

 xen/arch/arm/include/asm/tee/ffa.h |   3 +-
 xen/arch/arm/tee/ffa.c             | 202 ++++++++++++++++------
 xen/arch/arm/tee/ffa_msg.c         | 232 +++++++++++++++++++------
 xen/arch/arm/tee/ffa_notif.c       |  14 +-
 xen/arch/arm/tee/ffa_partinfo.c    | 263 +++++++++++++++++------------
 xen/arch/arm/tee/ffa_private.h     | 154 +++++++++++------
 xen/arch/arm/tee/ffa_rxtx.c        | 237 +++++++++++++++++++++-----
 xen/arch/arm/tee/ffa_shm.c         |  52 +++---
 8 files changed, 827 insertions(+), 330 deletions(-)

-- 
2.51.2



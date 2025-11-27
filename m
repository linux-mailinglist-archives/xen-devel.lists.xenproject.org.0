Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 090C9C8F5A0
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 16:52:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174069.1499044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeI7-0003fo-QO; Thu, 27 Nov 2025 15:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174069.1499044; Thu, 27 Nov 2025 15:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeI7-0003dH-Nm; Thu, 27 Nov 2025 15:52:19 +0000
Received: by outflank-mailman (input) for mailman id 1174069;
 Thu, 27 Nov 2025 15:52:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gQU=6D=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vOeI6-0003dB-9a
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 15:52:18 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 0c0d5dec-cba9-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 16:52:16 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EF55176A;
 Thu, 27 Nov 2025 07:52:08 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.89.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A54F3F73B;
 Thu, 27 Nov 2025 07:52:14 -0800 (PST)
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
X-Inumbo-ID: 0c0d5dec-cba9-11f0-9d18-b5c5bf9af7f9
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 00/10] xen/arm: ffa: FF-A v1.2 support
Date: Thu, 27 Nov 2025 16:51:31 +0100
Message-ID: <cover.1764254975.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series updates Xen’s FF-A mediator on Arm to implement the FF-A
v1.2 interface while keeping existing v1.0/v1.1 guests working.

Patches 1–5 rework the low-level plumbing:

  1) add the FF-A v1.2 function IDs and probe the new ABIs
  2) track per-VM FFA_VERSION state and enforce negotiation
  3) harden RX/TX mapping and validation
  4) rework SPMC RX/TX buffer management so access is serialized and
     RX buffers are always released back to the SPMC
  5) switch the mediator to spec-compliant signed 32-bit status codes

Patches 6–9 update the data structures and direct-call paths:

  6) add ffa_uuid helpers and rework partition-info handling
  7) refactor direct requests via a common RUN/direct completion helper
  8) add the v1.1/v1.2 SEND2 header layout
  9) add MSG_SEND_DIRECT_REQ2/RESP2 support and marshal the extended
     register set for v1.2 guests

Patch 10 tightens the dispatcher and advertises FF-A v1.2 only to guests
that negotiated v1.2:

  - reject SMCCC64 calls from AArch32 guests
  - expose the new FIDs and RX/TX capacity fields
  - bump Xen's FF-A version to 1.2 once the implementation is complete

v1.0/v1.1 guests continue to use the v1.1 ABI without behaviour changes,
while v1.2 guests can negotiate the wider ABI and use RUN, SEND2, and
DIRECT_REQ2/RESP2 with the extended register set.

This serie was validated through gitlab-ci here:
https://gitlab.com/xen-project/people/bmarquis/xen-ffa-research/-/tree/ffa-v1.2/v0
Build pipeline for the serie:
https://gitlab.com/xen-project/people/bmarquis/xen-ffa-research/-/pipelines/2183322953

Bertrand Marquis (10):
  xen/arm: ffa: add FF-A v1.2 function IDs
  xen/arm: ffa: per-VM FFA_VERSION negotiation state
  xen/arm: ffa: harden RX/TX mapping
  xen/arm: ffa: rework SPMC RX/TX buffer management
  xen/arm: ffa: use signed 32-bit status codes
  xen/arm: ffa: add UUID helpers for partition info
  xen/arm: ffa: refactor direct requests via RUN helper
  xen/arm: ffa: add v1.2 SEND2 header layout
  xen/arm: ffa: add MSG_SEND_DIRECT_REQ2 support
  xen/arm: ffa: advertise FF-A v1.2

 xen/arch/arm/include/asm/tee/ffa.h |   2 +-
 xen/arch/arm/tee/ffa.c             | 205 +++++++++++++++++-------
 xen/arch/arm/tee/ffa_msg.c         | 203 ++++++++++++++++++-----
 xen/arch/arm/tee/ffa_notif.c       |  14 +-
 xen/arch/arm/tee/ffa_partinfo.c    | 248 ++++++++++++++++++-----------
 xen/arch/arm/tee/ffa_private.h     | 133 ++++++++++------
 xen/arch/arm/tee/ffa_rxtx.c        | 160 +++++++++++++++----
 xen/arch/arm/tee/ffa_shm.c         |  30 ++--
 8 files changed, 703 insertions(+), 292 deletions(-)

-- 
2.51.2



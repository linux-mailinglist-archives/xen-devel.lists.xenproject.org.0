Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C7C9A0458
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 10:32:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819599.1232982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0zRy-00009K-Ml; Wed, 16 Oct 2024 08:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819599.1232982; Wed, 16 Oct 2024 08:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0zRy-00006a-Jj; Wed, 16 Oct 2024 08:32:10 +0000
Received: by outflank-mailman (input) for mailman id 819599;
 Wed, 16 Oct 2024 08:32:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0z3=RM=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1t0zRw-00006U-Si
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 08:32:08 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 204735a8-8b99-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 10:32:06 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A6FFFEC;
 Wed, 16 Oct 2024 01:32:35 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.21.81])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB1873F71E;
 Wed, 16 Oct 2024 01:32:03 -0700 (PDT)
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
X-Inumbo-ID: 204735a8-8b99-11ef-99a3-01e77a169b0f
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 00/10] xen/arm: ffa: Improvements and fixes
Date: Wed, 16 Oct 2024 10:31:20 +0200
Message-ID: <cover.1729066788.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie contains various patches to rework how firmware discovery and
feature detection is done and allow to have a more fine granular
filtering of the calls we do or not to the firmware.

There is also a patch introducing the use of the "bit 15" convention
from the FF-A specification to distinguish between secure and non-secure
identifiers as Xen VM IDs cannot have bit 15 set.

Finally we introduce support for indirect messages and for that we
transmit the RXTX buffers to the SPMC and we put the message related
functions into their own source file.

Changes in v2:
- do not activate FF-A if firmware does not support i
- various clean up and small fixes explained in each patch
- rebase on top of latest staging

Bertrand Marquis (10):
  xen/arm: ffa: Rework firmware discovery
  xen/arm: ffa: Rework feature discovery
  xen/arm: ffa: Fix version negotiation
  xen/arm: ffa: Fine granular call support
  xen/arm: ffa: Rework partition info get
  xen/arm: ffa: Use bit 15 convention for SPs
  xen/arm: ffa: Transmit RXTX buffers to the SPMC
  xen/arm: ffa: move message function into ffa_msg.c
  xen/arm: ffa: Remove per VM notif_enabled
  xen/arm: ffa: Add indirect message support

 xen/arch/arm/tee/Makefile       |   1 +
 xen/arch/arm/tee/ffa.c          | 251 +++++++++++++++-----------------
 xen/arch/arm/tee/ffa_msg.c      | 129 ++++++++++++++++
 xen/arch/arm/tee/ffa_notif.c    |  17 +--
 xen/arch/arm/tee/ffa_partinfo.c | 230 ++++++++++++++++++++---------
 xen/arch/arm/tee/ffa_private.h  |  79 ++++++++--
 xen/arch/arm/tee/ffa_rxtx.c     | 162 +++++++++++++++++----
 xen/arch/arm/tee/ffa_shm.c      |  39 +++--
 8 files changed, 642 insertions(+), 266 deletions(-)
 create mode 100644 xen/arch/arm/tee/ffa_msg.c

-- 
2.47.0



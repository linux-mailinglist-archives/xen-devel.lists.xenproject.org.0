Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE18C97C8FC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 14:20:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800666.1210617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8G-0003lc-Pq; Thu, 19 Sep 2024 12:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800666.1210617; Thu, 19 Sep 2024 12:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8G-0003iT-Mu; Thu, 19 Sep 2024 12:19:36 +0000
Received: by outflank-mailman (input) for mailman id 800666;
 Thu, 19 Sep 2024 12:19:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lyjY=QR=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1srG8F-0003iL-8K
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 12:19:35 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6d1f1fa2-7681-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 14:19:33 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0CEA1007;
 Thu, 19 Sep 2024 05:20:01 -0700 (PDT)
Received: from C3HXLD123V.emea.arm.com (usa-sjc-mx-foss1.foss.arm.com
 [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 555BA3F64C;
 Thu, 19 Sep 2024 05:19:31 -0700 (PDT)
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
X-Inumbo-ID: 6d1f1fa2-7681-11ef-99a2-01e77a169b0f
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 00/10] xen/arm: ffa: Improvements and fixes
Date: Thu, 19 Sep 2024 14:19:00 +0200
Message-Id: <cover.1726676338.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

Bertrand Marquis (10):
  xen/arm: ffa: Rework firmware discovery
  xen/arm: ffa: Rework feature discovery
  xen/arm: ffa: fix version negociation
  xen/arm: ffa: Fine granular call support
  xen/arm: ffa: Rework partition info get
  xen/arm: ffa: Use bit 15 convention for SPs
  xen/arm: ffa: Transmit RXTX buffers to the SPMC
  xen/arm: ffa: move message function into ffa_msg.c
  xen/arm: ffa: Remove per VM notif_enabled
  xen/arm: ffa: Add indirect message support

 xen/arch/arm/tee/Makefile       |   1 +
 xen/arch/arm/tee/ffa.c          | 242 ++++++++++++++------------------
 xen/arch/arm/tee/ffa_msg.c      | 129 +++++++++++++++++
 xen/arch/arm/tee/ffa_notif.c    |  17 ++-
 xen/arch/arm/tee/ffa_partinfo.c | 230 +++++++++++++++++++++---------
 xen/arch/arm/tee/ffa_private.h  |  66 +++++++--
 xen/arch/arm/tee/ffa_rxtx.c     | 139 +++++++++++++++---
 xen/arch/arm/tee/ffa_shm.c      |  39 ++---
 8 files changed, 605 insertions(+), 258 deletions(-)
 create mode 100644 xen/arch/arm/tee/ffa_msg.c

-- 
2.39.5 (Apple Git-154)



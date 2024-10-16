Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D13D39A0550
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819760.1233259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10EX-0002vA-3y; Wed, 16 Oct 2024 09:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819760.1233259; Wed, 16 Oct 2024 09:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10EW-0002rT-VE; Wed, 16 Oct 2024 09:22:20 +0000
Received: by outflank-mailman (input) for mailman id 819760;
 Wed, 16 Oct 2024 09:22:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0z3=RM=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1t10EV-0001Po-69
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:22:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 2337074b-8ba0-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 11:22:17 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93092FEC;
 Wed, 16 Oct 2024 02:22:46 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.21.81])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5457F3F528;
 Wed, 16 Oct 2024 02:22:15 -0700 (PDT)
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
X-Inumbo-ID: 2337074b-8ba0-11ef-99a3-01e77a169b0f
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [RFC PATCH 0/4] FF-A VM to VM support
Date: Wed, 16 Oct 2024 11:21:54 +0200
Message-ID: <cover.1729069025.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC serie is a first proposal to enable VM to VM communications
through FF-A on Arm.
It is sent as an RFC because some aspects of this serie will need to be
discussed:
- How to control/configure which VM can communicate with which VM
- How to enable this without conflicting with Optee support
- Would a system communicating with Optee without FF-A but using FF-A to
  communicate between VM make any sense

One main feature missing from this serie is the support for memory
sharing or lending through FF-A. Implementing such a feature is raising
the question of how to cleanly have FF-A mem sharing living on the side
of Xen grantables.

This serie must be applied on top of [1] which introduces
some rework of FF-A support required by this patch serie.

!! This patch serie must no be merged !!

[1] https://lore.kernel.org/xen-devel/cover.1729066788.git.bertrand.marquis@arm.com/

Bertrand Marquis (4):
  xen/arm: ffa: Introduce VM to VM support
  xen/arm: ffa: Add buffer full notification support
  xen/arm: ffa: Add indirect message between VM
  xen/arm: ffa: Enable VM to VM without firmware

 xen/arch/arm/tee/Kconfig        |  11 +++
 xen/arch/arm/tee/ffa.c          |  11 +++
 xen/arch/arm/tee/ffa_msg.c      |  96 +++++++++++++++++++--
 xen/arch/arm/tee/ffa_notif.c    | 142 ++++++++++++++++++--------------
 xen/arch/arm/tee/ffa_partinfo.c | 137 ++++++++++++++++++++++++------
 xen/arch/arm/tee/ffa_private.h  |  25 ++++++
 6 files changed, 329 insertions(+), 93 deletions(-)

-- 
2.47.0



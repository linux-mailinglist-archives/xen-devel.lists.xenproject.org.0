Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD164A8B264
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 09:40:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955178.1348991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xNM-0005Lx-43; Wed, 16 Apr 2025 07:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955178.1348991; Wed, 16 Apr 2025 07:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xNM-0005J2-12; Wed, 16 Apr 2025 07:40:04 +0000
Received: by outflank-mailman (input) for mailman id 955178;
 Wed, 16 Apr 2025 07:40:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8b=XC=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1u4xNK-0004tR-6S
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 07:40:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 009e065d-1a96-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 09:40:01 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D26C152B;
 Wed, 16 Apr 2025 00:39:58 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.44.175])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E5FF3F66E;
 Wed, 16 Apr 2025 00:39:58 -0700 (PDT)
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
X-Inumbo-ID: 009e065d-1a96-11f0-9eaf-5ba50f476ded
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [PATCH v5 0/6] FF-A VM to VM support
Date: Wed, 16 Apr 2025 09:39:41 +0200
Message-ID: <cover.1744787720.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch serie adds support to use FF-A between VM for communications
using indirect messages.

It adds a Kconfig parameter to enable this feature and marks it as
experimental as for now there is no system to restrict communication
rights between VM using this system.

It also adds support to use VM to VM communications using FF-A even if
there is no firmware support for FF-A. As this feature enables FF-A
support in all cases, we also introduce a new command line parameter to
allow the user to force which tee is to be used between FF-A and Optee
to have a solution to enable optee support if FF-A VM to VM is enabled.

Changes since v4:
- fix typos and optimize command line parameter
- split VM to VM support in 2 patches to ease review
- organize ffa contexts in a chain list to be able to build the partinfo
  result without taking the global domain lock
- introduce a maximum number of SPs to prevent holding the CPU for too
  long during partinfo call
- use an atomic to store the number of FF-A VMs
- prevent potential overflows in indirect message handling
- fix copy bug in indirect message introduced in v4

Changes since v3:
- reintroduce firmare v1.0 support in partinfo
- fix a possible TOC/TOU issue in indirect message handling
- typos and small fixes

Changes since v2:
- Rework partition_info_get implementation
- Taint Xen and display a message when VM to VM is enabled
- Various fixes explained in each patch

Changes since v1 (rfc):
- add a tee command line parameter
- use IS_ENABLED instead of ifdef when possible
- rebase on latest staging


Bertrand Marquis (6):
  xen/arm: Create tee command line parameter
  xen/arm: ffa: Rework partinfo_get implementation
  xen/arm: ffa: Introduce VM to VM support
  xen/arm: ffa: Add buffer full notification support
  xen/arm: ffa: Add indirect message between VM
  xen/arm: ffa: Enable VM to VM without firmware

 docs/misc/xen-command-line.pandoc  |  14 ++
 xen/arch/arm/include/asm/tee/tee.h |   4 +
 xen/arch/arm/tee/Kconfig           |  11 ++
 xen/arch/arm/tee/ffa.c             |  69 ++++++-
 xen/arch/arm/tee/ffa_msg.c         | 115 ++++++++++--
 xen/arch/arm/tee/ffa_notif.c       | 140 +++++++-------
 xen/arch/arm/tee/ffa_partinfo.c    | 286 ++++++++++++++++++++---------
 xen/arch/arm/tee/ffa_private.h     | 153 ++++++++++++---
 xen/arch/arm/tee/tee.c             |  32 ++++
 9 files changed, 628 insertions(+), 196 deletions(-)

-- 
2.47.1



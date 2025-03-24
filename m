Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BCEA6DC25
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 14:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925580.1328451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twiEy-0008JP-45; Mon, 24 Mar 2025 13:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925580.1328451; Mon, 24 Mar 2025 13:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twiEy-0008HT-1S; Mon, 24 Mar 2025 13:53:20 +0000
Received: by outflank-mailman (input) for mailman id 925580;
 Mon, 24 Mar 2025 13:53:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDgH=WL=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1twiEw-0008HJ-Ib
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 13:53:18 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 563fb632-08b7-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 14:53:17 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C43B16F3;
 Mon, 24 Mar 2025 06:53:22 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.86.79])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17C823F58B;
 Mon, 24 Mar 2025 06:53:13 -0700 (PDT)
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
X-Inumbo-ID: 563fb632-08b7-11f0-9ea2-5ba50f476ded
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
Subject: [PATCH v4 0/5] FF-A VM to VM support
Date: Mon, 24 Mar 2025 14:52:58 +0100
Message-ID: <cover.1742824138.git.bertrand.marquis@arm.com>
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

Bertrand Marquis (5):
  xen/arm: Create tee command line parameter
  xen/arm: ffa: Introduce VM to VM support
  xen/arm: ffa: Add buffer full notification support
  xen/arm: ffa: Add indirect message between VM
  xen/arm: ffa: Enable VM to VM without firmware

 docs/misc/xen-command-line.pandoc  |  14 ++
 xen/arch/arm/include/asm/tee/tee.h |   4 +
 xen/arch/arm/tee/Kconfig           |  11 ++
 xen/arch/arm/tee/ffa.c             |  24 ++-
 xen/arch/arm/tee/ffa_msg.c         | 110 ++++++++++--
 xen/arch/arm/tee/ffa_notif.c       | 140 ++++++++-------
 xen/arch/arm/tee/ffa_partinfo.c    | 274 +++++++++++++++++++----------
 xen/arch/arm/tee/ffa_private.h     |  35 +++-
 xen/arch/arm/tee/tee.c             |  31 ++++
 9 files changed, 474 insertions(+), 169 deletions(-)

-- 
2.47.1



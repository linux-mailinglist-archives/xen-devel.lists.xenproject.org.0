Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B699E4E2218
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 09:22:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292787.497186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWDIH-0002CX-HP; Mon, 21 Mar 2022 08:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292787.497186; Mon, 21 Mar 2022 08:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWDIH-0002AQ-DN; Mon, 21 Mar 2022 08:21:37 +0000
Received: by outflank-mailman (input) for mailman id 292787;
 Mon, 21 Mar 2022 08:21:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0xq=UA=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nWDIG-0002AF-5g
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 08:21:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ea1ffe70-a8ef-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 09:21:32 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8803C1042;
 Mon, 21 Mar 2022 01:21:31 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.72.68])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1ACA03F73B;
 Mon, 21 Mar 2022 01:21:28 -0700 (PDT)
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
X-Inumbo-ID: ea1ffe70-a8ef-11ec-8fbc-03012f2f19d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/3] xen: Linker scripts synchronization
Date: Mon, 21 Mar 2022 09:21:11 +0100
Message-Id: <20220321082114.49953-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to do the first step towards linker scripts
synchronization. Linker scripts for arm and x86 share a lot of common
sections and in order to make the process of changing/improving/syncing
them, these sections shall be defined in just one place.

The first patch creates a header file to store the first portion of the
content mutual to both x86 and arm linker scripts. When populating this
file, we are taking an example from x86 script as it is more improved and
up-to-date.

The last two patches make use of the common macros in x86 and arm linker
scripts respectively.

Michal Orzel (3):
  xen: Introduce a header to store common linker scripts content
  x86: Make use of helpers defined in xen_lds.h
  xen/arm: Make use of helpers defined in xen_lds.h

 xen/arch/arm/xen.lds.S    |  37 ++++---------
 xen/arch/x86/xen.lds.S    |  86 +++-------------------------
 xen/include/xen/xen_lds.h | 114 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 134 insertions(+), 103 deletions(-)
 create mode 100644 xen/include/xen/xen_lds.h

-- 
2.25.1



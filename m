Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE28F4E3A0C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 09:03:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293306.498215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWZTi-0000Zq-NM; Tue, 22 Mar 2022 08:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293306.498215; Tue, 22 Mar 2022 08:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWZTi-0000XU-K3; Tue, 22 Mar 2022 08:02:54 +0000
Received: by outflank-mailman (input) for mailman id 293306;
 Tue, 22 Mar 2022 08:02:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKWw=UB=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nWZTg-0000XI-Sj
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 08:02:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 77b7bf35-a9b6-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 09:02:51 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D0AE106F;
 Tue, 22 Mar 2022 01:02:49 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.5.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 157C53F73D;
 Tue, 22 Mar 2022 01:02:46 -0700 (PDT)
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
X-Inumbo-ID: 77b7bf35-a9b6-11ec-8fbc-03012f2f19d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/2] xen: Linker scripts synchronization
Date: Tue, 22 Mar 2022 09:02:31 +0100
Message-Id: <20220322080233.53134-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to do the first step towards linker scripts
synchronization. Linker scripts for arm and x86 share a lot of common
sections and in order to make the process of changing/improving/syncing
them, these sections shall be defined in just one place.

The first patch creates an empty header file xen.lds.h to store the
constructs mutual to both x86 and arm linker scripts. It also includes
this header in the scripts.

The second patch populates xen.lds.h with the first portion of common
macros and replaces the original contructs with these helpers.

Michal Orzel (2):
  xen: Introduce a header to store common linker scripts content
  xen: Populate xen.lds.h and make use of its macros

 xen/arch/arm/xen.lds.S    |  38 +++++---------
 xen/arch/x86/xen.lds.S    |  79 +++-------------------------
 xen/include/xen/xen.lds.h | 108 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 129 insertions(+), 96 deletions(-)
 create mode 100644 xen/include/xen/xen.lds.h

-- 
2.25.1



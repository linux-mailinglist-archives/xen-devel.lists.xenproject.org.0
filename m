Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D066D8B729B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 13:10:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714729.1116030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1lMe-0003OC-Ph; Tue, 30 Apr 2024 11:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714729.1116030; Tue, 30 Apr 2024 11:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1lMe-0003Lo-MX; Tue, 30 Apr 2024 11:09:36 +0000
Received: by outflank-mailman (input) for mailman id 714729;
 Tue, 30 Apr 2024 11:09:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=efY1=MD=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1s1lMd-0003Lb-Di
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 11:09:35 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 1f033d20-06e2-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 13:09:33 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 842AC2F4;
 Tue, 30 Apr 2024 04:09:58 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9953B3F73F;
 Tue, 30 Apr 2024 04:09:30 -0700 (PDT)
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
X-Inumbo-ID: 1f033d20-06e2-11ef-b4bb-af5377834399
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	nicola.vetrini@bugseng.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/2] Fix MISRA regression about flexible array member not at the end
Date: Tue, 30 Apr 2024 12:09:20 +0100
Message-Id: <20240430110922.15052-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small serie is fixing a MISRA regression on the R1.1 due to the
introduction of a new interface that uses a flexible member array [1].

I've splitted the serie in two in order to keep the Linux imported code on a
single commit, the imported macro is later used in the second patch of the
serie.

[1] https://lore.kernel.org/all/8be082b6d22d61c0b14910680d3833a7@bugseng.com/

Luca Fancellu (2):
  xen/kernel.h: Import __struct_group from Linux
  xen/arm: Fix MISRA regression on R1.1, flexible array member not at
    the end

 xen/arch/arm/acpi/domain_build.c        |  2 +-
 xen/arch/arm/domain_build.c             |  6 +++---
 xen/arch/arm/include/asm/kernel.h       | 11 ++++++++++-
 xen/arch/arm/include/asm/setup.h        | 18 ++++++++++--------
 xen/arch/arm/include/asm/static-shmem.h | 12 ++++++++++++
 xen/arch/arm/static-shmem.c             | 19 +++++++++----------
 xen/include/xen/kernel.h                | 21 +++++++++++++++++++++
 7 files changed, 66 insertions(+), 23 deletions(-)

-- 
2.34.1



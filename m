Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 650864296AD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 20:16:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206468.362056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzpt-0008DI-7L; Mon, 11 Oct 2021 18:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206468.362056; Mon, 11 Oct 2021 18:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzpt-0008BP-4E; Mon, 11 Oct 2021 18:15:41 +0000
Received: by outflank-mailman (input) for mailman id 206468;
 Mon, 11 Oct 2021 18:15:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBe3=O7=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1mZzps-0008BJ-7y
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 18:15:40 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id fe94f0e7-52bc-4c00-bc63-9840758c8537;
 Mon, 11 Oct 2021 18:15:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3AB8101E;
 Mon, 11 Oct 2021 11:15:37 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 759BE3F66F;
 Mon, 11 Oct 2021 11:15:36 -0700 (PDT)
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
X-Inumbo-ID: fe94f0e7-52bc-4c00-bc63-9840758c8537
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 0/2] arm/efi: Add dom0less support to UEFI boot
Date: Mon, 11 Oct 2021 19:15:26 +0100
Message-Id: <20211011181528.17367-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

This serie introduces a way to start a dom0less setup when Xen is booting as EFI
application.
Using the device tree it's now possible to fetch from the disk and load in
memory all the modules needed to start any domU defined in the DT.
Dom0less for now is supported only by the arm architecture.

This serie was originally formed by 3 patch, the first one was merged.

Luca Fancellu (2):
  arm/efi: Use dom0less configuration when using EFI boot
  arm/efi: load dom0 modules from DT using UEFI

 docs/misc/arm/device-tree/booting.txt |  29 +++
 docs/misc/efi.pandoc                  | 261 ++++++++++++++++++++
 xen/arch/arm/efi/efi-boot.h           | 343 +++++++++++++++++++++++++-
 xen/common/efi/boot.c                 |  55 +++--
 4 files changed, 671 insertions(+), 17 deletions(-)

-- 
2.17.1



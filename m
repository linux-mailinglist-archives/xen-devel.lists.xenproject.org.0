Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEB341DC42
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 16:29:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199966.354311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVx3T-0004gx-Gn; Thu, 30 Sep 2021 14:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199966.354311; Thu, 30 Sep 2021 14:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVx3T-0004fA-Co; Thu, 30 Sep 2021 14:28:59 +0000
Received: by outflank-mailman (input) for mailman id 199966;
 Thu, 30 Sep 2021 14:28:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v5L4=OU=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1mVx3S-0004f4-5U
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 14:28:58 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id eafbac8d-1b5b-468a-86b5-7a6d6cd63ad6;
 Thu, 30 Sep 2021 14:28:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8BFD101E;
 Thu, 30 Sep 2021 07:28:55 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C9E33F70D;
 Thu, 30 Sep 2021 07:28:54 -0700 (PDT)
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
X-Inumbo-ID: eafbac8d-1b5b-468a-86b5-7a6d6cd63ad6
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
Subject: [PATCH v4 0/3] arm/efi: Add dom0less support to UEFI boot
Date: Thu, 30 Sep 2021 15:28:43 +0100
Message-Id: <20210930142846.13348-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

This serie introduces a way to start a dom0less setup when Xen is booting as EFI
application.
Using the device tree it's now possible to fetch from the disk and load in
memory all the modules needed to start any domU defined in the DT.
Dom0less for now is supported only by the arm architecture.

Luca Fancellu (3):
  arm/efi: Introduce xen,uefi-cfg-load DT property
  arm/efi: Use dom0less configuration when using EFI boot
  arm/efi: load dom0 modules from DT using UEFI

 docs/misc/arm/device-tree/booting.txt |  37 +++
 docs/misc/efi.pandoc                  | 263 ++++++++++++++++++
 xen/arch/arm/efi/efi-boot.h           | 372 +++++++++++++++++++++++++-
 xen/common/efi/boot.c                 |  62 +++--
 4 files changed, 709 insertions(+), 25 deletions(-)

-- 
2.17.1



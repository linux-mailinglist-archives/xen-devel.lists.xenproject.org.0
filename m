Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F3440C76A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 16:27:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187703.336662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQVrg-0002rE-AQ; Wed, 15 Sep 2021 14:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187703.336662; Wed, 15 Sep 2021 14:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQVrg-0002os-5L; Wed, 15 Sep 2021 14:26:20 +0000
Received: by outflank-mailman (input) for mailman id 187703;
 Wed, 15 Sep 2021 14:26:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Uy1=OF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1mQVre-0002og-0y
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 14:26:18 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4f1d0d06-97b8-4803-9b99-515ab2e6830a;
 Wed, 15 Sep 2021 14:26:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B4DD6D;
 Wed, 15 Sep 2021 07:26:15 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA4DC3F719;
 Wed, 15 Sep 2021 07:26:13 -0700 (PDT)
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
X-Inumbo-ID: 4f1d0d06-97b8-4803-9b99-515ab2e6830a
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
Subject: [PATCH 0/2] arm/efi: Add dom0less support to UEFI boot
Date: Wed, 15 Sep 2021 15:26:00 +0100
Message-Id: <20210915142602.42862-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

This serie introduces a way to start a dom0less setup when Xen is booting as EFI
application.
Using the device tree it's now possible to fetch from the disk and load in
memory all the modules needed to start any domU defined in the DT.
Dom0less for now is supported only by the arm architecture.

Luca Fancellu (2):
  xen/efi: Restrict check for DT boot modules on EFI boot
  arm/efi: Use dom0less configuration when using EFI boot

 docs/misc/efi.pandoc        |  37 +++++
 xen/arch/arm/efi/efi-boot.h | 274 +++++++++++++++++++++++++++++++++++-
 xen/common/efi/boot.c       |  20 ++-
 3 files changed, 322 insertions(+), 9 deletions(-)

-- 
2.17.1



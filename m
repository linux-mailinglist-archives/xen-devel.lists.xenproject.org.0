Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB86414B8A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 16:14:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192810.343456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT30c-0003aj-0W; Wed, 22 Sep 2021 14:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192810.343456; Wed, 22 Sep 2021 14:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT30b-0003YJ-SN; Wed, 22 Sep 2021 14:14:01 +0000
Received: by outflank-mailman (input) for mailman id 192810;
 Wed, 22 Sep 2021 14:14:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=btef=OM=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1mT30a-0003YB-I4
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 14:14:00 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 535f4784-9f84-486f-b3be-01e0f6f5be2a;
 Wed, 22 Sep 2021 14:13:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C6B5113E;
 Wed, 22 Sep 2021 07:13:58 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9C333F59C;
 Wed, 22 Sep 2021 07:13:56 -0700 (PDT)
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
X-Inumbo-ID: 535f4784-9f84-486f-b3be-01e0f6f5be2a
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/2] arm/efi: Add dom0less support to UEFI boot
Date: Wed, 22 Sep 2021 15:13:39 +0100
Message-Id: <20210922141341.42288-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

This serie introduces a way to start a dom0less setup when Xen is booting as EFI
application.
Using the device tree it's now possible to fetch from the disk and load in
memory all the modules needed to start any domU defined in the DT.
Dom0less for now is supported only by the arm architecture.

Luca Fancellu (2):
  arm/efi: Introduce uefi,cfg-load DT property
  arm/efi: Use dom0less configuration when using EFI boot

 docs/misc/arm/device-tree/booting.txt |  21 ++
 docs/misc/efi.pandoc                  | 205 ++++++++++++++++++
 xen/arch/arm/efi/efi-boot.h           | 285 +++++++++++++++++++++++++-
 xen/arch/x86/efi/efi-boot.h           |   6 +
 xen/common/efi/boot.c                 |  36 ++--
 5 files changed, 533 insertions(+), 20 deletions(-)

-- 
2.17.1



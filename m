Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B8143488D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 12:06:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213759.372078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md8Tn-0007fR-Pw; Wed, 20 Oct 2021 10:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213759.372078; Wed, 20 Oct 2021 10:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md8Tn-0007de-Mo; Wed, 20 Oct 2021 10:05:51 +0000
Received: by outflank-mailman (input) for mailman id 213759;
 Wed, 20 Oct 2021 10:05:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=faDG=PI=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1md8Tm-0007dY-OL
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 10:05:50 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4d65871e-318d-11ec-8336-12813bfff9fa;
 Wed, 20 Oct 2021 10:05:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5A59ED1;
 Wed, 20 Oct 2021 03:05:49 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 423B03F70D;
 Wed, 20 Oct 2021 03:05:48 -0700 (PDT)
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
X-Inumbo-ID: 4d65871e-318d-11ec-8336-12813bfff9fa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Oleksandr_Andrushchenko@epam.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v3 0/1] Fixes: PCI devices passthrough on Arm
Date: Wed, 20 Oct 2021 11:05:36 +0100
Message-Id: <cover.1634723903.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch serie is a follow-up after various findings on d59168dc05
("xen/arm: Enable the existing x86 virtual PCI support for ARM") as of
agreed in [1].

It does the following:
- enable vpci_add_handlers on x86 and not only on arm
- remove __hwdom_init flag for vpci_add_handlers
- add missing vpci handler cleanup in error path during pci_device_add
  and pci_device_remove

[1] https://marc.info/?l=xen-devel&m=163455502020100&w=2

In the second version of the serie, the 3 patches have been merged into
one single patch.

Bertrand Marquis (1):
  xen/pci: Install vpci handlers on x86 and fix error paths

 xen/arch/arm/xen.lds.S        |  9 +--------
 xen/arch/x86/xen.lds.S        |  9 +--------
 xen/drivers/passthrough/pci.c | 14 ++++++++------
 xen/drivers/vpci/vpci.c       |  8 +++++++-
 xen/include/xen/vpci.h        |  2 ++
 5 files changed, 19 insertions(+), 23 deletions(-)

-- 
2.25.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EBE4333B9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 12:41:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212954.371023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmYm-00008e-Cg; Tue, 19 Oct 2021 10:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212954.371023; Tue, 19 Oct 2021 10:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmYm-0008WK-8M; Tue, 19 Oct 2021 10:41:32 +0000
Received: by outflank-mailman (input) for mailman id 212954;
 Tue, 19 Oct 2021 10:41:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJzt=PH=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mcmYj-0008TT-PC
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 10:41:29 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4b155b7f-cf77-4c6e-8dc9-7daa486107ab;
 Tue, 19 Oct 2021 10:41:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A563AD6E;
 Tue, 19 Oct 2021 03:41:27 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FA733F70D;
 Tue, 19 Oct 2021 03:41:26 -0700 (PDT)
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
X-Inumbo-ID: 4b155b7f-cf77-4c6e-8dc9-7daa486107ab
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	sstabellini@kernel.org,
	Oleksandr_Andrushchenko@epam.com,
	jbeulich@suse.com,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/3] Fixes: PCI devices passthrough on Arm
Date: Tue, 19 Oct 2021 11:40:32 +0100
Message-Id: <cover.1634639117.git.bertrand.marquis@arm.com>
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

Bertrand Marquis (3):
  xen/arm: call vpci_add_handlers on x86
  xen/vpci: Remove __hwdom_init for vpci_add_handlers
  xen/pci: Add missing vpci handler cleanup

 xen/drivers/passthrough/pci.c | 8 ++------
 xen/drivers/vpci/vpci.c       | 2 +-
 xen/include/xen/vpci.h        | 2 ++
 3 files changed, 5 insertions(+), 7 deletions(-)

-- 
2.25.1



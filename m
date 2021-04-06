Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84041355279
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 13:40:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105900.202527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTk4G-0000i0-Du; Tue, 06 Apr 2021 11:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105900.202527; Tue, 06 Apr 2021 11:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTk4G-0000hd-A9; Tue, 06 Apr 2021 11:40:24 +0000
Received: by outflank-mailman (input) for mailman id 105900;
 Tue, 06 Apr 2021 11:40:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7nR=JD=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lTk4E-0000hY-68
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 11:40:22 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ebb855a6-5be2-43a7-b0c5-0957f7b68ff5;
 Tue, 06 Apr 2021 11:40:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 666141042;
 Tue,  6 Apr 2021 04:40:20 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B74F23F73D;
 Tue,  6 Apr 2021 04:40:18 -0700 (PDT)
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
X-Inumbo-ID: ebb855a6-5be2-43a7-b0c5-0957f7b68ff5
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH 0/2] xen/pci: Make PCI passthrough code non-x86 specific
Date: Tue,  6 Apr 2021 12:39:09 +0100
Message-Id: <cover.1617702520.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1

This patch series is preparatory work to implement the PCI passthrough support
for the ARM architecture.

Rahul Singh (2):
  xen/pci: Move PCI ATS code to common directory
  xen/pci: Gate all MSI code in common code with CONFIG_HAS_PCI_MSI

 xen/drivers/passthrough/Makefile        |  1 +
 xen/drivers/passthrough/{x86 => }/ats.c |  2 +-
 xen/drivers/passthrough/pci.c           | 17 +++++++++++++++++
 xen/drivers/passthrough/x86/Makefile    |  1 -
 xen/drivers/pci/Kconfig                 |  4 ++++
 xen/drivers/vpci/Makefile               |  3 ++-
 xen/drivers/vpci/header.c               |  6 ++++++
 xen/drivers/vpci/vpci.c                 |  2 ++
 xen/include/xen/vpci.h                  |  4 ++++
 xen/xsm/flask/hooks.c                   |  6 +++---
 10 files changed, 40 insertions(+), 6 deletions(-)
 rename xen/drivers/passthrough/{x86 => }/ats.c (99%)

-- 
2.17.1



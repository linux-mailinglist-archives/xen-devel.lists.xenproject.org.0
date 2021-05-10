Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 718193792FB
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 17:48:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125342.235933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg88C-0004kB-Ld; Mon, 10 May 2021 15:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125342.235933; Mon, 10 May 2021 15:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg88C-0004iK-If; Mon, 10 May 2021 15:47:40 +0000
Received: by outflank-mailman (input) for mailman id 125342;
 Mon, 10 May 2021 15:47:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JfCf=KF=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lg88B-0004iE-6X
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 15:47:39 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0a22bc61-3b23-4cde-bcba-7184bf5cb9e5;
 Mon, 10 May 2021 15:47:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6FFF168F;
 Mon, 10 May 2021 08:47:37 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FC853F73B;
 Mon, 10 May 2021 08:47:35 -0700 (PDT)
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
X-Inumbo-ID: 0a22bc61-3b23-4cde-bcba-7184bf5cb9e5
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v5 0/2] xen/pci: Make PCI passthrough code non-x86 specific
Date: Mon, 10 May 2021 16:47:25 +0100
Message-Id: <cover.1620661205.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1

This patch series is preparatory work to implement the PCI passthrough support
for the ARM architecture.

Rahul Singh (2):
  xen/pci: Refactor PCI MSI intercept related code
  xen/pci: Refactor MSI code that implements MSI functionality within
    XEN

 xen/arch/x86/Kconfig                    |  1 +
 xen/drivers/passthrough/Makefile        |  1 +
 xen/drivers/passthrough/msi-intercept.c | 96 +++++++++++++++++++++++++
 xen/drivers/passthrough/pci.c           | 54 ++++----------
 xen/drivers/pci/Kconfig                 |  4 ++
 xen/drivers/vpci/Makefile               |  3 +-
 xen/drivers/vpci/header.c               | 19 ++---
 xen/drivers/vpci/msix.c                 | 54 ++++++++++++++
 xen/drivers/vpci/vpci.c                 |  3 +-
 xen/include/xen/msi-intercept.h         | 57 +++++++++++++++
 xen/include/xen/pci.h                   | 11 +--
 xen/include/xen/vpci.h                  | 43 +++++------
 xen/xsm/flask/hooks.c                   |  8 +--
 13 files changed, 262 insertions(+), 92 deletions(-)
 create mode 100644 xen/drivers/passthrough/msi-intercept.c
 create mode 100644 xen/include/xen/msi-intercept.h

-- 
2.17.1



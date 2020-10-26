Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC44929938F
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 18:18:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12474.32478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX68O-000305-Kd; Mon, 26 Oct 2020 17:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12474.32478; Mon, 26 Oct 2020 17:18:16 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX68O-0002zg-HQ; Mon, 26 Oct 2020 17:18:16 +0000
Received: by outflank-mailman (input) for mailman id 12474;
 Mon, 26 Oct 2020 17:18:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Yhc=EB=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kX68M-0002zb-VF
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:18:14 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id dfc9d755-f9ee-44c1-adf9-49016fcff8c9;
 Mon, 26 Oct 2020 17:18:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF93B139F;
 Mon, 26 Oct 2020 10:18:12 -0700 (PDT)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 491973F719;
 Mon, 26 Oct 2020 10:18:11 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0Yhc=EB=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kX68M-0002zb-VF
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:18:14 +0000
X-Inumbo-ID: dfc9d755-f9ee-44c1-adf9-49016fcff8c9
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id dfc9d755-f9ee-44c1-adf9-49016fcff8c9;
	Mon, 26 Oct 2020 17:18:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF93B139F;
	Mon, 26 Oct 2020 10:18:12 -0700 (PDT)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 491973F719;
	Mon, 26 Oct 2020 10:18:11 -0700 (PDT)
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v1 0/4] xen/arm: Make PCI passthrough code non-x86 specific
Date: Mon, 26 Oct 2020 17:17:50 +0000
Message-Id: <cover.1603731279.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1

This patch series is preparatory work to make PCI passthrough code non-x86
specific.

Rahul Singh (4):
  xen/ns16550: solve compilation error on ARM with CONFIG_HAS_PCI
    enabled.
  xen/pci: Introduce new CONFIG_HAS_PCI_ATS flag for PCI ATS
    functionality.
  xen/pci: Move x86 specific code to x86 directory.
  xen/pci: solve compilation error when memory paging is not enabled.

 xen/arch/x86/Kconfig                     |  1 +
 xen/drivers/char/Kconfig                 |  7 ++
 xen/drivers/char/ns16550.c               | 32 ++++----
 xen/drivers/passthrough/ats.h            | 24 ++++++
 xen/drivers/passthrough/pci.c            | 79 +------------------
 xen/drivers/passthrough/vtd/x86/Makefile |  2 +-
 xen/drivers/passthrough/x86/Makefile     |  3 +-
 xen/drivers/passthrough/x86/iommu.c      |  7 ++
 xen/drivers/passthrough/x86/pci.c        | 97 ++++++++++++++++++++++++
 xen/drivers/pci/Kconfig                  |  3 +
 xen/include/xen/pci.h                    |  2 +
 11 files changed, 164 insertions(+), 93 deletions(-)
 create mode 100644 xen/drivers/passthrough/x86/pci.c

-- 
2.17.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151402A4A89
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 17:00:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18392.43408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZyii-000784-PY; Tue, 03 Nov 2020 15:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18392.43408; Tue, 03 Nov 2020 15:59:40 +0000
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
	id 1kZyii-00077f-Ly; Tue, 03 Nov 2020 15:59:40 +0000
Received: by outflank-mailman (input) for mailman id 18392;
 Tue, 03 Nov 2020 15:59:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RC30=EJ=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kZyig-00077Z-KO
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 15:59:38 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 21a9fa7f-4dfe-4447-b9c0-09a10e142c63;
 Tue, 03 Nov 2020 15:59:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D491139F;
 Tue,  3 Nov 2020 07:59:36 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BFAE3F66E;
 Tue,  3 Nov 2020 07:59:35 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=RC30=EJ=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kZyig-00077Z-KO
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 15:59:38 +0000
X-Inumbo-ID: 21a9fa7f-4dfe-4447-b9c0-09a10e142c63
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 21a9fa7f-4dfe-4447-b9c0-09a10e142c63;
	Tue, 03 Nov 2020 15:59:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D491139F;
	Tue,  3 Nov 2020 07:59:36 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BFAE3F66E;
	Tue,  3 Nov 2020 07:59:35 -0800 (PST)
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2 0/4] xen/arm: Make PCI passthrough code non-x86 specific
Date: Tue,  3 Nov 2020 15:59:11 +0000
Message-Id: <cover.1604417224.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1

This patch series is v2 of preparatory work to make PCI passthrough code
non-x86 specific.

Rahul Singh (4):
  xen/ns16550: solve compilation error on ARM with CONFIG_HAS_PCI
    enabled.
  xen/pci: Introduce new CONFIG_PCI_ATS flag for PCI ATS functionality.
  xen/pci: Move x86 specific code to x86 directory.
  xen/pci: solve compilation error on ARM with HAS_PCI enabled.

 xen/drivers/char/Kconfig             |  7 +++
 xen/drivers/char/ns16550.c           | 32 +++++-----
 xen/drivers/passthrough/ats.h        | 26 ++++++++
 xen/drivers/passthrough/pci.c        | 84 +------------------------
 xen/drivers/passthrough/x86/Makefile |  3 +-
 xen/drivers/passthrough/x86/iommu.c  | 20 ++++++
 xen/drivers/passthrough/x86/pci.c    | 91 ++++++++++++++++++++++++++++
 xen/drivers/pci/Kconfig              |  9 +++
 xen/include/xen/iommu.h              |  2 +
 xen/include/xen/pci.h                |  2 +
 10 files changed, 177 insertions(+), 99 deletions(-)
 create mode 100644 xen/drivers/passthrough/x86/pci.c

-- 
2.17.1



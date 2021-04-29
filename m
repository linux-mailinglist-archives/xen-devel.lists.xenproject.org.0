Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A686736EC9B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 16:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120077.227061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc7wc-0001wI-Qw; Thu, 29 Apr 2021 14:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120077.227061; Thu, 29 Apr 2021 14:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc7wc-0001vt-N7; Thu, 29 Apr 2021 14:47:10 +0000
Received: by outflank-mailman (input) for mailman id 120077;
 Thu, 29 Apr 2021 14:47:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKbL=J2=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lc7wa-0001vo-EM
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 14:47:08 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 356d9e51-bb3c-4020-b062-c28ea55e641f;
 Thu, 29 Apr 2021 14:47:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B794A1FB;
 Thu, 29 Apr 2021 07:47:05 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D4293F73B;
 Thu, 29 Apr 2021 07:47:03 -0700 (PDT)
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
X-Inumbo-ID: 356d9e51-bb3c-4020-b062-c28ea55e641f
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v4 0/3] xen/pci: Make PCI passthrough code non-x86 specific
Date: Thu, 29 Apr 2021 15:46:50 +0100
Message-Id: <cover.1619707144.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1

This patch series is preparatory work to implement the PCI passthrough support
for the ARM architecture.

Rahul Singh (3):
  xen/iommu: Move iommu_update_ire_from_msi(..) to xen/iommu.h
  xen/pci: Refactor PCI MSI intercept related code
  xen/pci: Refactor MSI code that implements MSI functionality within
    XEN

 xen/arch/x86/Kconfig                    |  1 +
 xen/drivers/passthrough/Makefile        |  1 +
 xen/drivers/passthrough/msi-intercept.c | 94 +++++++++++++++++++++++++
 xen/drivers/passthrough/pci.c           | 61 ++++------------
 xen/drivers/pci/Kconfig                 |  4 ++
 xen/drivers/vpci/Makefile               |  3 +-
 xen/drivers/vpci/header.c               | 19 ++---
 xen/drivers/vpci/msix.c                 | 55 +++++++++++++++
 xen/drivers/vpci/vpci.c                 |  3 +-
 xen/include/xen/iommu.h                 | 13 +++-
 xen/include/xen/msi-intercept.h         | 56 +++++++++++++++
 xen/include/xen/pci.h                   | 11 +--
 xen/include/xen/vpci.h                  | 41 +++++------
 xen/xsm/flask/hooks.c                   |  8 +--
 14 files changed, 270 insertions(+), 100 deletions(-)
 create mode 100644 xen/drivers/passthrough/msi-intercept.c
 create mode 100644 xen/include/xen/msi-intercept.h

-- 
2.17.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200274B6FAF
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 16:25:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273309.468444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzhv-0000i1-3J; Tue, 15 Feb 2022 15:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273309.468444; Tue, 15 Feb 2022 15:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzhv-0000fX-0P; Tue, 15 Feb 2022 15:25:35 +0000
Received: by outflank-mailman (input) for mailman id 273309;
 Tue, 15 Feb 2022 15:25:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ8a=S6=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1nJzht-0000fR-HH
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 15:25:33 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 834485fc-8e73-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 16:25:32 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 305511396;
 Tue, 15 Feb 2022 07:25:31 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E06133F66F;
 Tue, 15 Feb 2022 07:25:29 -0800 (PST)
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
X-Inumbo-ID: 834485fc-8e73-11ec-8eb8-a37418f5ba1a
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] xen/vpci: msix: Make VPCI MSI-X code non-x86 specific
Date: Tue, 15 Feb 2022 15:25:15 +0000
Message-Id: <cover.1644937405.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is v2 of preparatory work to make VPCI MSI-X code non-x86
specific.

Rahul Singh (3):
  xen/vpci: msix: move x86 specific code to x86 file
  xen/vpci: msix: change return value of vpci_msix_{read,write}
  xen/vpci: msix: move read/write call to MSI-X PBA entry to arch file

 xen/arch/x86/hvm/vmsi.c             | 155 +++++++++++++++++++++++++++
 xen/arch/x86/include/asm/msi.h      |  28 -----
 xen/arch/x86/msi.c                  |   2 +-
 xen/drivers/passthrough/amd/iommu.h |   1 +
 xen/drivers/vpci/msi.c              |   3 +-
 xen/drivers/vpci/msix.c             | 158 +++-------------------------
 xen/include/xen/msi.h               |  28 +++++
 xen/include/xen/vpci.h              |  19 ++++
 8 files changed, 222 insertions(+), 172 deletions(-)

-- 
2.25.1



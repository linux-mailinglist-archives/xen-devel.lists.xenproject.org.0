Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F2D2B43A1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 13:25:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27882.56473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kedZt-0001cj-IF; Mon, 16 Nov 2020 12:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27882.56473; Mon, 16 Nov 2020 12:25:49 +0000
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
	id 1kedZt-0001cK-FE; Mon, 16 Nov 2020 12:25:49 +0000
Received: by outflank-mailman (input) for mailman id 27882;
 Mon, 16 Nov 2020 12:25:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+iU=EW=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kedZs-0001cF-1O
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 12:25:48 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id cdd74c7c-d060-4720-88b2-f346a4a63bac;
 Mon, 16 Nov 2020 12:25:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8FDF101E;
 Mon, 16 Nov 2020 04:25:46 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E4D93F70D;
 Mon, 16 Nov 2020 04:25:45 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3+iU=EW=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kedZs-0001cF-1O
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 12:25:48 +0000
X-Inumbo-ID: cdd74c7c-d060-4720-88b2-f346a4a63bac
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id cdd74c7c-d060-4720-88b2-f346a4a63bac;
	Mon, 16 Nov 2020 12:25:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8FDF101E;
	Mon, 16 Nov 2020 04:25:46 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E4D93F70D;
	Mon, 16 Nov 2020 04:25:45 -0800 (PST)
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
	Paul Durrant <paul@xen.org>
Subject: [PATCH v3 0/3]  xen/arm: Make PCI passthrough code non-x86 specific
Date: Mon, 16 Nov 2020 12:25:15 +0000
Message-Id: <cover.1605527997.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1

This patch series is v3 of preparatory work to make PCI passthrough code
non-x86 specific.

Rahul Singh (3):
  xen/ns16550: Make ns16550 driver usable on ARM with HAS_PCI enabled.
  xen/pci: Move x86 specific code to x86 directory.
  xen/pci: solve compilation error on ARM with HAS_PCI enabled.

 xen/drivers/char/Kconfig                    |  4 +
 xen/drivers/char/ns16550.c                  | 32 ++++----
 xen/drivers/passthrough/Makefile            |  3 -
 xen/drivers/passthrough/pci.c               | 86 +--------------------
 xen/drivers/passthrough/x86/Makefile        |  1 +
 xen/drivers/passthrough/{io.c => x86/hvm.c} | 66 ++++++++++++++++
 xen/drivers/passthrough/x86/iommu.c         | 19 +++++
 xen/include/xen/iommu.h                     |  2 +
 xen/include/xen/pci.h                       |  2 +
 9 files changed, 112 insertions(+), 103 deletions(-)
 rename xen/drivers/passthrough/{io.c => x86/hvm.c} (95%)

-- 
2.17.1



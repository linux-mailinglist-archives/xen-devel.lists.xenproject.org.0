Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF67D2C4763
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 19:17:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37950.70544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khzLQ-0001PT-Nq; Wed, 25 Nov 2020 18:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37950.70544; Wed, 25 Nov 2020 18:16:44 +0000
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
	id 1khzLQ-0001P4-KL; Wed, 25 Nov 2020 18:16:44 +0000
Received: by outflank-mailman (input) for mailman id 37950;
 Wed, 25 Nov 2020 18:16:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqAN=E7=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1khzLP-0001Oz-Dz
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 18:16:43 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f9eaebbc-03ee-46ce-9302-0670bb0b5b97;
 Wed, 25 Nov 2020 18:16:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06C4811D4;
 Wed, 25 Nov 2020 10:16:41 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9138B3F23F;
 Wed, 25 Nov 2020 10:16:39 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MqAN=E7=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1khzLP-0001Oz-Dz
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 18:16:43 +0000
X-Inumbo-ID: f9eaebbc-03ee-46ce-9302-0670bb0b5b97
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id f9eaebbc-03ee-46ce-9302-0670bb0b5b97;
	Wed, 25 Nov 2020 18:16:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06C4811D4;
	Wed, 25 Nov 2020 10:16:41 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9138B3F23F;
	Wed, 25 Nov 2020 10:16:39 -0800 (PST)
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
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 0/3] xen/arm: Make PCI passthrough code non-x86 specific
Date: Wed, 25 Nov 2020 18:16:01 +0000
Message-Id: <cover.1606326929.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series is v4 of preparatory work to make PCI passthrough code
non-x86 specific.

Rahul Singh (3):
  xen/pci: Move x86 specific code to x86 directory.
  xen/pci: solve compilation error on ARM with HAS_PCI enabled.
  ns16550: Gate all PCI code with CONFIG_X86

 xen/drivers/char/ns16550.c                  | 16 ++---
 xen/drivers/passthrough/Makefile            |  3 -
 xen/drivers/passthrough/pci.c               | 79 +--------------------
 xen/drivers/passthrough/x86/Makefile        |  1 +
 xen/drivers/passthrough/{io.c => x86/hvm.c} | 66 +++++++++++++++++
 xen/drivers/passthrough/x86/iommu.c         | 13 ++++
 xen/include/xen/iommu.h                     |  2 +
 xen/include/xen/pci.h                       |  9 +++
 8 files changed, 101 insertions(+), 88 deletions(-)
 rename xen/drivers/passthrough/{io.c => x86/hvm.c} (95%)

-- 
2.17.1



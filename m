Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A9035C463
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 12:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108959.207943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVuBk-0000iH-9b; Mon, 12 Apr 2021 10:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108959.207943; Mon, 12 Apr 2021 10:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVuBk-0000hs-69; Mon, 12 Apr 2021 10:53:04 +0000
Received: by outflank-mailman (input) for mailman id 108959;
 Mon, 12 Apr 2021 10:53:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VKKJ=JJ=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lVuBj-0000hn-2G
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 10:53:03 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f81b5f68-9c6b-4dd9-b793-ecdbe4df2bb2;
 Mon, 12 Apr 2021 10:53:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25F2D31B;
 Mon, 12 Apr 2021 03:53:01 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C7E83F694;
 Mon, 12 Apr 2021 03:52:59 -0700 (PDT)
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
X-Inumbo-ID: f81b5f68-9c6b-4dd9-b793-ecdbe4df2bb2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v3 0/4] xen/arm: Prevent Dom0 to be loaded when using dom0less
Date: Mon, 12 Apr 2021 11:52:39 +0100
Message-Id: <20210412105243.23354-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

This is the v2 of xen/arm: Prevent Dom0 to be loaded when using dom0less
previously pushed.

The aim of this serie is to prevent the creation and run of the domain 0 (Dom0)
when the system configuration to be used is dom0less, that is when the device
tree declares at least one domU and no Dom0.

Changes in v2 are:
 - Moving the dom0 creation in a proper function
 - Handle the case of having an hardware_domain NULL
 - Be sure that the domain id 0 is never allocated
 - Modify documentation about dom0less

Changes in v3: minor fixes explained in each patches

Luca Fancellu (4):
  xen/arm: Move dom0 creation in domain_build.c
  xen/arm: Handle cases when hardware_domain is NULL
  xen/arm: Reserve domid 0 for Dom0
  xen/arm: Prevent Dom0 to be loaded when using dom0less

 docs/features/dom0less.pandoc            |  7 +--
 xen/arch/arm/domain_build.c              | 43 ++++++++++++++-
 xen/arch/arm/irq.c                       |  2 +-
 xen/arch/arm/setup.c                     | 69 +++++++++++++-----------
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |  2 +-
 xen/drivers/passthrough/arm/smmu-v3.c    |  2 +-
 xen/drivers/passthrough/arm/smmu.c       |  2 +-
 xen/include/asm-arm/domain.h             |  2 +-
 xen/include/asm-arm/setup.h              |  2 +-
 xen/include/xen/sched.h                  |  3 ++
 10 files changed, 94 insertions(+), 40 deletions(-)

-- 
2.17.1



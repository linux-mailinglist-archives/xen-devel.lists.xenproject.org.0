Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 336F0602E5F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 16:24:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425043.672799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oknVg-0006VP-9n; Tue, 18 Oct 2022 14:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425043.672799; Tue, 18 Oct 2022 14:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oknVg-0006Se-73; Tue, 18 Oct 2022 14:24:00 +0000
Received: by outflank-mailman (input) for mailman id 425043;
 Tue, 18 Oct 2022 14:23:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+Ts=2T=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oknVf-0006SY-10
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 14:23:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 804caa8f-4ef0-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 16:23:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C29E2113E;
 Tue, 18 Oct 2022 07:24:02 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 789603F792;
 Tue, 18 Oct 2022 07:23:54 -0700 (PDT)
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
X-Inumbo-ID: 804caa8f-4ef0-11ed-91b4-6bf2151ebd3b
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 0/2] arm/p2m: XSA-409 fix
Date: Tue, 18 Oct 2022 14:23:44 +0000
Message-Id: <20221018142346.52272-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1

This series contains:

1. The first patch from Andrew that reworks p2m_init() so that
fallible operations in p2m_init() will not lead to leakage of VMID
or the root table.
2. The patch in [1] rebased on top of the p2m_init() rework that
populate default 16 pages to the p2m pool for the mapping of GICv2
at the domain creation stage.

[1] https://lore.kernel.org/xen-devel/20221017165133.17066-1-Henry.Wang@arm.com/

Andrew Cooper (1):
  arm/p2m: Rework p2m_init()

Henry Wang (1):
  xen/arm: p2m: Populate pages for GICv2 mapping in p2m_init()

 xen/arch/arm/domain.c          |  2 +-
 xen/arch/arm/include/asm/p2m.h | 14 +++++---
 xen/arch/arm/p2m.c             | 58 ++++++++++++++++++++++++++--------
 3 files changed, 55 insertions(+), 19 deletions(-)

-- 
2.17.1



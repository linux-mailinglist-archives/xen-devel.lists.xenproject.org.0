Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2F67CDF47
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 16:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618594.962435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7Nx-0005Fp-Q2; Wed, 18 Oct 2023 14:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618594.962435; Wed, 18 Oct 2023 14:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7Nx-0005E1-Lc; Wed, 18 Oct 2023 14:18:57 +0000
Received: by outflank-mailman (input) for mailman id 618594;
 Wed, 18 Oct 2023 14:18:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7etD=GA=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qt7Nw-0004vw-Az
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 14:18:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44b87780-6dc1-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 16:18:54 +0200 (CEST)
Received: from beta.station (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id 8F5DB4EE0739;
 Wed, 18 Oct 2023 16:18:53 +0200 (CEST)
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
X-Inumbo-ID: 44b87780-6dc1-11ee-9b0e-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [XEN PATCH 0/4][for-4.19] xen: address violations of Rule 13.1
Date: Wed, 18 Oct 2023 16:18:47 +0200
Message-Id: <cover.1697638210.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains some changes and deviation to address
reports of MISRA C:2012 Rule 13.1:
Initializer lists shall not contain persistent side effects

Some expressions with side-effects have been moved outside the
initializer lists, others have been deviated.

Function calls do not necessarily have side-effects, in these cases this
path propose to add GCC pure or const attributes whenever possible.

Function attributes pure and const do not need to be added as GCC
attributes, they can be added using ECLAIR configurations.

Simone Ballarin (4):
  xen/arm: address violations of MISRA C:2012 Rule 13.1
  automation/eclair: add deviations and call properties.
  xen/include: add pure and const attributes
  xen: address violations of MISRA C:2012 Rule 13.1

 .../eclair_analysis/ECLAIR/call_properties.ecl   | 10 ++++++++++
 automation/eclair_analysis/ECLAIR/deviations.ecl | 13 +++++++++++++
 docs/misra/deviations.rst                        | 11 +++++++++++
 xen/arch/arm/device.c                            |  6 +++---
 xen/arch/arm/guestcopy.c                         | 12 ++++++++----
 xen/arch/arm/include/asm/current.h               |  2 +-
 xen/common/sched/core.c                          | 16 ++++++++++++----
 xen/drivers/char/ns16550.c                       |  4 +++-
 xen/include/xen/pdx.h                            |  2 +-
 xen/include/xen/typesafe.h                       |  4 ++--
 10 files changed, 64 insertions(+), 16 deletions(-)

-- 
2.34.1



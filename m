Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 416978B223F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 15:11:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712058.1112439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzyst-00089g-Cw; Thu, 25 Apr 2024 13:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712058.1112439; Thu, 25 Apr 2024 13:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzyst-00086z-9o; Thu, 25 Apr 2024 13:11:31 +0000
Received: by outflank-mailman (input) for mailman id 712058;
 Thu, 25 Apr 2024 13:11:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c2YU=L6=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rzyss-00086c-0S
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 13:11:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 53a5d98b-0305-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 15:11:28 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 409821007;
 Thu, 25 Apr 2024 06:11:56 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FBFB3F7BD;
 Thu, 25 Apr 2024 06:11:27 -0700 (PDT)
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
X-Inumbo-ID: 53a5d98b-0305-11ef-909a-e314d9c70b13
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 0/2] xen/arm: Remove recursion from dt_unreserved_regions
Date: Thu, 25 Apr 2024 14:11:17 +0100
Message-Id: <20240425131119.2299629-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, this is an RFC that is exploiting the new 'struct membank' interface
introduced here 2209c1e35b479dff8ed3d3161001ffdefa0a704e ("xen/arm: Introduce a
generic way to access memory bank structures") to start removing recursion
from some function, in this serie the dt_unreserved_regions is reworked for
that reason.

This is an RFC to understand if the proposed approach can be accepted.

Another function can benefit from this approach, consider_modules in
arm32/mmu/mm.c, but it might require to rework also the 'struct bootmodules'
to adhere to the new interface and have just a loop that can go through all the
different structures.

Comments are welcome.

Luca Fancellu (2):
  xen/arm: Add DT reserve map regions to bootinfo.reserved_mem
  xen/arm: Rework dt_unreserved_regions to avoid recursion

 xen/arch/arm/arm32/mmu/mm.c             |  29 +----
 xen/arch/arm/bootfdt.c                  |  51 +++++---
 xen/arch/arm/domain_build.c             |   3 +-
 xen/arch/arm/include/asm/setup.h        |  13 +-
 xen/arch/arm/include/asm/static-shmem.h |   7 +-
 xen/arch/arm/kernel.c                   |   2 +-
 xen/arch/arm/setup.c                    | 158 +++++++++++++-----------
 7 files changed, 135 insertions(+), 128 deletions(-)

-- 
2.34.1



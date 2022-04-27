Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BD3511472
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314679.532859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeJ2-00088V-SZ; Wed, 27 Apr 2022 09:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314679.532859; Wed, 27 Apr 2022 09:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeJ2-000868-PC; Wed, 27 Apr 2022 09:49:56 +0000
Received: by outflank-mailman (input) for mailman id 314679;
 Wed, 27 Apr 2022 09:49:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTRx=VF=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1njeJ1-00085x-6a
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:49:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6317100a-c60f-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 11:49:53 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A693A1480;
 Wed, 27 Apr 2022 02:49:52 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.13.174])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0037A3F774;
 Wed, 27 Apr 2022 02:49:49 -0700 (PDT)
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
X-Inumbo-ID: 6317100a-c60f-11ec-a405-831a346695d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 0/8] xen: Remove unused-but-set variables
Date: Wed, 27 Apr 2022 11:49:33 +0200
Message-Id: <20220427094941.291554-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix all the gcc findings related to unused-but-set variables when performing
Xen compilation using target allyesconfig on arm32 and arm64. This is done by
temporarily removing flag -Wno-unused-but-set-variable set in Config.mk.

This series acts as a prerequisite to get rid of this flag one day.

Michal Orzel (8):
  xen/arm: bootfdt.c: Remove unused-but-set variable
  efi/boot.c: Remove unused-but-set variable
  gnttab: Remove unused-but-set variable
  xen/arm: smmu.c: Remove unused-but-set variable
  xen/sched: Remove unused-but-set variable
  platforms/xgene: Make use of dt_device_get_address return value
  platforms/omap: Remove unused-but-set variable
  drivers/exynos4210: Remove unused-but-set variable

 xen/arch/arm/bootfdt.c               |  3 ---
 xen/arch/arm/platforms/omap5.c       |  3 +--
 xen/arch/arm/platforms/xgene-storm.c |  2 +-
 xen/common/efi/boot.c                |  4 ++--
 xen/common/grant_table.c             |  6 ++----
 xen/common/sched/core.c              |  3 +--
 xen/drivers/char/exynos4210-uart.c   | 10 ++++++----
 xen/drivers/passthrough/arm/smmu.c   |  3 +--
 8 files changed, 14 insertions(+), 20 deletions(-)

-- 
2.25.1



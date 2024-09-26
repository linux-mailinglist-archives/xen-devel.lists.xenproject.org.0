Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D336987B24
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 00:25:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805917.1217169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stwv3-0002Wt-SB; Thu, 26 Sep 2024 22:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805917.1217169; Thu, 26 Sep 2024 22:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stwv3-0002Uf-OE; Thu, 26 Sep 2024 22:25:05 +0000
Received: by outflank-mailman (input) for mailman id 805917;
 Thu, 26 Sep 2024 22:25:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ruc3=QY=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1stwv1-0002UO-Ru
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 22:25:03 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b348298-7c56-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 00:25:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1F0488286DE2;
 Thu, 26 Sep 2024 17:25:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id x5T1wVY3xbka; Thu, 26 Sep 2024 17:24:59 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7C0348287726;
 Thu, 26 Sep 2024 17:24:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id tZIs9dG3S0tv; Thu, 26 Sep 2024 17:24:59 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E0BB0828533D;
 Thu, 26 Sep 2024 17:24:58 -0500 (CDT)
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
X-Inumbo-ID: 2b348298-7c56-11ef-a0ba-8be0dac302b0
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 7C0348287726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1727389499; bh=EqQ3Tu3Kcm3nw+tMpYddYKxOQrb/G5Y56Wvp3iJb5dc=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=S2+R5pvQ8shJZzmYvCawvsrIH8zIo69UWRNBrXCmKfm/WWkeXadttym6hWoW3K26n
	 mVrvNIuKPv2UJLDxCzK5u2zFBjQdLlig26ja4wfMib8T/pEnWcLnK4Q6C96Et+iM+E
	 MYtSw60uunMTsGT36GuLuxQLq0eBsEi65JRBrMn0=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v5 0/3] Early Boot Allocation on Power
Date: Thu, 26 Sep 2024 17:24:41 -0500
Message-Id: <cover.1727388925.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello all,

This series enables the Xen boot time allocator on Power by parsing
the available memory regions from the firmware-provided device tree.

Thanks to Oleksii's work on my patches to move ARM's bootfdt code to
common, v5 is much smaller. One new patch is included to fix some
newly-broken behavior in bootfdt.c regarding handling of DT reserved
memory maps.

Thanks,
Shawn

Shawn Anastasio (3):
  xen/device-tree: Let DT reserve map entries overlap reserved-memory
  xen/ppc: Enable bootfdt and boot allocator
  xen/ppc: mm-radix: Allocate all paging structures at runtime

 xen/arch/ppc/mm-radix.c           | 238 ++++++++++++++++--------------
 xen/arch/ppc/setup.c              |  20 ++-
 xen/common/device-tree/bootfdt.c  |  37 ++++-
 xen/common/device-tree/bootinfo.c |  11 +-
 xen/include/xen/bootfdt.h         |   3 +-
 5 files changed, 191 insertions(+), 118 deletions(-)

--
2.30.2



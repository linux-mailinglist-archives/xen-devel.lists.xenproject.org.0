Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 771BF8013D2
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 21:01:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645685.1007954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r99gg-0001SZ-Gq; Fri, 01 Dec 2023 20:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645685.1007954; Fri, 01 Dec 2023 20:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r99gg-0001Kt-CH; Fri, 01 Dec 2023 20:00:34 +0000
Received: by outflank-mailman (input) for mailman id 645685;
 Fri, 01 Dec 2023 20:00:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dz9Y=HM=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r99ge-0000tO-GB
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 20:00:32 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44ea1727-9084-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 21:00:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8A9838285C04;
 Fri,  1 Dec 2023 14:00:25 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id yA6vdnT18Dq4; Fri,  1 Dec 2023 14:00:24 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5759A828559D;
 Fri,  1 Dec 2023 14:00:24 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id quH52BITsjBK; Fri,  1 Dec 2023 14:00:24 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id D834382853A9;
 Fri,  1 Dec 2023 14:00:23 -0600 (CST)
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
X-Inumbo-ID: 44ea1727-9084-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 5759A828559D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701460824; bh=nyRS6rdpXEuouYJD2ds15y1eTJ7tL+RajSoNo3S8gak=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=udpK7yljv31Co49cVqY+0ol2E0YDmiVkrvaufO9WNs6UfAoARMNTRgb1OB1rL9BuF
	 dzzUsfMxb/Jmw78P9qIrb3USEvWEHRG/R9/I4wbHiQP4a9TrVtfZ/yx+Ts+1QlFoM7
	 ORjb+Tvld0NiFa9crIinZ8p9rw5MQkb1BthcM9Ug=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 0/3] Early Boot Allocation on Power
Date: Fri,  1 Dec 2023 13:59:53 -0600
Message-Id: <cover.1701384928.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello all,

This series enables the Xen boot time allocator on Power by parsing
the available memory regions from the firmware-provided device tree.

The device tree processing and bookkeeping code was adapted from Arm,
but it was trimmed down to exclude code for parsing Arm-specific dt
nodes.

Additionally, the final patch of the series updates the radix mmu
code to use the newly-enabled boot allocator for the Partition and
Process tables, instead of statically allocating them like was
previously done. Among other things, switching to run-time allocation
allows us to allocate a full-sized Process Table instead of the
minimal one that was previously used to keep the Xen binary size small.

Thanks,

Shawn Anastasio (3):
  xen/ppc: Enable Boot Allocator
  xen/ppc: mm-radix: Replace debug printing code with printk
  xen/ppc: mm-radix: Allocate Partition and Process Tables at runtime

 xen/arch/ppc/Makefile            |   1 +
 xen/arch/ppc/bootfdt.c           | 507 +++++++++++++++++++++++++++++++
 xen/arch/ppc/include/asm/setup.h | 113 +++++++
 xen/arch/ppc/mm-radix.c          | 197 ++++++------
 xen/arch/ppc/setup.c             | 109 ++++++-
 5 files changed, 823 insertions(+), 104 deletions(-)
 create mode 100644 xen/arch/ppc/bootfdt.c

--
2.30.2



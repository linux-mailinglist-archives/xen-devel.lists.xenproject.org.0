Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F977AF65F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 00:39:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608552.947118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlGhb-0006CC-Qk; Tue, 26 Sep 2023 22:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608552.947118; Tue, 26 Sep 2023 22:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlGhb-00069J-Ny; Tue, 26 Sep 2023 22:38:47 +0000
Received: by outflank-mailman (input) for mailman id 608552;
 Tue, 26 Sep 2023 22:38:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IkXO=FK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qlGhZ-0005uH-R4
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 22:38:45 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71e0774f-5cbd-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 00:38:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E751082854B0;
 Tue, 26 Sep 2023 17:38:31 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id H2aNhdbtOc3b; Tue, 26 Sep 2023 17:38:31 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 01BB8828558A;
 Tue, 26 Sep 2023 17:38:30 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id WmusQ2Kxu0yS; Tue, 26 Sep 2023 17:38:30 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 61138828548F;
 Tue, 26 Sep 2023 17:38:30 -0500 (CDT)
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
X-Inumbo-ID: 71e0774f-5cbd-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 01BB8828558A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695767911; bh=+ECsOLqZQDKTb4712xl8N/XSk0yNkmYkb6QnjMSl0z8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=f/PXoIYM6VSMyjhR/FTvirDF8ReGbIY1J5Rj3OCzDYyKYkJBpsIpJsOiN4LEyLWLY
	 oWh7oAPRFygsNQw5DaQiBsRgvK28udDtUdHv48tEmOe0Me0I4coHyKUoPpy0NDY30U
	 JvmJ5hd2ABzZyi4hqwjpcNpQNXL8kvdZgXs/MNGA=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/2] Fix Power CI build
Date: Tue, 26 Sep 2023 17:37:37 -0500
Message-Id: <cover.1695767747.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello all,

This series contains a few minor fixes to the CI config and one
additional patch to common/ that resolve ppc64-specific CI failures
that Jan discovered.

Thanks,

Shawn Anastasio (2):
  automation: Change build script to use arch defconfig
  xen/common: Add NUMA node id bounds check to
    page_alloc.c/node_to_scrub

 automation/scripts/build | 5 ++++-
 xen/common/page_alloc.c  | 8 ++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

--
2.30.2



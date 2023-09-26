Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9AC7AF360
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 20:55:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608495.946999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlDDA-00004y-QY; Tue, 26 Sep 2023 18:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608495.946999; Tue, 26 Sep 2023 18:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlDDA-0008R5-N9; Tue, 26 Sep 2023 18:55:08 +0000
Received: by outflank-mailman (input) for mailman id 608495;
 Tue, 26 Sep 2023 18:55:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IkXO=FK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qlDD9-0008Oe-OG
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 18:55:07 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 349513e6-5c9e-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 20:55:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8E4ED828587F;
 Tue, 26 Sep 2023 13:55:04 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id z7IxOIFD-phf; Tue, 26 Sep 2023 13:55:03 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id BADBA828597C;
 Tue, 26 Sep 2023 13:55:03 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id aT9Y6KzfcE3r; Tue, 26 Sep 2023 13:55:03 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 23F0A82856E3;
 Tue, 26 Sep 2023 13:55:03 -0500 (CDT)
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
X-Inumbo-ID: 349513e6-5c9e-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com BADBA828597C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695754503; bh=aEtO37WaeynTwQEG42ptd6iUUobibnEC7GuTBLy7PiY=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ElyF2L3ufEziikFUQLAI7FEJljc1jUQLdD5hO1T8aE0eOpd4vBYkN8TjWtxNEFUBw
	 6POi3Qg84HkYfHbF8CJKe2VARiAZGBHIKUQbn5Lw7f8ZI3tyGAHNq0CmtYcDYb8v1P
	 oOWTN+HWelR7KXxfiYWSGvRMKuoXEU0tKMq8f/6c=
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
Subject: [PATCH v2 0/2] Fix Power CI build
Date: Tue, 26 Sep 2023 13:54:54 -0500
Message-Id: <cover.1695754185.git.sanastasio@raptorengineering.com>
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

 automation/scripts/build | 7 ++++++-
 xen/common/page_alloc.c  | 8 ++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

--
2.30.2



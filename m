Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1237AF35E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 20:55:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608496.947013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlDDC-0000TV-0r; Tue, 26 Sep 2023 18:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608496.947013; Tue, 26 Sep 2023 18:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlDDB-0000Rs-UF; Tue, 26 Sep 2023 18:55:09 +0000
Received: by outflank-mailman (input) for mailman id 608496;
 Tue, 26 Sep 2023 18:55:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IkXO=FK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qlDDA-0008Od-AW
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 18:55:08 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35009f9d-5c9e-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 20:55:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9E06B82856E3;
 Tue, 26 Sep 2023 13:55:05 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id SN1cR25zWsfL; Tue, 26 Sep 2023 13:55:04 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C72E5828597C;
 Tue, 26 Sep 2023 13:55:04 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 04_qlkOyIH00; Tue, 26 Sep 2023 13:55:04 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 56B5F8285A03;
 Tue, 26 Sep 2023 13:55:04 -0500 (CDT)
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
X-Inumbo-ID: 35009f9d-5c9e-11ee-878a-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C72E5828597C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695754504; bh=1bghThgK+U6iQoTmvMbxS90PPSZnvYYz37y3sqDtbWc=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ZXC4+7ocqcH/hW7002q69SDtMTSdvZEQPAm62UyHFQtQkPZonxTwLIlAMk0uPEXD3
	 tGhhkYeBvoKHVG5FycuEjo9T8odOkQWc/CRWm8Ysu/r/6EQsHGbmrijECW15HKWa+f
	 M8Ivb4IP68lBSsLttvYKJFcmOHNyeK96K1sJNY4U=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/2] xen/common: Add NUMA node id bounds check to page_alloc.c/node_to_scrub
Date: Tue, 26 Sep 2023 13:54:56 -0500
Message-Id: <cbecf35392441b03dc3ccd2a119b6fbdbf13b855.1695754185.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1695754185.git.sanastasio@raptorengineering.com>
References: <cover.1695754185.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

When building for Power with CONFIG_DEBUG unset, a compiler error gets
raised inside page_alloc.c's node_to_scrub function:

common/page_alloc.c: In function 'node_to_scrub.part.0':
common/page_alloc.c:1217:29: error: array subscript 1 is above array
            bounds of 'long unsigned int[1]' [-Werror=array-bounds]
 1217 |         if ( node_need_scrub[node] )

It appears that this is a false positive, given that in practice
cycle_node should never return a node ID >= MAX_NUMNODES as long as the
architecture's node_online_map is properly defined and initialized, so
this additional bounds check is only to satisfy GCC.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
v2: Add comment to explain the bounds check.

 xen/common/page_alloc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 35d9a26fa6..c53f917dbc 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1211,6 +1211,14 @@ static unsigned int node_to_scrub(bool get_node)
         } while ( !cpumask_empty(&node_to_cpumask(node)) &&
                   (node != local_node) );

+        /*
+         * In practice `node` will always be within MAX_NUMNODES, but GCC can't
+         * always see that, so an explicit check is necessary to avoid tripping
+         * its out-of-bounds array access warning (-Warray-bounds).
+         */
+        if ( node >= MAX_NUMNODES )
+            break;
+
         if ( node == local_node )
             break;

--
2.30.2



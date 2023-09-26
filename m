Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8BB7AF661
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 00:39:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608553.947129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlGhd-0006Qh-2s; Tue, 26 Sep 2023 22:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608553.947129; Tue, 26 Sep 2023 22:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlGhc-0006OT-Uk; Tue, 26 Sep 2023 22:38:48 +0000
Received: by outflank-mailman (input) for mailman id 608553;
 Tue, 26 Sep 2023 22:38:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IkXO=FK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qlGha-0005uH-R7
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 22:38:46 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71e017bf-5cbd-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 00:38:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 941B6828548F;
 Tue, 26 Sep 2023 17:38:32 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id RU8ZbbAtZ0_b; Tue, 26 Sep 2023 17:38:32 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0ECBE8286987;
 Tue, 26 Sep 2023 17:38:32 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2PHqCNn3ZY9o; Tue, 26 Sep 2023 17:38:31 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 5AE0A828548F;
 Tue, 26 Sep 2023 17:38:31 -0500 (CDT)
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
X-Inumbo-ID: 71e017bf-5cbd-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0ECBE8286987
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695767912; bh=dSS9Fhkavs/AL0LupSPA21rO1FT/CXYU0GWi1j4YJNM=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=YUyv1Ek0BRLry0KFMuGSEq3230DYH2I5EpYzQz7hbr/W77RiS7UGHejuT2mpxgdHo
	 kOvOP3irPyTWgLwv6SfOB61GH2ciCAr66ihyzcEIanEtPjZuiMuAMbV0jcDywvYYRY
	 bAghSIcB0W+41FsMW2NGUDf90QBTVcIp+sYIAIr0=
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
Subject: [PATCH v3 2/2] xen/common: Add NUMA node id bounds check to page_alloc.c/node_to_scrub
Date: Tue, 26 Sep 2023 17:37:39 -0500
Message-Id: <d16b2f8749b65e303f531776d303586336ef1729.1695767747.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1695767747.git.sanastasio@raptorengineering.com>
References: <cover.1695767747.git.sanastasio@raptorengineering.com>
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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2: Add comment to explain the bounds check.

 xen/common/page_alloc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 35d9a26fa6..9b5df74fdd 100644
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



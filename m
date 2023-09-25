Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF4F7AE1D2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 00:42:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608151.946484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkuHv-0007DS-VV; Mon, 25 Sep 2023 22:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608151.946484; Mon, 25 Sep 2023 22:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkuHv-0007B0-P9; Mon, 25 Sep 2023 22:42:47 +0000
Received: by outflank-mailman (input) for mailman id 608151;
 Mon, 25 Sep 2023 22:42:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jxCo=FJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qkuHu-0006e1-0Q
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 22:42:46 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7c9fbcb-5bf4-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 00:42:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 52A33828558A;
 Mon, 25 Sep 2023 17:42:44 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id swcRR5RQMj6u; Mon, 25 Sep 2023 17:42:43 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2CE3D82867A9;
 Mon, 25 Sep 2023 17:42:43 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id t6R6dDD_VBP4; Mon, 25 Sep 2023 17:42:42 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 219B78285B83;
 Mon, 25 Sep 2023 17:42:42 -0500 (CDT)
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
X-Inumbo-ID: d7c9fbcb-5bf4-11ee-878a-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 2CE3D82867A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695681763; bh=n7RbV6HKhggR9ZKikSDWaAYhJWp3wDDzOjNqYprqXEk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=vLmBfBYe+KOv7Okxx7jFjFzyykpd0C/YFf6cCSqqAXQV5Bk4tJLmnG76eYtUxyADq
	 3qfBn5UxwkX3O7TYjqrsnc4dAtswk6vrEbrsLz33Nvdw3Vvv3OcBt9Mr2u6Nm0jU8g
	 qASTBWDfE7gL5LXuZ0m9gg0DPn1h43qWZXT/jKPg=
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
Subject: [PATCH 3/3] xen/common: Add NUMA node id bounds check to page_alloc.c/node_to_scrub
Date: Mon, 25 Sep 2023 17:42:30 -0500
Message-Id: <a47962a573eab38991a8aa3e09ca6b8bd3193b6c.1695681330.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1695681330.git.sanastasio@raptorengineering.com>
References: <cover.1695681330.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

When building for Power with CONFIG_DEBUG unset, a compiler error gets
raised inside page_alloc.c's node_to_scrub function, likely due to the
increased optimization level:

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
 xen/common/page_alloc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 35d9a26fa6..6df2a223e1 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1211,6 +1211,9 @@ static unsigned int node_to_scrub(bool get_node)
         } while ( !cpumask_empty(&node_to_cpumask(node)) &&
                   (node != local_node) );

+        if ( node >= MAX_NUMNODES )
+            break;
+
         if ( node == local_node )
             break;

--
2.30.2



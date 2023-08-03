Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 021D576E58E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:23:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576183.902092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVUO-0006Mo-Te; Thu, 03 Aug 2023 10:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576183.902092; Thu, 03 Aug 2023 10:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVUO-0006Ii-M8; Thu, 03 Aug 2023 10:23:28 +0000
Received: by outflank-mailman (input) for mailman id 576183;
 Thu, 03 Aug 2023 10:23:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYgs=DU=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qRVUN-0005QX-EG
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:23:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7fccec2-31e7-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 12:23:25 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 483E64EE0737;
 Thu,  3 Aug 2023 12:23:25 +0200 (CEST)
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
X-Inumbo-ID: c7fccec2-31e7-11ee-8613-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 06/13] xen/mem_access: address violations of MISRA C:2012 Rule 7.3
Date: Thu,  3 Aug 2023 12:22:21 +0200
Message-Id: <7e4ff67a24206177c5a304055f395cc2983bb994.1691053438.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691053438.git.simone.ballarin@bugseng.com>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
states:
"The lowercase character 'l' shall not be used in a literal suffix".

Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.

The changes in this patch are mechanical.

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/common/mem_access.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/mem_access.c b/xen/common/mem_access.c
index 010e6f8dbf..385950789c 100644
--- a/xen/common/mem_access.c
+++ b/xen/common/mem_access.c
@@ -60,7 +60,7 @@ int mem_access_memop(unsigned long cmd,
 
     case XENMEM_access_op_set_access:
         rc = -EINVAL;
-        if ( (mao.pfn != ~0ull) &&
+        if ( (mao.pfn != ~0ULL) &&
              (mao.nr < start_iter ||
               ((mao.pfn + mao.nr - 1) < mao.pfn) ||
               ((mao.pfn + mao.nr - 1) > domain_get_maximum_gpfn(d))) )
@@ -96,7 +96,7 @@ int mem_access_memop(unsigned long cmd,
             break;
 
         rc = -EINVAL;
-        if ( (mao.pfn > domain_get_maximum_gpfn(d)) && mao.pfn != ~0ull )
+        if ( (mao.pfn > domain_get_maximum_gpfn(d)) && mao.pfn != ~0ULL )
             break;
 
         rc = p2m_get_mem_access(d, _gfn(mao.pfn), &access, 0);
-- 
2.34.1



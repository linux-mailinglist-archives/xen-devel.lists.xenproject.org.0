Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A2F76D033
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 16:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574976.900674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzt-0007mI-0C; Wed, 02 Aug 2023 14:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574976.900674; Wed, 02 Aug 2023 14:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzs-0007fA-LB; Wed, 02 Aug 2023 14:38:44 +0000
Received: by outflank-mailman (input) for mailman id 574976;
 Wed, 02 Aug 2023 14:38:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIS5=DT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRCzq-0006bO-QF
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 14:38:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46b8c10b-3142-11ee-b260-6b7b168915f2;
 Wed, 02 Aug 2023 16:38:42 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 5E2AE4EE0745;
 Wed,  2 Aug 2023 16:38:41 +0200 (CEST)
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
X-Inumbo-ID: 46b8c10b-3142-11ee-b260-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Paul Durrant <paul@xen.org>
Subject: [XEN PATCH 06/11] xen/ioreq: move variable declaration to address MISRA C:2012 Rule 2.1
Date: Wed,  2 Aug 2023 16:38:12 +0200
Message-Id: <587d42fef7a0fc3fb3e7e5ef3deed6617b84cf03.1690985045.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690985045.git.nicola.vetrini@bugseng.com>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variable declarations between a switch statement guard and before
any case label are unreachable code, and hence violate Rule 2.1:
"A project shall not contain unreachable code".

Therefore the variable declarations are moved in the smallest enclosing
scope, near other variable definitions.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/ioreq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 7cb717f7a2..5044f43b81 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -1111,6 +1111,7 @@ struct ioreq_server *ioreq_server_select(struct domain *d,
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
         struct rangeset *r;
+        unsigned long start, end;
 
         if ( !s->enabled )
             continue;
@@ -1119,8 +1120,6 @@ struct ioreq_server *ioreq_server_select(struct domain *d,
 
         switch ( type )
         {
-            unsigned long start, end;
-
         case XEN_DMOP_IO_RANGE_PORT:
             start = addr;
             end = start + p->size - 1;
-- 
2.34.1



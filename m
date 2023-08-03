Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B7276E58D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:23:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576182.902073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVUM-0005iB-Hu; Thu, 03 Aug 2023 10:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576182.902073; Thu, 03 Aug 2023 10:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVUM-0005a4-Ao; Thu, 03 Aug 2023 10:23:26 +0000
Received: by outflank-mailman (input) for mailman id 576182;
 Thu, 03 Aug 2023 10:23:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYgs=DU=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qRVUL-0004Rp-0m
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:23:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c718767e-31e7-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 12:23:24 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id E185C4EE0740;
 Thu,  3 Aug 2023 12:23:23 +0200 (CEST)
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
X-Inumbo-ID: c718767e-31e7-11ee-b268-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Paul Durrant <paul@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 05/13] xen/ioreq: address violations of MISRA C:2012 Rule 7.3
Date: Thu,  3 Aug 2023 12:22:20 +0200
Message-Id: <771362e703548e55d4ccc420fa880585a5748c4f.1691053438.git.simone.ballarin@bugseng.com>
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

Signed-off-by: Gianluca	Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/common/ioreq.c      | 2 +-
 xen/include/xen/ioreq.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 7cb717f7a2..62b907f4c4 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -1182,7 +1182,7 @@ static int ioreq_send_buffered(struct ioreq_server *s, ioreq_t *p)
      *  - the count field is usually used with data_is_ptr and since we don't
      *    support data_is_ptr we do not waste space for the count field either
      */
-    if ( (p->addr > 0xffffful) || p->data_is_ptr || (p->count != 1) )
+    if ( (p->addr > 0xfffffUL) || p->data_is_ptr || (p->count != 1) )
         return 0;
 
     switch ( p->size )
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index a26614d331..cd399adf17 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -60,7 +60,7 @@ struct ioreq_server {
 static inline paddr_t ioreq_mmio_first_byte(const ioreq_t *p)
 {
     return unlikely(p->df) ?
-           p->addr - (p->count - 1ul) * p->size :
+           p->addr - (p->count - 1UL) * p->size :
            p->addr;
 }
 
-- 
2.34.1



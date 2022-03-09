Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E705A4D314A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 15:53:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287900.488194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRxgk-0000eY-DF; Wed, 09 Mar 2022 14:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287900.488194; Wed, 09 Mar 2022 14:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRxgk-0000ci-9P; Wed, 09 Mar 2022 14:53:18 +0000
Received: by outflank-mailman (input) for mailman id 287900;
 Wed, 09 Mar 2022 14:53:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/5Wz=TU=amazon.de=prvs=06034e0c2=doebel@srs-se1.protection.inumbo.net>)
 id 1nRxgh-0000cL-Qc
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 14:53:17 +0000
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a476d377-9fb8-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 15:53:13 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-2dbf0206.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-2101.iad2.amazon.com with ESMTP; 09 Mar 2022 14:53:12 +0000
Received: from EX13D44EUC003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2a-2dbf0206.us-west-2.amazon.com (Postfix) with
 ESMTPS id C75DDA277E; Wed,  9 Mar 2022 14:53:10 +0000 (UTC)
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D44EUC003.ant.amazon.com (10.43.164.229) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Wed, 9 Mar 2022 14:53:08 +0000
Received: from dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (10.13.240.106)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.28 via Frontend Transport; Wed, 9 Mar 2022 14:53:06 +0000
Received: by dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (Postfix,
 from userid 3160037)
 id 65C2A4E79; Wed,  9 Mar 2022 14:53:06 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a476d377-9fb8-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646837594; x=1678373594;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DagEakpqz6Dt5Y9fwUgvFiApWcxqurKY1A3qTM9nhpY=;
  b=RrZFIFpWIHtjTyQq8sHNjwqMPRppUEDdUfmU0pfzrW4kksr+EXlEI6pO
   6Upyu+qs8xc3V2LlUTbLYYjq7lYsbYiMA1B8CX1/35FymxKdh+xmdhJ/9
   k2JDB6W9L8vzs+TIHPIYdWvZmZM5TnmDA0fiVzGqaNiUKadwUu4mLw7jl
   A=;
X-IronPort-AV: E=Sophos;i="5.90,167,1643673600"; 
   d="scan'208";a="179765667"
From: Bjoern Doebel <doebel@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Roger
 Pau Monne <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Bjoern Doebel <doebel@amazon.de>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v5 1/2] Livepatch: resolve old address before function verification
Date: Wed, 9 Mar 2022 14:52:59 +0000
Message-ID: <03798b67ec3a892a302e6be5d87ea676e6376036.1646837462.git.doebel@amazon.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When verifying that a livepatch can be applied, we may as well want to
inspect the target function to be patched. To do so, we need to resolve
this function's address before running the arch-specific
livepatch_verify hook.

Signed-off-by: Bjoern Doebel <doebel@amazon.de>
Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/common/livepatch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index ec301a9f12..be2cf75c2d 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -684,11 +684,11 @@ static int prepare_payload(struct payload *payload,
                 return -EINVAL;
             }
 
-            rc = arch_livepatch_verify_func(f);
+            rc = resolve_old_address(f, elf);
             if ( rc )
                 return rc;
 
-            rc = resolve_old_address(f, elf);
+            rc = arch_livepatch_verify_func(f);
             if ( rc )
                 return rc;
 
-- 
2.32.0




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879





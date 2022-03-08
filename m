Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65834D1B95
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 16:23:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287074.486876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbgg-0007di-J8; Tue, 08 Mar 2022 15:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287074.486876; Tue, 08 Mar 2022 15:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbgg-0007aa-Fc; Tue, 08 Mar 2022 15:23:46 +0000
Received: by outflank-mailman (input) for mailman id 287074;
 Tue, 08 Mar 2022 15:23:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JMfM=TT=amazon.de=prvs=0590b4220=doebel@srs-se1.protection.inumbo.net>)
 id 1nRbge-0007aT-Ng
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 15:23:45 +0000
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bca01a70-9ef3-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 16:23:43 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-92ba9394.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-2101.iad2.amazon.com with ESMTP; 08 Mar 2022 15:23:31 +0000
Received: from EX13D44EUB004.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2a-92ba9394.us-west-2.amazon.com (Postfix) with
 ESMTPS id 5D173417EF; Tue,  8 Mar 2022 15:23:29 +0000 (UTC)
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D44EUB004.ant.amazon.com (10.43.166.198) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Tue, 8 Mar 2022 15:23:27 +0000
Received: from dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (10.13.240.106)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server
 id
 15.0.1497.28 via Frontend Transport; Tue, 8 Mar 2022 15:23:26 +0000
Received: by dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (Postfix,
 from userid 3160037)
 id E06444EA9; Tue,  8 Mar 2022 15:23:25 +0000 (UTC)
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
X-Inumbo-ID: bca01a70-9ef3-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646753023; x=1678289023;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DagEakpqz6Dt5Y9fwUgvFiApWcxqurKY1A3qTM9nhpY=;
  b=OpntINO+n8kEI8d9KA9+7Iuou6EB0Ib/MZgIRZxBj26x/C1mfWyFD9+G
   RcsO+GuTqBLynzioEl6v+rjmgdQh3aUMyEfn5VszLF6awdgX4/EHzF99K
   QVv6Kmk1mKPfprlmRo0lza6rBZdUyJtSWw47PxJ1eFxUeVdcqEgE47BqB
   0=;
X-IronPort-AV: E=Sophos;i="5.90,165,1643673600"; 
   d="scan'208";a="179452231"
From: Bjoern Doebel <doebel@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Roger
 Pau Monne <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Bjoern Doebel <doebel@amazon.de>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v4 1/2] Livepatch: resolve old address before function verification
Date: Tue, 8 Mar 2022 15:23:19 +0000
Message-ID: <7e547248b6c24b9f3761720f84919614af69c802.1646752948.git.doebel@amazon.de>
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





Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2709F4CFD71
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 12:54:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285880.485178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRBwV-0004uJ-Nm; Mon, 07 Mar 2022 11:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285880.485178; Mon, 07 Mar 2022 11:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRBwV-0004s9-IG; Mon, 07 Mar 2022 11:54:23 +0000
Received: by outflank-mailman (input) for mailman id 285880;
 Mon, 07 Mar 2022 11:54:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7T3K=TS=amazon.de=prvs=058ff0969=doebel@srs-se1.protection.inumbo.net>)
 id 1nRBwT-0004Lv-Mp
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 11:54:21 +0000
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51be7f8e-9e0d-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 12:54:20 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1e-7dac3c4d.us-east-1.amazon.com) ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 07 Mar 2022 11:54:03 +0000
Received: from EX13D03EUA003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1e-7dac3c4d.us-east-1.amazon.com (Postfix) with
 ESMTPS id 8653E99B13; Mon,  7 Mar 2022 11:54:01 +0000 (UTC)
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D03EUA003.ant.amazon.com (10.43.165.89) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Mon, 7 Mar 2022 11:54:00 +0000
Received: from dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (10.13.240.106)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.28 via Frontend Transport; Mon, 7 Mar 2022 11:53:59 +0000
Received: by dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (Postfix,
 from userid 3160037)
 id 61D514F5E; Mon,  7 Mar 2022 11:53:59 +0000 (UTC)
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
X-Inumbo-ID: 51be7f8e-9e0d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646654061; x=1678190061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7eEisiDKKSHw1++xLYtfPHKS3ymk9DBq2ioO+9jWrTY=;
  b=lBKIm+cqWi3PpCyDIQtJaz+qO0O1a9HOHrtyfifZwJFUryjFTwa1Qm2A
   2SOjFDyOA6YHtfbxRfiTD/so6hXxfT1ZOkTWfLzXdUT5ZbKd9ASqzQExu
   SEWGbblXeL2cCZ3VQHKPEKGTaHJcMesca7zQfEahBLdjjcFfWuS3+PVrb
   U=;
X-IronPort-AV: E=Sophos;i="5.90,162,1643673600"; 
   d="scan'208";a="200034811"
From: Bjoern Doebel <doebel@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Roger
 Pau Monne <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Bjoern Doebel <doebel@amazon.de>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 1/2] Livepatch: resolve old address before function verification
Date: Mon, 7 Mar 2022 11:53:52 +0000
Message-ID: <15b092bb3af6e32f72ee8fca45317687d23b8be4.1646653825.git.doebel@amazon.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1646653825.git.doebel@amazon.de>
References: <cover.1646653825.git.doebel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When verifying that a livepatch can be applied, we may as well want to
inspect the target function to be patched. To do so, we need to resolve
this function's address before running the arch-specific
livepatch_verify hook.

Signed-off-by: Bjoern Doebel <doebel@amazon.de>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
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





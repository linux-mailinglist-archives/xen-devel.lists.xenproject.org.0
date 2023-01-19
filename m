Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0426D67353B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 11:15:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480913.745539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIRwQ-0007nn-04; Thu, 19 Jan 2023 10:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480913.745539; Thu, 19 Jan 2023 10:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIRwP-0007lK-T7; Thu, 19 Jan 2023 10:14:41 +0000
Received: by outflank-mailman (input) for mailman id 480913;
 Thu, 19 Jan 2023 10:14:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7itS=5Q=amazon.com=prvs=3763fc082=mstrasun@srs-se1.protection.inumbo.net>)
 id 1pIRwO-0007kn-DI
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 10:14:40 +0000
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 140a99f7-97e2-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 11:14:38 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-96feee09.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-2101.iad2.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 10:14:34 +0000
Received: from EX13D50EUA002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1a-m6i4x-96feee09.us-east-1.amazon.com (Postfix)
 with ESMTPS id 3D6C842F0E
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 10:14:34 +0000 (UTC)
Received: from EX19D003EUA004.ant.amazon.com (10.252.50.128) by
 EX13D50EUA002.ant.amazon.com (10.43.165.201) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Thu, 19 Jan 2023 10:14:33 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX19D003EUA004.ant.amazon.com (10.252.50.128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.7; Thu, 19 Jan 2023 10:14:33 +0000
Received: from dev-dsk-mstrasun-1c-15417e94.eu-west-1.amazon.com
 (172.19.92.214) by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP
 Server id 15.0.1497.45 via Frontend Transport; Thu, 19 Jan 2023 10:14:32
 +0000
Received: by dev-dsk-mstrasun-1c-15417e94.eu-west-1.amazon.com (Postfix,
 from userid 17415739)
 id 19BEB21426; Thu, 19 Jan 2023 10:14:32 +0000 (UTC)
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
X-Inumbo-ID: 140a99f7-97e2-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1674123278; x=1705659278;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2xU/uBcWEWbfzk2TqLk64mpRRkZpjZZO7FkjawvYQC8=;
  b=XwJ0oRAz/IEfDDBcyv6oPOgWj5WE8hqfb1DuEJZdQM2/DDx+iUhyJvVH
   6G3VC0pnt37F1kgwwhmQ1MbihMrhGpI8aEDhooo8sbzOpGE3FuKDE7Fl7
   bWHJXDm53j4046GY3cLLilt9HmAdlkWatYBtFz4L1QHhshjX2UUSr0UAO
   k=;
X-IronPort-AV: E=Sophos;i="5.97,228,1669075200"; 
   d="scan'208";a="284332618"
From: Mihails Strasuns <mstrasun@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <mstrasun@amazon.com>, Raphael Ning <raphning@amazon.com>, Bjoern Doebel
	<doebel@amazon.de>, Martin Pohlack <mpohlack@amazon.de>
Subject: [PATCH v1 2/4] livepatch-build: Allow a patch to introduce new subdirs
Date: Thu, 19 Jan 2023 10:13:04 +0000
Message-ID: <472bfbf92aba6d3409b2a101798f04a50c97f6e9.1673623880.git.mstrasun@amazon.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673623880.git.mstrasun@amazon.com>
References: <cover.1673623880.git.mstrasun@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Raphael Ning <raphning@amazon.com>

Fix a bug in create_patch() where cp, strip, etc. will fail if the new
object file introduced by the patch is located in a new subdirectory:

 DEBUG: cp: cannot create regular file `output/xen/common/lu/lu.o': No such file or directory
 DEBUG: strip: 'output/xen/common/lu/lu.o': No such file

In this example, xen/common/lu/ does not exist in the original
(unpatched) Xen source tree. It needs to be created in output/ as well.

Signed-off-by: Raphael Ning <raphning@amazon.com>
Reviewed-by: Bjoern Doebel <doebel@amazon.de>
Reviewed-by: Martin Pohlack <mpohlack@amazon.de>
---
 livepatch-build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/livepatch-build b/livepatch-build
index f7d6471..444daa9 100755
--- a/livepatch-build
+++ b/livepatch-build
@@ -232,6 +232,7 @@ function create_patch()
 
     NEW_FILES=$(comm -23 <(cd patched/xen && find . -type f -name '*.o' | sort) <(cd original/xen && find . -type f -name '*.o' | sort))
     for i in $NEW_FILES; do
+        mkdir -p "output/$(dirname "$i")"
         cp "patched/$i" "output/$i"
         [[ $STRIP -eq 1 ]] && strip --strip-unneeded "output/$i"
         CHANGED=1
-- 
2.38.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879





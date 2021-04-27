Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D52A36CAC3
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 20:01:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118794.225103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS0v-0002G1-39; Tue, 27 Apr 2021 18:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118794.225103; Tue, 27 Apr 2021 18:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS0u-0002EO-HD; Tue, 27 Apr 2021 18:00:48 +0000
Received: by outflank-mailman (input) for mailman id 118794;
 Tue, 27 Apr 2021 18:00:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0s-00029f-3K
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0s-0004q5-2g
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:46 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0s-0001nc-1n
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:46 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lbS0q-0003ln-4E; Tue, 27 Apr 2021 19:00:44 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=H7py3//w0QUlttXfH9n5X0hN6r5MeX1YzG0RyQXhqDo=; b=1X6l0pdLMSWa1b0n54OL3xljC8
	r9TqZiJ38cL35NJ29N/Taw+8AEW4Ml9EmSAano2g4gUx1FxST+Zyh0izG2STsG+oCXY38eHB1/s+N
	vh8tjQsZPbzkNZv1r4vuyBDa54xS7yWmRtha9OW0CtshZUycbkiKrbPVqzGEIS3sLf3s=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 6/7] mg-schema-test-database: Fix following host_lifecycle
Date: Tue, 27 Apr 2021 19:00:32 +0100
Message-Id: <20210427180033.9439-7-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210427180033.9439-1-iwj@xenproject.org>
References: <20210427180033.9439-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This data doesn't really survive, since the tasks are all mangled.
Rather than trying to transpose it, just don't transfer it for now.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-schema-test-database | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mg-schema-test-database b/mg-schema-test-database
index eab0746e..df83b65a 100755
--- a/mg-schema-test-database
+++ b/mg-schema-test-database
@@ -482,6 +482,7 @@ END
 	for table in $tables; do
 		case $table in
 		schema_updates)	continue ;;
+		host_lifecycle)	continue ;;
 		esac
 		case " $ftables " in
 		*" $table "*)
-- 
2.20.1



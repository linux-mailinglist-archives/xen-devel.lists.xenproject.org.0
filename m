Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E022346A4C4
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 19:38:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239778.415753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIry-00028s-O8; Mon, 06 Dec 2021 18:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239778.415753; Mon, 06 Dec 2021 18:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIry-00026U-L8; Mon, 06 Dec 2021 18:37:46 +0000
Received: by outflank-mailman (input) for mailman id 239778;
 Mon, 06 Dec 2021 18:37:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIrx-00026O-62
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:37:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIrx-0004Ok-3X
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:37:45 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIrx-0005vO-2R
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:37:45 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1muIZd-0001ab-00; Mon, 06 Dec 2021 18:18:49 +0000
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
	bh=QQIjB4bvZcjYIHEme4Iso/oFJMJrpCjQ9+ROuu/dI2c=; b=Ad22Dr4CnydoGPKYUmhV4ZS1fZ
	DiV7+ZaDsAook6bTdt6tvqUeCjsyQPi7KUG+odqb2+oBlqCiw3KPZQV0L1j7mLa0xsZFga+Y1Qv8p
	pBKvX/pl3CFdnT8TUXilxfuwBUYM/I03c6WsF1KsMxSnayrjeLMJSWfMCNrhpLgOjqpY=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 10/13] TestSupport: sub broken: exit with status 0 for skip
Date: Mon,  6 Dec 2021 18:18:36 +0000
Message-Id: <20211206181839.23463-11-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211206181839.23463-1-iwj@xenproject.org>
References: <20211206181839.23463-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Otherwise, whatever calls us will set the step to fail (or something).

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/TestSupport.pm | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index ff890f96c..ebe436275 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -285,7 +285,12 @@ END
       ($affected>0 ? "marked $flight.$job $newst"
                    : "($flight.$job not marked $newst)").
 		     "\n";
-    die $msg;
+    if ($newst =~ m{^(?:skip)$}) {
+	print STDERR $msg;
+	exit 0;
+    } else {
+	die $msg;
+    }
 }
 
 sub complete_testid ($) {
-- 
2.20.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFC446A3DE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 19:19:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239726.415676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIa0-0002mb-5C; Mon, 06 Dec 2021 18:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239726.415676; Mon, 06 Dec 2021 18:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIZz-0002hh-OW; Mon, 06 Dec 2021 18:19:11 +0000
Received: by outflank-mailman (input) for mailman id 239726;
 Mon, 06 Dec 2021 18:19:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZx-00025z-JY
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZx-00041n-Ig
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:09 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZx-0004Th-Hs
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:09 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1muIZc-0001ab-Cc; Mon, 06 Dec 2021 18:18:48 +0000
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
	bh=HAxun9MazXyqzqKC8qATdNCpO7XqgWpXADfqESY/Jcw=; b=YHRjbWl/B5Gn96/S5QoB0HUGVw
	OeaawK0kz+G/w4LlOBEB7hrOcrYgB4xWzK2YBVxzQlIVxdnYgkiafMm89wJ8zdCyhkGTXNDZA8fGW
	X9zoviaRTe/S5czo3U5KY4OfPi37rgRiHv44qtK+lD0YBY5h+eOQ53/fxcIDmifyywE8=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 08/13] TestSupport: sub broken: break out "$msg"
Date: Mon,  6 Dec 2021 18:18:34 +0000
Message-Id: <20211206181839.23463-9-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211206181839.23463-1-iwj@xenproject.org>
References: <20211206181839.23463-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/TestSupport.pm | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index a0ca69437..b17bf08a6 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -281,8 +281,10 @@ sub broken ($;$) {
                AND (status='queued' OR status='running' OR status='preparing')
 END
     });
-    die uc($newst).": $m; ". ($affected>0 ? "marked $flight.$job $newst"
-                         : "($flight.$job not marked $newst)");
+    my $msg = uc($newst).": $m; ".
+      ($affected>0 ? "marked $flight.$job $newst"
+                   : "($flight.$job not marked $newst)");
+    die $msg;
 }
 
 sub complete_testid ($) {
-- 
2.20.1



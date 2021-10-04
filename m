Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF1D4214D0
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 19:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201610.356199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXRQf-0002tV-FU; Mon, 04 Oct 2021 17:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201610.356199; Mon, 04 Oct 2021 17:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXRQf-0002pz-Ab; Mon, 04 Oct 2021 17:07:05 +0000
Received: by outflank-mailman (input) for mailman id 201610;
 Mon, 04 Oct 2021 17:07:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQd-0002oc-Oi
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQd-0000L7-Nr
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:03 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQd-0005gF-N1
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:03 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mXRQb-0006NI-OK; Mon, 04 Oct 2021 18:07:01 +0100
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
	bh=T94U9z+a5DsOSr2q2nxD2XUprqIrdu2ze8pMDFZ0Qko=; b=jAvAwnXVBx47CSt+3PTpMkmqtL
	j6BV0iSYdG9C1ZvBrkUwayBetQe01BY+DvkcmRjBfm3ZjGEztYrKI0UfOyntQDzCjNekww1M6DJv4
	zm7VvGRnrDJ+FznpPNKMXFh/ICqruK5GXmn++RrS2/yDP0CCr2dXkldE82kaK/oPh7zQ=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 1/6] host lifecycle: Use correct taskid column for runvar reconstruction
Date: Mon,  4 Oct 2021 18:06:49 +0100
Message-Id: <20211004170654.21864-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211004170654.21864-1-iwj@xenproject.org>
References: <20211004170654.21864-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

t.taskid might be NULL since the task may have been deleted.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/JobDB/Executive.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/JobDB/Executive.pm b/Osstest/JobDB/Executive.pm
index 097c8d75b..c5db2691b 100644
--- a/Osstest/JobDB/Executive.pm
+++ b/Osstest/JobDB/Executive.pm
@@ -542,7 +542,7 @@ END
 
     my $scanq = $dbh_tests->prepare(<<END);
 	   SELECT h.flight, h.job, h.isprep, h.ident, h.stepno,
-                  t.live, t.taskid,
+                  t.live, h.taskid,
                   h2.lcseq later_notprep
 	     FROM host_lifecycle h
         LEFT JOIN host_lifecycle h2
-- 
2.20.1



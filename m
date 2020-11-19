Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E202B993B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 18:25:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31247.61583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfnfp-00022M-NF; Thu, 19 Nov 2020 17:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31247.61583; Thu, 19 Nov 2020 17:24:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfnfp-00021x-JM; Thu, 19 Nov 2020 17:24:45 +0000
Received: by outflank-mailman (input) for mailman id 31247;
 Thu, 19 Nov 2020 17:24:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kfnfo-00021s-5v
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kfnfo-0001GM-3c
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:44 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kfnfn-0001gq-V8
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:44 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kfnfl-0001j9-Jv; Thu, 19 Nov 2020 17:24:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kfnfo-00021s-5v
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=RSPmlMx6h7lY0hEWezC+PZdIowM8QBXv/eyi0QInOAw=; b=Hu3gydKXJioG6mxexNtWg5BOyy
	mAO0C72Dhb8ApH6sRL7JrbWHpAp2FfhRzbTvydbOFYhTUT7/znCQkZliFqzYiGFdZ2FGzwwMpfWEP
	C6iRUYdXpSxFa8WAWY8zg54fJycotWZEA5cEvcO45MACFa1i6pIYb7VGshWPkNnBjhz0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kfnfo-0001GM-3c
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:44 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kfnfn-0001gq-V8
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 17:24:44 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kfnfl-0001j9-Jv; Thu, 19 Nov 2020 17:24:41 +0000
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 1/3] sg-report-flight: Rename "sub" to more descriptive "relevant_flights"
Date: Thu, 19 Nov 2020 17:24:30 +0000
Message-Id: <20201119172432.15682-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.  We're going to add another WITH...

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-report-flight | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sg-report-flight b/sg-report-flight
index fd266586..40a3cc92 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -316,7 +316,8 @@ END
     # best option.
 
     my $flightsq= <<END;
-      WITH sub AS (
+      WITH
+      relevant_flights AS (
         SELECT DISTINCT flight, blessing
              FROM flights
 $runvars_joins
@@ -328,7 +329,7 @@ $runvars_conds
             LIMIT 1000
       )
       SELECT flight, jobs.status
-        FROM sub
+        FROM relevant_flights
 $flightsq_jobs_join
        WHERE (1=1)
 $flightsq_jobcond
-- 
2.20.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81A528F62A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 17:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7517.19686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5WW-0006Mo-Li; Thu, 15 Oct 2020 15:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7517.19686; Thu, 15 Oct 2020 15:50:36 +0000
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
	id 1kT5WW-0006M4-HC; Thu, 15 Oct 2020 15:50:36 +0000
Received: by outflank-mailman (input) for mailman id 7517;
 Thu, 15 Oct 2020 15:50:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kT5WU-0006GR-Qx
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:34 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af5f75c7-18ec-4453-a7b3-5bf1a27f9f3d;
 Thu, 15 Oct 2020 15:50:28 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WO-00087o-Jw
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:28 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WO-0005Em-Is
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:28 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kT5WM-0000oB-OA; Thu, 15 Oct 2020 16:50:26 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kT5WU-0006GR-Qx
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:34 +0000
X-Inumbo-ID: af5f75c7-18ec-4453-a7b3-5bf1a27f9f3d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id af5f75c7-18ec-4453-a7b3-5bf1a27f9f3d;
	Thu, 15 Oct 2020 15:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=ChVOyZirwRN6GYYGaNTGSTLn1c+zNQzFzRYYMg92a3g=; b=b2yRrKKCQz2qK9sK7vrxLr4/Sl
	1YqLKwjwOa9DxF3CYK3TkhOctsO1LWUAqzohJvLMoNB/eznfYzezv0szba90PNbwE2uRkeYA0WPdL
	BBzRRRQY22a3bVpRJMKI6m1C1PxsmoyVYtthPKi1qrE6UcZLvsQf9M6Wiqn94Xh6yZ1s=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WO-00087o-Jw
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:28 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WO-0005Em-Is
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:28 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WM-0000oB-OA; Thu, 15 Oct 2020 16:50:26 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH v2 02/17] Honour OSSTEST_SIMULATE_FAIL in sg-run-job
Date: Thu, 15 Oct 2020 16:50:04 +0100
Message-Id: <20201015155019.20705-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015155019.20705-1-iwj@xenproject.org>
References: <20201015155019.20705-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a Tcl list of globs for <job>.<step>, and allows for
simulating particular test failures.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-run-job | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sg-run-job b/sg-run-job
index dd76d4f2..c64ae026 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -406,7 +406,14 @@ proc spawn-ts {iffail testid args} {
     jobdb::spawn-step-commit $flight $jobinfo(job) $stepno $testid
 
     set xprefix {}
-    if {[var-or-default env(OSSTEST_SIMULATE) 0]} { set xprefix echo }
+    if {[var-or-default env(OSSTEST_SIMULATE) 0]} {
+	set xprefix echo
+	foreach ent [var-or-default env(OSSTEST_SIMULATE_FAIL) {}] {
+	    if {[string match $ent $jobinfo(job).$testid]} {
+		set xprefix OSSTEST_SIMULATE_FAIL
+	    }
+	}
+    }
 
     set log [jobdb::step-log-filename $flight $jobinfo(job) $stepno $ts]
     set redirects {}
-- 
2.20.1



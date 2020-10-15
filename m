Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7FA28F629
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 17:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7515.19658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5WR-0006HV-3a; Thu, 15 Oct 2020 15:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7515.19658; Thu, 15 Oct 2020 15:50:31 +0000
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
	id 1kT5WQ-0006Gu-VS; Thu, 15 Oct 2020 15:50:30 +0000
Received: by outflank-mailman (input) for mailman id 7515;
 Thu, 15 Oct 2020 15:50:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kT5WP-0006GR-Ub
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c9d18f5-3706-4452-bb2e-3b894d5a3882;
 Thu, 15 Oct 2020 15:50:29 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WO-00087r-QW
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:28 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WO-0005Ey-Oo
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:28 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kT5WN-0000oB-0F; Thu, 15 Oct 2020 16:50:27 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kT5WP-0006GR-Ub
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
X-Inumbo-ID: 8c9d18f5-3706-4452-bb2e-3b894d5a3882
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8c9d18f5-3706-4452-bb2e-3b894d5a3882;
	Thu, 15 Oct 2020 15:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=GKNUYQeiTTAK8ez/vVJcZ2hoW8Ug+I9meJLpgJqBeIU=; b=Q/8ZYg2rwXY9YNgyMWTqtdK71s
	Hnuv+uKXW4Y5/kNa24G4vbTHCC4kUxl0kAcWsbflvzZG+PKjMMND9O8uijMOaUI0WHyZEgdRDbgkK
	7r9RQqayc3e1qLH40ULry3k2bNV2W+sHp68N9Rp1NsMFipf4vagcjcVua7bKdRxT4WoI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WO-00087r-QW
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:28 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WO-0005Ey-Oo
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:28 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WN-0000oB-0F; Thu, 15 Oct 2020 16:50:27 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH v2 03/17] sg-report-flight: Consider all blessings for "never pass"
Date: Thu, 15 Oct 2020 16:50:05 +0100
Message-Id: <20201015155019.20705-4-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015155019.20705-1-iwj@xenproject.org>
References: <20201015155019.20705-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

$anypassq is used for the "never pass" check; the distinction between
this and simply "fail" is cosmetic (although it can be informative).

On non-"real" flights, it can easily happen that the flight never
passed *on this branch with this blessing* but has passed on real.  So
the steps subquery does not find us an answer within reasonable time.

Work around this by always searching for "real".  This keeps the
performance within acceptable bounds even during ad-hoc testing.

We don't actually use the row from this query, so the only effect is
that when the job passed in a "real" flight, we go on to the full
regresson analysis rather than short-circuiting and reporting "never
pass".

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-report-flight | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sg-report-flight b/sg-report-flight
index a07e03cb..15631001 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -935,7 +935,7 @@ sub justifyfailures ($;$) {
         )
         SELECT * FROM flights JOIN s USING (flight)
             WHERE $branches_cond_q
-              AND $blessingscond
+              AND ($blessingscond) OR blessing = 'real'
             LIMIT 1
 END
     $anypassq= db_prepare($anypassq);
-- 
2.20.1



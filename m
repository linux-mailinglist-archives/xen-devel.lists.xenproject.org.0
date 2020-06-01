Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE851EA42D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 14:45:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfjny-0002di-G7; Mon, 01 Jun 2020 12:44:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Um2E=7O=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jfjnw-0002dd-6T
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 12:44:36 +0000
X-Inumbo-ID: a5a6d5b6-a405-11ea-9dbe-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5a6d5b6-a405-11ea-9dbe-bc764e2007e4;
 Mon, 01 Jun 2020 12:44:35 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jfjnu-0006zf-FG; Mon, 01 Jun 2020 13:44:34 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 1/4] cs-bisection-step: Change some url. references to
 job.
Date: Mon,  1 Jun 2020 13:44:27 +0100
Message-Id: <20200601124430.29761-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This query is going to turn into two variants, one of which doesn't
have the url join.

In the output, prefer to refer to fields from job.  They are
constrained to be equal (and they are not null) so this has no
functional change.

Also swap the conditions over for clarity.

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cs-bisection-step | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/cs-bisection-step b/cs-bisection-step
index 16227234..f9ef1558 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -231,8 +231,8 @@ END
 
         SELECT url.val AS uval,
 	       rev.val AS rval,
-	       url.job AS job,
-      ${\ other_revision_job_suffix('url.job','url.use',' ') } AS othrev,
+	       rev.job AS job,
+      ${\ other_revision_job_suffix('rev.job','rev.use',' ') } AS othrev,
 	       url.name AS longname
 
 	    FROM tmp_build_info AS rev
@@ -241,8 +241,8 @@ END
            WHERE (rev.name LIKE E'built\\_revision\\_%' OR
                   rev.name LIKE E'revision\\_%')
   	     AND  url.name LIKE E'tree\\_%'
-	     AND  rev.use = url.use
-	     AND  rev.job = url.job
+	     AND  url.use = rev.use
+	     AND  url.job = rev.job
 	     AND (rev.name = 'built_revision_' || substr(url.name,6) OR
                   rev.name = 'revision_'       || substr(url.name,6))
 
-- 
2.20.1



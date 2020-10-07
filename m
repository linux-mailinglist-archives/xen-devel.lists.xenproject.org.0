Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB342866E3
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3677.10699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9L-0000xn-C6; Wed, 07 Oct 2020 18:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3677.10699; Wed, 07 Oct 2020 18:26:51 +0000
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
	id 1kQE9L-0000wd-5O; Wed, 07 Oct 2020 18:26:51 +0000
Received: by outflank-mailman (input) for mailman id 3677;
 Wed, 07 Oct 2020 18:26:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE5B-00072Q-Nf
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:33 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5aab6441-1978-40d2-b11a-5aa8d7b68ec3;
 Wed, 07 Oct 2020 18:20:59 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDkC-0007CF-Nl; Wed, 07 Oct 2020 19:00:52 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE5B-00072Q-Nf
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:33 +0000
X-Inumbo-ID: 5aab6441-1978-40d2-b11a-5aa8d7b68ec3
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5aab6441-1978-40d2-b11a-5aa8d7b68ec3;
	Wed, 07 Oct 2020 18:20:59 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDkC-0007CF-Nl; Wed, 07 Oct 2020 19:00:52 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 79/82] flight other job reporting: Further improvements to ordering
Date: Wed,  7 Oct 2020 19:00:21 +0100
Message-Id: <20201007180024.7932-80-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

We want to definitely put these NULLs last.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-report-flight | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sg-report-flight b/sg-report-flight
index d8829932..8f99bb69 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -1389,7 +1389,9 @@ END
       r_main AS
       (SELECT tident, hostname,
               bool_or(olive)                     AS olive,
-              1                                  AS kind_sort,
+              CASE WHEN min(prep_started)
+                   IS NOT NULL
+                   THEN 1 ELSE 3 END             AS kind_sort,
               flight, job,
 	      (SELECT status
 		 FROM jobs
@@ -1416,7 +1418,9 @@ END
 
       r_elided AS
       (SELECT tident, hostname, FALSE as olive,
-              2                                  AS kind_sort,
+              CASE WHEN count
+                   IS NOT NULL
+                   THEN 2 ELSE 4 END             AS kind_sort,
               $nullcols_main,
               $nullcols_tasks,
               count                              AS elided,
-- 
2.20.1



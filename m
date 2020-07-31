Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7BC2348BF
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 17:55:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1XMz-00055z-8t; Fri, 31 Jul 2020 15:54:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nr0X=BK=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k1XMy-00055u-F3
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 15:54:52 +0000
X-Inumbo-ID: 2afeaa3a-d346-11ea-8e65-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2afeaa3a-d346-11ea-8e65-bc764e2007e4;
 Fri, 31 Jul 2020 15:54:51 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k1XMw-0003MB-LC; Fri, 31 Jul 2020 16:54:50 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH] Disable mercurial support
Date: Fri, 31 Jul 2020 16:54:44 +0100
Message-Id: <20200731155444.2767-1-ian.jackson@eu.citrix.com>
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
Cc: committers@xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is in order that we can substantially simplify forthcoming
database changes.  If mercurial support were still desired, the right
thing to do would be to rework it now along the lines of this request.
But we haven't used it for some years.

It could be reenabled later, if this work were done then.  (Of course
there might be other bitrot already that we don't know about.)

CC: committers@xenproject.org
Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/TestSupport.pm |  5 +++++
 sg-report-flight       | 11 ++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 7eeac49f..faac106f 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -1661,6 +1661,11 @@ sub build_url_vcs ($) {
 	$tree = git_massage_url($tree);
     }
 
+    if ($vcs eq 'hg') {
+	die "mercurial support has rottted";
+	# to reinstate, git grep for "mercurial" and fix everything
+    }
+
     return ($tree, $vcs);
 }
 
diff --git a/sg-report-flight b/sg-report-flight
index 831917a9..49f7ba6a 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -299,7 +299,16 @@ END
                 last;
             }
             my ($wronginfo) = grep {
-                $_->[1]{val} !~ m/^(?: .*: )? $v /x;
+                $_->[1]{val} ne $v;
+                # Was once   $_->[1]{val} !~ m/^(?: .*: )? $v /x;
+		# to support stripping (local) changeset numbers from
+		# mercurial revisions in the val column.  But this
+		# does not work with our index query strategy.  To
+		# reinstate mercurial support, it will be necessary to
+		# either make the index query more complicated (eg an
+		# index on a substring of val) or to arrange for all
+		# the code to not ever store these revision counts in
+		# the db.  The latter is probably more correct.
             } @revisions;
 
             if (defined $wronginfo) {
-- 
2.20.1



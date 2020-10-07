Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D2D286703
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3704.11024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAD-0003Pf-IP; Wed, 07 Oct 2020 18:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3704.11024; Wed, 07 Oct 2020 18:27:45 +0000
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
	id 1kQEAC-0003Kr-6s; Wed, 07 Oct 2020 18:27:44 +0000
Received: by outflank-mailman (input) for mailman id 3704;
 Wed, 07 Oct 2020 18:27:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE3Z-00072Q-JR
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:53 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e804b8aa-d6c1-408b-9e73-b72abd65494b;
 Wed, 07 Oct 2020 18:19:50 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk8-0007CF-Lq; Wed, 07 Oct 2020 19:00:48 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE3Z-00072Q-JR
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:53 +0000
X-Inumbo-ID: e804b8aa-d6c1-408b-9e73-b72abd65494b
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e804b8aa-d6c1-408b-9e73-b72abd65494b;
	Wed, 07 Oct 2020 18:19:50 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk8-0007CF-Lq; Wed, 07 Oct 2020 19:00:48 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 61/82] runvar access: Introduce sharing_for_build
Date: Wed,  7 Oct 2020 19:00:03 +0100
Message-Id: <20201007180024.7932-62-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Builds don't have so much contingent setup.  We don't track the
runvars; we just rely on the share-* hostflag set in the job.

But selecthost() is going to automatically enable runvar access
control for shared/reused hosts.  So, provide a way to disable that.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/TestSupport.pm | 4 +++-
 ts-host-install        | 2 ++
 ts-xen-build-prep      | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 6403e52b..c6bd6714 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -143,7 +143,7 @@ BEGIN {
                       sha256file host_shared_mark_ready
                       gitcache_setup
 
-		      @accessible_runvar_pats
+		      @accessible_runvar_pats sharing_for_build
                       );
     %EXPORT_TAGS = ( );
 
@@ -3171,6 +3171,8 @@ END
                                  'home-osstest-gitconfig');
 }
 
+sub sharing_for_build () { @accessible_runvar_pats = qw(*); };
+
 sub runvar_access_restrict () {
     # restricts runvars to those in @accessible_runvar_pats
     return if "@accessible_runvar_pats" eq "*";
diff --git a/ts-host-install b/ts-host-install
index b0fd2028..5badc706 100755
--- a/ts-host-install
+++ b/ts-host-install
@@ -49,6 +49,8 @@ while (@ARGV and $ARGV[0] =~ m/^-/) {
     }
 }
 
+if ($build) { sharing_for_build(); }
+
 our ($whhost) = @ARGV;
 $whhost ||= 'host';
 our $ho= selecthost($whhost);
diff --git a/ts-xen-build-prep b/ts-xen-build-prep
index 092bbffe..fcabf75a 100755
--- a/ts-xen-build-prep
+++ b/ts-xen-build-prep
@@ -24,6 +24,7 @@ use Osstest::TestSupport;
 use Osstest::Debian;
 
 tsreadconfig();
+sharing_for_build();
 
 our ($whhost) = @ARGV;
 $whhost ||= 'host';
-- 
2.20.1



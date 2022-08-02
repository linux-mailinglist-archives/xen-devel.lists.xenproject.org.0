Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A043D587AAA
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 12:27:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379235.612531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIp6S-0003ZT-KB; Tue, 02 Aug 2022 10:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379235.612531; Tue, 02 Aug 2022 10:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIp6S-0003Xf-Gc; Tue, 02 Aug 2022 10:26:20 +0000
Received: by outflank-mailman (input) for mailman id 379235;
 Tue, 02 Aug 2022 10:26:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPpP=YG=citrix.com=prvs=206784369=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oIp6Q-0003I8-Dd
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 10:26:18 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8aeb72fb-124d-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 12:26:17 +0200 (CEST)
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
X-Inumbo-ID: 8aeb72fb-124d-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659435977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VglZLcyUFY4jo3jNwX1yvw5xUZlZ47FlvX09rpWoHdM=;
  b=NHyh6l9W0jR61CjmKsjXT29TGnZkNnlwLFMsO6+UjH9sops6GcuDWuN4
   tmLgN439YlQyKzeWbgw3TcM2/tuBzjWGQcL+x9NgrplmH1oA8UWidz/C2
   3P6XzR6u263ISmPqmHwZSpUKGNHic0wtc1Yce1FYmqjSRZIG+fHmxShoH
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79720159
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SB1/uq/xEv2oWdzinsLsDrUD5H6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 moXXWiBOPqJZzHzL910OYW3ph8A65SHz99rTVds+yw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EM35qyr0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGAF02E7JI88hLHUZD6
 dM+MysPSUDdrrfjqF67YrEEasULKcDqOMUUu216zCGfBvEjKXzBa/yUv5kChm52350QW6aFD
 yYaQWMHgBDoahtTOlARGdQmkf2hnHXXeDxEslOF46Ew5gA/ySQugee3aIOIK7RmQ+1lnH+Wu
 U3t4FjSQSgcEtWN9zTC03Cj07qncSTTB9tJSezQGuRRqFyMxEQDBRsOT1y5rPKlzEmkVLp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gDxh0YKNvVzfXDJdCGccNpp276faWADGy
 HeFg9PHOmxmnoGJbn+B2ZGPtjGVaXY8eDpqiTA/cecV3zXyiNht00OTFos6TfTdYs7dQm+pn
 W3TxMQqr/BK1JNQif3mlbzSq2j0zqUlWDLZ8ek+soiNygpiLLCoaIWzgbQwxaYRdd3JJrVtU
 ZVtpiR/0AztJcvU/MB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk0Y51bKGewO
 x6C4Gu9AaO/21PzNMdKj3+ZUZx2ncAM6/y/PhwrUja+SscoL1LWlM2fTUWRw3rsgCARrE3LA
 r/CKJ7EJStLVsxaIM+eHbh1PUkDmn9jngs+hPnTk3ya7FZpTCXNF+dbYAvXP7pRAWHtiFy9z
 uuz/vCik313ONASqAGNmWLPBTjm9UQGOK0=
IronPort-HdrOrdr: A9a23:vqqqLK3NeYdxhSJezPE3SgqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.93,210,1654574400"; 
   d="scan'208";a="79720159"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [OSSTEST PATCH 1/2] TestSupport: Add support for installing from backport repo
Date: Tue, 2 Aug 2022 11:26:01 +0100
Message-ID: <20220802102602.131992-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220802102602.131992-1-anthony.perard@citrix.com>
References: <20220802102602.131992-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We are going to need to install package from the debian backport
repository in order to do a build.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Osstest/TestSupport.pm | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 156cac799d58..91b0a7ab23a1 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -73,6 +73,7 @@ BEGIN {
                       target_run_pkgmanager_install
                       target_install_packages target_install_packages_norec
 		      target_install_packages_nonfree_nonconcurrent
+                      target_install_packages_backport
                       target_jobdir target_extract_jobdistpath_subdir
                       target_extract_jobdistpath target_extract_distpart
 		      target_tftp_prefix
@@ -650,8 +651,8 @@ sub target_putfile_root ($$$$;$) {
     tputfileex('root', @_);
 }
 
-sub target_run_pkgmanager_install ($$;$$) {
-    my ($ho, $packagelist, $norec, $force) = @_;
+sub target_run_pkgmanager_install ($$;$$$) {
+    my ($ho, $packagelist, $norec, $force, $backport) = @_;
     my @cmd;
     if ($ho->{OS} eq "freebsd") {
         push @cmd, qw(lockf /var/run/osstest-pkg-lock pkg-static install);
@@ -660,6 +661,7 @@ sub target_run_pkgmanager_install ($$;$$) {
                       with-lock-ex -w /var/lock/osstest-apt apt-get);
 	push @cmd, qw(-f) if $force;
 	push @cmd, qw(--no-install-recommends) if $norec;
+	push @cmd, "-t", "$ho->{Suite}-backports" if $backport;
 	push @cmd, qw(-y install);
     }
     push @cmd, @$packagelist;
@@ -688,6 +690,27 @@ END
     apt-get update
 END
 }
+sub target_install_packages_backport ($@) {
+    my ($ho, @packages) = @_;
+    my $had_backport_repo = 0;
+    target_editfile_root($ho, '/etc/apt/sources.list', sub {
+        my $suite = $ho->{Suite};
+        my $bp_url = Osstest::Debian::debian_mirror_url($ho);
+        while (<::EI>) {
+            if (m/^# $suite backports/) {
+                $had_backport_repo = 1;
+            }
+            print ::EO;
+        }
+        print ::EO <<EOF unless $had_backport_repo;
+
+# $suite backports
+deb $bp_url $suite-backports main
+EOF
+        });
+    target_cmd_root($ho, "apt-get update", 300) unless $had_backport_repo;
+    target_run_pkgmanager_install($ho,\@packages,0,0,1);
+}
 
 sub tpfcs_core {
     my ($tputfilef,$ho,$timeout,$filedata, $rdest,$lleaf) = @_;
-- 
Anthony PERARD



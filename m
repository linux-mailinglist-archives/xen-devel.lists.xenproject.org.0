Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9300A195D6A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 19:17:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHtWH-0004DV-F7; Fri, 27 Mar 2020 18:15:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tAzE=5M=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jHtWG-0004DG-Fg
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 18:15:48 +0000
X-Inumbo-ID: f324e04a-7056-11ea-b34e-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f324e04a-7056-11ea-b34e-bc764e2007e4;
 Fri, 27 Mar 2020 18:15:34 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jHtW1-0004UK-8g; Fri, 27 Mar 2020 18:15:33 +0000
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 18:15:25 +0000
Message-Id: <20200327181526.19412-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200327181526.19412-1-ian.jackson@eu.citrix.com>
References: <20200327181526.19412-1-ian.jackson@eu.citrix.com>
Subject: [Xen-devel] [OSSTEST PATCH 5/6] ts-logs-capture: try_fetch_logs:
 Honour $fs_ and $out_prefix
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

This allows us to add some stuff to add to each pattern, and each
filename.  This will be useful in a moment.

None of the call sites pass this yet.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-logs-capture | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/ts-logs-capture b/ts-logs-capture
index 418155ce..6be77676 100755
--- a/ts-logs-capture
+++ b/ts-logs-capture
@@ -68,11 +68,13 @@ END
     @guests = grep { defined $_->{Domid} } @allguests;
 }
 
-sub try_fetch_logs ($$) {
-    my ($lho, $logfilepats) = @_;
+sub try_fetch_logs ($$;$$) {
+    my ($lho, $logfilepats, $fs_prefix,$out_prefix) = @_;
+    $fs_prefix //= '';
+    $out_prefix //= '';
     my $ok= 0;
     foreach my $logfilepat (@$logfilepats) {
-        my $logfileslist= $logfilepat;
+        my $logfileslist= $fs_prefix.$logfilepat;
         if ($logfileslist =~ m/[*?]/) {
             if (!eval {
                 $logfileslist=
@@ -91,8 +93,9 @@ END
         }
         foreach my $logfile (split / /, $logfileslist) {
             my $llogfile= $logfile;
+	    $llogfile =~ s,^\Q$fs_prefix\E,,;
             $llogfile =~ s,/,-,g;
-            $llogfile= hostnamepath($lho)."--$llogfile";
+            $llogfile= hostnamepath($lho)."-$out_prefix-$llogfile";
             logm("fetching $logfile to $llogfile");
             if (!eval {
                 target_getfile_root($lho,60, $logfile,"$stash/$llogfile");
-- 
2.11.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A741F39CF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:33:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jicVb-0006K0-Lt; Tue, 09 Jun 2020 11:33:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7ZI/=7W=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jicVa-0006Ju-8o
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:33:34 +0000
X-Inumbo-ID: 0cb2043e-aa45-11ea-bb8b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0cb2043e-aa45-11ea-bb8b-bc764e2007e4;
 Tue, 09 Jun 2020 11:33:33 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jicVY-00079I-Kg; Tue, 09 Jun 2020 12:33:32 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [XEN PATCH for-4.14 1/2] docs-parse-support-md: Prepare for copying
 with pandoc versions
Date: Tue,  9 Jun 2020 12:33:22 +0100
Message-Id: <20200609113323.32731-1-ian.jackson@eu.citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <xadimgnik@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Different pandoc versions generate, and expect, a different toplevel
structure for their json output and inpout.  Newer pandoc's toplevel
is a hash.  We are going to want to support this.  We can tell what
kind of output we should produce by looking at the input we got (which
itself came from pandoc).  So:

 * Make space for code to read toplevel objects which are not arrays.
   Currently this code is absent and we just die explicitly (rather
   than dying because we tried to use a hashref as an array ref).

 * Move generation of the toplevel json structure out of
   pandoc2html_inline, and abstract it away through a subref which is
   set up when we read the input file.

This is just prep work.  No functional change other than a change to
an error message.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 docs/parse-support-md | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/docs/parse-support-md b/docs/parse-support-md
index 84f0a96a0f..b9978bfb4d 100755
--- a/docs/parse-support-md
+++ b/docs/parse-support-md
@@ -232,6 +232,8 @@ sub r_content ($) {
     }
 }
 
+our $pandoc_toplevel_constructor;
+
 sub r_toplevel ($) {
     my ($i) = @_;
 
@@ -241,9 +243,21 @@ sub r_toplevel ($) {
     $had_unknown = undef;
     $had_feature = undef;
 
-    foreach my $e (@$i) {
-        next unless ref $e eq 'ARRAY';
-        r_content $e;
+    my $blocks;
+    if (ref $i eq 'ARRAY') {
+	$pandoc_toplevel_constructor = sub {
+	    my ($blocks) = @_;
+	    return [
+		    { unMeta => { } },
+		    $blocks,
+		   ];
+	};
+	foreach my $e (@$i) {
+	    next unless ref $e eq 'ARRAY';
+	    r_content $e;
+	}
+    } else {
+	die;
     }
 }
 
@@ -274,10 +288,10 @@ sub pandoc2html_inline ($) {
     my ($content) = @_;
 
     my $json_fh = IO::File::new_tmpfile or die $!;
-    my $j = to_json([
-                     { unMeta => { } },
-                     [{ t => 'Para', c => $content }],
-                    ]) or die $!;
+
+    my $blocks = [{ t => 'Para', c => $content }];
+    my $data = $pandoc_toplevel_constructor->($blocks);
+    my $j = to_json($data) or die $!;
     print $json_fh $j;
     flush $json_fh or die $!;
     seek $json_fh,0,0 or die $!;
-- 
2.20.1



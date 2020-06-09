Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E501F39CE
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:33:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jicVg-0006Kc-TC; Tue, 09 Jun 2020 11:33:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7ZI/=7W=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jicVf-0006Ju-7V
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:33:39 +0000
X-Inumbo-ID: 0dacc248-aa45-11ea-8496-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dacc248-aa45-11ea-8496-bc764e2007e4;
 Tue, 09 Jun 2020 11:33:35 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jicVa-00079I-CU; Tue, 09 Jun 2020 12:33:34 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [XEN PATCH for-4.14 2/2] docs-parse-support-md: Cope with buster's
 pandoc
Date: Tue,  9 Jun 2020 12:33:23 +0100
Message-Id: <20200609113323.32731-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200609113323.32731-1-ian.jackson@eu.citrix.com>
References: <20200609113323.32731-1-ian.jackson@eu.citrix.com>
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

Provide the implementation for newer pandoc json.

I have done an adhoc test and this now works on both buster and
stretch and seems to produce the expected support matrix when run
using the example rune (which processes unstable and 4.11).

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 docs/parse-support-md | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/docs/parse-support-md b/docs/parse-support-md
index b9978bfb4d..a397637639 100755
--- a/docs/parse-support-md
+++ b/docs/parse-support-md
@@ -243,6 +243,15 @@ sub r_toplevel ($) {
     $had_unknown = undef;
     $had_feature = undef;
 
+    # Pandoc's JSON output changed some time between 1.17.2 (stretch)
+    # and 2.2.1 (buster).  I can find no documentation about this
+    # change or about the compatibility rules.  (It seems that
+    # processing the parse tree *is* supported upstream: they offer
+    # many libraries to do this inside the pandoc process.)
+    # Empirically, what has changed is just the top level structure.
+    # Also pandoc wants the same structure back that it spat out,
+    # when we ask it to format snippets.
+
     my $blocks;
     if (ref $i eq 'ARRAY') {
 	$pandoc_toplevel_constructor = sub {
@@ -256,6 +265,17 @@ sub r_toplevel ($) {
 	    next unless ref $e eq 'ARRAY';
 	    r_content $e;
 	}
+    } elsif (ref $i eq 'HASH') {
+	my $api_version = $i->{'pandoc-api-version'};
+	$pandoc_toplevel_constructor = sub {
+	    my ($blocks) = @_;
+	    return {
+		    blocks => $blocks,
+		    meta => { },
+		    'pandoc-api-version' => $api_version,
+		   };
+	};
+	r_content $i->{blocks};
     } else {
 	die;
     }
-- 
2.20.1



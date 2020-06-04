Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911DE1EE4B7
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 14:45:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgpFI-0005Ze-J4; Thu, 04 Jun 2020 12:45:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlcT=7R=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jgpFH-0005ZI-Cc
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 12:45:19 +0000
X-Inumbo-ID: 36dc180e-a661-11ea-81bc-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36dc180e-a661-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 12:45:05 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jgpF2-0006vr-Nt; Thu, 04 Jun 2020 13:45:04 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 1/4] cs-bisection-step: need_repro_sequence: Provide
 info to callback
Date: Thu,  4 Jun 2020 13:44:56 +0100
Message-Id: <20200604124459.18453-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200604124459.18453-1-ian.jackson@eu.citrix.com>
References: <20200604124459.18453-1-ian.jackson@eu.citrix.com>
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

This will be used by the callback in a moment.

No functional change yet.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cs-bisection-step | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/cs-bisection-step b/cs-bisection-step
index 478baa5b..35085e89 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -805,7 +805,8 @@ our $repro_count;
 sub need_repro_sequence ($$) {
     my ($need_each, $code) = @_;
     #
-    # $code->() should call, in turn for each required event,
+    # $code->($repro_count, $is_last_repro)
+    # should call, in turn for each required event,
     #    need_repro('pass', $nodes{SOMETHING}, $what) or
     #    need_repro('fail', $nodes{SOMETHING}, $what)
     # and return true as soon as any of the need_repro's return true.
@@ -817,7 +818,7 @@ sub need_repro_sequence ($$) {
     local ($repro_lastflight) = 0;
     local ($repro_count);
     for ($repro_count=0; $repro_count<$need_each; $repro_count++) {
-        return 1 if $code->();
+        return 1 if $code->($repro_count, $repro_count==$need_each-1);
     }
 }
 
@@ -851,6 +852,7 @@ sub search () {
 
     return if 
         need_repro_sequence(2, sub {
+            my ($repro_count, $is_last_repro) = @_;
             need_repro('pass', $nodes{"@basispass_rtuple"}, "basis pass") ||
             need_repro('fail', $nodes{"@latest_rtuple"},    "basis failure");
         });
-- 
2.20.1



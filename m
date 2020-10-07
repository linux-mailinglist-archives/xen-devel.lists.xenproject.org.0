Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680F128666D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3614.10419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQDkY-0004Pl-8f; Wed, 07 Oct 2020 18:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3614.10419; Wed, 07 Oct 2020 18:01:14 +0000
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
	id 1kQDkY-0004Ox-42; Wed, 07 Oct 2020 18:01:14 +0000
Received: by outflank-mailman (input) for mailman id 3614;
 Wed, 07 Oct 2020 18:01:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQDkW-0003r9-Rc
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:01:12 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 583345bd-7fd4-4cfd-9b83-fc8afdf57668;
 Wed, 07 Oct 2020 18:00:35 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDju-0007CF-84; Wed, 07 Oct 2020 19:00:34 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQDkW-0003r9-Rc
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:01:12 +0000
X-Inumbo-ID: 583345bd-7fd4-4cfd-9b83-fc8afdf57668
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 583345bd-7fd4-4cfd-9b83-fc8afdf57668;
	Wed, 07 Oct 2020 18:00:35 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDju-0007CF-84; Wed, 07 Oct 2020 19:00:34 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 08/82] host reuse: ms-planner: Bring some variables forward
Date: Wed,  7 Oct 2020 18:59:10 +0100
Message-Id: <20201007180024.7932-9-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Move the scope of $share earlier in cmd_show_html, and also introduce
$shared in the colour computation.  This makes the next changes easier.

No functional change.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 ms-planner | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/ms-planner b/ms-planner
index 11423404..d9f3db91 100755
--- a/ms-planner
+++ b/ms-planner
@@ -677,6 +677,7 @@ sub cmd_show_html () {
 	my $shares;
 	foreach my $evt (@{ $plan->{Events}{$reso} }) {
 	    my $type= $evt->{Type};
+	    my $share= $evt->{Share};
 	    my $show=
 		$type eq End ? ($evt->{Share} ? "End $evt->{Info}" : "") :
                 $type eq Unshare ? "$type [".showsharetype($evt->{Info})."]" :
@@ -685,7 +686,6 @@ sub cmd_show_html () {
 		(!$evt->{Allocated} ? Booking :
                  ($evt->{Allocated}{Live} ? Allocation : Completed).
                  " $evt->{Allocated}{Task}")." ".$evt->{Info};
-	    my $share= $evt->{Share};
 	    if ($share) {
 		$show .= sprintf(" [%s %d/%d %d]",
 				 showsharetype($share->{Type}),
@@ -789,15 +789,16 @@ sub cmd_show_html () {
                     $content->{Avail} ||
                     $content->{Type} eq After ||
                     ($content->{Allocated} && !$content->{Allocated}{Live});
+                my $shared = $content->{Share};
                 my $bgcolour=
                     $avail ?
-                    ($content->{Share} ? "#ccccff" : "#ffffff") :
+                    ($shared ? "#ccccff" : "#ffffff") :
                     $content->{Type} eq Overrun ?
-                    ($content->{Share} ? "#443344" : "#442222") :
+                    ($shared ? "#443344" : "#442222") :
                     $content->{Allocated} ?
-                    ($content->{Share} ? "#882288" : "#882222")
+                    ($shared ? "#882288" : "#882222")
                     :
-                    ($content->{Share} ? "#005555" : "#448844");
+                    ($shared ? "#005555" : "#448844");
                 my $fgcolour=
                     $avail ? "#000000" : "#ffffff";
 		printf "<td valign=top rowspan=%d".
-- 
2.20.1



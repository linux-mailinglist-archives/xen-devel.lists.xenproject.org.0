Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FCF28666E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3615.10431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQDkd-0004WE-OA; Wed, 07 Oct 2020 18:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3615.10431; Wed, 07 Oct 2020 18:01:19 +0000
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
	id 1kQDkd-0004VG-EM; Wed, 07 Oct 2020 18:01:19 +0000
Received: by outflank-mailman (input) for mailman id 3615;
 Wed, 07 Oct 2020 18:01:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQDkb-0003r9-Rh
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:01:17 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96361b6a-c30f-4d7b-a433-2f271bf7a56d;
 Wed, 07 Oct 2020 18:00:35 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDju-0007CF-F2; Wed, 07 Oct 2020 19:00:34 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQDkb-0003r9-Rh
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:01:17 +0000
X-Inumbo-ID: 96361b6a-c30f-4d7b-a433-2f271bf7a56d
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 96361b6a-c30f-4d7b-a433-2f271bf7a56d;
	Wed, 07 Oct 2020 18:00:35 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDju-0007CF-F2; Wed, 07 Oct 2020 19:00:34 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 09/82] host reuse: ms-planner: Do not show reuse as shared in the plan
Date: Wed,  7 Oct 2020 18:59:11 +0100
Message-Id: <20201007180024.7932-10-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

If the number of shares is 1, do not show it as shared, and also
ignore the Unshare events.

This clarifies the display, especially when used with forthcoming test
host reuse work.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 ms-planner | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/ms-planner b/ms-planner
index d9f3db91..4e38e4e3 100755
--- a/ms-planner
+++ b/ms-planner
@@ -249,6 +249,7 @@ sub launder_check_plan () {
 			Avail => 1,
 			Info => $cshare->{Type},
 			PreviousShare => $cshare,
+                        Shares => $cshare->{Shares},
 		    };
 		    $cshare= undef;
 		}
@@ -678,6 +679,7 @@ sub cmd_show_html () {
 	foreach my $evt (@{ $plan->{Events}{$reso} }) {
 	    my $type= $evt->{Type};
 	    my $share= $evt->{Share};
+	    next if $type eq 'Unshare' && $evt->{Shares} == 1;
 	    my $show=
 		$type eq End ? ($evt->{Share} ? "End $evt->{Info}" : "") :
                 $type eq Unshare ? "$type [".showsharetype($evt->{Info})."]" :
@@ -686,7 +688,7 @@ sub cmd_show_html () {
 		(!$evt->{Allocated} ? Booking :
                  ($evt->{Allocated}{Live} ? Allocation : Completed).
                  " $evt->{Allocated}{Task}")." ".$evt->{Info};
-	    if ($share) {
+	    if ($share && $share->{Shares} != 1) {
 		$show .= sprintf(" [%s %d/%d %d]",
 				 showsharetype($share->{Type}),
 				 $share->{Shares} - $evt->{Avail},
@@ -789,7 +791,8 @@ sub cmd_show_html () {
                     $content->{Avail} ||
                     $content->{Type} eq After ||
                     ($content->{Allocated} && !$content->{Allocated}{Live});
-                my $shared = $content->{Share};
+                my $shared = $content->{Share}
+		          && $content->{Share}{Shares} != 1;
                 my $bgcolour=
                     $avail ?
                     ($shared ? "#ccccff" : "#ffffff") :
-- 
2.20.1



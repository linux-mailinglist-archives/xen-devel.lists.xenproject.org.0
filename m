Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4882DEA5D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 21:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56681.99279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqMd3-000197-E0; Fri, 18 Dec 2020 20:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56681.99279; Fri, 18 Dec 2020 20:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqMd3-00018i-Ag; Fri, 18 Dec 2020 20:45:33 +0000
Received: by outflank-mailman (input) for mailman id 56681;
 Fri, 18 Dec 2020 20:45:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dpih=FW=daemonizer.de=maxi@srs-us1.protection.inumbo.net>)
 id 1kqMd2-00018c-IB
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 20:45:32 +0000
Received: from mx1.somlen.de (unknown [2a00:1828:a019::100:0])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 489e8013-2004-4272-bf58-e05c90e9a54b;
 Fri, 18 Dec 2020 20:45:31 +0000 (UTC)
Received: by mx1.somlen.de with ESMTPSA id 48D09C3AF0E;
 Fri, 18 Dec 2020 21:45:30 +0100 (CET)
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
X-Inumbo-ID: 489e8013-2004-4272-bf58-e05c90e9a54b
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: Maximilian Engelhardt <maxi@daemonizer.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/3] docs: use predictable ordering in generated documentation
Date: Fri, 18 Dec 2020 21:42:34 +0100
Message-Id: <31df2a1128c15bc1b4c738bf52e29c80982b4170.1608319634.git.maxi@daemonizer.de>
In-Reply-To: <cover.1608319634.git.maxi@daemonizer.de>
References: <cover.1608319634.git.maxi@daemonizer.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the seq number is equal, sort by the title to get predictable
output ordering. This is useful for reproducible builds.

Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>
---
 docs/xen-headers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/xen-headers b/docs/xen-headers
index 54155632c4..8c434d77e2 100755
--- a/docs/xen-headers
+++ b/docs/xen-headers
@@ -331,7 +331,7 @@ sub output_index () {
 <h2>Starting points</h2>
 <ul>
 END
-    foreach my $ic (sort { $a->{Seq} <=> $b->{Seq} } @incontents) {
+    foreach my $ic (sort { $a->{Seq} <=> $b->{Seq} or $a->{Title} cmp $b->{Title} } @incontents) {
         $o .= "<li><a href=\"$ic->{Href}\">$ic->{Title}</a></li>\n";
     }
     $o .= "</ul>\n";
-- 
2.20.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0E92866FB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3698.10950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEA0-0002oo-I7; Wed, 07 Oct 2020 18:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3698.10950; Wed, 07 Oct 2020 18:27:32 +0000
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
	id 1kQE9z-0002jx-HP; Wed, 07 Oct 2020 18:27:31 +0000
Received: by outflank-mailman (input) for mailman id 3698;
 Wed, 07 Oct 2020 18:27:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE4X-00072Q-Lk
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:53 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77d213f6-ed2e-46b6-b768-ae539b012360;
 Wed, 07 Oct 2020 18:20:22 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDju-0007CF-L3; Wed, 07 Oct 2020 19:00:34 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE4X-00072Q-Lk
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:53 +0000
X-Inumbo-ID: 77d213f6-ed2e-46b6-b768-ae539b012360
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 77d213f6-ed2e-46b6-b768-ae539b012360;
	Wed, 07 Oct 2020 18:20:22 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDju-0007CF-L3; Wed, 07 Oct 2020 19:00:34 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 10/82] hsot reuse: ms-planner: Abbreviate reporting of test shares
Date: Wed,  7 Oct 2020 18:59:12 +0100
Message-Id: <20201007180024.7932-11-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ms-planner | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ms-planner b/ms-planner
index 4e38e4e3..78d27b2f 100755
--- a/ms-planner
+++ b/ms-planner
@@ -414,11 +414,13 @@ END
 	next if $plan->{Events}{$reskey};
 	print DEBUG "document existing quiescent sharing $reskey".
 	    " share.Type $cshare->{Type}\n";
+	my $type = $cshare->{Type};
+	$type = "$&..." if $type =~ m{^test-\d+(?=\-)};
 	my $evt = {
             Time => $plan->{Start},
             Type => Unshare,
 	    Avail => 1,
-            Info => "recently shared $cshare->{Type}",
+            Info => "recently $type",
             PreviousShare => { %$cshare },
 	};
 	delete $evt->{PreviousShare}{OnlyPreparing};
-- 
2.20.1



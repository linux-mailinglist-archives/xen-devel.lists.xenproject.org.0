Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D6328671D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3770.11323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEBM-0006iQ-LZ; Wed, 07 Oct 2020 18:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3770.11323; Wed, 07 Oct 2020 18:28:56 +0000
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
	id 1kQEBM-0006fQ-4R; Wed, 07 Oct 2020 18:28:56 +0000
Received: by outflank-mailman (input) for mailman id 3770;
 Wed, 07 Oct 2020 18:28:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE5z-00072Q-Ph
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:23 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ebb28b1-5068-4d39-a376-f39b1a9a02b4;
 Wed, 07 Oct 2020 18:21:27 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk2-0007CF-7y; Wed, 07 Oct 2020 19:00:42 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE5z-00072Q-Ph
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:23 +0000
X-Inumbo-ID: 9ebb28b1-5068-4d39-a376-f39b1a9a02b4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9ebb28b1-5068-4d39-a376-f39b1a9a02b4;
	Wed, 07 Oct 2020 18:21:27 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk2-0007CF-7y; Wed, 07 Oct 2020 19:00:42 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 35/82] resource reporting: Print username when listing "rogue tasks"
Date: Wed,  7 Oct 2020 18:59:37 +0100
Message-Id: <20201007180024.7932-36-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ms-planner | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ms-planner b/ms-planner
index 78d27b2f..41f27fa0 100755
--- a/ms-planner
+++ b/ms-planner
@@ -325,6 +325,7 @@ END
 	    $info .= " $arow->{type} $arow->{refkey}";
 	    $info .= " ($arow->{comment})" if defined $arow->{comment};
 	    $info .= " $arow->{subtask}";
+	    $info .= " (user $arow->{username})";
 	}
 	$plan->{Allocations}{$reskey}= {
             Task => $arow->{owntaskid},
-- 
2.20.1



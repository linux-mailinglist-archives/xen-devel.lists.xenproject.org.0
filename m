Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4D82866F8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3696.10931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9x-0002ge-Mx; Wed, 07 Oct 2020 18:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3696.10931; Wed, 07 Oct 2020 18:27:29 +0000
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
	id 1kQE9w-0002c7-JF; Wed, 07 Oct 2020 18:27:28 +0000
Received: by outflank-mailman (input) for mailman id 3696;
 Wed, 07 Oct 2020 18:27:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE77-00072Q-S8
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:24:33 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cff2d2c9-adb1-41e0-ab49-5bf585595830;
 Wed, 07 Oct 2020 18:22:05 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk4-0007CF-AH; Wed, 07 Oct 2020 19:00:44 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE77-00072Q-S8
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:24:33 +0000
X-Inumbo-ID: cff2d2c9-adb1-41e0-ab49-5bf585595830
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cff2d2c9-adb1-41e0-ab49-5bf585595830;
	Wed, 07 Oct 2020 18:22:05 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk4-0007CF-AH; Wed, 07 Oct 2020 19:00:44 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 43/82] ts-hosts-allocate-Executive print sharing info in debug output
Date: Wed,  7 Oct 2020 18:59:45 +0100
Message-Id: <20201007180024.7932-44-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 ts-hosts-allocate-Executive | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index 58e9f891..fc107c08 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -691,7 +691,9 @@ sub hid_recurse ($$) {
     print DEBUG "$dbg FINAL start=$start_time va=$variation_age".
 	" variation_bonus=$variation_bonus".
         " previously_failed=$previously_failed".
-	" previously_failed_equiv=$previously_failed_equiv cost=$cost\n";
+	" previously_failed_equiv=$previously_failed_equiv".
+	" eff.share_bonus=$share_reuse*$share_reuse_bonus".
+	" cost=$cost\n";
 
     if (!defined $best || $cost < $best->{Cost}) {
         print DEBUG "$dbg FINAL BEST: ".
-- 
2.20.1



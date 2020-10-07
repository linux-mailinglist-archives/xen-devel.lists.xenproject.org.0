Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BF72866E4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:26:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3679.10724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9N-00012n-EC; Wed, 07 Oct 2020 18:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3679.10724; Wed, 07 Oct 2020 18:26:53 +0000
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
	id 1kQE9N-000110-2s; Wed, 07 Oct 2020 18:26:53 +0000
Received: by outflank-mailman (input) for mailman id 3679;
 Wed, 07 Oct 2020 18:26:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE4r-00072Q-Ma
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:13 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63f7e1ad-c494-4b89-b87a-6c792056477b;
 Wed, 07 Oct 2020 18:20:30 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDkC-0007CF-V0; Wed, 07 Oct 2020 19:00:53 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE4r-00072Q-Ma
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:13 +0000
X-Inumbo-ID: 63f7e1ad-c494-4b89-b87a-6c792056477b
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 63f7e1ad-c494-4b89-b87a-6c792056477b;
	Wed, 07 Oct 2020 18:20:30 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDkC-0007CF-V0; Wed, 07 Oct 2020 19:00:53 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 80/82] tsreadconfig: Change misleading "setting" message
Date: Wed,  7 Oct 2020 19:00:22 +0100
Message-Id: <20201007180024.7932-81-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are the *existing* runvars and it is confusing that we print
"setting" for them.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/TestSupport.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 163862f8..f2d8a0e1 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -210,7 +210,7 @@ END
         while ($row= $q->fetchrow_hashref()) {
             $r{ $row->{name} }= $row->{val};
 	    $r_notsynth{ $row->{name} }= !$row->{synth};
-            logm("setting $row->{name}=$row->{val}");
+            logm("runvar $row->{name}=$row->{val}");
         }
         $q->finish();
     });
-- 
2.20.1



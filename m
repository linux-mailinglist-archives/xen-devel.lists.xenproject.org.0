Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ADF2866F0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3689.10841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9f-0001rM-PI; Wed, 07 Oct 2020 18:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3689.10841; Wed, 07 Oct 2020 18:27:11 +0000
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
	id 1kQE9e-0001n3-MI; Wed, 07 Oct 2020 18:27:10 +0000
Received: by outflank-mailman (input) for mailman id 3689;
 Wed, 07 Oct 2020 18:27:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE6E-00072Q-QR
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:38 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2b79de9-1655-40fe-9954-e6f3aa7c5974;
 Wed, 07 Oct 2020 18:21:33 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjx-0007CF-P2; Wed, 07 Oct 2020 19:00:37 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE6E-00072Q-QR
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:38 +0000
X-Inumbo-ID: f2b79de9-1655-40fe-9954-e6f3aa7c5974
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f2b79de9-1655-40fe-9954-e6f3aa7c5974;
	Wed, 07 Oct 2020 18:21:33 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjx-0007CF-P2; Wed, 07 Oct 2020 19:00:37 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 18/82] host allocation: Remove some unnecessary definedness tests
Date: Wed,  7 Oct 2020 18:59:20 +0100
Message-Id: <20201007180024.7932-19-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

$set_info->() already checkes for undef, and returns immediately in
that case.  So there is no point checking at the call site.

No functional change.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 Osstest/Executive.pm | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index f17e7b70..5d71d08c 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -849,15 +849,8 @@ sub alloc_resources {
                 $set_info->('sub-priority',$ENV{OSSTEST_RESOURCE_SUBPRIORITY});
                 $set_info->('preinfo',     $ENV{OSSTEST_RESOURCE_PREINFO});
 		$set_info->('feature-noalloc', 1);
-
-                if (defined $waitstart) {
-                    $set_info->('wait-start',$waitstart);
-                }
-
-                my $adjust= $xparams{WaitStartAdjust};
-                if (defined $adjust) {
-                    $set_info->('wait-start-adjust',$adjust);
-                }
+		$set_info->('wait-start',$waitstart);
+		$set_info->('wait-start-adjust',$xparams{WaitStartAdjust});
 
                 my $jobinfo= $xparams{JobInfo};
                 if (!defined $jobinfo and defined $flight and defined $job) {
-- 
2.20.1



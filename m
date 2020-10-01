Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BC32803DF
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 18:25:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1458.4621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO1OK-0001aY-Ka; Thu, 01 Oct 2020 16:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458.4621; Thu, 01 Oct 2020 16:25:12 +0000
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
	id 1kO1OK-0001Zt-GH; Thu, 01 Oct 2020 16:25:12 +0000
Received: by outflank-mailman (input) for mailman id 1458;
 Thu, 01 Oct 2020 16:25:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kO1OI-0001JL-K1
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:25:10 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e49779b-04c5-4b07-8019-bb35150fe206;
 Thu, 01 Oct 2020 16:24:49 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kO1Nw-00029L-TM; Thu, 01 Oct 2020 17:24:49 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kO1OI-0001JL-K1
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:25:10 +0000
X-Inumbo-ID: 3e49779b-04c5-4b07-8019-bb35150fe206
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3e49779b-04c5-4b07-8019-bb35150fe206;
	Thu, 01 Oct 2020 16:24:49 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kO1Nw-00029L-TM; Thu, 01 Oct 2020 17:24:49 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 1/8] Executive: Fix an undef warning message
Date: Thu,  1 Oct 2020 17:24:32 +0100
Message-Id: <20201001162439.18160-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

$onhost can be undef too

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/Executive.pm | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Osstest/Executive.pm b/Osstest/Executive.pm
index 80e70070..a0d9f81e 100644
--- a/Osstest/Executive.pm
+++ b/Osstest/Executive.pm
@@ -1283,7 +1283,8 @@ END
     return sub {
         my ($job, $hostidname, $onhost, $uptoincl_testid) = @_;
 
-	my $memokey = "$job $hostidname $onhost ".($uptoincl_testid//"");
+	my $memokey = "$job $hostidname "
+	  .($onhost//"")." ".($uptoincl_testid//"");
 	my $memo = $our_memo->{$memokey};
 	return @$memo if $memo;
 
-- 
2.20.1



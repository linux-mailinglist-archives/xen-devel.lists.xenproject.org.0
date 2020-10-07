Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51612866E7
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3681.10751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9Q-0001BV-FU; Wed, 07 Oct 2020 18:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3681.10751; Wed, 07 Oct 2020 18:26:56 +0000
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
	id 1kQE9Q-0001AE-7j; Wed, 07 Oct 2020 18:26:56 +0000
Received: by outflank-mailman (input) for mailman id 3681;
 Wed, 07 Oct 2020 18:26:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE5k-00072Q-Op
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:08 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7be757a-7ef1-4450-aafd-609299bbaff6;
 Wed, 07 Oct 2020 18:21:19 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk7-0007CF-AN; Wed, 07 Oct 2020 19:00:47 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE5k-00072Q-Op
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:08 +0000
X-Inumbo-ID: b7be757a-7ef1-4450-aafd-609299bbaff6
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b7be757a-7ef1-4450-aafd-609299bbaff6;
	Wed, 07 Oct 2020 18:21:19 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk7-0007CF-AN; Wed, 07 Oct 2020 19:00:47 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 56/82] subst_netboot_template: Do not use all of %r
Date: Wed,  7 Oct 2020 18:59:58 +0100
Message-Id: <20201007180024.7932-57-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Instead of copying all of %r into %v, have the template substitutor
fall back to %r from %v.

This is going to be important when we have host-reuse-related access
control to %r.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/TestSupport.pm | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index be6b7119..634d6d2e 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -2876,6 +2876,7 @@ sub subst_netboot_template ($$$) {
 	$pat =~ s{\%(\w*)\%}{
 		    $1 eq '' ? '%' :
 		    defined($v->{$1}) ? $v->{$1} :
+		    defined($r{$1}) ? $r{$1} :
 		    next;
 		 }ge;
 	# and return the first pattern we managed to completely substitute
@@ -2890,7 +2891,7 @@ sub host_netboot_file ($;$) {
     # returns the full netboot filename path
     # in array context, returns (dir, pathtail)
     #  where dir does not depend on $templatekeytail
-    my %v = %r;
+    my %v;
     my $firmware = get_host_property($ho, "firmware");
     my $templatekeybase = $firmware eq 'uefi' ? 'NetGrub' : 'Pxe';
     $templatekeytail //= 'Templates';
-- 
2.20.1



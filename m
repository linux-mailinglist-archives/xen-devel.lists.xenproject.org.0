Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD47286709
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:28:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3712.11107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAW-0004Lx-DZ; Wed, 07 Oct 2020 18:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3712.11107; Wed, 07 Oct 2020 18:28:04 +0000
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
	id 1kQEAV-0004FP-Hu; Wed, 07 Oct 2020 18:28:03 +0000
Received: by outflank-mailman (input) for mailman id 3712;
 Wed, 07 Oct 2020 18:27:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE6x-00072Q-S3
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:24:23 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8f749b0-926d-4602-b095-e1080888c615;
 Wed, 07 Oct 2020 18:21:59 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk8-0007CF-6P; Wed, 07 Oct 2020 19:00:48 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE6x-00072Q-S3
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:24:23 +0000
X-Inumbo-ID: f8f749b0-926d-4602-b095-e1080888c615
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f8f749b0-926d-4602-b095-e1080888c615;
	Wed, 07 Oct 2020 18:21:59 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk8-0007CF-6P; Wed, 07 Oct 2020 19:00:48 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 60/82] runvar access: Use runvar_glob for dmrestrict runvar search
Date: Wed,  7 Oct 2020 19:00:02 +0100
Message-Id: <20201007180024.7932-61-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 3fa26e45..ae3c1d33 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -1032,7 +1032,7 @@ END
     # security.d.o CDN seems unreliable right now
     # and jessie-updates is no more
 
-    if (grep { m/_dmrestrict$/ && $r{$_} } keys %r and
+    if (grep { $r{$_} } runvar_glob('*_dmrestrict') and
 	$suite =~ m/stretch/) {
 	preseed_backports_packages($ho, $sfx, \%xopts, $suite,
 				   qw(chiark-scripts));
-- 
2.20.1



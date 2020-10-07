Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3832866E6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3680.10735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9O-00014t-5M; Wed, 07 Oct 2020 18:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3680.10735; Wed, 07 Oct 2020 18:26:54 +0000
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
	id 1kQE9N-00012c-Ot; Wed, 07 Oct 2020 18:26:53 +0000
Received: by outflank-mailman (input) for mailman id 3680;
 Wed, 07 Oct 2020 18:26:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE3F-00072Q-JI
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:33 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a795a7b0-ab03-49c3-846d-640a676d8665;
 Wed, 07 Oct 2020 18:19:42 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjx-0007CF-CF; Wed, 07 Oct 2020 19:00:37 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE3F-00072Q-JI
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:33 +0000
X-Inumbo-ID: a795a7b0-ab03-49c3-846d-640a676d8665
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a795a7b0-ab03-49c3-846d-640a676d8665;
	Wed, 07 Oct 2020 18:19:42 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjx-0007CF-CF; Wed, 07 Oct 2020 19:00:37 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 17/82] Debian: osstest-erase-other-disks: Slightly guard against races
Date: Wed,  7 Oct 2020 18:59:19 +0100
Message-Id: <20201007180024.7932-18-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Apparently it can happen that something decides to rescan a partition
table, removing a partition block device, while it is being zeroed:

 osstest-erase-other-disks-6081: hd devices present after: /dev/hd*
 osstest-erase-other-disks-6081: Erasing /dev/sda
 osstest-erase-other-disks-6081: Erasing /dev/sda1
 osstest-erase-other-disks-6081: /dev/sda1 is no longer a block device!

To try to narrow the window during which this race occurs, do not care
if the thing we just zeroed no longer exists after we zeroed it.

We still bomb out if it exists but is not a block device - that would
probably mean we had written it out as a file.

This is all quite unfortunate.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 85fd16da..3fa26e45 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -1211,8 +1211,8 @@ zero () {
     if test -b \$dev; then
         log "Erasing \$dev"
         dd if=/dev/zero of=\$dev count=64 ||:
-        if ! test -b \$dev; then
-            log "\$dev is no longer a block device!"
+        if test -e \$dev && ! test -b \$dev; then
+            log "\$dev still exists but is no longer a block device!"
             exit 1
         fi
     else
-- 
2.20.1



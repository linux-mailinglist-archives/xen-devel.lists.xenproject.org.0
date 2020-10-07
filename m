Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FEC2866F6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3694.10903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9s-0002Rb-I9; Wed, 07 Oct 2020 18:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3694.10903; Wed, 07 Oct 2020 18:27:24 +0000
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
	id 1kQE9r-0002Od-Ip; Wed, 07 Oct 2020 18:27:23 +0000
Received: by outflank-mailman (input) for mailman id 3694;
 Wed, 07 Oct 2020 18:27:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE3t-00072Q-Jv
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:13 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ace94ed7-c910-40bb-bbf1-9495690a4b88;
 Wed, 07 Oct 2020 18:20:00 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjy-0007CF-8H; Wed, 07 Oct 2020 19:00:38 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE3t-00072Q-Jv
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:13 +0000
X-Inumbo-ID: ace94ed7-c910-40bb-bbf1-9495690a4b88
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ace94ed7-c910-40bb-bbf1-9495690a4b88;
	Wed, 07 Oct 2020 18:20:00 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjy-0007CF-8H; Wed, 07 Oct 2020 19:00:38 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 20/82] ts-hosts-allocate-Executive: Fix handling of failed preps for same sharing
Date: Wed,  7 Oct 2020 18:59:22 +0100
Message-Id: <20201007180024.7932-21-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

This code was previously unreachable.  It ought to be executed when
all the shares are allocatable or prep: in that case, we can unshare
and re-share the host.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 ts-hosts-allocate-Executive | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index 78b94c6d..2c18a739 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -1044,12 +1044,11 @@ sub actual_allocation ($) {
 		# now-dead task.  If so that share will become allocatable
 		# (and therefore not be counted in `ntasks') in due course.
 		return undef;
-
-                # someone was preparing it but they aren't any more
-                push @allocwarnings,
-                    "previous preparation apparently abandoned";
-                $allocatable= 1;
-            }
+	    }
+	    # someone was preparing it but they aren't any more
+	    push @allocwarnings,
+		"previous preparation apparently abandoned";
+	    $allocatable= 1;
         }
     }
 
-- 
2.20.1



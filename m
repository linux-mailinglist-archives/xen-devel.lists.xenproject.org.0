Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF9228666A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:01:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3613.10406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQDkS-0004JZ-SW; Wed, 07 Oct 2020 18:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3613.10406; Wed, 07 Oct 2020 18:01:08 +0000
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
	id 1kQDkS-0004In-Om; Wed, 07 Oct 2020 18:01:08 +0000
Received: by outflank-mailman (input) for mailman id 3613;
 Wed, 07 Oct 2020 18:01:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQDkR-0003r9-Rn
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:01:07 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d866887-24c2-4b19-bf92-b182b500f471;
 Wed, 07 Oct 2020 18:00:34 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjt-0007CF-SJ; Wed, 07 Oct 2020 19:00:33 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQDkR-0003r9-Rn
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:01:07 +0000
X-Inumbo-ID: 0d866887-24c2-4b19-bf92-b182b500f471
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0d866887-24c2-4b19-bf92-b182b500f471;
	Wed, 07 Oct 2020 18:00:34 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjt-0007CF-SJ; Wed, 07 Oct 2020 19:00:33 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 07/82] ts-hosts-allocate-Executive: Add a comment about a warning
Date: Wed,  7 Oct 2020 18:59:09 +0100
Message-Id: <20201007180024.7932-8-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 ts-hosts-allocate-Executive | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index 58d2a389..78b94c6d 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -1039,6 +1039,10 @@ sub actual_allocation ($) {
 	    if ($shared->{ntasks}) {
 		warn "resource $shrestype $shared->{resname} allegedly".
                     " available but wrong state $shared->{state} and tasks";
+		# This can happen if following a failed prep by
+		# another job, the other shares are still owned by the
+		# now-dead task.  If so that share will become allocatable
+		# (and therefore not be counted in `ntasks') in due course.
 		return undef;
 
                 # someone was preparing it but they aren't any more
-- 
2.20.1



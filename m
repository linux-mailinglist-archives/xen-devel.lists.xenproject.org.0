Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 511992866F1
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:27:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3688.10832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9e-0001n1-5X; Wed, 07 Oct 2020 18:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3688.10832; Wed, 07 Oct 2020 18:27:09 +0000
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
	id 1kQE9d-0001iw-8i; Wed, 07 Oct 2020 18:27:09 +0000
Received: by outflank-mailman (input) for mailman id 3688;
 Wed, 07 Oct 2020 18:27:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE43-00072Q-KX
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:23 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0fb4a81-ea99-4022-a703-ec12d3b33d0a;
 Wed, 07 Oct 2020 18:20:05 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk6-0007CF-4E; Wed, 07 Oct 2020 19:00:46 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE43-00072Q-KX
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:21:23 +0000
X-Inumbo-ID: f0fb4a81-ea99-4022-a703-ec12d3b33d0a
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f0fb4a81-ea99-4022-a703-ec12d3b33d0a;
	Wed, 07 Oct 2020 18:20:05 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk6-0007CF-4E; Wed, 07 Oct 2020 19:00:46 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 51/82] host reuse: Reuse test hosts within a flight
Date: Wed,  7 Oct 2020 18:59:53 +0100
Message-Id: <20201007180024.7932-52-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Mark the host shareable, and unshareable, as appropriate.

There is still a lot more cleanup and improvement to do.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 sg-run-job | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sg-run-job b/sg-run-job
index af43008d..1e2fcfee 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -29,6 +29,8 @@ proc per-host-prep {} {
     per-host-ts @.      xen-install/@     ts-xen-install
     per-host-ts @.      xen-boot/@        ts-host-reboot
 
+    per-host-ts broken  =               { ts-host-reuse start-test }
+
     per-host-ts .       host-ping-check-xen/@ ts-host-ping-check
     per-host-ts .       =(*)            { ts-leak-check basis }
 }
@@ -64,6 +66,8 @@ proc run-job {job} {
     if {!$ok} return
 
     if {[llength $need_xen_hosts]} {
+        per-host-ts broken  =           { ts-host-reuse prealloc }
+	if {!$ok} return
         eval run-ts broken  =             ts-hosts-allocate + $need_xen_hosts
     }
 
@@ -120,6 +124,7 @@ proc run-job {job} {
        set ok 0
     }
 
+    if {$ok} { per-host-ts .  =            { ts-host-reuse post-test }    }
     if {$ok} { setstatus pass                                             }
 
     if {[llength $need_build_host] && $ok} { jobdb::preserve-task 90 }
-- 
2.20.1



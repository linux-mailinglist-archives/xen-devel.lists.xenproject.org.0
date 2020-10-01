Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A7F2803DB
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 18:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1454.4573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO1Nz-0001Jp-C7; Thu, 01 Oct 2020 16:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454.4573; Thu, 01 Oct 2020 16:24:51 +0000
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
	id 1kO1Nz-0001JQ-8H; Thu, 01 Oct 2020 16:24:51 +0000
Received: by outflank-mailman (input) for mailman id 1454;
 Thu, 01 Oct 2020 16:24:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kO1Ny-0001JL-Ku
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:24:50 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 418437ea-7a37-43b9-8e44-19305a131d4a;
 Thu, 01 Oct 2020 16:24:49 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kO1Nx-00029L-5P; Thu, 01 Oct 2020 17:24:49 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kO1Ny-0001JL-Ku
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:24:50 +0000
X-Inumbo-ID: 418437ea-7a37-43b9-8e44-19305a131d4a
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 418437ea-7a37-43b9-8e44-19305a131d4a;
	Thu, 01 Oct 2020 16:24:49 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kO1Nx-00029L-5P; Thu, 01 Oct 2020 17:24:49 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 2/8] standalone: Use mkdir -p
Date: Thu,  1 Oct 2020 17:24:33 +0100
Message-Id: <20201001162439.18160-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201001162439.18160-1-iwj@xenproject.org>
References: <20201001162439.18160-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two mkdir calls could fail if
standalone-generate-dump-flight-runvars is run without a log
directory, because they were not concurrency-correct.

mkdir -p should fix that.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 standalone | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/standalone b/standalone
index 9553d6c9..4d1f3513 100755
--- a/standalone
+++ b/standalone
@@ -181,12 +181,8 @@ check_repos() {
 }
 
 ensure_logs() {
-    if [ ! -d "logs" ] ; then
-	mkdir "logs"
-    fi
-    if [ ! -d "logs/$flight" ] ; then
-	mkdir "logs/$flight"
-    fi
+    mkdir -p "logs"
+    mkdir -p "logs/$flight"
 }
 
 with_logging() {
-- 
2.20.1



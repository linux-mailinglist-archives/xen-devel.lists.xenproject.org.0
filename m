Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD242866CD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:19:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3646.10571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE1u-0007Hr-I3; Wed, 07 Oct 2020 18:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3646.10571; Wed, 07 Oct 2020 18:19:10 +0000
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
	id 1kQE1u-0007HF-Cd; Wed, 07 Oct 2020 18:19:10 +0000
Received: by outflank-mailman (input) for mailman id 3646;
 Wed, 07 Oct 2020 18:19:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE1s-00072Q-Fv
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:08 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b62c7e83-dbae-4cf4-a3c7-fb9d424626b2;
 Wed, 07 Oct 2020 18:19:01 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk5-0007CF-9J; Wed, 07 Oct 2020 19:00:45 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE1s-00072Q-Fv
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:19:08 +0000
X-Inumbo-ID: b62c7e83-dbae-4cf4-a3c7-fb9d424626b2
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b62c7e83-dbae-4cf4-a3c7-fb9d424626b2;
	Wed, 07 Oct 2020 18:19:01 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk5-0007CF-9J; Wed, 07 Oct 2020 19:00:45 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <Ian.Jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 47/82] shared/reuse: Use @ for ts-host-install
Date: Wed,  7 Oct 2020 18:59:49 +0100
Message-Id: <20201007180024.7932-48-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Pass @ from sg-run-job.  These are all the call sites for
ts-host-install-*, so we can lose the open-coded test for SharedReady.

Signed-off-by: Ian Jackson <Ian.Jackson@eu.citrix.com>
---
 sg-run-job      | 6 +++---
 ts-host-install | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/sg-run-job b/sg-run-job
index d46a3a62..c454d4ea 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -85,7 +85,7 @@ proc run-job {job} {
         }
     }
 
-    per-host-ts broken  host-install/@(*) ts-host-install-twice
+    per-host-ts @broken host-install/@(*) ts-host-install-twice
 
     per-host-prep
 
@@ -675,7 +675,7 @@ proc examine-host-prep {} {
     run-ts broken  =            ts-hosts-allocate     + host
 }
 proc examine-host-install-debian {} {
-    run-ts broken  host-install ts-host-install-twice + host
+    run-ts broken host-install  ts-host-install-twice + @host
 }
 proc examine-host-install-xen {} {
     examine-host-install-debian
@@ -752,7 +752,7 @@ proc allocate-build-host {ostype} {
 }
 proc prepare-build-host-linux {} {
     global jobinfo
-    run-ts broken host-install(*) ts-host-install-twice + --build
+    run-ts broken host-install(*) ts-host-install-twice + --build @host
     run-ts . host-build-prep ts-xen-build-prep + @host
 }
 
diff --git a/ts-host-install b/ts-host-install
index 924c1e06..b0fd2028 100755
--- a/ts-host-install
+++ b/ts-host-install
@@ -53,7 +53,6 @@ our ($whhost) = @ARGV;
 $whhost ||= 'host';
 our $ho= selecthost($whhost);
 exit 0 if $ho->{Flags}{'no-reinstall'};
-exit 0 if $ho->{SharedReady};
 
 our %timeout= qw(ReadPreseed  350
                  Sshd        2400);
-- 
2.20.1



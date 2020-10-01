Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E162803DD
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 18:25:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1456.4597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO1OA-0001QV-0J; Thu, 01 Oct 2020 16:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456.4597; Thu, 01 Oct 2020 16:25:01 +0000
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
	id 1kO1O9-0001Pp-Sj; Thu, 01 Oct 2020 16:25:01 +0000
Received: by outflank-mailman (input) for mailman id 1456;
 Thu, 01 Oct 2020 16:25:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kO1O8-0001JL-Jf
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:25:00 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67a43fb5-0bab-4e4d-b4b0-b5c32ab605ac;
 Thu, 01 Oct 2020 16:24:50 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kO1Nx-00029L-KT; Thu, 01 Oct 2020 17:24:49 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kO1O8-0001JL-Jf
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:25:00 +0000
X-Inumbo-ID: 67a43fb5-0bab-4e4d-b4b0-b5c32ab605ac
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 67a43fb5-0bab-4e4d-b4b0-b5c32ab605ac;
	Thu, 01 Oct 2020 16:24:50 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kO1Nx-00029L-KT; Thu, 01 Oct 2020 17:24:49 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 4/8] ts-hosts-allocate-Executive: Allow to tolerate missing resources
Date: Thu,  1 Oct 2020 17:24:35 +0100
Message-Id: <20201001162439.18160-4-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201001162439.18160-1-iwj@xenproject.org>
References: <20201001162439.18160-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now, a job can specify that lack of a suitable host should be treated
as a plain test failure (ie, subject to the usual regression analysis)
rather than as an infrastructure or configuration problem.

This will be useful for some tests which don't work in some branches
because of lack of suitable hardware.  We want to avoid encoding our
hardware availability situation in make-flight.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 ts-hosts-allocate-Executive | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index 698437c0..58d2a389 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -704,6 +704,10 @@ sub alloc_hosts () {
 	my ($ok, $bookinglist) = attempt_allocation({
             ts_hosts_allocate_precheck => 1,
         }, 0);
+	if ($ok == $alloc_starved_r && $r{hostalloc_missing_expected}) {
+	    broken 'no suitable hosts available (as possibly expected)',
+	      'fail';
+	}
 	die $ok if $ok>1;
     }
 
-- 
2.20.1



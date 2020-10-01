Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB882803E1
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 18:25:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1460.4643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO1OU-0001l4-9j; Thu, 01 Oct 2020 16:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460.4643; Thu, 01 Oct 2020 16:25:22 +0000
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
	id 1kO1OU-0001jq-5w; Thu, 01 Oct 2020 16:25:22 +0000
Received: by outflank-mailman (input) for mailman id 1460;
 Thu, 01 Oct 2020 16:25:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kO1OS-0001JL-KK
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:25:20 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 809d7148-c8f6-4f44-bfcf-d302cb04b56d;
 Thu, 01 Oct 2020 16:24:51 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kO1Ny-00029L-Ao; Thu, 01 Oct 2020 17:24:50 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kO1OS-0001JL-KK
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:25:20 +0000
X-Inumbo-ID: 809d7148-c8f6-4f44-bfcf-d302cb04b56d
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 809d7148-c8f6-4f44-bfcf-d302cb04b56d;
	Thu, 01 Oct 2020 16:24:51 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kO1Ny-00029L-Ao; Thu, 01 Oct 2020 17:24:50 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 7/8] standalone-generate-dump-flight-runvars: Simulate cri-getplatforms
Date: Thu,  1 Oct 2020 17:24:38 +0100
Message-Id: <20201001162439.18160-7-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201001162439.18160-1-iwj@xenproject.org>
References: <20201001162439.18160-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set MF_SIMULATE_PLATFORMS to a suitable value if it is
not *set*.  (Distinguishing unset from set to empty.)

I have verified that this, plus the preceding commits to
cri-getplatforms, produces no change in the output of
  MF_SIMULATE_PLATFORMS='' OSSTEST_CONFIG=standalone-config-example eatmydata ./standalone-generate-dump-flight-runvars

Without the MF_SIMULATE_PLATFORMS setting it adds several new jobs to
each flight, name things like this:
  test-amd64-$arch1-xl-simplat-$arch2-$suite

The purpose of this right now is to provide a way to dry-run test the
next change.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 standalone-generate-dump-flight-runvars | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/standalone-generate-dump-flight-runvars b/standalone-generate-dump-flight-runvars
index 5c93b0af..07b9c126 100755
--- a/standalone-generate-dump-flight-runvars
+++ b/standalone-generate-dump-flight-runvars
@@ -45,6 +45,9 @@ fi
 : ${AP_FETCH_PLACEHOLDERS:=y}
 export AP_FETCH_PLACEHOLDERS
 
+: ${MF_SIMULATE_PLATFORMS='simplat-$xenarch-$suite'}
+export MF_SIMULATE_PLATFORMS
+
 export OSSTEST_HOSTSLIST_DUMMY=1
 
 if [ "x$AP_FETCH_PLACEHOLDERS" != xy ]; then
-- 
2.20.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE792803E0
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 18:25:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1459.4633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO1OO-0001ex-TN; Thu, 01 Oct 2020 16:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459.4633; Thu, 01 Oct 2020 16:25:16 +0000
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
	id 1kO1OO-0001eN-Po; Thu, 01 Oct 2020 16:25:16 +0000
Received: by outflank-mailman (input) for mailman id 1459;
 Thu, 01 Oct 2020 16:25:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kO1ON-0001JL-K9
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:25:15 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 827dfb01-4f3e-43a8-bbd4-e111ff0eb190;
 Thu, 01 Oct 2020 16:24:50 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kO1Ny-00029L-37; Thu, 01 Oct 2020 17:24:50 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kO1ON-0001JL-K9
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:25:15 +0000
X-Inumbo-ID: 827dfb01-4f3e-43a8-bbd4-e111ff0eb190
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 827dfb01-4f3e-43a8-bbd4-e111ff0eb190;
	Thu, 01 Oct 2020 16:24:50 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kO1Ny-00029L-37; Thu, 01 Oct 2020 17:24:50 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 6/8] cri-getplatforms: Honour new MF_SIMULATE_PLATFORMS env var
Date: Thu,  1 Oct 2020 17:24:37 +0100
Message-Id: <20201001162439.18160-6-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201001162439.18160-1-iwj@xenproject.org>
References: <20201001162439.18160-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is to be expanded by the shell, using eval, so that it can refer
to $xenarch, $suite and $blessing.

No functional change if this variable is unset, or empty.  If it is
set to a single space, cri-getplatforms produces no output (as it does
anyway in standalone mode).

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 cri-getplatforms | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/cri-getplatforms b/cri-getplatforms
index 1f206908..9f4cae56 100755
--- a/cri-getplatforms
+++ b/cri-getplatforms
@@ -19,6 +19,10 @@
 getplatforms () {
 	local xenarch=$1
 	local suite=$2
+	if [ "x$MF_SIMULATE_PLATFORMS" != x ]; then
+		eval "echo $MF_SIMULATE_PLATFORMS"
+		return
+	fi
         perl -e '
                 use Osstest;
                 csreadconfig();
-- 
2.20.1



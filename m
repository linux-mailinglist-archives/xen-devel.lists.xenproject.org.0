Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDD746A3DD
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 19:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239723.415651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIZy-0002HA-En; Mon, 06 Dec 2021 18:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239723.415651; Mon, 06 Dec 2021 18:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIZy-00029y-7H; Mon, 06 Dec 2021 18:19:10 +0000
Received: by outflank-mailman (input) for mailman id 239723;
 Mon, 06 Dec 2021 18:19:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZw-00023y-Ml
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZw-00041Y-Lw
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:08 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZw-0004Ss-L9
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:08 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1muIZb-0001ab-4V; Mon, 06 Dec 2021 18:18:47 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=0/OUNZQAV8JGMY/13VgnZluycff2ARMtudSMh6lwEvk=; b=JU8tqdMvdZ7iM+tnM6psy7kiEr
	UcdkgWLBooYlaRS1Y+1mEXoZAPfhZ20eej1Ty6Q0i+LbJDAYEUIuX0TFOeDpfrqsaM9zKtVRfOWWV
	EdwKFIrI8aQnaarH0Mw4Nz3sotL6G93N5yUlaxzbHAJ7/fEJ+MviiNMpOSsDtMPAeQG8=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 04/13] ts-memdisk-try-append: More defensive case test
Date: Mon,  6 Dec 2021 18:18:30 +0000
Message-Id: <20211206181839.23463-5-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211206181839.23463-1-iwj@xenproject.org>
References: <20211206181839.23463-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
 ts-memdisk-try-append | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/ts-memdisk-try-append b/ts-memdisk-try-append
index bfb36caf7..d5c12866f 100755
--- a/ts-memdisk-try-append
+++ b/ts-memdisk-try-append
@@ -34,14 +34,14 @@ arch=`perl -I. -we '
 case "$arch" in
 amd64)
     ;;
-'')
-    echo >&2 'Job arch retrieval failed?'
-    exit 1
-    ;;
-*)
+[a-z]*)
     echo "Arch $arch not supported for memdisk tests"
     exit 0
     ;;
+*)
+    echo >&2 'Job arch retrieval failed?'
+    exit 1
+    ;;
 esac
 
 if ./ts-freebsd-host-install --test-boot --record-append $@; then
-- 
2.20.1



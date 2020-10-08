Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90130287C2B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 21:14:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4587.12053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbN7-0008NB-3I; Thu, 08 Oct 2020 19:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4587.12053; Thu, 08 Oct 2020 19:14:37 +0000
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
	id 1kQbN6-0008Mm-W9; Thu, 08 Oct 2020 19:14:36 +0000
Received: by outflank-mailman (input) for mailman id 4587;
 Thu, 08 Oct 2020 19:14:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQbN5-0008Lp-DU
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:35 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96ba930c-3383-4068-91c2-db1e192daac7;
 Thu, 08 Oct 2020 19:14:34 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN4-0004R3-7F
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:34 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN4-0003pq-6V
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:34 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kQbN2-0006So-05; Thu, 08 Oct 2020 20:14:32 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQbN5-0008Lp-DU
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:35 +0000
X-Inumbo-ID: 96ba930c-3383-4068-91c2-db1e192daac7
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 96ba930c-3383-4068-91c2-db1e192daac7;
	Thu, 08 Oct 2020 19:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=Ib9u1KozgEMCg0jCGLWPWL8C4aZzOGRCjREpAAS7g4Y=; b=i2dGcQ3zWuoKvOwadSL80/ZwQh
	IMh5nqXT/22Hz6X1BsFZguNK/5O3s2zyMOo+IZYWYHHjjKqPlKpMO1y8fUFNsZDCGKmlil5XCUzZn
	SGJVt1vXsLQTn5lJicg0a/At1hcux+hBg9J3X0NqB2L34FIJzlpWe4nOKv+RLqEb6Ho4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN4-0004R3-7F
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:34 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN4-0003pq-6V
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:34 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN2-0006So-05; Thu, 08 Oct 2020 20:14:32 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 01/13] Honour OSSTEST_SIMULATE=2 to actually run dummy flight
Date: Thu,  8 Oct 2020 20:14:10 +0100
Message-Id: <20201008191422.5683-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008191422.5683-1-iwj@xenproject.org>
References: <20201008191422.5683-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 cri-args-hostlists | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/cri-args-hostlists b/cri-args-hostlists
index 994e00c0..6cdff53f 100644
--- a/cri-args-hostlists
+++ b/cri-args-hostlists
@@ -68,8 +68,8 @@ fi
 
 execute_flight () {
         case "x$OSSTEST_SIMULATE" in
-        x|x0)   ;;
-        *)      echo SIMULATING - NOT EXECUTING $1 $2
+        x|x0|x2)   ;;
+        *)      echo SIMULATING $OSSTEST_SIMULATE - NOT EXECUTING $1 $2
                 return
                 ;;
         esac
-- 
2.20.1



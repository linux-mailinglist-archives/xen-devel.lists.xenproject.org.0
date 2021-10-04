Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED514214D1
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 19:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201614.356234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXRQh-0003Vq-CA; Mon, 04 Oct 2021 17:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201614.356234; Mon, 04 Oct 2021 17:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXRQg-0003Kr-Tf; Mon, 04 Oct 2021 17:07:06 +0000
Received: by outflank-mailman (input) for mailman id 201614;
 Mon, 04 Oct 2021 17:07:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQe-0002p3-KQ
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQe-0000LN-Jg
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:04 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mXRQe-0005hE-In
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 17:07:04 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mXRQc-0006NI-Qb; Mon, 04 Oct 2021 18:07:02 +0100
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
	bh=yisPODdEzgt40Em95XrW2+0eACmf9EcBBEEdifxOE30=; b=t5ghfjmx3xpFGn91XyM5vqzvsy
	TIlRpUR8rv7E5oUhwmZpT0P2e+aG+uCm26EIRvcK47+QyQ9oC4V/eir3OBuYfZ9tai1wZ/IB15p/a
	MeWJWW8o3xClOXiwCxJP0jlGm6T1BRRaPLr8qg8Q8Wc1CdLzvUqKr9TK0uTaos5okb5s=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 5/6] mg-allocate: feasibility check: print a reassuring message
Date: Mon,  4 Oct 2021 18:06:53 +0100
Message-Id: <20211004170654.21864-6-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211004170654.21864-1-iwj@xenproject.org>
References: <20211004170654.21864-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-allocate | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mg-allocate b/mg-allocate
index 7dc2c7650..e700be185 100755
--- a/mg-allocate
+++ b/mg-allocate
@@ -393,6 +393,7 @@ sub execute (;$) {
 
 	if ($dryrun) {
 	    db_retry_abort();
+	    logm("allocation feasible in principle (subject to planning)");
 	    return;
 	}
         if (!$allok) {
-- 
2.20.1



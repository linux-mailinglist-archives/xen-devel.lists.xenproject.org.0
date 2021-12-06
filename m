Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79D946A3E0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 19:19:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239725.415668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIZz-0002hv-MH; Mon, 06 Dec 2021 18:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239725.415668; Mon, 06 Dec 2021 18:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIZz-0002Yu-Br; Mon, 06 Dec 2021 18:19:11 +0000
Received: by outflank-mailman (input) for mailman id 239725;
 Mon, 06 Dec 2021 18:19:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZx-00025u-J9
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZx-00041l-IB
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:09 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZx-0004Tc-H9
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:09 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1muIZb-0001ab-U0; Mon, 06 Dec 2021 18:18:48 +0000
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
	bh=E4sdrcKA9Vi1NCC94foXRbrUT73w1XN6CbQdZ8WGihM=; b=ckl7geURG7dCT1Vv4lpzpctz6F
	9/iBtNwa3I9eeu25U4J2FI85B2jKrhMetAgC+WIYWFUnBho91H7LCu8i9mgGIbQoUbZyrTo+rKwn8
	xVZVO9y9xHUmiV2h/zywlFBlyNAxkSg8THEpl0TBm3akMrvtle42XvF9+Fy5HubDt/Zk=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 07/13] sg-run-job: Do not set a step status to pass unless it's running
Date: Mon,  6 Dec 2021 18:18:33 +0000
Message-Id: <20211206181839.23463-8-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211206181839.23463-1-iwj@xenproject.org>
References: <20211206181839.23463-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This avoids skip etc. being treated as pass.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 tcl/JobDB-Executive.tcl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tcl/JobDB-Executive.tcl b/tcl/JobDB-Executive.tcl
index 38248823e..8e0062f59 100644
--- a/tcl/JobDB-Executive.tcl
+++ b/tcl/JobDB-Executive.tcl
@@ -326,6 +326,7 @@ proc step-set-status {flight job stepno st} {
                AND status<>'broken'
                AND status<>'starved'
                AND status<>'fail'
+               AND NOT ('$st' = 'pass' AND status <> 'running')
         "
         set pause 0
         db-execute-array stopinfo "
-- 
2.20.1



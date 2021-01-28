Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FDD307B09
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 17:35:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77229.139751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5AGr-0004xx-Oj; Thu, 28 Jan 2021 16:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77229.139751; Thu, 28 Jan 2021 16:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5AGr-0004xY-LL; Thu, 28 Jan 2021 16:35:49 +0000
Received: by outflank-mailman (input) for mailman id 77229;
 Thu, 28 Jan 2021 16:35:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l5AGq-0004xT-BR
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 16:35:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l5AGq-0001nK-9R
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 16:35:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l5AGq-0000CH-8l
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 16:35:48 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l5AGo-0004qn-FP; Thu, 28 Jan 2021 16:35:46 +0000
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From;
	bh=fIwb7eyYIbNb0HU/oXcFhJrHowxm8okfejvcix4R2r0=; b=gixlNo47vbmA69kaDIgAhFkP1m
	SRhOx1uAQPpD4eIOZFL/b3jvk+yqRASp/18ejGBcw+JaGAIPqZs3PYhoS06KnwBRgwSJdrMSpPBs6
	CsZB1zfQGUZ1TxRCeW24pgvi223h+aAx/M9SYaXDwu3PMEeGF6+oFOoTqTmZncyl/iq8=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	=?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
	Paul Durrant <xadimgnik@gmail.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen-release-management doc: More info on schedule
Date: Thu, 28 Jan 2021 16:35:38 +0000
Message-Id: <20210128163538.13922-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This documents our practice, established in 2018
  https://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html
et seq

CC: Jürgen Groß <jgross@suse.com>
CC: Paul Durrant <xadimgnik@gmail.com>
CC: Wei Liu <wl@xen.org>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 docs/process/xen-release-management.pandoc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/docs/process/xen-release-management.pandoc b/docs/process/xen-release-management.pandoc
index e1aa1eda8f..a5d70fed67 100644
--- a/docs/process/xen-release-management.pandoc
+++ b/docs/process/xen-release-management.pandoc
@@ -15,8 +15,10 @@ that they can have an idea what to expect from the Release Manager.
 
 # Xen release cycle
 
-The Xen hypervisor project now releases every 8 months. The actual release date
-depends on a lot of factors.
+The Xen hypervisor project now releases every 8 months.  We aim to
+release in the first half of March/July/November.  These dates have
+been chosen to avoid major holidays and cultural events; if one
+release slips, ideally the previous release cycle would be shortened.
 
 We can roughly divide one release into two periods. The development period
 and the freeze period. The former is 6 months long and the latter is about 2
@@ -33,6 +35,12 @@ During freeze period, the tree is closed for new features. Only bug fixes are
 accepted. This period can be shorter or longer than 2 months. If it ends up
 longer than 2 months, it eats into the next development period.
 
+The precise release schedule depends on a lot of factors and needs to
+be set afresh by the Release Manager in each release cycle.  When the
+release is in March, particular consideration should be given to the
+Chinese New Year holidaty which will then typically occur curing the
+freeze, so the freeze should probably be extended to compensate.
+
 # The different roles in a Xen release
 
 ## Release Manager
-- 
2.20.1



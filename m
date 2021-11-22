Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0130458DDE
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 12:53:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228842.396050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp7sT-0002aM-Bm; Mon, 22 Nov 2021 11:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228842.396050; Mon, 22 Nov 2021 11:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp7sT-0002YW-8K; Mon, 22 Nov 2021 11:52:53 +0000
Received: by outflank-mailman (input) for mailman id 228842;
 Mon, 22 Nov 2021 11:52:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mp7sR-0002Ie-88
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 11:52:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mp7sR-0006qn-7K
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 11:52:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mp7sR-00022o-6B
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 11:52:51 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mp7sO-0000Fy-RF; Mon, 22 Nov 2021 11:52:48 +0000
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
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=FExyuulJuHXMdlWWBxDca7ZOXC5VKaY1YWmCJG9l4rE=; b=mXzkJ3WtTRW4aoU4APtXN+DDPO
	upk6n3aewIe32SP1/26srCgCesW422Uz5J4DJAb56f35SKyniYdXFonU8lm73Y9sHMf7QBXzlikCR
	RUvfpccF08HoPm4U9sqtnmoSJjiIt7hE6GYBhfs8TeFMQjlBC4Cv0j63R8StOm0aSH1o=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 2/2] allow.all: Treat freeBSD memdisk-try-append failures as nonblocking
Date: Mon, 22 Nov 2021 11:52:39 +0000
Message-Id: <20211122115239.21743-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211122115239.21743-1-iwj@xenproject.org>
References: <20211122115239.21743-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In practice this currently fails on some of our hosts.  We don't seem
to have resources to investigate properly, and this will be blocking
recomissioning of hosts if we don't get it out of the way.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 allow.all | 1 +
 1 file changed, 1 insertion(+)

diff --git a/allow.all b/allow.all
index 7a34a809e..878c04ca5 100644
--- a/allow.all
+++ b/allow.all
@@ -3,3 +3,4 @@ build-@@                        logs-capture@@
 test-@@-pcipt@@
 test-@@-qemuu-@@		guest-localmigrate
 test-@@-win7-@@			guest-stop
+test-@@				memdisk-try-append
-- 
2.20.1



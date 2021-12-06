Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABAA46A4C3
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 19:38:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239781.415785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIsC-000351-IE; Mon, 06 Dec 2021 18:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239781.415785; Mon, 06 Dec 2021 18:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIsC-00031q-Ek; Mon, 06 Dec 2021 18:38:00 +0000
Received: by outflank-mailman (input) for mailman id 239781;
 Mon, 06 Dec 2021 18:37:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIsA-00030F-T2
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:37:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIsA-0004PO-SK
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:37:58 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIsA-0005yn-RP
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:37:58 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1muIZe-0001ab-B9; Mon, 06 Dec 2021 18:18:50 +0000
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
	bh=Ezi+pDANaaVnGfDPhbBun2anRmQhQjQ+Vf4Yn52Xjy8=; b=UOSYx1lw+uauCKIitsPDcgQVxF
	dyhTThXCyiS6fSnxuvgFdo1wpeEm6JIHm7T7c6YOjFkmx6NGnzF2dxBdd5YMkpuyflMTxcTsdYRqm
	8JdGIscC4dTyLPuAI8lj7iWhxjiTBaDgYsfTwUSiYXuHMTouaKjlsu0h74BBOK/gY+p8=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 13/13] ts-xen-install: enable timestamp on guests logs
Date: Mon,  6 Dec 2021 18:18:39 +0000
Message-Id: <20211206181839.23463-14-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211206181839.23463-1-iwj@xenproject.org>
References: <20211206181839.23463-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monne <roger.pau@citrix.com>

Enable the timestamp feature of xenconsoled so guests logs have a time
reference. Can be helpful when debugging boot related slowness.

This requires using the XENCONSOLED_ARGS option and setting both the
log and the timestamp options. Note that setting XENCONSOLED_TRACE
will override any options in XENCONSOLED_ARGS, so they can not be used
in conjunction.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Ian Jackson <iwj@xenproject.org>
---
 ts-xen-install | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-xen-install b/ts-xen-install
index 47865eb60..bf55d4e5c 100755
--- a/ts-xen-install
+++ b/ts-xen-install
@@ -140,7 +140,7 @@ sub adjustconfig () {
 
     my @commons_config =
         (
-	   "XENCONSOLED_TRACE" => "guest",
+	   "XENCONSOLED_ARGS" => '"--log=guest --timestamp=all"',
 	);
 
     my $xenstored = target_var($ho, 'xenstored');
-- 
2.20.1



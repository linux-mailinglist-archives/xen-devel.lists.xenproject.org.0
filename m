Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DF640994A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 18:31:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185807.334549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPorj-0001YS-QR; Mon, 13 Sep 2021 16:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185807.334549; Mon, 13 Sep 2021 16:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPorj-0001QH-MU; Mon, 13 Sep 2021 16:31:31 +0000
Received: by outflank-mailman (input) for mailman id 185807;
 Mon, 13 Sep 2021 16:31:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mPorh-0001Np-H0
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 16:31:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mPorh-00013R-GG
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 16:31:29 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mPorh-0006tr-FC
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 16:31:29 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mPorf-00038U-Ms; Mon, 13 Sep 2021 17:31:27 +0100
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
	bh=dLanMiw+A0RhDEAiKWmtytFsoVaO6ItybDZSeWiVSFQ=; b=MC7ROdb7+aFy8PSTZOAjvx2YIA
	1mA8fM/ol3/RPhPaQgEA8KvbEDoHR0Y23qTIhCU3R3Ksk7PFkZCrfbBR5ug7eKJxnsHi2iCU46xDr
	Yq3f7QkLdP3FhMG20W7tOupAx54XCeIks7zNf2XEHdXwOxMWxY4uNc99JE5N1cfbiwgY=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 2/5] mg-schema-update: improve an error message
Date: Mon, 13 Sep 2021 17:31:12 +0100
Message-Id: <20210913163115.12749-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913163115.12749-1-iwj@xenproject.org>
References: <20210913163115.12749-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-schema-update | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mg-schema-update b/mg-schema-update
index f22ed63a..fb754bed 100755
--- a/mg-schema-update
+++ b/mg-schema-update
@@ -268,5 +268,5 @@ die "need operation\n" unless @ARGV;
 my $subcmd= shift @ARGV;
 $subcmd =~ s/-/_/g;
 my $subcmdproc = ${*::}{"cmd_$subcmd"};
-die "unknown subcommand" unless $subcmdproc;
+die "unknown subcommand $subcmd" unless $subcmdproc;
 $subcmdproc->();
-- 
2.20.1



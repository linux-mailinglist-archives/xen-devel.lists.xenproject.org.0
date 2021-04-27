Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A8936CABF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 20:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118791.225071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS0t-0002Bc-49; Tue, 27 Apr 2021 18:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118791.225071; Tue, 27 Apr 2021 18:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS0s-0002AP-Se; Tue, 27 Apr 2021 18:00:46 +0000
Received: by outflank-mailman (input) for mailman id 118791;
 Tue, 27 Apr 2021 18:00:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0q-00027c-IV
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0q-0004pl-Hh
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0q-0001mB-GM
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:44 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lbS0o-0003ln-Mo; Tue, 27 Apr 2021 19:00:42 +0100
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
	bh=Kz6hhyMq9BuTwgBd5X7OokkNSvFgm9TeRwsQBEvDUck=; b=AUiANCSekuq3zAdpmX3MlnSqnT
	/QSY+HlUHsbncx0aIozCNl1OZW+CyCBq+6HgF+oamdePRCDRWTjsw+RvGTru5ZE/pOCJ+COhUSw1s
	Gj84cmONznb0CDR3tC+kYFI6NcHANYbdg5bP2ArUDVGxPbGjETijcssbxFG0hxCxcouc=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 3/7] mg-schema-test-database: posgtres compat: Cope with schema name
Date: Tue, 27 Apr 2021 19:00:29 +0100
Message-Id: <20210427180033.9439-4-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210427180033.9439-1-iwj@xenproject.org>
References: <20210427180033.9439-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dump now (postgresql 11) contains lots of "public." which made
these regexps not match.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-schema-test-database | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mg-schema-test-database b/mg-schema-test-database
index b49fbecf..b5906d70 100755
--- a/mg-schema-test-database
+++ b/mg-schema-test-database
@@ -377,9 +377,10 @@ END
 
 	# What tables are there ?
 	perl -ne <$t.schema >$t.tablevars '
-		if (m/^CREATE SEQUENCE (\w+)/) {
+		BEGIN { $sch_re = qr{(?:public\.)?}; }
+		if (m/^CREATE SEQUENCE $sch_re(\w+)/) {
 			print "sequences+=\" $1\"\n";
-		} elsif (m/^CREATE TABLE (\w+)/) {
+		} elsif (m/^CREATE TABLE $sch_re(\w+)\s+/) {
 			$table=$1;
 		} elsif (m/^\s*flight\s+integer\s/) {
 			die unless $table;
-- 
2.20.1



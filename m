Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCB436CAC6
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 20:01:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118790.225062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS0s-0002AK-IJ; Tue, 27 Apr 2021 18:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118790.225062; Tue, 27 Apr 2021 18:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbS0s-00029k-Co; Tue, 27 Apr 2021 18:00:46 +0000
Received: by outflank-mailman (input) for mailman id 118790;
 Tue, 27 Apr 2021 18:00:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0q-00027J-68
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0q-0004pi-47
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lbS0q-0001lo-3P
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 18:00:44 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lbS0o-0003ln-9t; Tue, 27 Apr 2021 19:00:42 +0100
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
	bh=JK5vF50HzYVrWkX33Nf1/Ad7XzKV6qN4f/xq8FqYezg=; b=vo5YpuUM/wL0h3CDOEOROI4Bj+
	dTs7EVQV9MsMXtzYn+eAoXoXgwKuwBV1JHx3K7bLipI93CV0cbK/uCh/3hkWpWcVT6Iir1likLsiL
	ceWsi8hej+ui/n4RRHpT82jsanJNGEciZZVOVeXtnR8VhfaP2vDwtYLJgD2K4ihfPziE=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 2/7] mg-schema-test-database: Be slightly more defensive
Date: Tue, 27 Apr 2021 19:00:28 +0100
Message-Id: <20210427180033.9439-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210427180033.9439-1-iwj@xenproject.org>
References: <20210427180033.9439-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-schema-test-database | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mg-schema-test-database b/mg-schema-test-database
index e69b9881..b49fbecf 100755
--- a/mg-schema-test-database
+++ b/mg-schema-test-database
@@ -381,7 +381,8 @@ END
 			print "sequences+=\" $1\"\n";
 		} elsif (m/^CREATE TABLE (\w+)/) {
 			$table=$1;
-		} elsif (m/^\s*flight\s+integer/) {
+		} elsif (m/^\s*flight\s+integer\s/) {
+			die unless $table;
 			print "ftables+=\" $table\"\n";
 		} elsif ($table && m/^\)\;$/) {
 			print "tables+=\" $table\"\n";
-- 
2.20.1



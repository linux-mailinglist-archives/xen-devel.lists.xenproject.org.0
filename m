Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E90A3A4766
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 19:03:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140594.259729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrkYK-0006FR-B4; Fri, 11 Jun 2021 17:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140594.259729; Fri, 11 Jun 2021 17:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrkYK-0006CK-6u; Fri, 11 Jun 2021 17:02:40 +0000
Received: by outflank-mailman (input) for mailman id 140594;
 Fri, 11 Jun 2021 17:02:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lrkYJ-0006CE-2u
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 17:02:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lrkYJ-0002As-24
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 17:02:39 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lrkYJ-0001fH-15
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 17:02:39 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lrkYH-0006mH-9o; Fri, 11 Jun 2021 18:02:37 +0100
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
	Message-Id:Date:Subject:Cc:To:From;
	bh=nIVDGrpYEEFfU9g4fKC8dpS6IW30yBrHRV+oWfW+Vxo=; b=UzkfsCwnKHYWfKOjHmzYAY1VNl
	W+s3N8RmVAtIroxI1wNehNrZj2+GYqtDtIM3FKl9XF9Oq7em3+UB4Hbxuacbs2zAQjjiJB+AE82f1
	bserwnSUGk2ifCs3WUiFptHHRbNlPhSCpWXLy/FjH37uKppZ+MF/caxZhkEmExiuIoPU=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [OSSTEST PATCH] ts-xen-build: Turn on CONFIG_PV32 again
Date: Fri, 11 Jun 2021 18:02:30 +0100
Message-Id: <20210611170230.20195-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CC: George Dunlap <george.dunlap@citrix.com>
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 ts-xen-build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ts-xen-build b/ts-xen-build
index deec52b2..af0dd894 100755
--- a/ts-xen-build
+++ b/ts-xen-build
@@ -132,6 +132,10 @@ END
 		# on Xen. For now (Xen 4.10/4.11 at at least),
 		# will be not built by default and gated by expert mode
 		echo >>xen/.config CONFIG_HAS_ITS=y
+
+		# PV32 is disabled by default but we still want to test
+		# it, for now at least until everything is updated.
+		echo >>xen/.config CONFIG_PV32=y
 	fi
 END
                );
-- 
2.20.1



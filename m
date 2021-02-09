Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8725A31557D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 18:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83377.155056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9XIF-0007lq-69; Tue, 09 Feb 2021 17:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83377.155056; Tue, 09 Feb 2021 17:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9XIE-0007jo-So; Tue, 09 Feb 2021 17:59:18 +0000
Received: by outflank-mailman (input) for mailman id 83377;
 Tue, 09 Feb 2021 17:59:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XIC-0007em-2J
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XIC-0003zA-1N
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:16 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9XIC-0004eY-0O
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:59:16 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l9XIA-00065Y-4X; Tue, 09 Feb 2021 17:59:14 +0000
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
	bh=zS5Qpm9EEk8VpYi2KeFWiIa9aufzej4lmRBAOxzJ8fo=; b=iXl7meE5dLhsslURerdtufop65
	bz/nnK0lO0CavJvqgI+tBlYjzuUCTg0iLIU769Cli5Zrup6eUCeWBBsmVBXZNAHdip0sUN7q/gxhT
	ayjr5TVq2F6yRhx9XTHoFwO7GZ5BfHaYIqhL6ZvYMExoWF0HFehuIhEvN2V5t7bWihW0=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [OSSTEST PATCH 6/7] production-config: Use a snapshot for buster armhf
Date: Tue,  9 Feb 2021 17:59:03 +0000
Message-Id: <20210209175904.28282-6-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209175904.28282-1-iwj@xenproject.org>
References: <20210209175904.28282-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recent Debian update broke some guest setup.  Roll back.

CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 production-config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/production-config b/production-config
index e7009a55..126c5d3b 100644
--- a/production-config
+++ b/production-config
@@ -93,6 +93,8 @@ TftpDiVersion_jessie 2018-06-26
 TftpDiVersion_stretch 2020-09-24
 TftpDiVersion_buster 2021-02-08
 
+DebianMirror_buster_armhf http://snapshot.debian.org/archive/debian/20210201T024125Z/
+
 DebianSnapshotBackports_jessie http://snapshot.debian.org/archive/debian/20190206T211314Z/
 
 # For ISO installs
-- 
2.20.1



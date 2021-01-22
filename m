Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7943007E4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 16:56:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72900.131416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynH-0004e0-Hf; Fri, 22 Jan 2021 15:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72900.131416; Fri, 22 Jan 2021 15:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynH-0004d9-2t; Fri, 22 Jan 2021 15:56:15 +0000
Received: by outflank-mailman (input) for mailman id 72900;
 Fri, 22 Jan 2021 15:56:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynF-0004b8-7N
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynF-0002OS-62
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynF-0000Rf-3k
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:13 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l2ynD-0004Ar-Co; Fri, 22 Jan 2021 15:56:11 +0000
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
	bh=CsoLIf8Kq8xCnyj6QmPhtuHVnLJJVZJvJ7WQ8VV1uXw=; b=BbJyOtDW18fafmJkwJ/M6KK7e0
	lKRhW6T21dh/FHPx37yr6ELMfH/+rDS7xY9JrwzXqNZJgEKhZlQNDBRkOVcFgIRVM/lsc1bBC3Vaj
	jufTiwtxzcfmTNIejGIDkcG9GemU/OPz9KuUOmxDLXJB8J68W1DwxBP97SG4G7IKE+ew=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 4/7] ts-xen-install: Break out @commons_config
Date: Fri, 22 Jan 2021 15:56:00 +0000
Message-Id: <20210122155603.23402-4-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122155603.23402-1-iwj@xenproject.org>
References: <20210122155603.23402-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We are going to set other things here too.  Prepare for that.

No functional change.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 ts-xen-install | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/ts-xen-install b/ts-xen-install
index feb98951..fc4bf423 100755
--- a/ts-xen-install
+++ b/ts-xen-install
@@ -138,8 +138,12 @@ sub adjustconfig () {
     }
     die unless defined $commons_config_file;
 
+    my @commons_config =
+        (
+	   "XENCONSOLED_TRACE" => "guest",
+	);
     target_editfile_root($ho, $commons_config_file,
-	sub { target_editfile_kvp_replace("XENCONSOLED_TRACE", "guest") });
+	sub { target_editfile_kvp_replace(@commons_config) });
 
     target_editfile_root($ho, '/etc/libvirt/libvirtd.conf',
 		sub { target_editfile_kvp_replace("log_level", "1") })
-- 
2.20.1



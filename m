Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CC1405B33
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 18:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183407.331581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONCm-0005cD-HS; Thu, 09 Sep 2021 16:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183407.331581; Thu, 09 Sep 2021 16:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONCm-0005W1-8v; Thu, 09 Sep 2021 16:47:16 +0000
Received: by outflank-mailman (input) for mailman id 183407;
 Thu, 09 Sep 2021 16:47:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mONCk-00059s-L0
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:47:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mONCk-0002Mv-KF
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:47:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mONCk-0001Rn-J1
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 16:47:14 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mONCi-0006u8-NO; Thu, 09 Sep 2021 17:47:12 +0100
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
	bh=2+4QD+hpkm6kgypvB1lp50M/jnKqf3BdU/Qs7r96jAo=; b=NiSJ7mnc1wqpzNMdNCM10IPLou
	0aZqHSSXr7OvBgXjN13JrcAsaMfwD6aX1eIh0l9p+Q/fJUDAbcx7g+msAixTscKeuTUWUsqfdYEoY
	dj0o7wU+7y/VOj9EYoG7qae+oC2YWJKcO1xiWiwbMXRJE5HhR+Rj/tzE+Cl5eF+17uVg=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [OSSTEST PATCH 4/4] mfi-common: Drop Linux dom0 i386 tests for newer Linux branches
Date: Thu,  9 Sep 2021 17:47:03 +0100
Message-Id: <20210909164703.19426-4-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210909164703.19426-1-iwj@xenproject.org>
References: <20210909164703.19426-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes radical changes to the test ste for the linux-linus and
linux-next branches.

Mostly, tests are dropped but some 64-bit dom0 tests are added to
replace them.

Requested-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mfi-common | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mfi-common b/mfi-common
index 02278420..771843f0 100644
--- a/mfi-common
+++ b/mfi-common
@@ -655,6 +655,11 @@ test_matrix_iterate () {
             *) continue ;;
         esac
 
+        case "${branch}_${dom0arch}" in
+          linux-5.4_i386 | linux-[2-4].*_i386) ;; # keep 32-bit for old linux
+          linux-*_i386) continue;;
+        esac
+
         dom0arches+=" $dom0arch"
       done
 
-- 
2.20.1



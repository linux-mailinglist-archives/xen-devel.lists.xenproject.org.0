Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC8028F62B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 17:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7519.19708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5Wb-0006Sn-JK; Thu, 15 Oct 2020 15:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7519.19708; Thu, 15 Oct 2020 15:50:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT5Wb-0006RO-BO; Thu, 15 Oct 2020 15:50:41 +0000
Received: by outflank-mailman (input) for mailman id 7519;
 Thu, 15 Oct 2020 15:50:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kT5WZ-0006GR-RD
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:39 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 319bc935-827b-4bc2-a804-a0d3a64e1b32;
 Thu, 15 Oct 2020 15:50:29 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WP-00087u-3W
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kT5WP-0005FC-1D
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kT5WN-0000oB-7F; Thu, 15 Oct 2020 16:50:27 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/DR3=DW=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kT5WZ-0006GR-RD
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:39 +0000
X-Inumbo-ID: 319bc935-827b-4bc2-a804-a0d3a64e1b32
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 319bc935-827b-4bc2-a804-a0d3a64e1b32;
	Thu, 15 Oct 2020 15:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=jMrPuRfDpr5F+mH23YfeFKCRSJQrvgGxKa9leTchrQs=; b=CXoc1/puYuanYGZwuMzekdpowu
	8Rr6FPbGx+mQf1rceLB8ZdAcoj2yjyXt2pUuCdc0pU5DcrgN85o5JNGpciFEQH6ny7CQBmAO3RdFX
	OyY5lxg5eNxls6XlyA4ZznHZo3n7jE2uIvDjy0x5FUGDpta0EvjRgYIDZvCKrOVl27Ig=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WP-00087u-3W
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WP-0005FC-1D
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 15:50:29 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kT5WN-0000oB-7F; Thu, 15 Oct 2020 16:50:27 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH v2 04/17] mg-execute-flight: Do not include the transcript in reports
Date: Thu, 15 Oct 2020 16:50:06 +0100
Message-Id: <20201015155019.20705-5-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015155019.20705-1-iwj@xenproject.org>
References: <20201015155019.20705-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are large and not very useful.  A copy is in the tree if needed.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-execute-flight | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/mg-execute-flight b/mg-execute-flight
index 391f4810..bef8dab6 100755
--- a/mg-execute-flight
+++ b/mg-execute-flight
@@ -101,9 +101,6 @@ echo
 
 ./cr-fold-long-lines <tmp/$flight.report
 
-echo ============================================================
-./cr-fold-long-lines <tmp/$flight.transcript
-
 exec >&2
 
 if $publish; then
-- 
2.20.1



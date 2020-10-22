Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BAF29635F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 19:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10598.28278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVe5T-0002Oh-LE; Thu, 22 Oct 2020 17:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10598.28278; Thu, 22 Oct 2020 17:09:15 +0000
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
	id 1kVe5T-0002Ns-GG; Thu, 22 Oct 2020 17:09:15 +0000
Received: by outflank-mailman (input) for mailman id 10598;
 Thu, 22 Oct 2020 17:09:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVe5S-0002N0-1M
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:14 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f495b60-ce14-4014-9d06-1feaf311c5d6;
 Thu, 22 Oct 2020 17:09:13 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVe5R-0005td-2I
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:13 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVe5R-0005X1-02
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:13 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVdiG-00059e-C8; Thu, 22 Oct 2020 17:45:16 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVe5S-0002N0-1M
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:14 +0000
X-Inumbo-ID: 0f495b60-ce14-4014-9d06-1feaf311c5d6
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0f495b60-ce14-4014-9d06-1feaf311c5d6;
	Thu, 22 Oct 2020 17:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=hVU1+g4bJC8UHbCyURdy+z5xK2i7GZBXZk4m60xh6gI=; b=T4KHNm77Mgj+qRdM3pGkpeph6X
	I3K7wgG3miPJ55KYAG6ofd5iZwvJW2D9YoLyuT9nmsjM9xOv4OQFD1J86vckNQTL7NgvR4Y3AKQA4
	s3H4Ol3M+wtmFr72WVlxTe5vo3X7Jk4JZKPBiKH9K1bFY8xt2sXxhFJgjK/frYxz2B9Y=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVe5R-0005td-2I
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:13 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVe5R-0005X1-02
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:13 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiG-00059e-C8; Thu, 22 Oct 2020 17:45:16 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 11/16] host reuse fixes: Fix runvar entry for adhoc tasks
Date: Thu, 22 Oct 2020 17:45:01 +0100
Message-Id: <20201022164506.1552-12-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022164506.1552-1-iwj@xenproject.org>
References: <20201022164506.1552-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When processing an item from the host lifecycle table into the runvar,
we don't want to do all the processing of flight and job.  Instead, we
should simply put the ?<taskid> into the runvar.

Previously this would produce ?<taskid>: which the flight reporting
code would choke on.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/JobDB/Executive.pm | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Osstest/JobDB/Executive.pm b/Osstest/JobDB/Executive.pm
index 04555113..1dcf55ff 100644
--- a/Osstest/JobDB/Executive.pm
+++ b/Osstest/JobDB/Executive.pm
@@ -649,6 +649,11 @@ END
 	    }
 	    next if $tj_seen{$oisprepmark.$otj}++;
 
+	    if (!defined $o->{flight}) {
+		push @lifecycle, "$omarks$otj";
+		next;
+	    }
+
 	    if (!$omarks && !$olive && defined($o->{flight}) &&
 		$ho->{Shared} &&
 		$ho->{Shared}{Type} =~ m/^build-/ &&
-- 
2.20.1



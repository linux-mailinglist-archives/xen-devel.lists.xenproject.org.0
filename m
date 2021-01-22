Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FBB3007E6
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 16:56:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72898.131393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynG-0004cV-L1; Fri, 22 Jan 2021 15:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72898.131393; Fri, 22 Jan 2021 15:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynG-0004bm-Co; Fri, 22 Jan 2021 15:56:14 +0000
Received: by outflank-mailman (input) for mailman id 72898;
 Fri, 22 Jan 2021 15:56:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynE-0004ay-MY
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynE-0002OM-Lf
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynE-0000RF-KM
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:12 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l2ynC-0004Ar-Mt; Fri, 22 Jan 2021 15:56:11 +0000
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
	bh=V4DNzO9T0hlpsDh/QQtSucpoSUBfF4hGCHEzohAvxvY=; b=RxNME30Y6jHmgfZsZYe3qAyQAg
	cjeokpkgi7Hnilre8GiGPBEW6kxA0OlgU+vhgBRPBqS4Hzbgeh7eMCCaB/EOVlwUepQVAGMZlPXC6
	x9E0km2tjqN6PxtvA+PYEuUZMUgL2AF99ejAaFd18HZIVB64hocBs3f/W2GunEELH0g8=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 2/7] target_editfile_kvp_replace: Add a bit of logging
Date: Fri, 22 Jan 2021 15:55:58 +0000
Message-Id: <20210122155603.23402-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122155603.23402-1-iwj@xenproject.org>
References: <20210122155603.23402-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps see what's going on without fishing individual
before-and-after files out of the log directory.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 Osstest/TestSupport.pm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index d2558f31..9e85303a 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -777,6 +777,7 @@ sub teditfileex {
 sub target_editfile_kvp_replace
 {
     my (%kv) = @_;
+    logm("substituing: @_");
     my $prnow= sub {
 	my ($key) = @_;
 	my $value = $kv{$key};
-- 
2.20.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ED629635E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 19:09:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10597.28267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVe5Q-0002Kw-9k; Thu, 22 Oct 2020 17:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10597.28267; Thu, 22 Oct 2020 17:09:12 +0000
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
	id 1kVe5Q-0002KF-60; Thu, 22 Oct 2020 17:09:12 +0000
Received: by outflank-mailman (input) for mailman id 10597;
 Thu, 22 Oct 2020 17:09:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVe5N-0002GB-Ok
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:09 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 586d40d2-9e6f-43e5-8ea2-2722e0efbe36;
 Thu, 22 Oct 2020 17:09:08 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVe5M-0005tU-Hj
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:08 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVe5M-0005W0-Gu
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:08 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVdiH-00059e-Cj; Thu, 22 Oct 2020 17:45:17 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVe5N-0002GB-Ok
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:09 +0000
X-Inumbo-ID: 586d40d2-9e6f-43e5-8ea2-2722e0efbe36
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 586d40d2-9e6f-43e5-8ea2-2722e0efbe36;
	Thu, 22 Oct 2020 17:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=uD3SLBKiMkKsr66Riht6zcwv/GQ882j78TtfYVzfoKE=; b=oNAJn4NbsakzNZDpST6aDvIwWy
	v3eFTy0uKSG6l3lsKn9PaVP0iLv3a+ssXfkNGpg6todEHlxijFZq9YSge1+0xH9F7OWgo4fCK60fQ
	ZwDecxOiN6ZVdbJ7vQ/7eLWwa6TwOTrGBKi3zNGiyHQa4KkhqK2nOvMyBmuITB/9Tivs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVe5M-0005tU-Hj
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:08 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVe5M-0005W0-Gu
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:08 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiH-00059e-Cj; Thu, 22 Oct 2020 17:45:17 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 15/16] host reuse fixes: Do not break host-reuse if no host allocated
Date: Thu, 22 Oct 2020 17:45:05 +0100
Message-Id: <20201022164506.1552-16-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022164506.1552-1-iwj@xenproject.org>
References: <20201022164506.1552-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If host allocation failed, or our dependency jobs failed, then we
won't have allocated a host.  The host runvar will not be set.
In this case, we want to do nothing.

But we forgot to pass $noneok to selecthost.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 ts-host-reuse | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-host-reuse b/ts-host-reuse
index e2498bb6..b885a3e6 100755
--- a/ts-host-reuse
+++ b/ts-host-reuse
@@ -165,7 +165,7 @@ sub act_start_test () {
 
 sub act_final () {
     if (!@ARGV) {
-	$ho = selecthost($whhost);
+	$ho = selecthost($whhost, 1);
 	return unless $ho;
 	host_update_lifecycle_info($ho, 'final');
     } elsif ("@ARGV" eq "--post-test-ok") {
-- 
2.20.1



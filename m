Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E352909CA
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 18:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8187.21830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTSie-0000lg-Nr; Fri, 16 Oct 2020 16:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8187.21830; Fri, 16 Oct 2020 16:36:40 +0000
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
	id 1kTSie-0000l3-Jl; Fri, 16 Oct 2020 16:36:40 +0000
Received: by outflank-mailman (input) for mailman id 8187;
 Fri, 16 Oct 2020 16:36:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tDey=DX=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kTSid-0000fz-57
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:39 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0be6163-2bcd-4d17-8fce-8d7a69e58454;
 Fri, 16 Oct 2020 16:36:28 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kTSiS-0001KY-NW
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:28 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kTSiS-0008Da-Bg
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:28 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kTSiQ-0004zo-KS; Fri, 16 Oct 2020 17:36:26 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tDey=DX=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kTSid-0000fz-57
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:39 +0000
X-Inumbo-ID: f0be6163-2bcd-4d17-8fce-8d7a69e58454
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f0be6163-2bcd-4d17-8fce-8d7a69e58454;
	Fri, 16 Oct 2020 16:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=YMqUcSG249nJyp30zh8d53bqbvmo1wljVruJ5ddf6HQ=; b=ynkpWmR9VV3StiRTDWzKyEPPFM
	LXgpeQhSkIDilGrs/K55t6MhOuBJkmCq2MJLydQ3Hb60o3BKDV99qnCpWCyRB97EJLdkUqMZduBJ+
	GT1HksnBVA0BsvuTmKN2ZToiPcaYy8r/r/jcyXcZnYWhDXVZF1GTVk8Rc7Pf1Y8+0fZo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTSiS-0001KY-NW
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:28 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTSiS-0008Da-Bg
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:36:28 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTSiQ-0004zo-KS; Fri, 16 Oct 2020 17:36:26 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 3/3] Revert "host reuse: Reuse hosts only in same role (for now)"
Date: Fri, 16 Oct 2020 17:36:15 +0100
Message-Id: <20201016163615.5086-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201016163615.5086-1-iwj@xenproject.org>
References: <20201016163615.5086-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This workaround is no longer needed because I have fixed the problem
properly.

Also, it didn't work anyway, because at that point $ho isn't set, so
all this did was produce some Perl warnings.

This reverts commit f3668acae2c6201c680dc7b4e9085ab184136d7e.
---
 ts-host-reuse | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ts-host-reuse b/ts-host-reuse
index ea8a471d..e2498bb6 100755
--- a/ts-host-reuse
+++ b/ts-host-reuse
@@ -67,7 +67,6 @@ sub sharetype_add ($$) {
 sub compute_test_sharetype () {
     my @runvartexts;
     my %done;
-    push @runvartexts, $ho->{Ident};
     foreach my $key (runvar_glob(@accessible_runvar_pats)) {
 	next if runvar_is_synth($key);
 	my $val = $r{$key};
-- 
2.20.1



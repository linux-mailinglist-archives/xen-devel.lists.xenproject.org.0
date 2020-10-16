Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0E429051A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 14:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8070.21482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTOxP-0001wZ-BB; Fri, 16 Oct 2020 12:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8070.21482; Fri, 16 Oct 2020 12:35:39 +0000
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
	id 1kTOxP-0001wA-7j; Fri, 16 Oct 2020 12:35:39 +0000
Received: by outflank-mailman (input) for mailman id 8070;
 Fri, 16 Oct 2020 12:35:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tDey=DX=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kTOxN-0001w4-0o
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 12:35:37 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76d9e649-a8df-4b2a-89bd-e06495a32646;
 Fri, 16 Oct 2020 12:35:36 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kTOxM-00041W-0q
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 12:35:36 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kTOxL-0008PS-V8
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 12:35:35 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kTOxK-0003eA-3Z; Fri, 16 Oct 2020 13:35:34 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tDey=DX=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kTOxN-0001w4-0o
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 12:35:37 +0000
X-Inumbo-ID: 76d9e649-a8df-4b2a-89bd-e06495a32646
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 76d9e649-a8df-4b2a-89bd-e06495a32646;
	Fri, 16 Oct 2020 12:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=f0hAf7wfFJTtTLqm2PlOsH+pnB4+KPz9jXt4sXqTpK8=; b=6jBrCkxS1/UcaGB0UFxX1gvIcu
	jY+JK8zVdAStnfLexUTZ/jAnR+DCdDuJdhn0VAZ8MEUbnIfkG9+plbgm+QchLWPVoBicEp1hkUaBm
	g3hQtkEm+UYs8MoSXjwY4+XqDowMZipGwmIkdwuUDhxjlErIifKjYuOjPAq9gXdgIpr0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTOxM-00041W-0q
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 12:35:36 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTOxL-0008PS-V8
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 12:35:35 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTOxK-0003eA-3Z; Fri, 16 Oct 2020 13:35:34 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH] host reuse: Reuse hosts only in same role (for now)
Date: Fri, 16 Oct 2020 13:35:28 +0100
Message-Id: <20201016123528.1894-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a workaround.  There is a problem with hoat key setup in a
group of hosts, which means that when a pair test reuses a host set up
by a different test, we can get
   Host key verification failed.
during the src-to-dst migration.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 ts-host-reuse | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ts-host-reuse b/ts-host-reuse
index ae967304..8d674257 100755
--- a/ts-host-reuse
+++ b/ts-host-reuse
@@ -67,6 +67,7 @@ sub sharetype_add ($$) {
 sub compute_test_sharetype () {
     my @runvartexts;
     my %done;
+    push @runvartexts, $ho->{Ident};
     foreach my $key (runvar_glob(@accessible_runvar_pats)) {
 	next if runvar_is_synth($key);
 	my $val = $r{$key};
-- 
2.20.1



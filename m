Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5594C2909FE
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 18:51:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8199.21855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTSwP-0002l0-Bc; Fri, 16 Oct 2020 16:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8199.21855; Fri, 16 Oct 2020 16:50:53 +0000
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
	id 1kTSwP-0002kb-7s; Fri, 16 Oct 2020 16:50:53 +0000
Received: by outflank-mailman (input) for mailman id 8199;
 Fri, 16 Oct 2020 16:50:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tDey=DX=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kTSwN-0002kR-ME
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:50:51 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8c8aade-3d15-4f8c-a7ab-2c732511750e;
 Fri, 16 Oct 2020 16:50:50 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kTSwM-0001dk-MF
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:50:50 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kTSwM-0001aE-KO
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:50:50 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kTSwK-00052F-Qr; Fri, 16 Oct 2020 17:50:48 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tDey=DX=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kTSwN-0002kR-ME
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:50:51 +0000
X-Inumbo-ID: c8c8aade-3d15-4f8c-a7ab-2c732511750e
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c8c8aade-3d15-4f8c-a7ab-2c732511750e;
	Fri, 16 Oct 2020 16:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=spOHayiZ5llu8K3oTStjH9Mre3G0q13wN0/Z0Ay6zSg=; b=vBQBb6xXMDulav22cSpnbumgIt
	FnmB0A+hBlEICG3JYAiweF65iX4UEcn3cGFGxxBfZ4yFeLqWLjQCH8dIR3gG4FE2PZpb4o0UqqoU9
	Yd1blEO6QZsQy9sLNyL7TMhpO1QrT13dP9gHG4awoHV4DcGt4quFibtIWMLJ31HV6ClA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTSwM-0001dk-MF
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:50:50 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTSwM-0001aE-KO
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 16:50:50 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kTSwK-00052F-Qr; Fri, 16 Oct 2020 17:50:48 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 2/2] Do not mark hosts used for pair test as reusable
Date: Fri, 16 Oct 2020 17:50:41 +0100
Message-Id: <20201016165041.6716-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201016165041.6716-1-iwj@xenproject.org>
References: <20201016165041.6716-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We do not currently tear down the nbd, and that means the next test
cannot remove our LVs.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-run-job | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sg-run-job b/sg-run-job
index 69ee715b..bc5a0c8f 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -581,6 +581,8 @@ proc run-job/test-debianhvm {} {
 }
 
 proc setup-test-pair {} {
+    global reuse_ok
+    set reuse_ok 0
     run-ts . =              ts-debian-install      dst_host
     run-ts . =              ts-debian-fixup        dst_host          + debian
     run-ts . =              ts-guests-nbd-mirror + dst_host src_host + debian
-- 
2.20.1



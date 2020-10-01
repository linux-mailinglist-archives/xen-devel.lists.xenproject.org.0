Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205392803DC
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 18:25:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1455.4584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO1O4-0001MI-Kp; Thu, 01 Oct 2020 16:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455.4584; Thu, 01 Oct 2020 16:24:56 +0000
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
	id 1kO1O4-0001Lm-H2; Thu, 01 Oct 2020 16:24:56 +0000
Received: by outflank-mailman (input) for mailman id 1455;
 Thu, 01 Oct 2020 16:24:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kO1O3-0001JL-JR
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:24:55 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57916f4e-c27c-453e-bc92-0bb81ac20b09;
 Thu, 01 Oct 2020 16:24:50 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kO1Nx-00029L-Cc; Thu, 01 Oct 2020 17:24:49 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kO1O3-0001JL-JR
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:24:55 +0000
X-Inumbo-ID: 57916f4e-c27c-453e-bc92-0bb81ac20b09
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 57916f4e-c27c-453e-bc92-0bb81ac20b09;
	Thu, 01 Oct 2020 16:24:50 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kO1Nx-00029L-Cc; Thu, 01 Oct 2020 17:24:49 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 3/8] sg-run-job: Preserve step state "fail" if set by test script
Date: Thu,  1 Oct 2020 17:24:34 +0100
Message-Id: <20201001162439.18160-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201001162439.18160-1-iwj@xenproject.org>
References: <20201001162439.18160-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the test script exits nonzero but after setting the step status to
'fail', we can leave it that way.  This is particularly relevant if
the iffail in the job spec says 'broken' or something.  After this
change, a step can decide to override that.

An alternative would be to have the step script exit zero, but of
course that would (generally) leave the job to continue running more
steps!

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 tcl/JobDB-Executive.tcl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tcl/JobDB-Executive.tcl b/tcl/JobDB-Executive.tcl
index 4fe85696..38248823 100644
--- a/tcl/JobDB-Executive.tcl
+++ b/tcl/JobDB-Executive.tcl
@@ -325,6 +325,7 @@ proc step-set-status {flight job stepno st} {
                AND status<>'aborted'
                AND status<>'broken'
                AND status<>'starved'
+               AND status<>'fail'
         "
         set pause 0
         db-execute-array stopinfo "
-- 
2.20.1



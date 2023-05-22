Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB2170C621
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 21:15:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538078.837832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Azt-0001lt-I2; Mon, 22 May 2023 19:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538078.837832; Mon, 22 May 2023 19:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Azt-0001jL-FF; Mon, 22 May 2023 19:15:09 +0000
Received: by outflank-mailman (input) for mailman id 538078;
 Mon, 22 May 2023 19:15:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iirr=BL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1q1Azs-0001jA-C2
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 19:15:08 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f54518db-f8d4-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 21:15:06 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 168478290119119.98926170790287;
 Mon, 22 May 2023 12:15:01 -0700 (PDT)
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
X-Inumbo-ID: f54518db-f8d4-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1684782902; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O0kdTS3rolyoS3J0hIN0vOe5o99wlAJsZ5oFiSdxjTwPjmYLX6z2Mu1YfkgGqBnGgPmAR1770DwoPRLCHOfz3XZyZzpOtEZ7mWz+r1QGfZwSTjG0Q0h2ZcbXhTMqxGIlNwVoOdxqiWMZOO5nneZ2ablU5n2jJUnltesKf0hJERs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1684782902; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=dAPFVcJYTMmZ5NEfQ3IJYFc1oVcKeuaNKP6R+EjiTdk=; 
	b=UlJXX835xzOCgshy0+MfMpcIqMn+lpz5bHL3bbKWFXtG0DkGSLp2WGkNPvvV6Bm/j3qD9B+zKdbrhUAPkPHWbUiXAzs99dDlwO1eoj5wVPi3hQq0ZCcVWDtsyl3PsVM+2VWbNG8HaSAHiAo5fE5aAQUh6s+GV4Hi8I6AK6A2eX4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1684782902;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=dAPFVcJYTMmZ5NEfQ3IJYFc1oVcKeuaNKP6R+EjiTdk=;
	b=VuBKVrqwSvsbAJiUWpvnJWjNwMvLhfYMAv1iwEaMDTdpswUXY6Nf/7AkgQWVJ7e6
	FubF7dfkzxFR5lQK7lNs9hJrZRGf40Z1O2vsGqHwt3nAFmVQb1+ZaZs8sR/KFcnDMSt
	z3UAWukmsCXny0fKWvJUp6XTe08l83KtFtAvo8vA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] maintainers: add regex matching for xsm
Date: Mon, 22 May 2023 15:14:49 -0400
Message-Id: <20230522191450.5665-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

XSM is a subsystem where it is equally important of how and where its hooks are
called as is the implementation of the hooks. The people best suited for
evaluating the how and where are the XSM maintainers and reviewers. This
creates a challenge as the hooks are used throughout the hypervisor for which
the XSM maintainers and reviewers are not, and should not be, a reviewer for
each of these subsystems in the MAINTAINERS file. Though the MAINTAINERS file
does support the use of regex matches, 'K' identifier, that are applied to both
the commit message and the commit delta. Adding the 'K' identifier will declare
that any patch relating to XSM require the input from the XSM maintainers and
reviewers. For those that use the get_maintianers script, the 'K' identifier
will automatically add the XSM maintainers and reviewers. Any one not using
get_maintainers, it will be their responsibility to ensure that if their work
touches and XSM hook, to ensure the XSM maintainers and reviewers are copied.

This patch adds a pair of regex expressions to the XSM section. The first is
`xsm_.*` which seeks to match XSM hooks in the commit's delta. The second is
`\b(xsm|XSM)\b` which seeks to match strictly the words xsm or XSM and should
not capture words with a substring of "xsm".

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2f1881b32..b0f0823d21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -674,6 +674,8 @@ F:	tools/flask/
 F:	xen/include/xsm/
 F:	xen/xsm/
 F:	docs/misc/xsm-flask.txt
+K:	xsm_.*
+K:	\b(xsm|XSM)\b
 
 THE REST
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
-- 
2.20.1



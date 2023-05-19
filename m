Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 956DD7096C1
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 13:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537023.835756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzybK-0001ku-9L; Fri, 19 May 2023 11:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537023.835756; Fri, 19 May 2023 11:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzybK-0001iB-6g; Fri, 19 May 2023 11:48:50 +0000
Received: by outflank-mailman (input) for mailman id 537023;
 Fri, 19 May 2023 11:48:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=937s=BI=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1pzybI-0001i5-Ak
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 11:48:48 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bcaec07-f63b-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 13:48:46 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1684496920935451.16488822791234;
 Fri, 19 May 2023 04:48:40 -0700 (PDT)
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
X-Inumbo-ID: 1bcaec07-f63b-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1684496922; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cB8C1krIFJBzTOzr2aap3/rRvAvTPTk6svyUvCp6o94IsrbeG8JXjeqUa7/L1HbsbVNUKQHGWWudTfBBfidyS+ARkIaqs8BCY+4igND0CzNe4JPieh2sfgzUYUsew4hxmm8/wcxLP7j7Be4yKu43LGYRZlgSdfbZhHGXsH8PARI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1684496922; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=CyO3tHf0BVTIqiWlpbO9WHzMK2kr7jU8+ZeKunsHBt8=; 
	b=X3LDdxkhbez70bEVmHMh4XR+NdgjBAur5bMT60crvKwnh4ZQzz/AMqEkjZgFc9mD4YK+xZlnRjtbC/kr8zJJA86F8HILw1F/lDpvPMe+kAduvWLF7LSnhN/1eD3cGFaRUC3Utf9PtABoUlxTtKAkiwxrsvv7UmMjz52IKFMf8TY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1684496922;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=CyO3tHf0BVTIqiWlpbO9WHzMK2kr7jU8+ZeKunsHBt8=;
	b=d43WFm+J7t2vcywaoNt7eD4mfYtVR+iKoijGN0YhXzyv+cQp5C7xeVL85zbR/2ll
	zZDp0WddNEdDWig4QG21WL8jEmTqrJeA5knvV3HNszsjuM9+f1YwTbm72oDg5TSKaHt
	tw5UHu+K2INT8wlIkwal6JUCNORRoryR3r61uz94=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] maintainers: add regex matching for xsm
Date: Fri, 19 May 2023 07:48:24 -0400
Message-Id: <20230519114824.12482-1-dpsmith@apertussolutions.com>
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
index f2f1881b32..f7c8961dbb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -674,6 +674,8 @@ F:	tools/flask/
 F:	xen/include/xsm/
 F:	xen/xsm/
 F:	docs/misc/xsm-flask.txt
+K:  xsm_.*
+K:  \b(xsm|XSM)\b
 
 THE REST
 M:	Andrew Cooper <andrew.cooper3@citrix.com>
-- 
2.20.1



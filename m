Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842AC6DF00B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 11:08:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520071.807305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmWSa-0007fC-Ug; Wed, 12 Apr 2023 09:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520071.807305; Wed, 12 Apr 2023 09:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmWSa-0007cW-RN; Wed, 12 Apr 2023 09:08:12 +0000
Received: by outflank-mailman (input) for mailman id 520071;
 Wed, 12 Apr 2023 09:01:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sOUS=AD=zen2.lab.linutronix.de=alex@srs-se1.protection.inumbo.net>)
 id 1pmWMC-0007XZ-F4
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 09:01:36 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f19566a-d910-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 11:01:33 +0200 (CEST)
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
X-Inumbo-ID: 9f19566a-d910-11ed-8611-37d641c3527e
From: Alexander Kanavin <alex@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681290092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ASDAJcN9ZDCx7m2Ft89Q46dO/QfgStSaLx/RmpoqlmE=;
	b=j9n5cvIz7zoE/PDOF9CPf+FJcl6xd+Q8njqcaKJTWCkpCrqxeijmMdF2w3qJEWtCHStLLW
	MRidshZoi5xM6kQN79R9ICW3OPGW/6YXfHTI9GluBPlwkNDaMRV/HCmrNUZL7rtKms4tBX
	7C+3WRWa00YnmxvhZP58E+SjWYDpDDKlak+XxBv3HcCKyRKDWLpiS1snhiz25YKP9FrkIA
	SuNumLFhyiEf3saSBjqX3H/+TAE7f3ktg3g8Zr4t3wJBgvK5KFHXXazQFoRPQcO6h2VV28
	YY5Ec68PwYuZEJKhJ4zzjHgN5tZL2XWA0Yp5OtRoRgZVnFl2x5rEhTaL80XljQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681290092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ASDAJcN9ZDCx7m2Ft89Q46dO/QfgStSaLx/RmpoqlmE=;
	b=Y2N2se/Zydec6sWuFFSISLM+R1HkD+nTrPu9DD9ulcZYJ+sX3ceUARERhH3Vs8eLjjndEA
	hoZs6wFhmyk91LDA==
To: xen-devel@lists.xenproject.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/xenstore/xenstored_control.c: correctly print time_t
Date: Wed, 12 Apr 2023 11:01:04 +0200
Message-Id: <20230412090104.3794213-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 32 bit systems with 64 bit time_t (hello, Y2038 problem),
the following error occurs otherwise:

| xenstored_control.c: In function 'lu_reject_reason':
| xenstored_control.c:646:70: error: format '%ld' expects argument of type 'long int', but argument 5 has type 'time_t' {aka 'long long int'} [-Werror=format=]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 tools/xenstore/xenstored_control.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index cbd62556c3..8683947d25 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -668,10 +668,10 @@ static const char *lu_reject_reason(const void *ctx)
 	list_for_each_entry(conn, &connections, list) {
 		if (conn->ta_start_time &&
 		    (now - conn->ta_start_time >= lu_status->timeout)) {
-			ret = talloc_asprintf(ctx, "%s\nDomain %u: %ld s",
+			ret = talloc_asprintf(ctx, "%s\nDomain %u: %jd s",
 					      ret ? : "Domains with long running transactions:",
 					      conn->id,
-					      now - conn->ta_start_time);
+					      (intmax_t)now - conn->ta_start_time);
 		}
 	}
 
-- 
2.30.2



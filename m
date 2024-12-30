Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6364C9FEAC3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2024 22:01:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863549.1274929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSMt1-000769-8E; Mon, 30 Dec 2024 21:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863549.1274929; Mon, 30 Dec 2024 21:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSMt1-00073p-4d; Mon, 30 Dec 2024 21:01:15 +0000
Received: by outflank-mailman (input) for mailman id 863549;
 Mon, 30 Dec 2024 21:01:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjPe=TX=daemonizer.de=maxi@srs-se1.protection.inumbo.net>)
 id 1tSMt0-00073D-FP
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2024 21:01:14 +0000
Received: from mx1.somlen.de (typhoon.somlen.de [89.238.64.140])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3416d09c-c6f1-11ef-a0db-8be0dac302b0;
 Mon, 30 Dec 2024 22:01:13 +0100 (CET)
Received: by mx1.somlen.de with ESMTPSA id 3A4D45030E8;
 Mon, 30 Dec 2024 22:01:13 +0100 (CET)
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
X-Inumbo-ID: 3416d09c-c6f1-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daemonizer.de;
	s=202303; t=1735592473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PMl7doOmmRwQcq+r6ytsB5DZXr1441bm/ek2YpkEhpg=;
	b=02s4tETFA/3dODyJqbV8n07g9zGuDfFQi43R7JGitkzK3iq8kJhwbOY4o0P6VGPkuz/g4a
	uAB44NyDFRVxk9wnSOCgwholvBgj2sCGydqqwYIGjeqGQyJzq0Wd2vVBk5Me6Ned2X7xJt
	J4xVU9TPSmjJWuXg64PrA3y35XP6FOVJJFuhd0WjpYqe1PqbfXHeDY4qIkghctpmtrbB9r
	IQ7HxFnT8/3MVB9kzgjJc8weSuROSOekrHaJFg12IuhKeenPzCJT2hgrKHjftHmRM6wFyw
	T+dH1WItXQKZwd2hwBxPMSK+/ovypRBjkA1CN7Yi6LC/nuBJcEVmwCD4qKsvMA==
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: Maximilian Engelhardt <maxi@daemonizer.de>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [XEN PATCH 2/5] docs: set DATE to SOURCE_DATE_EPOCH if available
Date: Mon, 30 Dec 2024 22:00:30 +0100
Message-Id: <1ad1283052a580cbe7dbd7581b64f3cfd87cbf88.1735585600.git.maxi@daemonizer.de>
In-Reply-To: <cover.1735585600.git.maxi@daemonizer.de>
References: <cover.1735585600.git.maxi@daemonizer.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the solution described in [1] to replace the call to the 'date'
command with a version that uses SOURCE_DATE_EPOCH if available. This
is needed for reproducible builds.

The -d "@..." syntax was introduced in GNU date about 2005 (but only
added to the docuemntation in 2011), so I assume a version supporting
this syntax is available, if SOURCE_DATE_EPOCH is defined. If
SOURCE_DATE_EPOCH is not defined, nothing changes with respect to the
current behavior.

[1] https://reproducible-builds.org/docs/source-date-epoch/

Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>
---
 docs/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/docs/Makefile b/docs/Makefile
index b30cc619f8..beba02a94f 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -3,7 +3,13 @@ include $(XEN_ROOT)/Config.mk
 -include $(XEN_ROOT)/config/Docs.mk
 
 VERSION		:= $(shell $(MAKE) -C $(XEN_ROOT)/xen --no-print-directory xenversion)
-DATE		:= $(shell date +%Y-%m-%d)
+
+DATE_FMT	:= +%Y-%m-%d
+ifdef SOURCE_DATE_EPOCH
+DATE		:= $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)" 2>/dev/null || date -u -r "$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)" 2>/dev/null || date -u "$(DATE_FMT)")
+else
+DATE		:= $(shell date "$(DATE_FMT)")
+endif
 
 DOC_ARCHES      := arm x86_32 x86_64
 MAN_SECTIONS    := 1 5 7 8
-- 
2.39.5



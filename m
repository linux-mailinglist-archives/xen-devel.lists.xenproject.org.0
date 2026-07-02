Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2TYwCNF9RmoRXQsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 17:03:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B7A6F92AD
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 17:03:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=JP5i7hTN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1352012.1608972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfIwb-0005bO-5G; Thu, 02 Jul 2026 15:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352012.1608972; Thu, 02 Jul 2026 15:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfIwb-0005Ye-2C; Thu, 02 Jul 2026 15:03:13 +0000
Received: by outflank-mailman (input) for mailman id 1352012;
 Thu, 02 Jul 2026 15:03:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wfIwZ-0005YR-3D
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 15:03:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfIwX-007ziY-RR
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 17:03:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a467d9b-bab6-0a2a0a5309dd-0a2a4503e5ce-46
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 17:03:09 +0200
Received: from [209.85.208.47] (helo=mail-ed1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a467da8-ec1a-0a2a45030019-d155d02fa899-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 17:03:04 +0200
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6983d3dae7aso1171353a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 08:03:04 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db8a4b83sm11052511f8f.12.2026.07.02.08.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 08:03:03 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1783004584; x=1783609384; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DjmOe84IrhGJfQjiy2t/gDqUrLCLWBZLNspBTB4loJM=;
        b=JP5i7hTN5B82dxM7VAn+1fc0tYAt2zceSPUA9OL1YZy+G6v8zjGD5wYPvbGVUAVmIc
         7wr1vBNf+MkN92xxVILVb5hDvJrZo3EM+gnp5LlOVuBiGnqdzPMA7Ekq+Yu9W+2vJeni
         d2nlGh/JmQQbhMiaQxnO9yaH0bOtK586Rh5/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783004584; x=1783609384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjmOe84IrhGJfQjiy2t/gDqUrLCLWBZLNspBTB4loJM=;
        b=p/ZEzCOHKU0wFPoXQAEMuUudOnPc6ie4tluiu7AMHUlx8Kq4iCFJ36O0V14d5pSo6d
         Qh8Ytnw6+ZPckrhcDQmDFI5XatCs8dv7dE/4zTqkNj8X0oaLRbZVnC1dgtyZVBSjK3y3
         DnVSeFdTFWaOsdBvXjDdBhNVvStSIq9ffwCcgEhryvSCpkeGGmgePRfu0AN2Pp/m7riI
         Zd92ZcgFWUPaUrxh3HSGr0snbWQpERuNP9K1jgGDuJqZR6gfX7ahqTksCECMa1sPGv/q
         BRCvIPBvqdhMUXk6BXS4t/nffvgubDfSMGgvyscQlMb2D/7f2Xp7eWoKLwqiq/tusSEm
         mJsg==
X-Gm-Message-State: AOJu0YyakJ3Zno1jDu52uMatiAeE581v00fAV1xo9X4/3xm5popGbsjR
	zWAf7FlUXhrb9JUidMwyjIH+oIreKgxnm3qpa2B9J1Wm7EFn6eZeAWZJCt32auEsnuIsmMXix/6
	i4fpFDiM=
X-Gm-Gg: AfdE7cliNE1ICdaAVXM1vx2/75Wrufg6+0aMzqbzz14tnOqi0lSf/qUNKTAHoANnzda
	rqdT5p5NdC9+DBvFo3F2mjewOG9MEMr/iq5FGDGVDRN/uJ05Kaypv1VayoHzPC0Ktl2+Stho2fD
	vypCuauuStZtk6cg04SQKrlyIYtSi8LAcq/QElp3wBCV4bPcs8QZjXCq26DZ+Ftoe1GAL2pgeGJ
	SnHMiRVsvHhbGWNY/ApAYrHMKnc4Jol8YvDxWnIZGDgD6einpRG1243fG9P7WtIvO7CkVuf91Jg
	K1IK4TKCoYiMSPLblPjgUNm6zhwkl+Z+O8eFZOGvgCpALPtU2xpsaGJ9nGCiyPOaofs8ZiLUWcb
	X8JFsEgzMgH4C7a1q1B9LV+3Zg8DrFfwIxWlPtewOACwBYt0I6wRvgxbs6w84Ft+jXBXoShoypk
	p9mWCfVEGFR1aF8LSsVIdzSC/KfhDKjq0BNkOw/FXTf1XyWPluK9XF7WxaGYhkhGQ=
X-Received: by 2002:a17:907:d303:b0:c12:a7c5:e638 with SMTP id a640c23a62f3a-c12c9d3c84cmr14402666b.7.1783004583966;
        Thu, 02 Jul 2026 08:03:03 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22] tools/libfsimage: Remove the XEN_FSIMAGE_FSDIR environment variable
Date: Thu,  2 Jul 2026 16:03:01 +0100
Message-Id: <20260702150301.825883-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1783004589-B57BF5D1-AA55E787/10/73395122804
X-purgate-type: spam
X-purgate-size: 2307
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,gmail.com];
	TO_DN_ALL(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,changelog.md:url,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,keepachangelog.com:url,xen.org:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96B7A6F92AD

This was reported to the security team, demonstrating that code execution
could be achieved, but without a demonstration of a priviliege boundary being
bypassed.

Still, it's a high risk path with no obvious evidence of having been used even
for debugging, so remove the environment variable and use the build time
$(libdir)/xenfsimage path only.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For 4.22.  This was supposed to be posted earlier but fell through the cracks.
Given it's borderline-security aspect, we don't want to delay it any further.
---
 CHANGELOG.md                             | 1 +
 tools/libfsimage/common/fsimage_plugin.c | 5 +----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ef4e6ae9c459..0a4e5f013cb1 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -63,6 +63,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
  - Removed xenpm tool on non-x86 platforms as it doesn't actually provide
    anything useful outside of x86.
+ - Removed the XEN_FSIMAGE_FSDIR environment variable.
 
 ## [4.21.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.21.0) - 2025-11-19
 
diff --git a/tools/libfsimage/common/fsimage_plugin.c b/tools/libfsimage/common/fsimage_plugin.c
index d0cb9e96a654..539dc247356a 100644
--- a/tools/libfsimage/common/fsimage_plugin.c
+++ b/tools/libfsimage/common/fsimage_plugin.c
@@ -121,7 +121,7 @@ static int init_plugin(const char *lib)
 
 int fsi_init(void)
 {
-	const char *fsdir = getenv("XEN_FSIMAGE_FSDIR");
+	const char *fsdir = FSIMAGE_FSDIR;
 	struct dirent *dp = NULL;
 	DIR *dir = NULL;
 	char *tmp = NULL;
@@ -129,9 +129,6 @@ int fsi_init(void)
 	int err;
 	int ret = -1;
 
-	if (fsdir == NULL)
-		fsdir = FSIMAGE_FSDIR;
-
 	if ((name_max = pathconf(fsdir, _PC_NAME_MAX)) == -1)
 		goto fail;
 

base-commit: ad9f564a5d840389cbf1b230086e1dd8257d8820
-- 
2.39.5



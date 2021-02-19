Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D71631FA63
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 15:14:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86887.163409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD6XS-0000xQ-Si; Fri, 19 Feb 2021 14:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86887.163409; Fri, 19 Feb 2021 14:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD6XS-0000x1-PY; Fri, 19 Feb 2021 14:13:46 +0000
Received: by outflank-mailman (input) for mailman id 86887;
 Fri, 19 Feb 2021 14:13:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jZy7=HV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lD6XR-0000ww-9D
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 14:13:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cacaf6f-74c1-4b44-90c4-9ccb488c96e0;
 Fri, 19 Feb 2021 14:13:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B8CDABAE;
 Fri, 19 Feb 2021 14:13:43 +0000 (UTC)
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
X-Inumbo-ID: 2cacaf6f-74c1-4b44-90c4-9ccb488c96e0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613744023; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m9LvAwR4BamUvVwgeaJtp/lMusRaDgmJHEvq2QOW/hM=;
	b=cAK+uYSmkCA7h8hxcrzuToVJDOK+x2eSDT8qYT/xICl3nynXtvsMtE/VoVBwMCN/pukKoW
	Cx0r5Fw4KU0aeeSwBGXO1VFClxuMjhl4gcxJvnymsjrh3NrefuKEl9iK57O+PCMUA7vA05
	Y1vcGcFOmJqmqeofXt/K/yHQjpej8Jk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH-for-4.15] tools/libs/light: fix xl save -c handling
Date: Fri, 19 Feb 2021 15:13:37 +0100
Message-Id: <20210219141337.6934-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libxl_domain_resume() won't work correctly for the case it was called
due to a "xl save -c" command, i.e. to continue the suspended domain.

The information to do that is not saved in libxl__dm_resume_state for
non-HVM domains.

Fixes: 6298f0eb8f443 ("libxl: Re-introduce libxl__domain_resume")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/light/libxl_dom_suspend.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_dom_suspend.c b/tools/libs/light/libxl_dom_suspend.c
index 25d1571895..f7823bbc8f 100644
--- a/tools/libs/light/libxl_dom_suspend.c
+++ b/tools/libs/light/libxl_dom_suspend.c
@@ -630,12 +630,13 @@ void libxl__domain_resume(libxl__egc *egc,
         goto out;
     }
 
+    dmrs->suspend_cancel = suspend_cancel;
+
     if (type != LIBXL_DOMAIN_TYPE_HVM) {
         rc = 0;
         goto out;
     }
 
-    dmrs->suspend_cancel = suspend_cancel;
     dmrs->dm_resumed_callback = domain_resume_done;
     libxl__dm_resume(egc, dmrs); /* must be last */
     return;
-- 
2.26.2



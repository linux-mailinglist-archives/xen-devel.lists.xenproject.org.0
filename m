Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D860895A5E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 19:07:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700227.1093033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrhaU-0004OL-Iz; Tue, 02 Apr 2024 17:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700227.1093033; Tue, 02 Apr 2024 17:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrhaU-0004MN-FN; Tue, 02 Apr 2024 17:06:18 +0000
Received: by outflank-mailman (input) for mailman id 700227;
 Tue, 02 Apr 2024 17:06:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy/k=LH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rrhaS-0004MH-SL
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 17:06:16 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 507f0ddd-f113-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 19:06:15 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5684db9147dso6052758a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 10:06:15 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t18-20020a17090616d200b00a4664e6ad8esm6720392ejd.169.2024.04.02.10.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 10:06:14 -0700 (PDT)
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
X-Inumbo-ID: 507f0ddd-f113-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712077574; x=1712682374; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QUBlmUWv7LiNRjLFrjOMUxED6POsgobYLpj2gCO8DwA=;
        b=PpdSXMZgMkHYRz21GjoqDqmpk97qd9aqjFXzh/6bta7nvQ/kZNvArMabubbrsTt7+n
         litMW+WJ0cD7FsJNs9tVFQt8q8QbV1ZetpBcqhZ7jHlfEWmzolkM23YwzbMYBLuASysK
         GhtuKFE0cM6Ok6bT55DfClrVwKaIbN2M7g7fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712077574; x=1712682374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUBlmUWv7LiNRjLFrjOMUxED6POsgobYLpj2gCO8DwA=;
        b=wTvay9j/nymGxf2+/ObySflxlsn513Nyw4zVk+pInY6l6rPPIHSX2bs2xP5yGJk0nZ
         0hO7goQD6ftNC5rccKLdJKkKvEdW5lIywgNuIj2Dvk1TfIpDtMRoQ1slgY9UYxCWbHwq
         StlansHvedKHPbQHiwD6WFVDB1c3qRZv6nLqqv72rVSH7lZdNDyW13AJPkWHP0tei1vr
         4mcBlESYuLdMPrJtmWo+8hMSVKD2zleKkO62Pt0BlGI2ASSbKet2S3SAfh/e1VNbvOOk
         WWs2WF7IcoG/Ql9EhJNB2sZKQ8HFhUdt5B6DgkGStt+25CMDJO9kvY+/xKno7dS7pY5s
         MutA==
X-Gm-Message-State: AOJu0YzzdusIudvMuCaJCITkVW0x8o0vBHJHywOpCMiA5ORC0+kYppa4
	Q480GR/d7PzfstgDPU8zXK+hW/X5ev6zgBE/u1Btm9KgNAtDIG/cu+Ohz1J4FLFQAHdIWBTycTg
	ehzA=
X-Google-Smtp-Source: AGHT+IHGGhbFnk3JSYFJaNCHupKszT9iWapTMyudX5dBh+kxJaqC05P9ZoWcj0YOEQyF2bfqYGyyAw==
X-Received: by 2002:a17:906:2b5b:b0:a4e:60c0:6a98 with SMTP id b27-20020a1709062b5b00b00a4e60c06a98mr252775ejg.55.1712077574465;
        Tue, 02 Apr 2024 10:06:14 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound event channels"
Date: Tue,  2 Apr 2024 18:06:12 +0100
Message-Id: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit makes a claim without any kind of justification.

The claim is false, and the commit broke lsevtchn in dom0.  It is also quite
obvious from XSM_TARGET that it has broken device model stubdoms too.

Whether to return information about a xen-owned evtchn is a matter of policy,
and it's not acceptable to short circuit the XSM on the matter.

This reverts commit f60ab5337f968e2f10c639ab59db7afb0fe4f7c3.

Fixes: f60ab5337f96 ("evtchn: refuse EVTCHNOP_status for Xen-bound event channels")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Daniel Smith <dpsmith@apertussolutions.com>
---
 xen/common/event_channel.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 20f586cf5ecd..ae6c2f902645 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1040,12 +1040,6 @@ int evtchn_status(evtchn_status_t *status)
 
     read_lock(&d->event_lock);
 
-    if ( consumer_is_xen(chn) )
-    {
-        rc = -EACCES;
-        goto out;
-    }
-
     rc = xsm_evtchn_status(XSM_TARGET, d, chn);
     if ( rc )
         goto out;

base-commit: 7a09966e7b2823b70f6d56d0cf66c11124f4a3c1
-- 
2.30.2



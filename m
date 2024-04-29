Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A25F8B5A59
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 15:43:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714081.1115080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1RHQ-0006lJ-WC; Mon, 29 Apr 2024 13:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714081.1115080; Mon, 29 Apr 2024 13:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1RHQ-0006jC-SY; Mon, 29 Apr 2024 13:42:52 +0000
Received: by outflank-mailman (input) for mailman id 714081;
 Mon, 29 Apr 2024 13:42:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNw/=MC=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1s1RHP-0006Ul-6a
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 13:42:51 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e21342a-062e-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 15:42:49 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-343e46ec237so3808001f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 06:42:49 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net
 (default-46-102-197-201.interdsl.co.uk. [46.102.197.201])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a5d50c2000000b0034c5b28c264sm8530404wrt.16.2024.04.29.06.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 06:42:48 -0700 (PDT)
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
X-Inumbo-ID: 5e21342a-062e-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714398168; x=1715002968; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPqHn0dROWWlXbauIG0GZlybXJNpXzvYnmQkiXmKdag=;
        b=Y7mzQaickKA/96c18jM72TBpHtdS4VD/64OubHzTkEbYF5t9a9R9Lk0vd76U0UmvM4
         wNkoGdxaIPatndRBH0M6paWjcrtrodsJNEAqidrO1oB39TfyC0s8jL5Yy+PCTE+2QnvR
         0WmDRuQjZAXEh19CXUxj8hm7WjftqtasB95UI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714398168; x=1715002968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPqHn0dROWWlXbauIG0GZlybXJNpXzvYnmQkiXmKdag=;
        b=IUCaqMVPx0TtQqo7IulJfm6qQN/PqJHIlBgvT4DavWhP9g1u9gR4QtpL6JPndVR0p1
         K4ACSMWLwQNHFwqRlJ9SdzWvW8KgwWJYT1GbnmEKNeGOJ7+QvgT6BL1zkiDiAVNhNRDa
         5Ghld7OsB5XjDZzf/QzBiR379orjTPXMAmKQWPWKn5ZxD2tGFwWaxVewZCOBADJeRAFK
         5qm98gBOKz2uWyKDGamUR1C9VLlLX19ZcfnuUWFGDo78m+u4eXf9RsoxNlbzU8mxdLdG
         fmXAZ8rUGjxCgOOP6mAFogJWyt1Yx1QyXqZy2cYJWyBNMeBS+UrmRJLkJAKwZIXh5AUk
         KcQA==
X-Gm-Message-State: AOJu0YxryRG6Nbz2CRyMXfB/8uTM9FtzntHSYkQ/1+ENz/20hi3KUbvK
	+FRpmfM2/d6R1NNo5DxykJ3mCJbuNiDvxbuVDP8TUervPLVONgwuACJB8sDEdcRnPMyNt0tAalv
	+
X-Google-Smtp-Source: AGHT+IHahA4exGqGIr2Dz6YoO3IIAkAZOLXXSZT7eEQyuZVqKpnA7eN6sAKil+iHoNkGOMPdYbuqEA==
X-Received: by 2002:a5d:64a4:0:b0:34d:1a30:1e48 with SMTP id m4-20020a5d64a4000000b0034d1a301e48mr2308587wrp.21.1714398168394;
        Mon, 29 Apr 2024 06:42:48 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 1/2] evtchn: Add error status indicators for evtchn_status hypercall
Date: Mon, 29 Apr 2024 14:42:41 +0100
Message-Id: <2f9544433fd9bb5c4b7ccccbacc27bc928f57dfb.1714148012.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714148012.git.matthew.barnes@cloud.com>
References: <cover.1714148012.git.matthew.barnes@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the evtchn_status hypercall fails, it is not possible to determine
the cause of the error, since the library call returns -1 to the tool
and not the errno.

Because of this, lsevtchn is unable to determine whether to continue
event channel enumeration upon an evtchn_status hypercall error.

Add error status indicators for the eventchn_status hypercall for
lsevtchn to terminate its loop on, and keep other errors as failed
hypercalls.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 xen/common/event_channel.c         | 12 +++++++++++-
 xen/include/public/event_channel.h |  2 ++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index aceee0695f9f..0f11e71c3e6f 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1030,7 +1030,17 @@ int evtchn_status(evtchn_status_t *status)
 
     d = rcu_lock_domain_by_any_id(dom);
     if ( d == NULL )
-        return -ESRCH;
+    {
+        status->status = EVTCHNSTAT_dom_invalid;
+        return 0;
+    }
+
+    if ( !port_is_valid(d, port) )
+    {
+        status->status = EVTCHNSTAT_port_invalid;
+        rcu_unlock_domain(d);
+        return 0;
+    }
 
     chn = _evtchn_from_port(d, port);
     if ( !chn )
diff --git a/xen/include/public/event_channel.h b/xen/include/public/event_channel.h
index 0d91a1c4afab..29cbf43945b3 100644
--- a/xen/include/public/event_channel.h
+++ b/xen/include/public/event_channel.h
@@ -200,6 +200,8 @@ struct evtchn_status {
 #define EVTCHNSTAT_pirq         3  /* Channel is bound to a phys IRQ line.   */
 #define EVTCHNSTAT_virq         4  /* Channel is bound to a virtual IRQ line */
 #define EVTCHNSTAT_ipi          5  /* Channel is bound to a virtual IPI line */
+#define EVTCHNSTAT_dom_invalid  6  /* Given domain ID is not a valid domain  */
+#define EVTCHNSTAT_port_invalid 7  /* Given port is not within valid range   */
     uint32_t status;
     uint32_t vcpu;                 /* VCPU to which this channel is bound.   */
     union {
-- 
2.34.1



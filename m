Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F2B849801
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:47:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675775.1051235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwV6-00076t-7f; Mon, 05 Feb 2024 10:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675775.1051235; Mon, 05 Feb 2024 10:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwV6-00074Q-4z; Mon, 05 Feb 2024 10:46:56 +0000
Received: by outflank-mailman (input) for mailman id 675775;
 Mon, 05 Feb 2024 10:46:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/8nl=JO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1rWwV4-00074G-BA
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:46:54 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfca4a3a-c413-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 11:46:53 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56001d49cc5so2785901a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 02:46:53 -0800 (PST)
Received: from localhost.localdomain ([185.25.64.249])
 by smtp.gmail.com with ESMTPSA id
 ty24-20020a170907c71800b00a372a739731sm3409598ejc.45.2024.02.05.02.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 02:46:52 -0800 (PST)
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
X-Inumbo-ID: dfca4a3a-c413-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707130013; x=1707734813; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SzenSDt43d9dKKfeFM0SDMDstPJFaTNqj96pw7JED8k=;
        b=W/p+LcO90q9l0VU7eVvx2W0lx0DImxZAmXC5LLtLOWpTmI1jZYbP6s32gsZMtFYj0Z
         Le/cEnYozgQJMjCDgUba0DKrFmoCRaQuavg5sXrfc2YQndCReuipWYqOIP5h8yZs3QIh
         zU3V0iDYNlmktFWKyfb7h61+Iw5EL5dgGfFD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707130013; x=1707734813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzenSDt43d9dKKfeFM0SDMDstPJFaTNqj96pw7JED8k=;
        b=FuFiBcwuT+6TSv5R6inl13J9h4MFTGn4dKQlC0blsrq4nQ/U69ksvB+PS5OZ2RtQZH
         rsV00hQPQGe0DDYHA1C4rK8skQLyQUSBhp21lyZP8EucO5AkUmqKs9H544TgcNGQH/du
         OSo8N0dfeBvJtTWvnzMWz9V/uXCSiHbU520HyRRW8L6S5SHsE3oOOY23hXg42O7PzlUr
         Uo6q9CjHwmqCraBYCr/nRrbYnreyGWhIsORiBI3nHnZGJp9xsOM65nOI0ElfhkqREDOy
         sSZH1DWuwO2mtG2sk1lysBiyhNYEiXV5ZeqQYx014iyFKMiA2GfHfgRRUfkMHj6NyjdZ
         5Asw==
X-Gm-Message-State: AOJu0YysJSrIQP40BgqWEwhuRbJX6bWpjyH94KHsdM3uEQzEbGkACfVu
	+yS13vZcQzLSFkvTzdTJu858feCHHkVa4NjytzA5aPNjbDr47OYy5gm2wklKScE=
X-Google-Smtp-Source: AGHT+IGpt7ONVCe4L9IOR0v5GCjP3NS8ipucmpxnpP8IN6nrT22e82WK+MJKeNOvIaSiGD1ieUkC8Q==
X-Received: by 2002:a17:907:77d0:b0:a37:152e:2e61 with SMTP id kz16-20020a17090777d000b00a37152e2e61mr6562814ejc.71.1707130012924;
        Mon, 05 Feb 2024 02:46:52 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUq9xZccYn5t6aR5xhQOBUOB6URWktyY2MLQj+RFNhncs7AC8XGpc5ZJ8q8b9AxJqq5FOjIoJruXSeyy9HFIHwAyLA2/Wb0UZeYhZBFOVtidxKUAlRXBX9Xh9zkx2V4/ekj5veA5U3wuNvo/MYAOJD55/LB0Ul0cvMY4aVOg4Lsheg8QKMR6kjRtw8oe5/wMFhwcQ41l1yzTAfqgdNsLbQQ9U1AQgJuAAK4aw==
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH 2/5] Remove useless assignment
Date: Mon,  5 Feb 2024 10:46:37 +0000
Message-Id: <20240205104637.14868-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable is assigned later, that value is never used.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/common/event_channel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index a7a004a084..15aec5dcbb 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -324,8 +324,6 @@ int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, evtchn_port_t port)
         goto out;
     }
 
-    rc = 0;
-
     chn = evtchn_from_port(d, port);
 
     rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
-- 
2.34.1



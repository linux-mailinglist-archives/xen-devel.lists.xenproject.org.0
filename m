Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44451C6ABC1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 17:50:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165193.1491988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLOuT-0005fm-OZ; Tue, 18 Nov 2025 16:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165193.1491988; Tue, 18 Nov 2025 16:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLOuT-0005dX-L0; Tue, 18 Nov 2025 16:50:29 +0000
Received: by outflank-mailman (input) for mailman id 1165193;
 Tue, 18 Nov 2025 16:50:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/QT=52=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vLOuS-0005dM-9o
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 16:50:28 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae6c23fd-c49e-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 17:50:26 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso40156045e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 08:50:26 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f203afsm33752427f8f.39.2025.11.18.08.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 08:50:24 -0800 (PST)
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
X-Inumbo-ID: ae6c23fd-c49e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1763484625; x=1764089425; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ucoPHXHtoUxVGw2y8SYQNYXWmtCikp7TefnmB/In0Ts=;
        b=GFhdpBrx9OhqH40VTzV57FzLJ4CBCHOpk287TWImIaahpqmn5JQJtWqQ5FIsCQb8TG
         /lPxvKg6NLwqp4HdonDhBOkb12L5ZO3d5i3I3zKGQ51xFYZhcwjOPb9sfwAEW/zC6nyq
         UHkhUy6luhzwiB9r3ukiLtXMjuvZAjArt9v3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763484625; x=1764089425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucoPHXHtoUxVGw2y8SYQNYXWmtCikp7TefnmB/In0Ts=;
        b=pKJFZw3Q42/qDqELF8YJBcbOU7V49g1CTLxMWM3NWtmc4VMnWBImVnmRrklFfp4xAq
         Z6G1z/CWFgkr3HgQ5HtLpNDqjIxG2duaZzHS8kkoWfH0SJRCfAx/fSlLC1FrSOy93KA4
         Y8elJsOMvJC8aVhpsIYT2t5R1t/+HWhYsLDnDzASvzcFc8HyOjtWU2fc8Bgj4ip3VLXO
         XjpPUYkKHpwuxKKFi93CTqVgcoKYtcQNLPzMLxNoIb35iQ3y07IiYqAh5gtu92Uflmth
         pevsMTVAvnye5nap/rAiYGE4WXfo5vyKAmRD++z5x1XpoTr4O0IsDrw/i1qMSr3ER1KP
         3Q1A==
X-Gm-Message-State: AOJu0YyCWqZrkKQWOXhKdYzX4aM2HSMiw0iKLnI7y98ngFskhpzaqz/s
	B+9UukJDSCX9Qy4GP57gIIN/7o7pPSM3ZtCjIaIXoPZei+eT2e+nlPQplTFMTVoUBThsIlF9lvt
	NFv703aU=
X-Gm-Gg: ASbGncvv23G9u842SEJKFnaJI5jjxERAioCYrmECs2jGZU5xv01GyNDReruCQPI9zs5
	5Yf66p/CJlhxb4duqhwg2dj0kgdvA7mCIDKKnTD6dyMoBGTXo5RIaPaDlDLEjhrRXOlzES5LMdG
	HbhFr6KfF2n/hkCMWutg5GkFWJxUG2svvNoKjAQqohRDy2MUJSwnYmJ5RONSOLdry3eflDkHBpD
	6hmj9iM1bJ4dxJ8DT0l4blshZnuFbMfOMd/0cLw2SbrL167lVxtWZ9fUcK2jKGdCnB6GlZcXxHP
	fO3Z+YZumDGnSL6bWEAGSKfjyMvR/ABKBw7QJNsc0NLYlybZ5DF3/uJF8aB+plVbp+7uksiA43j
	XYIOBzjLjGg4Q43fw/4c9CnN9sqce9uGg+Fc7T7q71+chA/WvRoQyL5j5HECPArmKrfSTyBHNXI
	jcDT/jJTeTs3sU3dQ0qjCpRvwO4q5cscEc+YkP7ojwxb3EgUJ+V2aqsyGUSLxWzkz7QC0+R2Is5
	CS1RvYnfRU=
X-Google-Smtp-Source: AGHT+IFPpnTlgSd5Ri1cMDvNcvPfBBLE/+MWox1M6eM5WMq7tmmyEcyQgQWpT1KXkVWPXmxWGcFF6w==
X-Received: by 2002:a05:600c:a43:b0:46e:396b:f5ae with SMTP id 5b1f17b1804b1-4778fe6a415mr191818175e9.16.1763484624980;
        Tue, 18 Nov 2025 08:50:24 -0800 (PST)
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
Subject: [PATCH for-4.21] SUPPORT.md: Define support lifetime
Date: Tue, 18 Nov 2025 16:50:22 +0000
Message-Id: <20251118165022.476308-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 SUPPORT.md | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 491f9ecd1bbb..3099225c77f4 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,13 +9,13 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: 4.21-rc
-    Initial-Release: n/a
-    Supported-Until: TBD
-    Security-Support-Until: Unreleased - not yet security-supported
+    Xen-Version: 4.21
+    Initial-Release: 2025-11-19
+    Supported-Until: 2027-05-19
+    Security-Support-Until: 2028-11-19
 
 Release Notes
-: <a href="https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">RN</a>
+: <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.21_Release_Notes">RN</a>
 
 # Feature Support
 
-- 
2.39.5



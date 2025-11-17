Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EAFC666D0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 23:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164265.1491288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL7bN-0003Bf-O7; Mon, 17 Nov 2025 22:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164265.1491288; Mon, 17 Nov 2025 22:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL7bN-00039Z-Kn; Mon, 17 Nov 2025 22:21:37 +0000
Received: by outflank-mailman (input) for mailman id 1164265;
 Mon, 17 Nov 2025 22:21:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FLbM=5Z=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vL7bL-0002p7-RG
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 22:21:35 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1703c2c-c403-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 23:21:25 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso24600025e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 14:21:25 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42c9628ebacsm15223789f8f.30.2025.11.17.14.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 14:21:24 -0800 (PST)
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
X-Inumbo-ID: c1703c2c-c403-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1763418085; x=1764022885; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Oyky22DR2eOVRpdxtWGlLFx/KrwmQftfBci2BIb+7E=;
        b=hR3VCmkN8PPMazI78aaEG2OjdrUO4IhJQJiC4ibrQFCgleH/1y+tq5aUvtcKU98T6o
         pDV8p3kIXa/IlwraktA6gX/6MPC9ev2mL4Yy1gnFijqrwF8YaxEVdVMpyvda6HJuABxC
         58/NzLYTqcGlHBdSXPHppWyp92190lyw2HA00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763418085; x=1764022885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Oyky22DR2eOVRpdxtWGlLFx/KrwmQftfBci2BIb+7E=;
        b=MXgPKo0ZZHOn6rZdw8QS+ONQ1KEjtvnhQ2i/JJsz97x91VD3nmYG4rmNHutNx9uiV9
         wHxxD4ZhXyCLA4FytxU6+oBPMoD8lCEiZxDZgvWvlGsVE12oy1jzID+HJ+wxYMmnqRIJ
         YeTw9Ykru1PaJC+W16zKJB4wIOTFbC7lZUY5+e+7ZedLgrb9W9KZKx0Mih2PhWlo1oU8
         scoggRRV4PHEZdUqEa6EufMy0NYncsSCJnZUOQnJB2dkbMS0TBxHE+l6DrOnpJTJ9wpY
         8tICfCsTLqg6WGP+1j6LG4O0t6hg87stz/jGTnAxbn8jwfp/xhxMkRVv4gxMnEbMB04L
         KIkQ==
X-Gm-Message-State: AOJu0Yz9IjiGco7N3xocd21WgiNw1msH9Kih0sdjeUhlSDsWQYKOALHi
	uHh9CHIc33TiWR6SG4Zgvtkthk0QDzDR96UnpjVxZstgB7dlw9RNYgCktXX31yip++Oe/WEsP2s
	EnSt3uR8=
X-Gm-Gg: ASbGncvRgXfWSBsd88LKr/9bHk4FREcCWlEicFIxUwMypOWtzbtjtR1RhY8GOfie6jQ
	5LOAzFlYzzmyUjmkC5/CmUbbF1qtP5MTPqKyNfHSjPeQB1KiV2iC+IuEsLgLIZgPTxSQrLJobKp
	34wjL1v2inJNqIOXibaGMuXO6RiVH5Ma2YcK4t0io3l4UadeqCwln2B2itwWoYUh30cIvM/1PjP
	t5cCkt3HshwY20u3bzqJri/t4pBsfoMz0XCN5OzTXwnbfSm1yDhh+xK7ClU0UPGqSZDDgWpF0sk
	QwT3qdijNkyjuE7UpW6aTEgrich29KdkP560+mKe+tjx2s8k09CEY31IOeUGTG6Tg16P6USnbT1
	7X8Az0WxISLxLLuCkP5lGdXX3qK2/KgscBSWcotN3AA5ixwEKQj+Fd0GzFtIUL2Nxu9yBSvHr1e
	rlnnbsorzsBKIyJ5/u+hSmBsvYkgj3akWOjM/STK3F8lgutbvm1MGgW7ZcYbAqew==
X-Google-Smtp-Source: AGHT+IH5hdJmF4OZUnYXn9fedk7MQhwP9+GLhqI7ZFZ/TxlwYo0avPssMKexuH2SqnbyvjRoD9oU4A==
X-Received: by 2002:a05:600c:8b4b:b0:477:63a4:88fe with SMTP id 5b1f17b1804b1-4778fe50df1mr126864095e9.2.1763418085122;
        Mon, 17 Nov 2025 14:21:25 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/3] x86/ucode: Drop structurally unreachable ASSERT()s
Date: Mon, 17 Nov 2025 22:21:19 +0000
Message-Id: <20251117222120.473451-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251117222120.473451-1-andrew.cooper3@citrix.com>
References: <20251117222120.473451-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's impossible for wait_for_state() to return false when looking for
LOADING_EXIT, so much so that the optimiser can drop the ASSERT()s.

No functional change.

Fixes: 5ed12565aa32 ("microcode: rendezvous CPUs in NMI handler and load ucode")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/core.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index ecee400f28a6..7aaf62839f56 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -320,12 +320,10 @@ static int secondary_thread_fn(void)
     self_nmi();
 
     /*
-     * Wait for ucode loading is done in case that the NMI does not arrive
-     * synchronously, which may lead to a not-yet-updated CPU signature is
-     * copied below.
+     * NMIs may not be delivered synchronously.  Wait for the primary threads
+     * to be done.
      */
-    if ( unlikely(!wait_for_state(LOADING_EXIT)) )
-        ASSERT_UNREACHABLE();
+    wait_for_state(LOADING_EXIT);
 
     /* Copy update revision from the primary thread. */
     this_cpu(cpu_sig).rev =
@@ -345,12 +343,10 @@ static int primary_thread_fn(const struct microcode_patch *patch,
         self_nmi();
 
         /*
-         * Wait for ucode loading is done in case that the NMI does not arrive
-         * synchronously, which may lead to a not-yet-updated error is returned
-         * below.
+         * NMIs may not be delivered synchronously.  Wait for the primary
+         * threads to be done.
          */
-        if ( unlikely(!wait_for_state(LOADING_EXIT)) )
-            ASSERT_UNREACHABLE();
+        wait_for_state(LOADING_EXIT);
 
         return this_cpu(loading_err);
     }
-- 
2.39.5



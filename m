Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1640D7EA0FA
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 17:10:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631765.985455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ZVv-00012A-Br; Mon, 13 Nov 2023 16:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631765.985455; Mon, 13 Nov 2023 16:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ZVv-00010C-8a; Mon, 13 Nov 2023 16:10:15 +0000
Received: by outflank-mailman (input) for mailman id 631765;
 Mon, 13 Nov 2023 16:10:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1x5=G2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r2ZVt-0000kV-Vp
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 16:10:13 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f65707b-823f-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 17:10:11 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4084de32db5so40155835e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 08:10:11 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 fm14-20020a05600c0c0e00b003fee8793911sm8414341wmb.44.2023.11.13.08.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 08:10:10 -0800 (PST)
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
X-Inumbo-ID: 1f65707b-823f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699891811; x=1700496611; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0sqf60uuy6WP/IELnnjhXU0ebHU5JMNByUn7ifmfjM=;
        b=WUv60P9Mhlq8QnBW2c8krP7HicaEFRUR4RUU6dp5sC6oWlCTJbDEm8i6BvvGOL3GNU
         cgRvk+Dxuf+o/f09+xv9SlOrwXP9brw5lbLvpneLJG66Gok6+CFiHtxDJZEwm4saqQgw
         hkO6ro05yVP2y7488NVFK8IN/AKSkpZkVzXJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699891811; x=1700496611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0sqf60uuy6WP/IELnnjhXU0ebHU5JMNByUn7ifmfjM=;
        b=JCHlA7nOx1M58MMqOZtDbAXHTKLXBHktLnVYzrwxzlXaTu28RGIMc9go0YI9jnM21t
         L8XC7w2FVEaD9hu8tquE3V5OzkE484rbhug8GJNbYYX+Ow7zKY5mlVJSyoOgLsgIVZ7P
         3uU7ns//6xaJGIipS8tkvbo8szW2tyLOk0vPcga/KYg8MpEBb2BQmqg045KnYl8l/FRY
         F3Pqy+rjPCde2NVgBtGvruaSfIxN6KVCsw93SC+nDNv7NkkJhcdOwvUEyg4Y7Obw9R1G
         2I3iEtjNQq6iJpBdHns9eWIXv/qbHVdCBXpZ1WADwH4WI6+dVPdnAesWuHo54MhV5e5o
         IBJA==
X-Gm-Message-State: AOJu0YxMIBUS+T0qTp2VR7s6qOGSFgDNnIBstS1Jlzi7T1cLspryy50q
	CZEUi2ya6LmjaFy1t4tEy+AIdt7N5NLGerEo41s=
X-Google-Smtp-Source: AGHT+IHui0DMsxmsXNBSRyttpmsh9c3gUU9wFXhTBpTmUrtGdGW8osDQWsf8XPoPBKkcKemPcMDr1A==
X-Received: by 2002:a05:600c:21c2:b0:40a:463c:1d8c with SMTP id x2-20020a05600c21c200b0040a463c1d8cmr5676064wmj.21.1699891811150;
        Mon, 13 Nov 2023 08:10:11 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 1/2] livepatch-tools: add -largp option when required
Date: Mon, 13 Nov 2023 17:09:39 +0100
Message-ID: <20231113160940.52430-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113160940.52430-1-roger.pau@citrix.com>
References: <20231113160940.52430-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

crate-diff-object makes use of argp library, and depending on the libc
used by the system (ie: musl or BSD libc) argp is a separate library
and requires the addition of -largp to the build rune.

Introduce some shell logic to detect whether -largp is required for
linking create-diff-object.

I haven't done this as a reusable macro because I'm not sure there's
much point in doing so, the only library we need to test for is argp,
anything else is likely to be a mandatory library flag that doesn't
require such testing (like libelf for example).

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index f96b150539d2..2f74c3433336 100644
--- a/Makefile
+++ b/Makefile
@@ -11,6 +11,10 @@ LIBEXECDIR = $(DESTDIR)$(PREFIX)/libexec/livepatch-build-tools
 CFLAGS  += -Iinsn -Wall -g
 LDFLAGS = -lelf
 
+# Non GNU libc systems usually have argp as a standalone library.
+LDFLAGS += $(shell if test -z "`$(CC) -largp 2>&1 | grep '\-largp'`"; \
+                      then echo "-largp"; fi;)
+
 TARGETS = create-diff-object prelink
 CREATE_DIFF_OBJECT_OBJS = create-diff-object.o lookup.o insn/insn.o insn/inat.o common.o
 PRELINK_OBJS = prelink.o lookup.o insn/insn.o insn/inat.o common.o
-- 
2.42.0



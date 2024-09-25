Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAF59855BD
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 10:43:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803574.1214248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNc5-0005jN-5R; Wed, 25 Sep 2024 08:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803574.1214248; Wed, 25 Sep 2024 08:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNc4-0005dS-W3; Wed, 25 Sep 2024 08:43:08 +0000
Received: by outflank-mailman (input) for mailman id 803574;
 Wed, 25 Sep 2024 08:43:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stNc3-0005NX-R3
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 08:43:07 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f257778-7b1a-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 10:43:06 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8a7596b7dfso116107866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 01:43:06 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f54141sm183645366b.83.2024.09.25.01.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 01:43:05 -0700 (PDT)
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
X-Inumbo-ID: 2f257778-7b1a-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727253785; x=1727858585; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnMSClB/JlHEd0hi+6Yy8qVmR2fgY2lFCm5wFEZMF2U=;
        b=Ry1waOanimGHbuARzKfPApeBxAfggLOEPjPPb1d2EsX9fo0UIda61dp/k63/MVcsSN
         aGLHxs4pGdkGX8bgjGyJIHQB+ONFGecH/0VH/nXBtVoL7uJMZMQSavtN01Oer4/wi1kg
         tULrjZrn+b4rxT7ILRMF2ehtIs8QRz0RAbJCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727253785; x=1727858585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnMSClB/JlHEd0hi+6Yy8qVmR2fgY2lFCm5wFEZMF2U=;
        b=AF3y6Z4TpkiG0PwsdZMv7TL0Inl/AVrM2rhnJt/jWB1H3LdEHtEtLC4byqJ2Q0vvhN
         6xlIv9ueOQIdvK2PiIioSYwRgaAouO4NU3xKVffYY6yGZH9PZeX2HSgfFv7xWlX3+7bA
         hvQ/jjXowDxrWMiPj22NyDJZusxWShFuAw27nQIvxh2pJwmpWw2Glyp/cYvI5WbvGe0Y
         u59p8pxDEEhRfiMWPixC4ZiiWOUTrEd1FA+tUiiuAMx/LjbWw2n9X/7Dh5TeO4xLUqqX
         RtQsOpL98FtKJ87uorlv9FVheeLFF60vQcXdyVzF4+ylg7xSdQGgIfAf9syzYzIKf37M
         ypiA==
X-Gm-Message-State: AOJu0Yz8ZBVOak6HvOXlWdyAuy3B7x7GxOb9AhOZeaXWfieQbDXs3Xk8
	Ros2AsmfaJ7tIYByZYTZeTQ3Byf7ZArmYkNMjZ69rtrjT6Iq6PZCzW0WpkjAetg9uoEFCeRNyg/
	q
X-Google-Smtp-Source: AGHT+IHkJDPHmXBuT9psZKCEzzfYDng6uBeOeq+mOZpku0Vg3D7V/SVe9mQu0aXanUQbwH0gbitggg==
X-Received: by 2002:a17:907:6094:b0:a8a:6db7:665d with SMTP id a640c23a62f3a-a93a170470cmr158573766b.17.1727253785521;
        Wed, 25 Sep 2024 01:43:05 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 2/6] xen/livepatch: zero pointer to temporary load buffer
Date: Wed, 25 Sep 2024 10:42:35 +0200
Message-ID: <20240925084239.85649-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240925084239.85649-1-roger.pau@citrix.com>
References: <20240925084239.85649-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The livepatch_elf_sec data field points to the temporary load buffer, it's the
load_addr field that points to the stable loaded section data.  Zero the data
field once load_addr is set, as it would otherwise become a dangling pointer
once the load buffer is freed.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/common/livepatch.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index df41dcce970a..87b3db03e26d 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -383,6 +383,9 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
             }
             else
                 memset(elf->sec[i].load_addr, 0, elf->sec[i].sec->sh_size);
+
+            /* Avoid leaking pointers to temporary load buffers. */
+            elf->sec[i].data = NULL;
         }
     }
 
-- 
2.46.0



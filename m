Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A4BB3A3BA
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:11:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099196.1453181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHf-0002he-Qi; Thu, 28 Aug 2025 15:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099196.1453181; Thu, 28 Aug 2025 15:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHf-0002d6-LV; Thu, 28 Aug 2025 15:11:27 +0000
Received: by outflank-mailman (input) for mailman id 1099196;
 Thu, 28 Aug 2025 15:11:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCe-00035A-Fs
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:06:16 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a9d1b23-8420-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 17:06:14 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3cd59c5a953so693956f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:06:14 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:06:13 -0700 (PDT)
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
X-Inumbo-ID: 8a9d1b23-8420-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393574; x=1756998374; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKqcLDxlG1mGiL4nQNT2c4TkVXSyMWLCBmIFBffr14U=;
        b=IBOAy2llDm3I0eNGNdVzHeuGdaPwKmkze4+GvV28Pu4RDXS7M0OFGJWRWVs8FEbvgQ
         9OiZ1bugIWS+VVpWoTBpDvHl+AC/WdREbOe6SDgS/Ju5aSejEFyjn/yzfbxm5wusCanc
         GbC0Z6vOUThU3Xf3KoonYwrdrf03i2W8T2SbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393574; x=1756998374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKqcLDxlG1mGiL4nQNT2c4TkVXSyMWLCBmIFBffr14U=;
        b=K8+v/E17SfWEe4pTDSdZkBTfabKCydh5cjBo1oP3LKbkgfP6C75UpYof9ium0fDdQS
         Y93+mbozI8bZBe/g58XSoEaNZ72vSCggBOddXvYZ6+YGVTTYJI1yzyn+OhrKTaN5d55u
         R/3LSukJKy6IeCB/5rS41BWKjP35i+Mew6TS3mQlA3ziPcOiO9lDu2GGYnXDk7sDwSh/
         9i/pXqOhVVkouGi2nZJcBwqlpzd27dar16FQt/YLkPYLGqhblUpXPMrx0O3ycQWZUFhi
         6zISkj4An8ZlT1oVZ9yvwGPhlzq/ZeixRU/DGAE1Nr00TGwtL0RoDyX+L2G9v2FGnjsx
         w61Q==
X-Gm-Message-State: AOJu0YyfPFqn0TAir/3lxGYuz/K3bcIOvhCqpsN5qpiT6zItaK21Zb/J
	sqJNrlwnWrZQsM+3rG+xkUFwWsntVOYXn+eJI91LJRDYkk83uBJB75Tw/jeO0Nx8l4RzO0CNvJm
	GUFvx
X-Gm-Gg: ASbGncvxMTrZhECIPUhoA7087BTom4phIb4a5BBitUgZ9x4m4aLPpetA3LAxZhL0cv9
	sgDRri1G9dsY45E8Qcvhr8l+bUvJX/pY+wv3VPZMxrfSEvnRL7YqhXufDJ8rQQZvNbP17iJN9gG
	d9noN7kxqcRV2apiMS+97Cu4n7OYYcOB1jQ/MMsjUwrV7Xi7NvBvkraRs2gzS01xpqkIRP7f/s2
	xRfXwAvwytjJ0vWog/QZiEuYfWK8Tg4Hm49Jhy7x0lOx29muYFZ0eFskjtgFE1uQ/2p7Rk61UeB
	BTcZYp62dvT6YPjZ+pTubRj+43L6Pyro7iEPVxCyFEpVds73d3y+YBRt1VIDJqG5Gpli7tPH8QB
	7H8b25mNojLv7+FLn1mxxYXek83LQkUoQbFk99gRRxsZAy2UaZEV0YRyywqx94v5TxnA1c8mj7x
	KVN3Lu7mylQ38=
X-Google-Smtp-Source: AGHT+IF8N9XSxD0PQESmtZKfFtRr1vtWoJ4TLrpN191W3gdZj8NisuWwnrpE2c7KJGLHlE+VMVGfYQ==
X-Received: by 2002:a5d:5d08:0:b0:3c5:20d3:6041 with SMTP id ffacd0b85a97d-3c5dc54071emr19642035f8f.41.1756393573895;
        Thu, 28 Aug 2025 08:06:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 15/23] x86/pv: Deduplicate is_canonical_address() in do_set_segment_base()
Date: Thu, 28 Aug 2025 16:04:01 +0100
Message-Id: <20250828150409.901315-16-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is really a rearrangement to make adding FRED support easier.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New

There is a marginal code size improvement:

  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-46 (-46)
  Function                                     old     new   delta
  do_set_segment_base                          496     450     -46

but it does get undone by the FRED support.
---
 xen/arch/x86/pv/misc-hypercalls.c | 32 ++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index 7a37f16bf038..4c2abeb4add8 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -176,27 +176,29 @@ long do_set_segment_base(unsigned int which, unsigned long base)
     switch ( which )
     {
     case SEGBASE_FS:
-        if ( is_canonical_address(base) )
-            write_fs_base(base);
-        else
+    case SEGBASE_GS_USER:
+    case SEGBASE_GS_KERNEL:
+        if ( !is_canonical_address(base) )
+        {
             ret = -EINVAL;
-        break;
+            break;
+        }
 
-    case SEGBASE_GS_USER:
-        if ( is_canonical_address(base) )
+        switch ( which )
         {
-            write_gs_shadow(base);
+        case SEGBASE_FS:
+            write_fs_base(base);
+            break;
+
+        case SEGBASE_GS_USER:
             v->arch.pv.gs_base_user = base;
-        }
-        else
-            ret = -EINVAL;
-        break;
+            write_gs_shadow(base);
+            break;
 
-    case SEGBASE_GS_KERNEL:
-        if ( is_canonical_address(base) )
+        case SEGBASE_GS_KERNEL:
             write_gs_base(base);
-        else
-            ret = -EINVAL;
+            break;
+        }
         break;
 
     case SEGBASE_GS_USER_SEL:
-- 
2.39.5



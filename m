Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0539C0592
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 13:21:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831765.1247136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t91Vu-0003WI-LW; Thu, 07 Nov 2024 12:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831765.1247136; Thu, 07 Nov 2024 12:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t91Vu-0003Un-IF; Thu, 07 Nov 2024 12:21:26 +0000
Received: by outflank-mailman (input) for mailman id 831765;
 Thu, 07 Nov 2024 12:21:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cd42=SC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t91Vt-0003Uc-Ik
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 12:21:25 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc80d798-9d02-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 13:21:21 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5cebcf96fabso1057163a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 04:21:21 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b5c91esm727688a12.4.2024.11.07.04.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 04:21:20 -0800 (PST)
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
X-Inumbo-ID: cc80d798-9d02-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmMiLCJoZWxvIjoibWFpbC1lZDEteDUyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNjODBkNzk4LTlkMDItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTgyMDgxLjk3MjE4NSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730982081; x=1731586881; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDbTb7NjSJYn3X1Dh4L5KXZIiaqRtXYAT6o5D6+07ZU=;
        b=agqa3JUTy2fl+mpj6JAbJDy6oCVvngy5hXNVD3oNvvYw0Dj5/T+RoEIu1onw6X2l0N
         XDMfXYgbItG/QgG2u5xA3M9d6bJuT4vbqioXzl/I0Cz0U4yCwUTkdkG/Dw2pE5fTIG2D
         QojCzhveo0ceeSc5D7TIKYOvaO4zH+Sdm8X7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730982081; x=1731586881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDbTb7NjSJYn3X1Dh4L5KXZIiaqRtXYAT6o5D6+07ZU=;
        b=KDlPEuO5NauW9d7pwGLfJ88OOreiFGrZtnVmNeZm4l83EPjOhZjULwAYuVaqw4Vi/Y
         dPuVM0CFzzJVUQMsX1TgKm/dmRrmbOlumLJlVrfB2w5d9WWxgxNFFD8U2+DgBQXteAET
         9vN2GznH0AP3XropOmIWGrdFtJyAbJdigcrg+Oa7KjBHdunalf74mJIG7KjtOktz7r/R
         QQq/xIaqkixLzpBOpL1dx7va5bSoGVmo3U7LCy/ZNBMu/FMpMlpWyI1LdKXaC5PoBoTf
         XJD5H9IB6LeRz1piM13vJ73Qo5NDXFGYTVtjvEDhDNeix1hfhB3MyDhAkLOoN6apzjRF
         K6Iw==
X-Gm-Message-State: AOJu0YwBIf1dX9Ai/7nKcHtrH8poN1I2+wIleBtXYQrPSp3BnvwmKmNk
	q1u5EsvG2Yi8VQL9jKGre0E/JfdRGj+JVJFj6utLxfP8fFMXxKovwB6wF3iIQ5Nrv9yGLh4oTFQ
	N
X-Google-Smtp-Source: AGHT+IGpF/m3x2o12SaRg3fy6eGoryDpECSFOmUQ7NWXQw1gZ34JFuB/Ho2T7Tux41gXWEKqiTfODQ==
X-Received: by 2002:a05:6402:5242:b0:5ce:f7c2:65fe with SMTP id 4fb4d7f45d1cf-5cf05a5976emr1020372a12.28.1730982080836;
        Thu, 07 Nov 2024 04:21:20 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] x86/ucode: Don't use microcode_update_cpu() in early_microcode_load()
Date: Thu,  7 Nov 2024 12:21:15 +0000
Message-Id: <20241107122117.4073266-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241107122117.4073266-1-andrew.cooper3@citrix.com>
References: <20241107122117.4073266-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are two callers of microcode_update_cpu(), and because one passes NULL
and one doesn't, there are effectively two disjoint pieces of logic wrapped in
a single function.

early_microcode_load()'s use skips all the microcode_cache handling, and is
just a simple patch application.

This skips a redundant collect_cpu_info() call (performed in
early_microcode_init(), marginally earlier), and avoids holding
microcode_mutex when we're not interacting with microcode_cache at all.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 11cd878d1f2e..d9406ec3fd34 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -900,7 +900,7 @@ static int __init early_microcode_load(struct boot_info *bi)
      */
     early_mod_idx = idx;
 
-    rc = microcode_update_cpu(patch, 0);
+    rc = ucode_ops.apply_microcode(patch, 0);
 
  unmap:
     bootstrap_unmap();
-- 
2.39.5



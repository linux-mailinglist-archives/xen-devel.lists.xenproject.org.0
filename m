Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 946EFC666D4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 23:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164263.1491278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL7bJ-0002sc-IX; Mon, 17 Nov 2025 22:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164263.1491278; Mon, 17 Nov 2025 22:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL7bJ-0002qv-Eq; Mon, 17 Nov 2025 22:21:33 +0000
Received: by outflank-mailman (input) for mailman id 1164263;
 Mon, 17 Nov 2025 22:21:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FLbM=5Z=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vL7bH-0002p7-BT
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 22:21:31 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0ea62a4-c403-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 23:21:25 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-429c82bf86bso2782635f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 14:21:25 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42c9628ebacsm15223789f8f.30.2025.11.17.14.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 14:21:23 -0800 (PST)
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
X-Inumbo-ID: c0ea62a4-c403-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1763418084; x=1764022884; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nS8Y4MW3jKPXjFOtHxgsnr3CWj4mFip+xBgOcDXCg/w=;
        b=vCNM3mELmO9dkmqS4UklfoWzfr7aU1qefk5gGP0pSJZbt1hbyMcm1KqWEKGc6KovzY
         x2hinKAr0yyh1MzlHUntiFaeCqR/FVLnA8DuKQkPkkp0sqDTGVa3hrKFt3fQE03XMX7R
         YghcsAT3iqDdFExi0PethJvuisTuQwfUf47yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763418084; x=1764022884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nS8Y4MW3jKPXjFOtHxgsnr3CWj4mFip+xBgOcDXCg/w=;
        b=va7q7I9HxsmatfocgUEKFuRfLck6sjCOG7CXwM7JMFUR/Av8Sou4b/OmbeAf1CDA7b
         MFcqhsLY9/dsIVuH16T7QSK3wGUv6gXKRuJxaQvdu0BKWlIM8YxUbex/JXS+0kzAaL21
         7jCCgYZRueSLtailGe/W/APTXRh/whWRk/c82uH0HTKe39ukQtMVrxIyb0svkb/ppCI7
         hEhb4CZm8k6Kty9yiJisInCrg4qo3b29ZPRtMrhQeA2oal+xAgkX0mGOoBhK7Ar1JCHA
         cDcnD5Qx1raq+xZdbD758QKAHiMM4V2ZTndatf0/CrKRkDxHeBrLCYjwBhp0ECyGSAAl
         /LFw==
X-Gm-Message-State: AOJu0Yxa9unlpz24SLHRlSMKQbWZt0ZYU/JSzR9C6FuppfCsioBhLvaI
	TBX04732crKgKoQwdLRcxZ5Ov6erSipt/4Zc24wVhbtjW9SyEEnN8LL4xcNO5ASHVDom+cobdRi
	rG8VIJEc=
X-Gm-Gg: ASbGncuYrGPjbX+mS7mBOJpOA9HMnasxKQwCaskLVv+m+M23I+7H/SGbw9dHR8CAXg6
	khDvIQXjnG9iOtE9iXgjQcq8ShyZq7I7vCJO5DMn6lxhN9XAcvVfx3JuloQMB3G3mV2thFixpPN
	0cINxDczpLo1cbrcwB3YgGptH0+BZKVx59dfSqACGzraqdmSZq8aoRuzDGTCquMC08ZMzq381YC
	j8/p4tM8OB9Aizz/soLB3KG59qIF/qrPzPMzYGZPU686HZPKl+sqnTX8B/YnamDi/vmp4PHO5i0
	ghDOkNzTIdQu9ASEX387sMn0HnaN9TLL18oYTilMmEL4h/TEXGqc3esdGTS5Q/a7fDcsEBmwdNc
	0z6Q0ZkXCNn3oyDv/u8BArLgrOx7lJMUnzz5Y9cA7KmqUDEdVrWqIG8cZKvAhRzVE6ZkNVwnxTs
	m/CzTlAQDFPJRh71e13FlFaU1s6RhYqTvPbVksZyl85odD17Xrkso=
X-Google-Smtp-Source: AGHT+IGKIO4YFmGZgie5fFXUNyXGbFUx6hLPcXshfCgZof896k2szlOzsHZXIZ+ThS69AfHIHp29FQ==
X-Received: by 2002:a05:6000:4284:b0:42b:3cc6:a4d7 with SMTP id ffacd0b85a97d-42b593742f2mr12502867f8f.37.1763418084180;
        Mon, 17 Nov 2025 14:21:24 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] x86/ucode: Fix error handling during parallel ucode load
Date: Mon, 17 Nov 2025 22:21:18 +0000
Message-Id: <20251117222120.473451-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251117222120.473451-1-andrew.cooper3@citrix.com>
References: <20251117222120.473451-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

wait_for_state() returns false on encountering LOADING_EXIT.
control_thread_fn() can move directly to this state in the case of an early
error.  It is not an error condition for APs, but right now the latest write
into stopmachine_data.fn_result wins, causing the real error, -EIO, to get
clobbered with -EBUSY.  e.g.:

  # xen-ucode /lib/firmware/amd-ucode/microcode_amd_fam17h.bin --force
  Failed to update microcode. (err: Device or resource busy)

  (XEN) 256 cores are to update their microcode
  (XEN) microcode: CPU0 update rev 0x830107d to 0x830107c failed, result 0x830107d
  (XEN) Late loading aborted: CPU0 failed to update ucode: -5

Drop all the -EBUSY's, and treat hitting LOADING_EXIT as a success case.  This
causes only a single error to be returned through stop_machine_run().  e.g.:

  # xen-ucode /lib/firmware/amd-ucode/microcode_amd_fam17h.bin --force
  Failed to update microcode. (err: Input/output error)

  (XEN) 256 cores are to update their microcode
  (XEN) microcode: CPU0 update rev 0x830107d to 0x830107c failed, result 0x830107d
  (XEN) Late loading aborted: CPU0 failed to update ucode: -5

Fixes: 5ed12565aa32 ("microcode: rendezvous CPUs in NMI handler and load ucode")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Xen 4.19 and earlier hit this case naturally, without the need of --force.
---
 xen/arch/x86/cpu/microcode/core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 1d1a5aa4b097..ecee400f28a6 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -260,7 +260,9 @@ static int secondary_nmi_work(void)
 {
     cpumask_set_cpu(smp_processor_id(), &cpu_callin_map);
 
-    return wait_for_state(LOADING_EXIT) ? 0 : -EBUSY;
+    wait_for_state(LOADING_EXIT);
+
+    return 0;
 }
 
 static int primary_thread_work(const struct microcode_patch *patch,
@@ -271,7 +273,7 @@ static int primary_thread_work(const struct microcode_patch *patch,
     cpumask_set_cpu(smp_processor_id(), &cpu_callin_map);
 
     if ( !wait_for_state(LOADING_ENTER) )
-        return -EBUSY;
+        return 0;
 
     ret = alternative_call(ucode_ops.apply_microcode, patch, flags);
     if ( !ret )
@@ -313,7 +315,7 @@ static int cf_check microcode_nmi_callback(
 static int secondary_thread_fn(void)
 {
     if ( !wait_for_state(LOADING_CALLIN) )
-        return -EBUSY;
+        return 0;
 
     self_nmi();
 
@@ -336,7 +338,7 @@ static int primary_thread_fn(const struct microcode_patch *patch,
                              unsigned int flags)
 {
     if ( !wait_for_state(LOADING_CALLIN) )
-        return -EBUSY;
+        return 0;
 
     if ( ucode_in_nmi )
     {
-- 
2.39.5



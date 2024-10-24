Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAAD9AE5FA
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 15:22:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825235.1239419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xn6-0004NP-3p; Thu, 24 Oct 2024 13:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825235.1239419; Thu, 24 Oct 2024 13:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xn5-0004KH-Vp; Thu, 24 Oct 2024 13:22:15 +0000
Received: by outflank-mailman (input) for mailman id 825235;
 Thu, 24 Oct 2024 13:22:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd6X=RU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3xn4-0004K5-9X
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 13:22:14 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fad52a42-920a-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 15:22:12 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-539eb97f26aso905363e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 06:22:12 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912ee592sm618574766b.79.2024.10.24.06.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 06:22:10 -0700 (PDT)
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
X-Inumbo-ID: fad52a42-920a-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729776131; x=1730380931; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xI3YWCuDWA5ZJYhHfqCN+eAld5aMRSkjdw5nOvKgkSM=;
        b=CSsiSgPx6hp3rFeqxVWW3bepQruJrVa2TIhNJo+GMDh98eovRg9dFs63O/yh2Cgv+m
         DZgiBxXyZdO1E+0cLujA+jUl+1G98bFdNTsYzjPOEF1gKEtQwppCDwTCQetJEBIuDrOa
         hh8EslyCpsSC2nI1wHyb1mSSu26aiwKnIWBj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729776131; x=1730380931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xI3YWCuDWA5ZJYhHfqCN+eAld5aMRSkjdw5nOvKgkSM=;
        b=upr1ylu1NHsSyVakFoaYzfk+0Ywzs0J0ce3IIuKlfkh3BYI0pJU4kl443yZYUitBJe
         jJOcx3WOMwomju4rvoIYnTt4j0O+OEHcaHbh5Op1i6VdlkkDxxc1+VchzFF9PcIOhP0e
         npF7vKssOk6t5snM6Zu1+Y2sRuyuraR0hM5CvRmyE7FOT/MSX+lUbx1X184YfXMS92fr
         ZWu4qjqG0duFZxb6IctsEOr/XsusPWoLQVPvgRAopwUBl6KZUQ3Y9sVG/fvihnWpjhzc
         UutgmqpAMBvSgvQz2XyOt+906KTCcpBH7wawd9LRWqbLt0P4If4SCpEm3/jyfGP+WShY
         7dKg==
X-Gm-Message-State: AOJu0Yw2Lj8nAXa0XB+2s+K3pkFokZdrqGAu12h/m/pQmbZmMHN7OVHK
	QJxlN7bDmMAHz8Fd+fMWJlKN8+WS02+de4+8mNXHlG1CkeBzdppLMJALKyvUtgL1gXA4MnyCMwG
	q
X-Google-Smtp-Source: AGHT+IGMqcL+fx6Snhrn5yxbpjO1LwkkVZDl2+dmTre9UqLBmLZFLFZuDvVKXxiaFY5tSmBazckizw==
X-Received: by 2002:a05:6512:b02:b0:539:e3d8:fa33 with SMTP id 2adb3069b0e04-53b1a38d08cmr3893206e87.54.1729776131251;
        Thu, 24 Oct 2024 06:22:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/5] x86/ucode: Rename hypercall-context functions
Date: Thu, 24 Oct 2024 14:22:01 +0100
Message-Id: <20241024132205.987042-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241024132205.987042-1-andrew.cooper3@citrix.com>
References: <20241024132205.987042-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

microcode_update{,_helper}() are overly generic names in a file that has
multiple update routines and helper functions contexts.

Rename microcode_update() to ucode_update_hcall() so it explicitly identifies
itself as hypercall context, and rename microcode_update_helper() to
ucode_update_hcall_cont() to make it clear it is in continuation context.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/core.c    | 10 +++++-----
 xen/arch/x86/include/asm/microcode.h |  4 ++--
 xen/arch/x86/platform_hypercall.c    |  6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 1d58cb0f3bc1..21077b449c38 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -586,7 +586,7 @@ struct ucode_buf {
     char buffer[];
 };
 
-static long cf_check microcode_update_helper(void *data)
+static long cf_check ucode_update_hcall_cont(void *data)
 {
     int ret;
     struct ucode_buf *buffer = data;
@@ -722,8 +722,8 @@ static long cf_check microcode_update_helper(void *data)
     return ret;
 }
 
-int microcode_update(XEN_GUEST_HANDLE(const_void) buf,
-                     unsigned long len, unsigned int flags)
+int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) buf,
+                       unsigned long len, unsigned int flags)
 {
     int ret;
     struct ucode_buf *buffer;
@@ -748,11 +748,11 @@ int microcode_update(XEN_GUEST_HANDLE(const_void) buf,
     buffer->flags = flags;
 
     /*
-     * Always queue microcode_update_helper() on CPU0.  Most of the logic
+     * Always queue ucode_update_hcall_cont() on CPU0.  Most of the logic
      * won't care, but the update of the Raw CPU policy wants to (re)run on
      * the BSP.
      */
-    return continue_hypercall_on_cpu(0, microcode_update_helper, buffer);
+    return continue_hypercall_on_cpu(0, ucode_update_hcall_cont, buffer);
 }
 
 static int __init cf_check microcode_init(void)
diff --git a/xen/arch/x86/include/asm/microcode.h b/xen/arch/x86/include/asm/microcode.h
index a278773f8b5d..dd20cdb9ebb6 100644
--- a/xen/arch/x86/include/asm/microcode.h
+++ b/xen/arch/x86/include/asm/microcode.h
@@ -22,8 +22,8 @@ struct cpu_signature {
 DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
 
 void microcode_set_module(unsigned int idx);
-int microcode_update(XEN_GUEST_HANDLE(const_void) buf,
-                     unsigned long len, unsigned int flags);
+int ucode_update_hcall(XEN_GUEST_HANDLE(const_void) buf,
+                       unsigned long len, unsigned int flags);
 int microcode_update_one(void);
 
 struct boot_info;
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 67f851237def..90abd3197fc9 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -313,7 +313,7 @@ ret_t do_platform_op(
 
         guest_from_compat_handle(data, op->u.microcode.data);
 
-        ret = microcode_update(data, op->u.microcode.length, 0);
+        ret = ucode_update_hcall(data, op->u.microcode.length, 0);
         break;
     }
 
@@ -323,8 +323,8 @@ ret_t do_platform_op(
 
         guest_from_compat_handle(data, op->u.microcode2.data);
 
-        ret = microcode_update(data, op->u.microcode2.length,
-                               op->u.microcode2.flags);
+        ret = ucode_update_hcall(data, op->u.microcode2.length,
+                                 op->u.microcode2.flags);
         break;
     }
 
-- 
2.39.5



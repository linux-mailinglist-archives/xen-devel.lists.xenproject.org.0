Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1451960CC1
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 15:58:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784072.1193475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwhs-00052M-8u; Tue, 27 Aug 2024 13:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784072.1193475; Tue, 27 Aug 2024 13:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwhs-0004wO-3i; Tue, 27 Aug 2024 13:58:00 +0000
Received: by outflank-mailman (input) for mailman id 784072;
 Tue, 27 Aug 2024 13:57:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovuO=P2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1siwhq-0003sI-6S
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 13:57:58 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ca9fc5d-647c-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 15:57:56 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so493904266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 06:57:56 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e588adf2sm113898966b.173.2024.08.27.06.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 06:57:54 -0700 (PDT)
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
X-Inumbo-ID: 5ca9fc5d-647c-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724767076; x=1725371876; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGUfx2q1+jWgi8jP5MwYlvDEDt5Tq995qxqKh3B4e+k=;
        b=DHLiiCoBRMXFoVCaBxdOlLd8jCuJ7jxvy1jvJg81HN0sZuf1lwh7cRYKOm2Y2IfXAO
         dUtgyBfBI+GPZkmb6+NpJNk+pOa256bpX+2tAVipjjk2fFL+UCyRVh9tX2WS235UYPDm
         vUVD3Zbn4gT4YUA4EHC/yGqik3u4RFZPc1bSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724767076; x=1725371876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGUfx2q1+jWgi8jP5MwYlvDEDt5Tq995qxqKh3B4e+k=;
        b=ZBsXRgC7NTkQqkwIToFL/xtBLTfT6/33hwP7+7HzyxV0o5xHAWacl+kLStVHkizGDq
         M9JIiHy3lmLiBksNwYgsmnqDQy+jRWgT9NRHn84Qk9YYZZI7YJamEVmCMVWbN11+M/+o
         dwb0fRun+u0igKtay51RPCI6IdQLWo2QqxfkDTMovl2uY3EEExpWqTJ+HfaRD8AjHQbn
         kanAhLeKVBPwTy3lJmsrilb30ldbk+8zYHQVhpC6EedLtUGbdWvj0yIQyjkvjNE7Pic6
         PEmuUuDBXDw3DF1vmxeHCVvrGfzF4YQOiPD4I4v6rBAoZwRA7qAl/SJ0DQcSCtU8QtOz
         rGPw==
X-Gm-Message-State: AOJu0Yz6HxO13k8do/s9Jn1kOEIV1dHXr7LYeMYlCtcgPveJLglF5aRf
	tQXhYLO/QN05ayschIp6z8qQGEu7N2BAkkxHtY+OJvoT9vrVkPN68+niO9GN5kO/sydnm7qQQwn
	a
X-Google-Smtp-Source: AGHT+IF+lE+VmLKB8gnLP/DI0Jsj0j8worRIiuKlHU8MrF0gDq9Q5hJgWjAvzf9gxSKUf9uxlYP8Dw==
X-Received: by 2002:a17:907:7e9a:b0:a86:a4b1:d2c0 with SMTP id a640c23a62f3a-a86a54b8ce4mr1167977166b.53.1724767075121;
        Tue, 27 Aug 2024 06:57:55 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/4] x86/hvm: Rework hpet_write() for improved code generation
Date: Tue, 27 Aug 2024 14:57:45 +0100
Message-Id: <20240827135746.1908070-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
References: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In the HPET_STATUS handling, the use of __clear_bit(i, &new_val) is the only
thing causing it to be spilled to the stack.  Furthemore we only care about
the bottom 3 bits, so rewrite it to be a plain for loop.

For the {start,stop}_timer variables, these are spilled to the stack despite
the __{set,clear}_bit() calls.  Again we only care about the bottom 3 bits, so
shrink the variables from long to int.  Use for_each_set_bit() rather than
opencoding it at the end which amongst other things means the loop predicate
is no longer forced to the stack by the loop body.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

All in all, it's modest according to bloat-o-meter:

  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-29 (-29)
  Function                                     old     new   delta
  hpet_write                                  2225    2196     -29

but we have shrunk the stack frame by 8 bytes; 0x28 as opposed to 0x30 before.
---
 xen/arch/x86/hvm/hpet.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index 87642575f9cd..e3981d5e467c 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -349,8 +349,7 @@ static int cf_check hpet_write(
     unsigned int tn, i;
 
     /* Acculumate a bit mask of timers whos state is changed by this write. */
-    unsigned long start_timers = 0;
-    unsigned long stop_timers  = 0;
+    unsigned int start_timers = 0, stop_timers = 0;
 #define set_stop_timer(n)    (__set_bit((n), &stop_timers))
 #define set_start_timer(n)   (__set_bit((n), &start_timers))
 #define set_restart_timer(n) (set_stop_timer(n),set_start_timer(n))
@@ -405,16 +404,12 @@ static int cf_check hpet_write(
 
     case HPET_STATUS:
         /* write 1 to clear. */
-        while ( new_val )
+        for ( i = 0; i < HPET_TIMER_NUM; i++ )
         {
-            bool active;
-
-            i = ffsl(new_val) - 1;
-            if ( i >= HPET_TIMER_NUM )
-                break;
-            __clear_bit(i, &new_val);
-            active = __test_and_clear_bit(i, &h->hpet.isr);
-            if ( active )
+            if ( !(new_val & (1U << i)) )
+                continue;
+
+            if ( __test_and_clear_bit(i, &h->hpet.isr) )
             {
                 hvm_ioapic_deassert(v->domain, timer_int_route(h, i));
                 if ( hpet_enabled(h) && timer_enabled(h, i) &&
@@ -533,19 +528,11 @@ static int cf_check hpet_write(
     }
 
     /* stop/start timers whos state was changed by this write. */
-    while (stop_timers)
-    {
-        i = ffsl(stop_timers) - 1;
-        __clear_bit(i, &stop_timers);
+    for_each_set_bit ( i, stop_timers )
         hpet_stop_timer(h, i, guest_time);
-    }
 
-    while (start_timers)
-    {
-        i = ffsl(start_timers) - 1;
-        __clear_bit(i, &start_timers);
+    for_each_set_bit ( i, start_timers )
         hpet_set_timer(h, i, guest_time);
-    }
 
 #undef set_stop_timer
 #undef set_start_timer
-- 
2.39.2



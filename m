Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BEA9C919B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 19:23:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836762.1252650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBeU9-0005qy-UU; Thu, 14 Nov 2024 18:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836762.1252650; Thu, 14 Nov 2024 18:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBeU9-0005oI-RX; Thu, 14 Nov 2024 18:22:29 +0000
Received: by outflank-mailman (input) for mailman id 836762;
 Thu, 14 Nov 2024 18:22:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3TDs=SJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBeU9-0005oC-38
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 18:22:29 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64bbd4e1-a2b5-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 19:22:23 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso9676961fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 10:22:23 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79c1de36sm796650a12.84.2024.11.14.10.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 10:22:21 -0800 (PST)
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
X-Inumbo-ID: 64bbd4e1-a2b5-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmUiLCJoZWxvIjoibWFpbC1sajEteDIyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY0YmJkNGUxLWEyYjUtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjA4NTQzLjY4NjkzMiwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731608542; x=1732213342; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FKxjklqWasJ4RWLvYPjj9yS4LbXJP7EHAG4iJ3xZMaE=;
        b=kBXiI2sL7PctiNs55eBeP3WN9BJMpKKhbgX9YRTUXinLGLRZbVsmQya5LwfYT9zmEs
         vFrKIoUcibq+PziguLWmHV3FgsAKJH/NBzUsGf7quXmIe6Y5NVhk5CBo8yteh7Ki4BSd
         5YS648gpJIKhiOkz+CW1elow+Z+2uNcDbiGgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731608542; x=1732213342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKxjklqWasJ4RWLvYPjj9yS4LbXJP7EHAG4iJ3xZMaE=;
        b=lAJMzbBXK8xUFht3WsFiqPP/5eaJ4fwwHJRDAwl1rtNo72zIC4YMR5w71eXdb8toYl
         +FH52LGMm8SfxZUg+D7Y6l+WC7CroVUGVul7GzA449g/0g6BqUXTTlFzAMgb1ghbRVmy
         LOHPE5emaF8vEBAofP0W+HiEeWpfHaWaJsSOX0RGJM/SxBm5loXFaI3TijfQOC5qhxNL
         Q7inhZl/4WM8hQcx3XHCIBEDJZnA90pK4gOVyj+q06g77Xd7A8NYasi2tmtZ87kPQhjX
         ngLEbx8+Z4ygn+9XwncHgaky9aAhO6Ji99a/GSkEHLICq+NqclPzlW52e9KGn6asn2ra
         6X+g==
X-Gm-Message-State: AOJu0YxpxGi4xFeVTzX7hrWBMwdzyDuFBGbCFDz0JNGz+huy7N+5Ov4j
	wC/tJUyyVn2ZfX4KZiNNxuW3zF2oGbc31hU11xwW28nimt47euLIt5VJAonpErC1DlZ63HJcbZN
	C
X-Google-Smtp-Source: AGHT+IH9UV3RMNcDMjY6M6SjjTvsFO3vB/l5a77HKYmSIhq17yGOsmqpdhEv5INu5LAslAquAAqjrg==
X-Received: by 2002:a05:651c:905:b0:2fb:4abb:7001 with SMTP id 38308e7fff4ca-2ff60650b4fmr729501fa.2.1731608542509;
        Thu, 14 Nov 2024 10:22:22 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH] x86/boot: Fix comment about setting up the real mode stack
Date: Thu, 14 Nov 2024 18:22:19 +0000
Message-Id: <20241114182219.1983073-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It may have taken a while, but it occurs to me that the mentioned commit fixed
a second problem too.

On entering trampoline_boot_cpu_entry(), %esp points at the trampoline stack,
but in a 32bit flat segment.  It happens to be page aligned.

When dropping into 16bit mode, the stack segment operates on %sp, preserving
the upper bits.  Prior to 1ed76797439e, the top nibble of %sp would depend on
where the trampoline was placed in low memory, and only had a 1/16 chance of
being 0 and therefore operating on the intended stack.

There was a 15/16 chance of using a different page in the trampoline as if it
were the stack.  Therefore, zeroing %esp was correct, but for more reasons
than realised at the time.

Update the comment to explain why zeroing %esp is correct in all cases.  Move
it marginally earlier to when a 16bit stack segment is first loaded.

Fixes: 1ed76797439e ("x86/boot: fix BIOS memory corruption on certain IBM systems")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/boot/trampoline.S | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index 924bda37c1b7..f5a1d61280c5 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -176,6 +176,12 @@ trampoline_boot_cpu_entry:
         mov     %eax,%gs
         mov     %eax,%ss
 
+        /*
+         * The stack is at trampoline_phys + 64k, which for a 16bit stack
+         * segment wants %sp starting at 0.
+         */
+        xor     %esp, %esp
+
         /* Switch to pseudo-rm CS, enter real mode, and flush insn queue. */
         mov     %cr0,%eax
         dec     %eax
@@ -190,8 +196,6 @@ trampoline_boot_cpu_entry:
         mov     %ax,%es
         mov     %ax,%ss
 
-        /* Initialise stack pointer and IDT, and enable irqs. */
-        xor     %esp,%esp
         lidt    bootsym(rm_idt)
         sti
 

base-commit: 41c80496084aa3601230e01c3bc579a0a6d8359a
prerequisite-patch-id: 6eb3b54ccd19effe3a89768e0ec5c7a2496a233a
prerequisite-patch-id: b9c480479c1f4021e9c3fe659811e28bf88f6eca
prerequisite-patch-id: 68f0d0fff4312fb059861efddbef95ddf4635b0e
prerequisite-patch-id: 66902cf11d58181ff63b8ee4efb4078df5828490
-- 
2.39.5



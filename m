Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id O8c+OXCyGWrsyQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:36:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1EF604DAF
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322630.1588963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSzFp-0005LL-FP; Fri, 29 May 2026 15:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322630.1588963; Fri, 29 May 2026 15:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSzFp-0005IP-Bu; Fri, 29 May 2026 15:36:09 +0000
Received: by outflank-mailman (input) for mailman id 1322630;
 Fri, 29 May 2026 15:36:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wSzFn-000528-J1
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:36:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSzFm-002zYi-W5
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:36:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a19b25d-2eae-0a2a0a5409dd-0a2a4507bef8-18
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:36:06 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a19b262-229c-0a2a45070019-d155dd31ac4e-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:36:03 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-45ef6565cfdso145168f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:36:03 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34b834esm4196196f8f.11.2026.05.29.08.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 08:36:01 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780068962; x=1780673762; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hg/OjpvMkex/VsN4w/g7ONkFyHjBg9XMQ+S/ZB+OhsE=;
        b=W3ml5erUf2gRuY9MbN1QYL2WFx5eEHS57lG8d7jTE4PYy8QGsUzPKe0k91Vjw1Bcm7
         V74JRbZgxhjK+9OP7c5SVRl80RXH3PusIvNvfqKg8RfGTqz0popi4gbDhCFJLSaUIWMn
         hsUTyL4kW/deRWqMcmbZ5E9b9DNRbaSrmxp5L2pUef9bUsofmUdScggC0ro5QRsUWbnM
         GZVVx1dWVBJjhBn6PEfbyPJrA7hiqii71TJfrq75rEZ1iCAE5d/SapF6KZtrI43HGCZk
         PcehbWILnCH8YxJVXtzhzQYUKUUJcUCtpU66s7c9gmIsldyzyFrFH7Q90AXTpKIpKB74
         fiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780068962; x=1780673762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hg/OjpvMkex/VsN4w/g7ONkFyHjBg9XMQ+S/ZB+OhsE=;
        b=JMA016Fy3nz76OWFNs0v2AMeURNQHwyFHBWmGPnhEPKHiGDBNytWSMgQedgcJyO1Na
         clmQm9lKFt1fGjxrPkOTWizX2Bd5I3odvQM8VRK4IDw2ELGIUb81yHukuLBjIGHxXEgZ
         zcKoT0GldTalN0mNsRL7QmaEdYey67TxBu/l+4GwP9I+FGLHjTd+Y1TIBJZmUm74RmzA
         RpF9lSxWfJ/wbaVjBUbTJVKXPoapsD+UBmKRHKArWRnpM2Esa8G6rttuokAnqRf3z+T1
         uDAKTMKJ3yoEzODBP75IaaZD3oMygH5z4OX5aPF0mQyI9T1eIJIjDrWmSGC/xcHkt/1S
         T0Rg==
X-Gm-Message-State: AOJu0YxytOujly3QJPqxF9vfZjqxWv55HYhd+wmowT2V3xV5Rm6La0Sk
	hFiRe4grXnY3QK7PMCnx1FkZWW0tMItcDpbFKqkqd8/kJcHmr+HcPOQm/c0dtrz+
X-Gm-Gg: Acq92OGxNx5Oz2E9+cmFOttui8Jn3+4KArsN7mbCOSY5lrRMJPi8r9HVf5616+whaL7
	dwpvu+cC6H8bxT+UPj30GjV6adon5K8yGWlI8WXzyZusk6tNVEHDpN+rwOxUztv/Y8jZxCi4sGF
	p+vUm4i9QwplmpcdDVHpO3I0FtRmkOrqcutuIA2uxkyEHxI12MG33q7X7KFlLnyb3AUbpcspZ5+
	9dmP1ZqiGf0lUx4DhM+/6Bv+3g6ET/05ZvEuUKW2HILdFwvdd/ASxL/HccRBFaa/2Ya23ghb+vl
	zl8mPybS6dpiiFY4JzILDSiJIpOJxkKuLkOQpSinRY5r7RF2ZRWNtk9ItzBRzmXoF00E6eS3EBK
	sdwvyPC329Px934kpc0Ws9IZTDvbXJJQ6r4awSNkNjc2M2FN1ZxD7sSTplAyBOx8usQDioixa29
	KSBimtwNCEXbdG71DWaw+jpv5zKmxstB9iiRSngSTEkYBtvhmXLEXY+wj3kQm43lEHl3q2EiDWq
	AjgfIaD4TiNLBRTA/9DCtTLo0evA0mLaxDu
X-Received: by 2002:a5d:634a:0:b0:43c:fdd:ea96 with SMTP id ffacd0b85a97d-45ef6b5e032mr387230f8f.26.1780068962441;
        Fri, 29 May 2026 08:36:02 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 4/6] x86/efi: discard multiboot related entry code for PE binary
Date: Fri, 29 May 2026 16:35:29 +0100
Message-ID: <20260529153531.1341542-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1780068963-0956BC48-80DAF02E/0/0
X-purgate-type: clean
X-purgate-size: 1711
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,cloud.com:mid,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DF1EF604DAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Roger Pau Monné <roger.pau@citrix.com>

The multiboot and PVH entry points are not used in the PE binary, hence
discard them in the linker script when doing a PE build.

That removes some relocations that otherwise appear due to the entry point
code in head.S not being position independent.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/boot/head.S | 3 ++-
 xen/arch/x86/xen.lds.S   | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 77bb7a9e21..90faf411b9 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -152,7 +152,7 @@ vga_text_buffer:
 efi_platform:
         .byte   0
 
-        .section .init.text, "ax", @progbits
+        .section .init.multiboot, "ax", @progbits
 
 early_error: /* Here to improve the disassembly. */
 
@@ -710,6 +710,7 @@ trampoline_setup:
         /* Jump into the relocated trampoline. */
         lret
 
+        .section .init.text, "ax", @progbits
 ENTRY(trampoline_start)
 #include "trampoline.S"
 ENTRY(trampoline_end)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 907f826ae0..a5a85e9b8a 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -59,6 +59,7 @@ SECTIONS
   . = __image_base__;
   /DISCARD/ : {
     *(.text.header)
+    *(.init.multiboot)
   }
 #endif
 
@@ -200,6 +201,7 @@ SECTIONS
        _sinittext = .;
        *(.init.text)
        *(.text.startup)
+       *(.init.multiboot)
        _einittext = .;
        /*
         * Here are the replacement instructions. The linker sticks them
-- 
2.43.0



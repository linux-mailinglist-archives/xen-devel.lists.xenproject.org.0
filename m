Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C92EA77BBA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934115.1335955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbMU-0001JM-0o; Tue, 01 Apr 2025 13:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934115.1335955; Tue, 01 Apr 2025 13:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbMT-0001Do-Sf; Tue, 01 Apr 2025 13:09:01 +0000
Received: by outflank-mailman (input) for mailman id 934115;
 Tue, 01 Apr 2025 13:09:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oF/L=WT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tzbMT-0008KU-0K
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:09:01 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a42de4d-0efa-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 15:09:00 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac2a089fbbdso991083966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 06:09:00 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac71961f9b9sm761161266b.114.2025.04.01.06.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 06:08:59 -0700 (PDT)
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
X-Inumbo-ID: 7a42de4d-0efa-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743512940; x=1744117740; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPf0H0iWY3C1zaNGO1+8PzDu8ltCUQ9Xi40SfByzm4E=;
        b=K8UwQuVbMzyrzUXvk2qATMdJKPjMEWnpIfMw67Xnr+gmVqQYDulAd1LCY39VZfQbNx
         yuIela0a++A9gmIrfNFb7cyK+Th1NaoqVtoRO9nfE8fLYtgrOkJh4nkUVmdY/WONkhj6
         3s80bTl517LlLwGTvzozHo9MpmAdV6W4otF0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512940; x=1744117740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPf0H0iWY3C1zaNGO1+8PzDu8ltCUQ9Xi40SfByzm4E=;
        b=a27K0dLBHNtozf7oyLJjotsUyu6LFwZMgXCYE1Qh7/XGmAuEUZGFFdCNIoPVPI9+8o
         U2AD3wzBFl/BELrrvlDapOhvUdvhAYIJburuRDdMdlQ4rxjWcye8l3Yll8ej79jwiGOg
         eFbg+A3mgtJTTuLPpsy0LIqmv/g0FMaKOWv8dXZ8rZSxbIPQfgqBjHVkcfdQHPLPZpS1
         BwDkiJWLRA00EUUFuwy5iYYn3+9pRXLwcK+XKoqNTUEV1tkHUY9Tgt2B6+Y5mKx2CgR1
         Wos4/7MpqzkCD/pXuKr+nFAw0GiHr3CIVcFEQ+W12uHRx/HgfFz5AF5BeHRp5VSEDICQ
         3zxQ==
X-Gm-Message-State: AOJu0YwULyxcufj97cjfrcnpCfCgXE2uCpTVsIWt7xZZH/BsAJDMl0f3
	AFdijWPJWbDPV8A3ZeCjQi88A/z7QtL7HWF9BegAuGhOILLTC9Y4hFl1NAWP2nohwTwiL99yZys
	2
X-Gm-Gg: ASbGnctUAr79TCkHC4H5yHX7DFVpY3w0GgT/5tHrk+1dF+ewgkteC0XD8GBoERoAip8
	VYawBmohJ3ODrvJ1htdCuLzwtPQymNH3Pvc2S8M+5F3B1O5HI2bhGhrsV4z8eS0ITW+BcUENNbJ
	hRCprbrK6EOgVANnhbR0LJMJz3XJ5pyAdP/RJtGfrq9nxMkxpmsh2/LhKVCXHcsNgyve2fELsE6
	ZtpNjADJvXJlOR81H+rhO4GmIYvhSTTG0bDl5oUz78LhNwcQ1uufh9ofpZ9xA11OwEAOxQQFY9g
	LDmEqeUYUtfEju655bysTNR4NZDuKV9kL4HEYiW6OXPf8bum1g==
X-Google-Smtp-Source: AGHT+IHY/qPLexqKDJxO4g24fcXOb0HmgauV7SPAPnQfLmH6qR3xT3USyAbirTGkx2VpSSrw64zi3w==
X-Received: by 2002:a17:907:1c97:b0:ac6:e42a:fb4c with SMTP id a640c23a62f3a-ac71ec04f5cmr1466839766b.9.1743512939707;
        Tue, 01 Apr 2025 06:08:59 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 07/11] x86/efi: discard multiboot related entry code for PE binary
Date: Tue,  1 Apr 2025 15:08:36 +0200
Message-ID: <20250401130840.72119-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401130840.72119-1-roger.pau@citrix.com>
References: <20250401130840.72119-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The multiboot and PVH entry points are not used in the PE binary, hence
discard them in the linker script when doing a PE build.

That removes some relocations that otherwise appear due to the entry point
code in head.S not being position independent.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
We could also place the entry points in it's own isolated section and skip
such section for relocations generation in mkreloc, but it seems best to
just remove the code if it's unused.
---
 xen/arch/x86/boot/head.S | 3 ++-
 xen/arch/x86/xen.lds.S   | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 81473578fe84..774894954e44 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -151,7 +151,7 @@ vga_text_buffer:
 efi_platform:
         .byte   0
 
-        .section .init.text, "ax", @progbits
+        .section .init.multiboot, "ax", @progbits
 
 early_error: /* Here to improve the disassembly. */
 
@@ -709,6 +709,7 @@ trampoline_setup:
         /* Jump into the relocated trampoline. */
         lret
 
+        .section .init.text, "ax", @progbits
 ENTRY(trampoline_start)
 #include "trampoline.S"
 ENTRY(trampoline_end)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index ad908539f38a..1191bf4e2ddd 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -63,6 +63,7 @@ SECTIONS
   . = __image_base__;
   /DISCARD/ : {
     *(.text.header)
+    *(.init.multiboot)
   }
 #endif
 
@@ -208,6 +209,7 @@ SECTIONS
        _sinittext = .;
        *(.init.text)
        *(.text.startup)
+       *(.init.multiboot)
        _einittext = .;
        /*
         * Here are the replacement instructions. The linker sticks them
-- 
2.48.1



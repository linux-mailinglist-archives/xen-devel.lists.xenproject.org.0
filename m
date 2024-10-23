Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9EE9AC85E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 12:58:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824524.1238668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Z43-0000Ut-V7; Wed, 23 Oct 2024 10:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824524.1238668; Wed, 23 Oct 2024 10:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Z43-0000RQ-QE; Wed, 23 Oct 2024 10:58:07 +0000
Received: by outflank-mailman (input) for mailman id 824524;
 Wed, 23 Oct 2024 10:58:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jJ8W=RT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3Z42-0000Ow-Np
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 10:58:06 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ada6390a-912d-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 12:58:04 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c9552d02e6so8441646a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 03:58:04 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91571e3asm462067266b.147.2024.10.23.03.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 03:58:02 -0700 (PDT)
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
X-Inumbo-ID: ada6390a-912d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729681083; x=1730285883; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PiZxguWTJ+3SGGRPO/U42i+dgE2giroEnnA16gZDT+E=;
        b=s4OgVZ/jlkzgse03D5AIgVo0muFxwE5V9Bm/sWLzl8UW5er4HgVbaJdPBkwj+B8meS
         y77qFkzbP6GEMpISWzzZT5yi7EtCWouPdXhvLIjVeoSs+zTu8a0w0tOVzD2Df8Igaz4p
         OGxr50OpH0Fr+qSz+6HWN7bkIX+TiwVGB51RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729681083; x=1730285883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PiZxguWTJ+3SGGRPO/U42i+dgE2giroEnnA16gZDT+E=;
        b=pT0x9BQPEFlFLmgm1X426/GexA5yCG9GOr8HQgiL89RSajQ6AY0eBdgoPA3aJRBV6C
         A+VETYmmBwEtHbdGVl+AWPTu8DtJPxbFVVekjZAhakNXyqhA/X37nIZY5ZUL/QlG7Eor
         AIbsyWewa0Fz/0I9KJOhPKYB86w7TEaAnmxBNd7jfXhU1DnY6CRSAU+YO6yGlHpdjiEA
         OfLQ97Ag9tloRQam3mzS1TgcCDzR3qcygSCkb8RVDwXEm41VkuLdQaIpqvDvFYD1w+lj
         vjF9ZWVugu7WERHm1dzzpMKOaxC85aDN3d0I4/Hd7IwJPteDcUdZREezpMfEGsstUkMs
         IopQ==
X-Gm-Message-State: AOJu0YzYIRSuiFuNw/pB9ZZMaS0xenti2mOtcBtJeZm0t352HjNGGLyZ
	4MOa/hFKA3Nnk3DCLhYLvoJJShxODM+GcLdIOl1YNRpzoHHLM7uL3Z0vceBwzuI+riO7buLMIPV
	n
X-Google-Smtp-Source: AGHT+IFIsPAa9xnQjyqUO5z1QLm+iAT23rgeuuNu8jOjdEAWIoFppgJ0o4PiStlDqAVfIkqcIX3EZA==
X-Received: by 2002:a17:907:9811:b0:a99:eb94:3e37 with SMTP id a640c23a62f3a-a9abf964492mr168095366b.58.1729681083050;
        Wed, 23 Oct 2024 03:58:03 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 1/3] x86/boot: Add a temporary module_map pointer to boot_image
Date: Wed, 23 Oct 2024 11:57:54 +0100
Message-Id: <20241023105756.641695-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241023105756.641695-1-andrew.cooper3@citrix.com>
References: <20241023105756.641695-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... in order to untangle parameter handling independently from other other
logic changes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 1 +
 xen/arch/x86/setup.c                | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index ffa443406747..6237da7e4d86 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -31,6 +31,7 @@ struct boot_info {
     size_t memmap_length;
 
     unsigned int nr_modules;
+    unsigned long *module_map; /* Temporary */
     struct boot_module mods[MAX_NR_BOOTMODS + 1];
 };
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c5b37bd2112e..d8001867c925 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1086,6 +1086,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     }
 
     bi = multiboot_fill_boot_info(mbi, mod);
+    bi->module_map = module_map; /* Temporary */
 
     /* Parse the command-line options. */
     if ( (kextra = strstr(bi->cmdline, " -- ")) != NULL )
-- 
2.39.5



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824818B3967
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 16:02:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712822.1113693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0M97-0000DU-OX; Fri, 26 Apr 2024 14:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712822.1113693; Fri, 26 Apr 2024 14:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0M97-00005H-II; Fri, 26 Apr 2024 14:01:49 +0000
Received: by outflank-mailman (input) for mailman id 712822;
 Fri, 26 Apr 2024 14:01:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LIFE=L7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s0M96-0008CS-Gg
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 14:01:48 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84ef6a17-03d5-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 16:01:46 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a5883518135so255336966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 07:01:46 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 cd9-20020a170906b34900b00a5264576138sm10646714ejb.35.2024.04.26.07.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 07:01:45 -0700 (PDT)
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
X-Inumbo-ID: 84ef6a17-03d5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714140106; x=1714744906; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeM/RCPSV+ID4MLdicSmYmkIWjkyBfbsjTrcmvtyVG4=;
        b=OZ4lOPhN3yh5GHIYkiK6Y69+hb2BKrIPvXPoVsbCPtYBY9XQj3Y5cH52UFB5WWbZhq
         g/p27HExZbFEgZuF0oDzswg6cJZqOrUQvP0P66EFvneqiUSrlo87OgzPO/LF3shPx7SY
         9mPw3rvy9hCuYh2JEnUrsrppbd4YWIZYYZoCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714140106; x=1714744906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xeM/RCPSV+ID4MLdicSmYmkIWjkyBfbsjTrcmvtyVG4=;
        b=c94Hpaw303vhxPXvYCJX05NuYjq7nU40XcLBq/nhCAikuEZBjFmxqe7fvEmaxJ29Jh
         eSa8CLqg0YAukzdvQBrVW6yydZqjz0HGfOkZzpCtveEeQg73wXR5FhrWdxHzcQCANHGB
         j8jxBCqeN/1wrKfWqQB7/D7JCyBCgs48ag5bDW/xMEH1v5H3pUABbSTCoDkYHBMdDXuF
         4lXKdqdKXvAdgtpdBUIJbyJ/K2O3q5BywMq6tA5QyIctyRQ1qW4qPhagDw2NIBmIeTq4
         ldGHL6FNvomKS3uCcfkBU8NO0gSP2yhE+oT+Pcdo07vQrP008fxFHVGYZSxTJAmfzVpk
         FgrQ==
X-Gm-Message-State: AOJu0Yy21GO2QqBNhst5u1ikkLtMmbX3tlj3PFKRY+nv3BOh2JCXLzgi
	qOJdvam9/bc4C8G98CD0ZhneLumYaG6d/347tz5eREVMc8EhNt3ESmH78KPglytBbBEcC/6FbnQ
	n
X-Google-Smtp-Source: AGHT+IHXYzsYv7isaIpXd/H2FGGVqrIpSvN9UrZRbkeAhfvNg0Rod0Zj+Jbpr22V3Soh08zCR09Cng==
X-Received: by 2002:a17:906:f748:b0:a55:b021:c0b1 with SMTP id jp8-20020a170906f74800b00a55b021c0b1mr2631322ejb.9.1714140105903;
        Fri, 26 Apr 2024 07:01:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 3/3] x86/boot: Refactor pvh_load_kernel() to have an initrd_len local
Date: Fri, 26 Apr 2024 15:01:40 +0100
Message-Id: <20240426140140.465506-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240426140140.465506-1-andrew.cooper3@citrix.com>
References: <20240426140140.465506-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The expression get more complicated when ->mod_end isn't being abused as a
size field.  Introduce and use a initrd_len local variable.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Daniel Smith <dpsmith@apertussolutions.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>
---
 xen/arch/x86/hvm/dom0_build.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index ac71d43a6b3f..b0cb96c3bc76 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -650,6 +650,7 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
 {
     void *image_start = image_base + image_headroom;
     unsigned long image_len = image->mod_end;
+    unsigned long initrd_len = initrd ? initrd->mod_end : 0;
     struct elf_binary elf;
     struct elf_dom_parms parms;
     paddr_t last_addr;
@@ -710,7 +711,7 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
      * simplify it.
      */
     last_addr = find_memory(d, &elf, sizeof(start_info) +
-                            (initrd ? ROUNDUP(initrd->mod_end, PAGE_SIZE) +
+                            (initrd ? ROUNDUP(initrd_len, PAGE_SIZE) +
                                       sizeof(mod)
                                     : 0) +
                             (cmdline ? ROUNDUP(strlen(cmdline) + 1,
@@ -725,7 +726,7 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
     if ( initrd != NULL )
     {
         rc = hvm_copy_to_guest_phys(last_addr, mfn_to_virt(initrd->mod_start),
-                                    initrd->mod_end, v);
+                                    initrd_len, v);
         if ( rc )
         {
             printk("Unable to copy initrd to guest\n");
@@ -733,8 +734,8 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
         }
 
         mod.paddr = last_addr;
-        mod.size = initrd->mod_end;
-        last_addr += ROUNDUP(initrd->mod_end, elf_64bit(&elf) ? 8 : 4);
+        mod.size = initrd_len;
+        last_addr += ROUNDUP(initrd_len, elf_64bit(&elf) ? 8 : 4);
         if ( initrd->string )
         {
             char *str = __va(initrd->string);
-- 
2.30.2



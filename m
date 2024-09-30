Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E172F98A99B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 18:19:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807552.1219106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svJ6k-0001ez-1G; Mon, 30 Sep 2024 16:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807552.1219106; Mon, 30 Sep 2024 16:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svJ6j-0001c3-UF; Mon, 30 Sep 2024 16:18:45 +0000
Received: by outflank-mailman (input) for mailman id 807552;
 Mon, 30 Sep 2024 16:18:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Bw3=Q4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1svJ6i-00019g-6r
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 16:18:44 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9412057-7f47-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 18:18:43 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2fac6b3c220so16923361fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 09:18:43 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2776d83sm550760366b.43.2024.09.30.09.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 09:18:40 -0700 (PDT)
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
X-Inumbo-ID: a9412057-7f47-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727713122; x=1728317922; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XvczQYxmpdcGE+M38uBRSt699wzNn8bkg2MtX8Hvg4=;
        b=aninZlTvy47wiHsA4B81wJyLCoO+Z0xxSGvWy9dv+hcvuqdKKYS30JFocrKe8EXGqW
         YQp18bwkeooJygefxvtv4+rtIIHZAXonPjlPQhw211ivfULc2W5Kt8/bDiOZX1uIuqK6
         GlZkcZQuABHG+MPUOvy7q3CaoliCF/gI2TKac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727713122; x=1728317922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XvczQYxmpdcGE+M38uBRSt699wzNn8bkg2MtX8Hvg4=;
        b=JnsKanjOYf8jLq3pqWhpiqL0h13ANJ1jRArWMqBirq6uHvlHQrT7/nuh2zAOiPuzY0
         zkbhj2LId69WDM/OABY5zawJ1G/yrpGJiv2MFKfTJJ/8HBGuAc7B8E/eRUkTI0+wM0Yj
         dXkAIDNPDgsoTkLP02KvCZxwz2A2xjuNjPgM4tuhHoCfs1CAxHcXlr+RN7JOnl710S/U
         R9K+Fj8YGOQkaHmaW0qim2vkVjvrhWL8U1zyii6i4tOFergUy+HQ4dCGjbJinsVp3Wja
         0BCGhBQG9yNDVsxl3pXi9nzkS7qYxS3Mdr7LrOUOq0s9/o9qIjdG8xhoVQlLy+RmvkD1
         985w==
X-Gm-Message-State: AOJu0Yze74nRig3K6CtcYLXxNu+0bCt2VcFF3fcJsiD95fa92xYx9Ye5
	TH0vHjxVuG8b4eSt+Rh/W1wWTb92Qd0e7M/QeTpRb87YcU4O4FHNjUdQotTkSr6Fx7y4/vXD8Vu
	zA4Y=
X-Google-Smtp-Source: AGHT+IHnDeu5tUI/rEWPnJa+PJrqcJutctAaKn1KNG+qCw1NteztUZnhVaOlAbbH0gZaRyVjXWhflQ==
X-Received: by 2002:a2e:a990:0:b0:2fa:cfba:fb7f with SMTP id 38308e7fff4ca-2facfbafe44mr28805361fa.40.1727713122128;
        Mon, 30 Sep 2024 09:18:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/2] x86/pv: Handle #PF correctly when reading the IO permission bitmap
Date: Mon, 30 Sep 2024 17:18:37 +0100
Message-Id: <20240930161837.1248144-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240930161837.1248144-1-andrew.cooper3@citrix.com>
References: <20240930161837.1248144-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The switch statement in guest_io_okay() is a very expensive way of
pre-initialising x with ~0, and performing a partial read into it.

However, the logic isn't correct either.

In a real TSS, the CPU always reads two bytes (like here), and any TSS limit
violation turns silently into no-access.  But, in-limit accesses trigger #PF
as usual.  AMD document this property explicitly, and while Intel don't (so
far as I can tell), they do behave consistently with AMD.

Switch from __copy_from_guest_offset() to __copy_from_guest_pv(), like
everything else in this file.  This removes code generation setting up
copy_from_user_hvm() (in the likely path even), and safety LFENCEs from
evaluate_nospec().

Change the logic to raise #PF if __copy_from_guest_pv() fails, rather than
disallowing the IO port access.  This brings the behaviour better in line with
normal x86.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

RFC: Should we make the boundary check be (port + bytes + 8)?  That would be
more correct, but liable to break unsuspecting VMs.  Maybe we should just
comment our way out of it.

This needs to be combined with Jan's "x86/PV: simplify (and thus correct)
guest accessor functions" to function completely correctly.  From XTF testing:

This series on its own:

  --- Xen Test Framework ---
  Environment: PV 64bit (Long mode 4 levels)
  Test pv-emul-cr2
  Error: %cr2 expected 0x3000, got 0x2fff
  Test result: ERROR

This series plus Jan's fix:

  --- Xen Test Framework ---
  Environment: PV 64bit (Long mode 4 levels)
  Test pv-emul-cr2
  Test result: SUCCESS

Interestingly, the test also does an `INW` without an output parameter
straddling that page boundary, and it does reliably get 0x3000 even without
the accessor fix.
---
 xen/arch/x86/pv/emul-priv-op.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 978bd6c0775f..b5d184038fa3 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -169,29 +169,26 @@ static int guest_io_okay(unsigned int port, unsigned int bytes,
 
     if ( (port + bytes) <= v->arch.pv.iobmp_limit )
     {
-        union { uint8_t bytes[2]; uint16_t mask; } x;
+        const void *__user addr = v->arch.pv.iobmp.p + (port >> 3);
+        uint16_t mask;
+        int rc;
 
-        /*
-         * Grab permission bytes from guest space. Inaccessible bytes are
-         * read as 0xff (no access allowed).
-         */
+        /* Grab permission bytes from guest space. */
         if ( user_mode )
             toggle_guest_pt(v);
 
-        switch ( __copy_from_guest_offset(x.bytes, v->arch.pv.iobmp,
-                                          port>>3, 2) )
-        {
-        default: x.bytes[0] = ~0;
-            /* fallthrough */
-        case 1:  x.bytes[1] = ~0;
-            /* fallthrough */
-        case 0:  break;
-        }
+        rc = __copy_from_guest_pv(&mask, addr, 2);
 
         if ( user_mode )
             toggle_guest_pt(v);
 
-        if ( (x.mask & (((1 << bytes) - 1) << (port & 7))) == 0 )
+        if ( rc )
+        {
+            x86_emul_pagefault(0, (unsigned long)addr + bytes - rc, ctxt);
+            return X86EMUL_EXCEPTION;
+        }
+
+        if ( (mask & (((1 << bytes) - 1) << (port & 7))) == 0 )
             return X86EMUL_OKAY;
     }
 
-- 
2.39.5



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C50D198D144
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 12:31:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808696.1220686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svwdH-0002bh-8J; Wed, 02 Oct 2024 10:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808696.1220686; Wed, 02 Oct 2024 10:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svwdH-0002ZD-5k; Wed, 02 Oct 2024 10:30:59 +0000
Received: by outflank-mailman (input) for mailman id 808696;
 Wed, 02 Oct 2024 10:30:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VgkK=Q6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1svwdF-0002Z7-KL
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 10:30:57 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 685baa3b-80a9-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 12:30:56 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c896b9b4e0so4829332a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 03:30:56 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2945f2esm840491666b.117.2024.10.02.03.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 03:30:54 -0700 (PDT)
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
X-Inumbo-ID: 685baa3b-80a9-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727865055; x=1728469855; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5wGju39Hmhcid0JvQ/mxq0sNrfsihG52p86ltXcpmmE=;
        b=cOjJrCg3ACN4/Bo0I7i8stYbe+Lotov1QjKNlhknQf7CXFLlMWhEMmGGFNifSPL6gm
         iNn642zNoBiUn4LZ0Mgv0mO+MCkxKQvITgpECLTvYsdVCzOxrskwPEdaAc9Zygao1Niv
         TZQiyYcIXQqX9IxHgDnB7McrT5rudoJmFEClg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727865055; x=1728469855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5wGju39Hmhcid0JvQ/mxq0sNrfsihG52p86ltXcpmmE=;
        b=wNupMz3JfR6HtCWQa07PAQS7dE7O28bvOpSoxv6gfBRN1Lh+QbAJUvmn/1ZUpIhYVJ
         K2gLC/e3ER4+m75zjbTPVuRYPwiytBUWPh2v/DYYKkW/f7uM1IKotKp5wFcKUke2XU8p
         58xf7MHtkvzx3g+M9UHIgEgTj/XrPnGwdI1tzbsJP5hPJ1pbRqSOrWCNZDcaq7dVYfum
         OsST2rpKoLgDh7afRrl0q9A/7z6Pe6eUoDpoYG26wKw03BY9v65FpYGOH5QwocFpJy3X
         QPOrjniB9+/hxAx4bcpu/2bCgb5sxfo4eyCq8ONaYO+NYvbLstfpoyokKnp/xarPR88w
         DoRQ==
X-Gm-Message-State: AOJu0Yx6p5ErM/VjImfxsWX1u9lf7XbWpYer/hDXMbigNKkCEUqFHSld
	SZTwqYVCrsYezAdrM+1r2QYmGCZ47LKTOClNvZ7eqB+onY8Mz83pLgDuZS0/n12y8FVEUfNztqx
	fgPo=
X-Google-Smtp-Source: AGHT+IFSYEW9xCt3tR2WKTM4I5ZMGDYARk/8qxPUmTem2hQOOjjnA+ooG1GRWuwe9193xsaYEt0O4g==
X-Received: by 2002:a17:906:4fd0:b0:a90:c710:6f3c with SMTP id a640c23a62f3a-a98f824e957mr275880766b.19.1727865055324;
        Wed, 02 Oct 2024 03:30:55 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/kexec: Separate code and data by at least 1 cacheline
Date: Wed,  2 Oct 2024 11:30:52 +0100
Message-Id: <20241002103052.1797237-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No functional change, but it performs a bit better.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Rebase over metadata changes.
---
 xen/arch/x86/x86_64/kexec_reloc.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index 9f40c80d7c4b..50ba454abd48 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -19,6 +19,7 @@
 #include <xen/kimage.h>
 
 #include <asm/asm_defns.h>
+#include <asm/cache.h>
 #include <asm/msr-index.h>
 #include <asm/page.h>
 #include <asm/machine_kexec.h>
@@ -174,6 +175,9 @@ FUNC_LOCAL(compatibility_mode)
         ud2
 END(compatibility_mode)
 
+        /* Separate code and data into into different cache lines */
+        .balign L1_CACHE_BYTES
+
 DATA_LOCAL(compat_mode_gdt_desc, 4)
         .word .Lcompat_mode_gdt_end - compat_mode_gdt -1
         .quad 0x0000000000000000     /* set in call_32_bit above */
-- 
2.39.5



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2579EA67B11
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 18:36:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919630.1324058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuarm-00084q-Hk; Tue, 18 Mar 2025 17:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919630.1324058; Tue, 18 Mar 2025 17:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuarm-00082f-Ez; Tue, 18 Mar 2025 17:36:38 +0000
Received: by outflank-mailman (input) for mailman id 919630;
 Tue, 18 Mar 2025 17:36:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuark-0005mN-Ni
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 17:36:36 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 895a62eb-041f-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 18:36:35 +0100 (CET)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-300fefb8e06so6558622a91.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 10:36:35 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-301539ed283sm9468305a91.18.2025.03.18.10.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 10:36:32 -0700 (PDT)
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
X-Inumbo-ID: 895a62eb-041f-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742319393; x=1742924193; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnnJ3xUa+7L049ca6Sahnid1TE+CyJxFQ59zdbyMZxw=;
        b=rR5ke08HrJUomu+ykVjM3XBi134zBON6pTB6xFHqVztC4+k0vkyqggVJiQSpYGtoFW
         C/xuS75g564zJrZBkZdDPehwLpXxlz8ejXaxMV9GS42i5V4/+zhT8VnIGWTVulWwrcer
         xe+uOM6LiiDUzbtpay2Lfak2fD0TNqaOTSqtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742319393; x=1742924193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnnJ3xUa+7L049ca6Sahnid1TE+CyJxFQ59zdbyMZxw=;
        b=gQvr/i2eV3PV9YdBtWZA683lYJLkLd+UE3DsVKISw4yKIaNtKYPqWscw/y66O3q1Et
         fB5Lme5C8/UgGTy3QEq4KdPOqDwVY29bRHvWNWfebWs9r1kYIleRM05fGZgocWv63tXq
         w8sIb13T/Nf/kpaEtTBDS9GRvR4jAoWbt9yol/U1hqIG/gUW+ZogWH4FWIqY/rpcFMC+
         UbK3LnNXGXyBNd89HeMfFT54kwcpzDH3Ydf6WOMUUfvYRfppVhG6mheTQQ+zZzuQTXzj
         rh4Np88RtoC7y+G/QPbbIag3veNW1clw9CIHaHJn7dOg4F03ZMHBnmHqrOLdYVzLx5/H
         dJ5g==
X-Gm-Message-State: AOJu0YxeCFiLje3GBIf7Os5ltmpQcXTZL8yR02o7l4tCHPjIgj8rjFw6
	DoSJdrNssWR97H3UUm6+HLaQ1XhAhf6DpQpznwX+z9QE0tY/eALugG35VcYSCfwtlKqTYreVVdP
	d
X-Gm-Gg: ASbGncutSNfk5f8RtuUfv62rhvQ4J3ZJNoE3e3W3vk4B7AZ7YGPJEubZEbIBgnRCTmD
	vOGNYsVEzqOqBY1GUToMY3FwnKcR7aaTTvSpS/uUwXEZ38RUSizYD04Cd82ZO+tKT+dEH/RgNVD
	DTSfRu/l7+zsF/u/SOvCLo9yA0aIJ/z5romwzpdeZQxXoN7Dke9+KPqbDeVyjqqNPsKmhVvm5Hr
	OgHcth1arjACYxnUoLrkG9Kgg7evMa8qfRs6cdovjvKy8aa7DbMccLtT2jS7xiOf1qNSpWe1krR
	0trQ2wRjuPyaaTHfJxscQpdM29sZOjAYp7s7FWR4N7kGxXfLVg==
X-Google-Smtp-Source: AGHT+IFXq7LlHxnBn4TlEJLayGWBPmrkETzsLxszrzf6fvzFGAVESafuRGRJtglAaac4Evwz9sRLMg==
X-Received: by 2002:a17:90a:ec90:b0:2ee:d371:3227 with SMTP id 98e67ed59e1d1-301a5b1cf96mr4723168a91.17.1742319393308;
        Tue, 18 Mar 2025 10:36:33 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 6/7] x86/efi: do not merge all .init sections
Date: Tue, 18 Mar 2025 18:35:46 +0100
Message-ID: <20250318173547.59475-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318173547.59475-1-roger.pau@citrix.com>
References: <20250318173547.59475-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As a result of relocations now being applied after the trampoline has been
copied into the low 1MB region, there's no need for a single .init section
that's writable, as .init.text is no longer modified.

Remove the bodge and fallback to the layout used by ELF images with an
.init.text and .init.data section.

The resulting PE sections are:

Sections:
Idx Name          Size      VMA               LMA               File off  Algn
  0 .text         0019072c  ffff82d040200000  ffff82d040200000  00000440  2**4
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .rodata       000884c8  ffff82d040400000  ffff82d040400000  00190b80  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  2 .buildid      00000035  ffff82d0404884c8  ffff82d0404884c8  00219060  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .init.text    00052866  ffff82d040600000  ffff82d040600000  002190a0  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  4 .init.data    00059730  ffff82d040658000  ffff82d040658000  0026b920  2**2
                  CONTENTS, ALLOC, LOAD, DATA
[...]

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/xen.lds.S | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index d4dd6434c466..5ab37cefa25a 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -197,11 +197,7 @@ SECTIONS
   __2M_init_start = .;         /* Start of 2M superpages, mapped RWX (boot only). */
   . = ALIGN(PAGE_SIZE);             /* Init code and data */
   __init_begin = .;
-#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
-  DECL_SECTION(.init) {
-#else
   DECL_SECTION(.init.text) {
-#endif
        _sinittext = .;
        *(.init.text)
        *(.text.startup)
@@ -213,12 +209,8 @@ SECTIONS
         */
        *(.altinstr_replacement)
 
-#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
-       . = ALIGN(SMP_CACHE_BYTES);
-#else
   } PHDR(text)
   DECL_SECTION(.init.data) {
-#endif
        *(.init.bss.stack_aligned)
 
        . = ALIGN(POINTER_ALIGN);
-- 
2.48.1



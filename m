Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218AB8D52AE
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 21:53:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733042.1139157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sClpW-0005IO-36; Thu, 30 May 2024 19:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733042.1139157; Thu, 30 May 2024 19:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sClpV-0005G4-Vq; Thu, 30 May 2024 19:52:53 +0000
Received: by outflank-mailman (input) for mailman id 733042;
 Thu, 30 May 2024 19:52:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8pxM=NB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sClpU-0005Fw-7M
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 19:52:52 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3253247d-1ebe-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 21:52:51 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a59a352bbd9so204601966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 12:52:51 -0700 (PDT)
Received: from [10.125.231.30] ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31bb842asm153358a12.36.2024.05.30.12.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 12:52:50 -0700 (PDT)
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
X-Inumbo-ID: 3253247d-1ebe-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717098771; x=1717703571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=66sYQHl4BCSEPgMTbi+xgnu8w6fvK5zkPBldVjlOX6M=;
        b=ghWLoeKcqWURWfHiMdYyWuyn8NXPFqIBocHvb+0b9Q1pe8xIxaF+K2CoMbIQJGTtv/
         bd+2nRwLZLaCSB9MrYB+YqSTG/NujDDBKtXRLZXv8A+L1CEdiTic4zaeWED7FRpRJZoD
         AfgOwHNOZuWiZVIysg0SinOhFgE66vP1EDDF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717098771; x=1717703571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66sYQHl4BCSEPgMTbi+xgnu8w6fvK5zkPBldVjlOX6M=;
        b=Scndn+bsTwO81oTOZe2DhviRWQEcn3V/IXWLB2JGMYLr7FIJw2xdgvRR5yW93Gs7fm
         r7/7u9wnKG1B+Z2dIYekNWWMQPWSiYEW0JyXa+lHp+V3UNW9fKYf0AOpor91w956jJpq
         /tCdq14oJWA8Q29UZdhdZrAkbU0ZK/U/PrY1Yw35+ly+pj4Wofj+QA+VZKcinKnuJgmX
         5OIHH1PU9NYfJUo/uwkHcr3zLAj1XOe9jiJKnsth3CcH728k8HpMw9ywrNb22Q1ivjsd
         Boq3Y84IiHvUbP6R4yETXuwf/QpceSAY4Jz6QaS5G+rBeyGtcbmFLZcq7HP/U9aia6kV
         XPYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqzmMun2+lRH+8J0WwH0D1Wx2/zV9wNVqiLAPQd9Nfv5NKjIQlP3HQCIXMMWxPipmUZ0nlFiBTTs2Enwx3PP+76yo1KqA5S6Yev1xmBFQ=
X-Gm-Message-State: AOJu0YzlIhGSCzTeGd+tzEZkKp6IHqBchbPM1L6iVn3UHdDnb6BpdTIt
	+BzP1Xgcn1IGPRdGTNzKOoRLjG71t5DFZbWRKFtqouy75KtcK+jkTtC3OjVgBpI=
X-Google-Smtp-Source: AGHT+IGgkzz7Rx7rkwy6I6mOUC3zd9eHKsyLg3uCoIC8shlqg6maXpZBnBdS+omtHnnbC462p/zuxQ==
X-Received: by 2002:a17:906:c2d8:b0:a59:bf27:5f2e with SMTP id a640c23a62f3a-a65f0a56cb7mr192344466b.20.1717098770602;
        Thu, 30 May 2024 12:52:50 -0700 (PDT)
Message-ID: <d4e5b4c8-d494-440b-8970-488b49bee12e@citrix.com>
Date: Thu, 30 May 2024 20:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 8/8] xen/README: add compiler and binutils versions
 for RISC-V64
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
 <c6ff49af9a107965f8121862e6b32c24548956e6.1717008161.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c6ff49af9a107965f8121862e6b32c24548956e6.1717008161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
> diff --git a/README b/README
> index c8a108449e..30da5ff9c0 100644
> --- a/README
> +++ b/README
> @@ -48,6 +48,10 @@ provided by your OS distributor:
>        - For ARM 64-bit:
>          - GCC 5.1 or later
>          - GNU Binutils 2.24 or later
> +      - For RISC-V 64-bit:
> +        - GCC 12.2 or later
> +        - GNU Binutils 2.39 or later

I would like to petition for GCC 10 and Binutils 2.35.

These are the versions provided as cross-compilers by Debian, and
therefore are the versions I would prefer to do smoke testing with.

One issue is in cpu_relax(), needing this diff to fix:

diff --git a/xen/arch/riscv/include/asm/processor.h
b/xen/arch/riscv/include/asm/processor.h
index 6846151717f7..830a05dd8e3a 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -67,7 +67,7 @@ static inline void cpu_relax(void)
     __asm__ __volatile__ ( "pause" );
 #else
     /* Encoding of the pause instruction */
-    __asm__ __volatile__ ( ".insn 0x0100000F" );
+    __asm__ __volatile__ ( ".4byte 0x0100000F" );
 #endif
 
     barrier();

The .insn directive appears to check that the byte pattern is a known
extension, where .4byte doesn't.  AFAICT, this makes .insn pretty
useless for what I'd expect is it's main purpose...


The other problem is a real issue in cmpxchg.h, already committed to
staging (51dabd6312c).

RISC-V does a conditional toolchain for the Zbb extension
(xen/arch/riscv/rules.mk), but unconditionally uses the ANDN instruction
in emulate_xchg_1_2().

Nevertheless, this is also quite easy to fix:

diff --git a/xen/arch/riscv/include/asm/cmpxchg.h
b/xen/arch/riscv/include/asm/cmpxchg.h
index d5e678c03678..12ecb0950701 100644
--- a/xen/arch/riscv/include/asm/cmpxchg.h
+++ b/xen/arch/riscv/include/asm/cmpxchg.h
@@ -18,6 +18,20 @@
         : "r" (new) \
         : "memory" );
 
+/*
+ * Binutils < 2.37 doesn't understand ANDN.  If the toolchain is too
old, form
+ * it of a NOT+AND pair
+ */
+#ifdef __riscv_zbb
+#define ANDN_INSN(rd, rs1, rs2)                 \
+    "andn " rd ", " rs1 ", " rs2 "\n"
+#else
+#define ANDN_INSN(rd, rs1, rs2)                 \
+    "not " rd ", " rs2 "\n"                     \
+    "and " rd ", " rs1 ", " rd "\n"
+#endif
+
+
 /*
  * For LR and SC, the A extension requires that the address held in rs1 be
  * naturally aligned to the size of the operand (i.e., eight-byte aligned
@@ -48,7 +62,7 @@
     \
     asm volatile ( \
         "0: lr.w" lr_sfx " %[old], %[ptr_]\n" \
-        "   andn  %[scratch], %[old], %[mask]\n" \
+        ANDN_INSN("%[scratch]", "%[old]", "%[mask]") \
         "   or   %[scratch], %[scratch], %z[new_]\n" \
         "   sc.w" sc_sfx " %[scratch], %[scratch], %[ptr_]\n" \
         "   bnez %[scratch], 0b\n" \



And with that, everything builds... but doesn't link.  I've got this:

  LDS     arch/riscv/xen.lds
riscv64-linux-gnu-ld      -T arch/riscv/xen.lds -N prelink.o \
    ./common/symbols-dummy.o -o ./.xen-syms.0
riscv64-linux-gnu-ld: prelink.o: in function `keyhandler_crash_action':
/local/xen.git/xen/common/keyhandler.c:552: undefined reference to
`guest_physmap_remove_page'
riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol
`guest_physmap_remove_page' isn't defined
riscv64-linux-gnu-ld: final link failed: bad value

which is completely bizarre.

keyhandler_crash_action() has no actual reference to
guest_physmap_remove_page(), and keyhandler.o has no such relocation.

I'm still investigating this one.

~Andrew


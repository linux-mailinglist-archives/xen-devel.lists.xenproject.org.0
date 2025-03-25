Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF69FA70989
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 19:52:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926936.1329759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx9Ny-0000uR-7d; Tue, 25 Mar 2025 18:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926936.1329759; Tue, 25 Mar 2025 18:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx9Ny-0000sz-4L; Tue, 25 Mar 2025 18:52:26 +0000
Received: by outflank-mailman (input) for mailman id 926936;
 Tue, 25 Mar 2025 18:52:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+BiV=WM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tx9Nw-0000s8-Cl
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 18:52:24 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49868b4f-09aa-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 19:52:23 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43948021a45so52365875e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 11:52:23 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f43e50sm206824065e9.12.2025.03.25.11.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 11:52:21 -0700 (PDT)
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
X-Inumbo-ID: 49868b4f-09aa-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742928742; x=1743533542; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SsmRaKPEIATAjGQw1ayk5oTYnpRRR/3cnZRb904ZOsc=;
        b=AtzybXMTXKh32/3CmtkvfOajX6++0rIfScPt22lR0etaj/vjtwWId97TtWvunTMkHE
         rJLTFLsMZCqh2WGBJOD9XKZSt0X36EdQsz7t+JIGs49xWQ0wqEbm6moLPlq/LFIITFSZ
         6297HsTNN10jEM057Y2wUC6d0CwN7XBDcXsqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742928742; x=1743533542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SsmRaKPEIATAjGQw1ayk5oTYnpRRR/3cnZRb904ZOsc=;
        b=fzYs7xv9W0/OwOL60V4rW1ocD8e6VzlBZMz7ISKjXJqYKkcU+Oixar4DcaQ57699Ly
         ljtIP7nw9QrOdqKD06HvNtWyxPSNIg/+2WHoLBgK83vQUCFdWQrs/5BYcAX5hxnxSm70
         UvUH/zRWkBDlKIjxxCJGs+RmkMVdgKrvQj9VMJGdbPVxqYvkcnzeYif3DnYpweEfGy+8
         Htv3po02zWl4DX7Tg/6k/++DBCRSWFPjHoRGO5WLyCZrBbTfdqiBtqIPDr0uLJd5g5K+
         a14c29grTb6JwofeBZCcNo9yCILOotiFtdViZdnYMjeusD68CgcW9+7qpBTR/B0miI8Y
         l3Lw==
X-Gm-Message-State: AOJu0YxyZ2qCFiDhl7v0mNHQN9O4f/yTssuhB595qMif+aHr4J1zUUKM
	dq+MYJDDfP/MTbZ7YuuFmhg+JAwMyRYCRejXnmneXSwYaIlTiy/enK58gwf2cKaqjoCewVwCuvH
	wj5k=
X-Gm-Gg: ASbGncuvNsv+GP1xq33CnoxV9FCNHpgdkWJ2TqLj7JvQxHD0VQoQcDpBdUze25gn/IQ
	sg6BTbS6MAW9Qfk1bkHicwlqAGEknLYPSMf339PBGgRr1+A+W1/bi0T4vZAT6oQJ1s6foeg3d0X
	8fCkx99dIdpfoKGaGKMwFjEvpOzik/S158kD15IoEit7uI9CT2jz2sIw3bLgGS7dRrEqyv7FmLA
	ReKVL7Ot5U8vRuQtVcAXOSptpSUJH8lwtQcautcEtBnvQR3q07L45eG9/W65AVTyTJlSD/5U/ME
	WDEo5bKfU0aXclIg2AufYhQfgJm86y12ByusrSY/MmK7/3QoWS17jMog7ql0rozL0bUdZ2Nn15g
	XGRZaRIlAnqzwTutEbA==
X-Google-Smtp-Source: AGHT+IG3neElunJ2uTnihP6zdGPeb3Vj6lm/jTIIlyVd8l8oBDOr15uQNT0aD5OVLMsQAG3w2OWljg==
X-Received: by 2002:a05:600c:1ca4:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-43d50a3a75bmr187527705e9.30.1742928742254;
        Tue, 25 Mar 2025 11:52:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/bitops: Account for POPCNT errata on earlier Intel CPUs
Date: Tue, 25 Mar 2025 18:52:19 +0000
Message-Id: <20250325185219.315319-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Manually break the false dependency for the benefit of cases such as
bitmap_weight() which is a reasonable hotpath.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Not sure if this warrants a fixes or not, but:

Fixes: 6978602334d9 ("x86/bitops: Use the POPCNT instruction when available")

Many examples online suggest a 2x improvement perf improvement on tight loops
by breaking this dependency.  cpumasks in particular make frequent use of this
loop.

Still TODO:

 1) Put a double CS prefix on the CALL instruction to avoid a trailing 2-byte
    NOP, but this depends on x86_decode_lite() in order to work.

 2) Revert a buggy GAS diagnostic:

    ./arch/x86/include/asm/bitops.h: Assembler messages:
    ./arch/x86/include/asm/bitops.h:493: Error: same type of prefix used twice
    ./arch/x86/include/asm/bitops.h:493: Error: same type of prefix used twice

    Multiple prefixes are not an error, and are sometimes the best choice
    available.

It turns out that LZCNT/TZCNT have the same input dependent bug, prior to
Skylake.  There are no instructions in the "cleaned up" part of bitops yet,
and I don't expect any to survive cleaning.
---
 xen/arch/x86/include/asm/bitops.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index bb9d75646023..87eac7782f10 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -488,10 +488,16 @@ static always_inline unsigned int arch_hweightl(unsigned long x)
      *
      * This limits the POPCNT instruction to using the same ABI as a function
      * call (input in %rdi, output in %eax) but that's fine.
+     *
+     * On Intel CPUs prior to Cannon Lake, the POPCNT instruction has a false
+     * input dependency on it's destination register (errata HSD146, SKL029
+     * amongst others), impacting loops such as bitmap_weight().  Insert an
+     * XOR to manually break the dependency.
      */
     alternative_io("call arch_generic_hweightl",
+                   "xor %k[res], %k[res]\n\t"
                    "popcnt %[val], %q[res]", X86_FEATURE_POPCNT,
-                   ASM_OUTPUT2([res] "=a" (r) ASM_CALL_CONSTRAINT),
+                   ASM_OUTPUT2([res] "=&a" (r) ASM_CALL_CONSTRAINT),
                    [val] "D" (x));
 
     return r;
-- 
2.39.5



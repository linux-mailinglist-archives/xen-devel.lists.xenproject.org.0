Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FF4B1EF6B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075018.1437460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcb-0005zV-94; Fri, 08 Aug 2025 20:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075018.1437460; Fri, 08 Aug 2025 20:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcb-0005wb-4c; Fri, 08 Aug 2025 20:23:25 +0000
Received: by outflank-mailman (input) for mailman id 1075018;
 Fri, 08 Aug 2025 20:23:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTcZ-0005tJ-TR
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:23 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8774018f-7495-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 22:23:22 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45994a72356so19662905e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:22 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:20 -0700 (PDT)
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
X-Inumbo-ID: 8774018f-7495-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684601; x=1755289401; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XPZdbzmMxNNc6YJDmmLb0VrWoSZ8jhqn1MaPLISSgE=;
        b=pl7zeZzauvFfYNP2aRlxBVf/rMBY6t/hnALX1fIDn1dEEw/PDMoxidWZ2SM6RCR9R0
         R5z2fRigiG0a62BfO8o31Fc8Xrh3CTrsPBLQlbqSTt1RKprSp5ay7da5XKJVqoDGL+sx
         cBjlQ9yRWaRLG1ZNfQViCC2uB+8CxiiJ/N/ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684601; x=1755289401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XPZdbzmMxNNc6YJDmmLb0VrWoSZ8jhqn1MaPLISSgE=;
        b=vFCOnVrguvRwszygC49Yj1ygLJyHWXVIPbzSgyQHDOOlF7awWg2q/W2bQMs7GZGSpM
         y3s0tSGl6q1oduZqcmjW28tJ8e443dN1eXU12ut5oaBCMPkgyuISjRBIH8CmdbYWQQzP
         HGQ8vfmJP+asc7I35nGYhSC63hMj2G6kCHARVBdeCAux3lf3+tuuwbr9iQk4FeYGbW/2
         mm7tCFm57F99QRWBoGmbkZrPLrou+LqX52S8At9g2IvUdvfxiym4ziRRwpCmu6O/bTs9
         W+w/DHvcZuUlhxqTwYOZKu/XnATXdENHVF8E6yvAi8vTnqqAXBZrz0I+mqQyV4+lEa9M
         gLlw==
X-Gm-Message-State: AOJu0YyBH9HLOD/WzN1r7Cu6KVnDAC5a0+Uu9kiPy79QxsEtZzCzIWLY
	jr+7OYjYKHKsTl3ihxPozlBKi5izHWxg2zRI+faj2tOr94phJFo7fgEipJJbuRZXCDUTzp07PMN
	oWCj54Fg=
X-Gm-Gg: ASbGnctunAoZeo1IvFNM4qgwHBYVH4YaTRJfkJNtD2MF2tc4MlVzFTAdxHBZZVTiWjd
	60tUDqJRKiggg7AVPb4hLOd4P+tXjeco+nDPxytouhLYzgjl9GM6CtGECPncQU4hVxUSsw/o5Ep
	pYrWxAh7/C43ggAcMriubegsAkI8JBiWYxwR1Cxn3hFc5msCseu8a/p29ZU9jr74gi93DKtJGXL
	Xhyj9mR01WQAtddET8sQVeQJEm040KF2UgAVasNNPRAsojcj9XwvnbS9CuCBllhzQgtn5Zmt0sx
	C9NZBUkohXHp+97hMcjFLyWHYLrPFQ4OdDPXg85HtZOnjjH8gbgnQSA+BpI1unAN5VC0sw3bOsM
	YcYcJsgmUPlGe8Qgp9V4QgvJOb1JJdgLoKilWB30bV3LTdx2M92hNl2Esmw94XlzFhjla4Y5Vya
	EW
X-Google-Smtp-Source: AGHT+IFGc/gbZa6En9xjXehNP/ecIwgegsDSFIj239IUr/R3bVfNbyu+lhGZaNFvH+BLOBDQlEonVA==
X-Received: by 2002:a05:6000:2c01:b0:3a5:8991:64b7 with SMTP id ffacd0b85a97d-3b8f97f50c7mr8332086f8f.26.1754684601059;
        Fri, 08 Aug 2025 13:23:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 02/22] x86/msr: Rename wrmsr_ns() to wrmsrns(), and take 64bit value
Date: Fri,  8 Aug 2025 21:22:54 +0100
Message-Id: <20250808202314.1045968-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In hindsight, having the wrapper name not be the instruction mnemonic was a
poor choice.  Also, PKS turns out to be quite rare in wanting a split value.

Switch to using a single 64bit value in preparation for new users.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/msr.h      | 4 ++--
 xen/arch/x86/include/asm/prot-key.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 4c4f18b3a54d..b6b85b04c3fd 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -39,7 +39,7 @@ static inline void wrmsrl(unsigned int msr, uint64_t val)
 }
 
 /* Non-serialising WRMSR, when available.  Falls back to a serialising WRMSR. */
-static inline void wrmsr_ns(uint32_t msr, uint32_t lo, uint32_t hi)
+static inline void wrmsrns(uint32_t msr, uint64_t val)
 {
     /*
      * WRMSR is 2 bytes.  WRMSRNS is 3 bytes.  Pad WRMSR with a redundant CS
@@ -47,7 +47,7 @@ static inline void wrmsr_ns(uint32_t msr, uint32_t lo, uint32_t hi)
      */
     alternative_input(".byte 0x2e; wrmsr",
                       ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
-                      "c" (msr), "a" (lo), "d" (hi));
+                      "c" (msr), "a" (val), "d" (val >> 32));
 }
 
 /* rdmsr with exception handling */
diff --git a/xen/arch/x86/include/asm/prot-key.h b/xen/arch/x86/include/asm/prot-key.h
index 0cbecc2df401..3e9c2eaef415 100644
--- a/xen/arch/x86/include/asm/prot-key.h
+++ b/xen/arch/x86/include/asm/prot-key.h
@@ -72,14 +72,14 @@ static inline void wrpkrs(uint32_t pkrs)
     {
         *this_pkrs = pkrs;
 
-        wrmsr_ns(MSR_PKRS, pkrs, 0);
+        wrmsrns(MSR_PKRS, pkrs);
     }
 }
 
 static inline void wrpkrs_and_cache(uint32_t pkrs)
 {
     this_cpu(pkrs) = pkrs;
-    wrmsr_ns(MSR_PKRS, pkrs, 0);
+    wrmsrns(MSR_PKRS, pkrs);
 }
 
 #endif /* ASM_PROT_KEY_H */
-- 
2.39.5



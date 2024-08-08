Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CF994BEAD
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:43:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774172.1184668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3Pv-0004G4-UX; Thu, 08 Aug 2024 13:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774172.1184668; Thu, 08 Aug 2024 13:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3Pv-0004Do-PQ; Thu, 08 Aug 2024 13:42:59 +0000
Received: by outflank-mailman (input) for mailman id 774172;
 Thu, 08 Aug 2024 13:42:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgd2=PH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sc3Pu-0002jZ-K9
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:42:58 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f3ff6fa-558c-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 15:42:58 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7d89bb07e7so127096966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:42:58 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ecb551sm741537166b.223.2024.08.08.06.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 06:42:56 -0700 (PDT)
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
X-Inumbo-ID: 1f3ff6fa-558c-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723124577; x=1723729377; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uKc4D/FCmujJpSYe6Bi/Q/cwgGcN1SIl98HqfdDNIU=;
        b=j3VjLwcFLMsopbU9tHf4Byue+gDPit1w+gvBhAAlNj0trC6LKwzUHae7Fz6Yx6ZT0q
         LnWA2b9L9jPYL5PYupLrHMmDciiiqsKeJ1mhyNRXc1Udw4d/J46QttkMI+XeNZxRY3oF
         stzFgApwCPlMhXG7LLLE8vRWYIphDvaVn5PeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723124577; x=1723729377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uKc4D/FCmujJpSYe6Bi/Q/cwgGcN1SIl98HqfdDNIU=;
        b=SqLUNZt0Ffx1OSb8EatbzuT5E1FOZ/GqQZanSMPVUiYbS3RSru7LDTDjXrxF6wFsUB
         Q1d3s3vwXXlWVg9a2LWx6YYAhi3b/5Uq4CsIV/R4JlhSp0GpvUm6ks2umqOczlQ0SCqU
         +7RkZA3R0Ig4YynH5kHY8Z6ND3NZ4kro4FOwjcPwNwPhJeqAmF9lKTxdB6qVoCyrgtwd
         Szl2wJOECpiVq6I1sDHchKkrci9aY+awt0bAvVvVOKO9V70hHRCOmsHeILH3EVJs2Qfd
         drXjGap++YipEm4nJHz2JXx+Jw3KRbhgpDizIimOW0ygCd6jhF+MH3NAF0ypp5hPYn94
         tbAA==
X-Gm-Message-State: AOJu0YwNVmpAd61PvAiKnDVqDZZkeMFNhtr04MDbwEuwOD2CAzA3YQl6
	8sHkEbGR8GGZwbXumz2PQt3kk/5Rwbta3D3r9cjLrqUVsUpHBOdEeTz7OWdV158vViWy1SyR1I7
	B
X-Google-Smtp-Source: AGHT+IFfFhFaLf1ArmgnvJU2ePQ6v9ViJlwrPDJl5nizABtj7PAsREdAazV3vZO4vx70PKKP/ds9IQ==
X-Received: by 2002:a17:907:d2da:b0:a72:8762:1f5d with SMTP id a640c23a62f3a-a8090e9e1ecmr147267966b.55.1723124577270;
        Thu, 08 Aug 2024 06:42:57 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v5 01/10] tools/hvmloader: Fix non-deterministic cpuid()
Date: Thu,  8 Aug 2024 14:42:41 +0100
Message-ID: <20240808134251.29995-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
References: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hvmloader's cpuid() implementation deviates from Xen's in that the value
passed on ecx is unspecified. This means that when used on leaves that
implement subleaves it's unspecified which one you get; though it's more
than likely an invalid one.

Import Xen's implementation so there are no surprises.

Fixes: 318ac791f9f9 ("Add utilities needed for SMBIOS generation to
hvmloader")
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v5:
  * Added Fixes tag
  * Cosmetic changes to static inline, as proposed by Andrew
---
 tools/firmware/hvmloader/util.c |  9 ---------
 tools/firmware/hvmloader/util.h | 27 ++++++++++++++++++++++++---
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index c34f077b38e3..d3b3f9038e64 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -267,15 +267,6 @@ memcmp(const void *s1, const void *s2, unsigned n)
     return 0;
 }
 
-void
-cpuid(uint32_t idx, uint32_t *eax, uint32_t *ebx, uint32_t *ecx, uint32_t *edx)
-{
-    asm volatile (
-        "cpuid"
-        : "=a" (*eax), "=b" (*ebx), "=c" (*ecx), "=d" (*edx)
-        : "0" (idx) );
-}
-
 static const char hex_digits[] = "0123456789abcdef";
 
 /* Write a two-character hex representation of 'byte' to digits[].
diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index deb823a892ef..e53a36476b70 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -184,9 +184,30 @@ int uart_exists(uint16_t uart_base);
 int lpt_exists(uint16_t lpt_base);
 int hpet_exists(unsigned long hpet_base);
 
-/* Do cpuid instruction, with operation 'idx' */
-void cpuid(uint32_t idx, uint32_t *eax, uint32_t *ebx,
-           uint32_t *ecx, uint32_t *edx);
+/* Some CPUID calls want 'count' to be placed in ecx */
+static inline void cpuid_count(
+    uint32_t leaf,
+    uint32_t subleaf,
+    uint32_t *eax,
+    uint32_t *ebx,
+    uint32_t *ecx,
+    uint32_t *edx)
+{
+    asm volatile ( "cpuid"
+          : "=a" (*eax), "=b" (*ebx), "=c" (*ecx), "=d" (*edx)
+          : "a" (leaf), "c" (subleaf) );
+}
+
+/* Generic CPUID function (subleaf 0) */
+static inline void cpuid(
+    uint32_t leaf,
+    uint32_t *eax,
+    uint32_t *ebx,
+    uint32_t *ecx,
+    uint32_t *edx)
+{
+    cpuid_count(leaf, 0, eax, ebx, ecx, edx);
+}
 
 /* Read the TSC register. */
 static inline uint64_t rdtsc(void)
-- 
2.45.2



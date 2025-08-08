Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DDDB1EF89
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:32:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075141.1437664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTky-0001GV-8O; Fri, 08 Aug 2025 20:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075141.1437664; Fri, 08 Aug 2025 20:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTky-0001F2-5C; Fri, 08 Aug 2025 20:32:04 +0000
Received: by outflank-mailman (input) for mailman id 1075141;
 Fri, 08 Aug 2025 20:32:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTcl-0005tJ-CD
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:35 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e46660f-7495-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 22:23:33 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so21412555e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:33 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:32 -0700 (PDT)
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
X-Inumbo-ID: 8e46660f-7495-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684613; x=1755289413; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0+lABFbcbDRQyVLuDKpWi9Q/vTwEudyUax4FU2we4k=;
        b=rARpPgTeGPErQq0e3+wb9FjncWB6gITb21s7MkiAOUXgS2yFaoSnLvGPH5qAND5M6q
         8tEmszXAborRuFc5k9Sr4KYIhx1hBbDy2tL2UdaUCCQf0y30Ler+MtKbsoX+bzvSIRya
         RLLtndDzjOvBQ12wU8XNvmhmUbkZ5CAjXyQgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684613; x=1755289413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0+lABFbcbDRQyVLuDKpWi9Q/vTwEudyUax4FU2we4k=;
        b=Na/jRdDTdVzCsEm3KmhfiHUq+loP+FQne9lLGrQExjItzTaqR1IU9P7Xh2elXOii3n
         hMkoMKm3WxSKaFMHAT2QyQgI5WNUKqvcpXK85yCXw1yNJjIgrLC9sn3zD4HabP/EbPQr
         C8whaw89WWkmzt98dBiudeiG2fGHvNu18auuG2vAwEdZT8n5GahEyLsVH+KiYkJVcu8e
         Ksd+ofDC+0JbTOVIDcmMCMPEW8UKrXKmxf8ciFIOhrQe+IsVs5xgiNsX4gtcYRWGW9+l
         rLgI40QuHyurrbXyq9sQoARdEEBzzkmVcZAQ0FsskpfBnk2yzAu6rlMcSnveMzLRwcY8
         oTyg==
X-Gm-Message-State: AOJu0YxMjJr1EGVnMat/yuTYqLQCJmhY8gEbl5Ib8dPZnpYUeCnK1B2f
	5qDir6tRzszFbydn1SUkqgKZRs6SDM05DK+31kuEY896TC3jH5z8eahlInQG2fEtzmC98ud9nxT
	eMU0kqcE=
X-Gm-Gg: ASbGncvC9gSY2pznrR3I/0g/yrnccamPBriL5fyJ7LrWu82rlzhD1fFy6p5Znzt/AF7
	ywIVCt1RGzS6+RWsDt4ql/ocVt1iatT9s3xCpnDz2ia19Y7VKNW83oCC26t23E4Pf9dQyZPzbRI
	fgIQ+e2W9t4HMpIaEkfom/t7QPE7vFbEHzFswMu5XZei+n04KuhZ/jnryZQ1eEeZqoZzSzcRXj8
	IAHLHi+fQOhLYiG8qANw5ojWRLGT6We0rZfqt0bAyMlk3OlpLVmCayNKx27+J7yj5kZZ9FHMmkR
	qd2aIp/ZyA7gGolnfVYC54WA/PqDsY/K/NriU0UEPVAtogRdyUTu3sheIRZENOCenNQnDcSB3bV
	XjYg0RxiyR78fBL8pOuWXU+X6TsnY+ykwMBSP37OZdN6WMQ1I7Tbw3iYWoWBBXYG9jfAfLufvMT
	xs
X-Google-Smtp-Source: AGHT+IFv8BFy8CiiAYDhU6YYdfX21Rsk3CpUh43kzdxpdKNgBsdJlp2pWcFU87juIIAPy6rcU5U25w==
X-Received: by 2002:a05:600c:4fca:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-459f4f03764mr38192155e9.19.1754684612636;
        Fri, 08 Aug 2025 13:23:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 17/22] x86/S3: Switch to using RSTORSSP to recover SSP on resume
Date: Fri,  8 Aug 2025 21:23:09 +0100
Message-Id: <20250808202314.1045968-18-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Under FRED, SETSSBSY is unavailable, and we want to be setting up FRED prior
to setting up shadow stacks.  Luckily, RSTORSSP will also work in this case.

This involves a new type of shadow stack token, the Restore Token, which is
distinguished from the Supervisor Token by pointing to the adjacent slot on
the shadow stack rather than pointing at itself.

In the short term, this logic still needs to load MSR_PL0_SSP.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/wakeup_prot.S | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/acpi/wakeup_prot.S b/xen/arch/x86/acpi/wakeup_prot.S
index dfc8c6ac6e8c..6ddc4011d8b6 100644
--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -90,7 +90,7 @@ LABEL(s3_resume)
         mov     %rcx, STACK_CPUINFO_FIELD(cr4)(%r15)
         mov     %rcx, %cr4
 
-        /* WARNING! call/ret now fatal (iff SHSTK) until SETSSBSY loads SSP */
+        /* WARNING! CALL/RET now fatal (iff SHSTK) until RSTORSSP loads SSP */
 
 #if defined(CONFIG_XEN_SHSTK)
         test    $CET_SHSTK_EN, %al
@@ -98,32 +98,31 @@ LABEL(s3_resume)
 
         /*
          * Restoring SSP is a little complicated, because we are intercepting
-         * an in-use shadow stack.  Write a temporary token under the stack,
-         * so SETSSBSY will successfully load a value useful for us, then
-         * reset MSR_PL0_SSP to its usual value and pop the temporary token.
+         * an in-use shadow stack.  Write a Restore Token under the stack, and
+         * use RSTORSSP to load it.  RSTORSSP converts the token to a
+         * Previous-SSP Token, which we discard.
          */
         mov     saved_ssp(%rip), %rdi
 
-        /* Construct the temporary supervisor token under SSP. */
-        sub     $8, %rdi
-
-        /* Load it into MSR_PL0_SSP. */
+        /* Calculate MSR_PL0_SSP from SSP. */
         mov     $MSR_PL0_SSP, %ecx
         mov     %rdi, %rdx
         shr     $32, %rdx
         mov     %edi, %eax
-        wrmsr
-
-        /* Write the temporary token onto the shadow stack, and activate it. */
-        wrssq   %rdi, (%rdi)
-        setssbsy
-
-        /* Reset MSR_PL0_SSP back to its normal value. */
         and     $~(STACK_SIZE - 1), %eax
         or      $(PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8, %eax
         wrmsr
 
-        /* Pop the temporary token off the stack. */
+        /*
+         * A Restore Token's value is &token + 8 + 64BIT (bit 0).
+         * We want to put this on the shstk at SSP - 8.
+         */
+        lea     1(%rdi), %rax
+        sub     $8, %rdi
+        wrssq   %rax, (%rdi)
+        rstorssp (%rdi)
+
+        /* Discard the Previous-SSP Token from the shstk. */
         mov     $2, %eax
         incsspd %eax
 #endif /* CONFIG_XEN_SHSTK */
-- 
2.39.5



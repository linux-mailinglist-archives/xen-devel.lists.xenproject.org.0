Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0722FF99B
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 01:55:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72507.130630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2kju-00031z-CR; Fri, 22 Jan 2021 00:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72507.130630; Fri, 22 Jan 2021 00:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2kju-00031N-87; Fri, 22 Jan 2021 00:55:50 +0000
Received: by outflank-mailman (input) for mailman id 72507;
 Fri, 22 Jan 2021 00:55:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0NXE=GZ=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1l2kjs-0002iW-Eq
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 00:55:48 +0000
Received: from mail-pj1-x1031.google.com (unknown [2607:f8b0:4864:20::1031])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86f9716e-6b72-4d65-b309-08f63f003b40;
 Fri, 22 Jan 2021 00:55:27 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id md11so2752424pjb.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 16:55:27 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:4f00:c640:3cc1:5f60:de20:49b1])
 by smtp.gmail.com with ESMTPSA id j23sm6930632pgj.34.2021.01.21.16.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 16:55:26 -0800 (PST)
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
X-Inumbo-ID: 86f9716e-6b72-4d65-b309-08f63f003b40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CFX6vZfWhMq09bRCfmvsW5ie9rPQtvDQcG3Brosrm6s=;
        b=YnQDUTRKzR2FAZH64TchEmzbGB3xk4MXMtj61l+ax0KqCpfFfFdzGSxzFQDs2oduLj
         +4i/+oj7pZxfGMvtA42dYewvacvnQTmFZVOZEDvKyHOCMtl8OM4+iYm/ou4LGFar9vFR
         2pG3y7TGYbvbEORWWq0VqzNuPkTSSABFZwJSNjOQQ8vQEX5xmTRCdDGrKSfPIxx+SJKO
         UabXhjfbjbcQNntY36yLCWDROn8dAeFjELeqLa8EmRRrzrCWVKWezgERc5SrimeaYMKc
         VN1Wv3HbzcYxXpoSw33R6qBY5b61caj1VAk1T9UbqHNwdVUtalG2YriVmczgDb5QMhpo
         NEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CFX6vZfWhMq09bRCfmvsW5ie9rPQtvDQcG3Brosrm6s=;
        b=O+8rN0pIPAsilLQzcsqdy6y5lwlTJqktMsIXek5UYX7tsZ61fUglKhtzox4ZmfwRgN
         HwoNw5/VkNjLRPKBZgMZvZl358bgEsC1QzEXqQOYTabOj+lOxBe4xwl36T1ydyeiktir
         mfpSBqTzHsjpPGA8oxWOKMCVTB5r8tc7rPFl91gvIQTTL1ANQZAwt4JKTzHGswVIHsH3
         hbZLx8fhSRqxcDZDQtxWpdvYGvv37g1Q8K1qWqw6/dvaC/F2mTZTK+dSNAtjo5BZw3yV
         xpL5/OXj9EW//+n1DcuR0V4P52Qrxw4QybRI3+0Am+lHzRSWpa22y0pKhOo/2xSlh3/n
         88wg==
X-Gm-Message-State: AOAM533MBp0IUvMQhmfki9w6TWMSQWukk1amgzg5CSjKCvn9snYHFyx6
	j3/RxddXQmRxPJ652KNcizA24pfF5XcAFqPH
X-Google-Smtp-Source: ABdhPJzwplZeh2R2BWgR4suxGpwxTWEGaRcsK1iVER1ir4oVUHHrtog6cn3MiQ06OyI56Cjj/8/FiQ==
X-Received: by 2002:a17:902:ed83:b029:de:84d2:9ce8 with SMTP id e3-20020a170902ed83b02900de84d29ce8mr1982099plj.17.1611276926866;
        Thu, 21 Jan 2021 16:55:26 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel Kiper <daniel.kiper@oracle.com>,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 4/5] xen/x86: add some addresses to the Multiboot2 header
Date: Thu, 21 Jan 2021 16:51:43 -0800
Message-Id: <35ad940a3da56fc39c9f24e15c9f09ef74ad3448.1611273359.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1611273359.git.bobbyeshleman@gmail.com>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Kiper <daniel.kiper@oracle.com>

In comparison to ELF the PE format is not supported by the Multiboot2
protocol. So, if we wish to load xen.mb.efi using this protocol we have
to add MULTIBOOT2_HEADER_TAG_ADDRESS and MULTIBOOT2_HEADER_TAG_ENTRY_ADDRESS
tags into Multiboot2 header.

Additionally, put MULTIBOOT2_HEADER_TAG_ENTRY_ADDRESS and
MULTIBOOT2_HEADER_TAG_ENTRY_ADDRESS_EFI64 tags close to each
other to make the header more readable.

The Multiboot2 protocol spec can be found at
  https://www.gnu.org/software/grub/manual/multiboot2/

Signed-off-by: Daniel Kiper <daniel.kiper@oracle.com>
Signed-off-by: Bobby Eshleman <bobbyeshleman@gmail.com>
---
 xen/arch/x86/boot/head.S | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 189d91a872..f2edd182a5 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -94,6 +94,13 @@ multiboot2_header:
         /* Align modules at page boundry. */
         mb2ht_init MB2_HT(MODULE_ALIGN), MB2_HT(REQUIRED)
 
+        /* The address tag. */
+        mb2ht_init MB2_HT(ADDRESS), MB2_HT(REQUIRED), \
+                   sym_offs(multiboot2_header), /* header_addr */ \
+                   sym_offs(start),             /* load_addr */ \
+                   sym_offs(__bss_start),       /* load_end_addr */ \
+                   sym_offs(__2M_rwdata_end)    /* bss_end_addr */
+
         /* Load address preference. */
         mb2ht_init MB2_HT(RELOCATABLE), MB2_HT(OPTIONAL), \
                    sym_offs(start), /* Min load address. */ \
@@ -101,6 +108,14 @@ multiboot2_header:
                    0x200000, /* Load address alignment (2 MiB). */ \
                    MULTIBOOT2_LOAD_PREFERENCE_HIGH
 
+        /* Multiboot2 entry point. */
+        mb2ht_init MB2_HT(ENTRY_ADDRESS), MB2_HT(REQUIRED), \
+                   sym_offs(__start)
+
+        /* EFI64 Multiboot2 entry point. */
+        mb2ht_init MB2_HT(ENTRY_ADDRESS_EFI64), MB2_HT(OPTIONAL), \
+                   sym_offs(__efi64_mb2_start)
+
         /* Console flags tag. */
         mb2ht_init MB2_HT(CONSOLE_FLAGS), MB2_HT(OPTIONAL), \
                    MULTIBOOT2_CONSOLE_FLAGS_EGA_TEXT_SUPPORTED
@@ -114,10 +129,6 @@ multiboot2_header:
         /* Request that ExitBootServices() not be called. */
         mb2ht_init MB2_HT(EFI_BS), MB2_HT(OPTIONAL)
 
-        /* EFI64 Multiboot2 entry point. */
-        mb2ht_init MB2_HT(ENTRY_ADDRESS_EFI64), MB2_HT(OPTIONAL), \
-                   sym_offs(__efi64_mb2_start)
-
         /* Multiboot2 header end tag. */
         mb2ht_init MB2_HT(END), MB2_HT(REQUIRED)
 .Lmultiboot2_header_end:
-- 
2.30.0



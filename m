Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3090098B97F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 12:23:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807972.1219750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sva1u-00020c-EF; Tue, 01 Oct 2024 10:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807972.1219750; Tue, 01 Oct 2024 10:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sva1u-0001y4-Al; Tue, 01 Oct 2024 10:22:54 +0000
Received: by outflank-mailman (input) for mailman id 807972;
 Tue, 01 Oct 2024 10:22:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i7H1=Q5=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sva1s-0001jp-Oe
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 10:22:52 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d165702-7fdf-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 12:22:51 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a910860e4dcso12575966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 03:22:51 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297bceesm681772966b.187.2024.10.01.03.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 03:22:50 -0700 (PDT)
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
X-Inumbo-ID: 1d165702-7fdf-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727778171; x=1728382971; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ec7IJ82TAUIZ24f2ims91e1OgLvu1KLsDjKQelIoz6M=;
        b=AxfW4w+Ek5GuRpQAUFLX3Ylx2uWAv66BDdWLSHWUf5Qim9Jjivudazw/TPHTv1GDoO
         x3Qpn1Hu/0oJazBtRhhYzLxQS+63GyJv6tYwDXdT69FHCwkofJFPexcxYZHk6SDIoc05
         /N5tSXASTkc6xQsivUGyUNWP+YSfUw0NemRao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727778171; x=1728382971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ec7IJ82TAUIZ24f2ims91e1OgLvu1KLsDjKQelIoz6M=;
        b=jKL6EznCconoWSnirehBToE1JEvItmJZeUcK71Z5XmIaJPXoPjc95EjjxAKrgjBEjq
         VdTKVg+OipCY5BwjrhoV/bOUR7cZQKzwbwXDSOhYB93zZ/DBf21PmI/xEKUYHG6CCtOT
         i064mYENkWNT3v5cqn26SJHyIrBbSOgcY4k/zN2Q+s6geGrZ5d6ZRmwopIPRcZE1KnOy
         dWDODit2Dx0enxFIXEVXiFNkJ9gTD5/gJEOSyNb4zAqgIqS4mSM+S4Z7RYVF2GaaTFzX
         k7zrJEcfIcv5mOUymGZNNbLCp/qxxFWSvPDgyGhSoG8RXXZNgCX678Odi8L4vu9IO6aT
         /8Sw==
X-Gm-Message-State: AOJu0YzQa5PMq1HYmdqicFivO3KU7YIIsIXomVKCXkaWZl9AFkPVbDAC
	DsOyVtFBGzp9mtQwtgjl03ktVCoWBi53G7dIJukCOvbqLjyeTfZN4zcvY4pU6A6sdoNbrE4P2Pj
	i
X-Google-Smtp-Source: AGHT+IF1U8NDFlUm54dcpcQqlhSm+jEmpqFqtZ2h9Gbsw0Pp3jHFUvwvT3lgGlczbatDf8BJACaBqw==
X-Received: by 2002:a17:907:7e8e:b0:a8d:555f:eeda with SMTP id a640c23a62f3a-a93c48e7fc2mr1768741066b.8.1727778170687;
        Tue, 01 Oct 2024 03:22:50 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 2/2] x86/boot: Improve MBI2 structure check
Date: Tue,  1 Oct 2024 11:22:39 +0100
Message-Id: <20241001102239.2609631-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001102239.2609631-1-frediano.ziglio@cloud.com>
References: <20241001102239.2609631-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tag structure should contain at least the tag header.
Entire tag structure must be contained inside MBI2 data.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v6:
- compare against total_size every time to avoid overflows.
---
 xen/arch/x86/efi/mbi2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/efi/mbi2.c b/xen/arch/x86/efi/mbi2.c
index 55a1777483..935f3ae5d0 100644
--- a/xen/arch/x86/efi/mbi2.c
+++ b/xen/arch/x86/efi/mbi2.c
@@ -13,6 +13,7 @@ efi_multiboot2_prelude(uint32_t magic, const multiboot2_fixed_t *mbi)
     EFI_HANDLE ImageHandle = NULL;
     EFI_SYSTEM_TABLE *SystemTable = NULL;
     const char *cmdline = NULL;
+    const void *const mbi_raw = (const void *)mbi;
     bool have_bs = false;
 
     if ( magic != MULTIBOOT2_BOOTLOADER_MAGIC )
@@ -21,7 +22,9 @@ efi_multiboot2_prelude(uint32_t magic, const multiboot2_fixed_t *mbi)
     /* Skip Multiboot2 information fixed part. */
     tag = _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN));
 
-    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size &&
+    for ( ; (const void *)(tag + 1) - mbi_raw <= mbi->total_size &&
+            tag->size >= sizeof(*tag) &&
+            (const void *)tag + tag->size - mbi_raw <= mbi->total_size &&
             tag->type != MULTIBOOT2_TAG_TYPE_END;
           tag = _p(ROUNDUP((unsigned long)tag + tag->size,
                    MULTIBOOT2_TAG_ALIGN)) )
-- 
2.34.1



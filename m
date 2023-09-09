Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C177C7996E0
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 10:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598450.933270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qetQV-0003qn-EW; Sat, 09 Sep 2023 08:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598450.933270; Sat, 09 Sep 2023 08:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qetQV-0003nr-8Z; Sat, 09 Sep 2023 08:34:47 +0000
Received: by outflank-mailman (input) for mailman id 598450;
 Sat, 09 Sep 2023 08:34:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rb1o=EZ=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qetQU-0003Y6-6s
 for xen-devel@lists.xenproject.org; Sat, 09 Sep 2023 08:34:46 +0000
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [2607:f8b0:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba735d05-4eeb-11ee-8783-cb3800f73035;
 Sat, 09 Sep 2023 10:34:45 +0200 (CEST)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-564b6276941so2087599a12.3
 for <xen-devel@lists.xenproject.org>; Sat, 09 Sep 2023 01:34:45 -0700 (PDT)
Received: from leoy-yangtze.lan ([98.98.49.29])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b001bde65894d5sm2781080plo.109.2023.09.09.01.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 01:34:43 -0700 (PDT)
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
X-Inumbo-ID: ba735d05-4eeb-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694248484; x=1694853284; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6h+kQFNlJuKLKcUFrkwizN3qvwCXJUGePLvvNBk0jw=;
        b=AL2cQRMXOl3LgiyzE+pydbCAQmrDcma88cmTGDMwbQJgKhbKo971woTXvD0Hx+xlVe
         kMpSOuMl8Kw1clHlpqeHC9cw2pzbtAEargExtaCX7rnZlT7IVA5d7ZqBGYfo1Q54hYZ7
         pFrkhg9Zk/lm0GXmnj5EOU8O5gCmNhLsTfl9uoYmsIbaIdnY3Zlmb9aEL4tMffxidQWO
         fJS4KJwzYAJTD5Uz3F22yUheVdHqgFOd7vqCoiNtrrJVeyi2NSRYnE+obmy6GF0G+b3k
         N02h8mqXoC95XObKTdLCpNL1CGVy+MNHHkTS2j6jtRmSY3Y9WQvhOXoj1i4C1IJpuI6E
         Tfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694248484; x=1694853284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6h+kQFNlJuKLKcUFrkwizN3qvwCXJUGePLvvNBk0jw=;
        b=WNUdTYZsc7fW94Kmr0Vj/8zha4b43pZnYe9kf6cioNGpD1uAxrQaD5N10xJ8GJppyY
         9J8KtySjbv4xTine0xKTuF5wuzS3zpw21O58+31x0dhTx47odZ80yG8aBb4nOdhGlORj
         P8j/YI5NSW3QfNW7Vmyudk0pqf8UYyiNhvdwZts0cNlDFAJ9UGP0AZRzMQMwdCPDx4i+
         o5nALb8a07J92qUyhwf4EBeFGOfpfu2scbxxN8Yqv5/R4+02qS53gDqyJ4QV9+Ljrui8
         jd+t7tTp8RirtQWEbrqaUZ/UJv+VZb3Om7qEycIgaDsbKr+l6sCb0UhV+NrGXJ3HO1U/
         JoUQ==
X-Gm-Message-State: AOJu0YyPpG0oCInvKLLfWi30l2+167gyLr/S3qtp1ZG3E8IgUGOMAhRN
	EfqFDvg/aPMQgpcFzmqlDf4Ke9/pBuX8u2sUJgNMlx25
X-Google-Smtp-Source: AGHT+IFRvTt3STy9ETwUk8VeK8KnAu1eRRfaQSnUAJIE0ud1V8L6R2sYM7J9R4YL6YksIJdry8eILg==
X-Received: by 2002:a17:903:11c6:b0:1c0:e630:5031 with SMTP id q6-20020a17090311c600b001c0e6305031mr5851416plh.28.1694248484193;
        Sat, 09 Sep 2023 01:34:44 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH RESEND v2 1/2] xen/arm: Add macro XEN_VM_MAPPING
Date: Sat,  9 Sep 2023 16:34:09 +0800
Message-Id: <20230909083410.870726-2-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230909083410.870726-1-leo.yan@linaro.org>
References: <20230909083410.870726-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen maps the virtual memory space starting from L0 slot 4, so it's open
coded for macros with the offset '4'.

For more readable, add a new macro XEN_VM_MAPPING which defines the
start slot for Xen virtual memory mapping, and all virtual memory
regions are defined based on it.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 xen/arch/arm/include/asm/config.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 83cbf6b0cb..21f4e68a40 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -117,11 +117,14 @@
 #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
 #else
 
+#define IDENTITY_MAPPING_AREA_NR_L0	4
+#define XEN_VM_MAPPING			SLOT0(IDENTITY_MAPPING_AREA_NR_L0)
+
 #define SLOT0_ENTRY_BITS  39
 #define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
 #define SLOT0_ENTRY_SIZE  SLOT0(1)
 
-#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
+#define XEN_VIRT_START          (XEN_VM_MAPPING + _AT(vaddr_t, MB(2)))
 #endif
 
 /*
@@ -184,12 +187,10 @@
 
 #else /* ARM_64 */
 
-#define IDENTITY_MAPPING_AREA_NR_L0  4
-
-#define VMAP_VIRT_START  (SLOT0(4) + GB(1))
+#define VMAP_VIRT_START  (XEN_VM_MAPPING + GB(1))
 #define VMAP_VIRT_SIZE   GB(1)
 
-#define FRAMETABLE_VIRT_START  (SLOT0(4) + GB(32))
+#define FRAMETABLE_VIRT_START  (XEN_VM_MAPPING + GB(32))
 #define FRAMETABLE_SIZE        GB(32)
 #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
 
-- 
2.39.2



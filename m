Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FF798F5AD
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809694.1222240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ7D-00019D-Al; Thu, 03 Oct 2024 17:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809694.1222240; Thu, 03 Oct 2024 17:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ7C-0000xb-Qj; Thu, 03 Oct 2024 17:59:50 +0000
Received: by outflank-mailman (input) for mailman id 809694;
 Thu, 03 Oct 2024 17:59:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swQ79-0006qR-80
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 17:59:47 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4581093a-81b1-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 19:59:44 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8a7cdfdd80so231114266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 10:59:44 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104731a5sm111876166b.180.2024.10.03.10.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 10:59:43 -0700 (PDT)
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
X-Inumbo-ID: 4581093a-81b1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727978384; x=1728583184; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzvJYHGLE9z5OUSnbhsIqX8inHPsJLzDP+/krirdPTI=;
        b=E82F/3BuuUPX5pVK4OSGNlbH46hZIGcYeYr1YIy/8aKzHb40pyuwaEe9XLVMiOTLmG
         9CXwJIaHOXwQnqQnkDyslSw6xDaKUrbBM7RG/6A+5lyQWiDs/W/o0+phzcbYrqw9TTZ9
         vYuO7n0YvSqzTdQ5on+9NBPiQ4UiQTTaNAvaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727978384; x=1728583184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzvJYHGLE9z5OUSnbhsIqX8inHPsJLzDP+/krirdPTI=;
        b=OGbPaAiAkpmk9FRgeW98eXC1btSAPAAJSPD/EYfCLN7HnqCVOVocBkm/fPGrVMi3EE
         VEQ76JyjgjEmtAJ42JWFxAqd+0UkZOFtbmSmo6BzdEo+AtnSeL6WcnpoDKn+Aikfgw+G
         iSZiZuIWGJjU2WhMN9I8jETWzs2GitZ3ONfVv8jx1nG+2gAvzMHa4Hcix4vM2mTxnMFO
         Lpg6SvLpZQnqnWWfTDdpzJuBf7CMQpH/YGhrIyEGLaT6FQU+8KSxcMkvDIfEuqVJSpbi
         ye7DaXH4ckjlYysdVQBBfDkwrT1WVCEmOuEWUyOuZ9KlrYwI0jC/slbjRibw1/hbeBpX
         iFdg==
X-Gm-Message-State: AOJu0YxkgOwB2gm996Be4ZoGkRaUNhffcU40/gem/WdF07571DLCP/Q9
	4f+L43GjwhvaAYyh/MwrKmAOvcUf3c7ZDzJL8MdkOSsMf6qHoXo/YJKDwyae44m22WrgPM7y3jI
	F
X-Google-Smtp-Source: AGHT+IFsJal4LhQPyoNJwTthAC7oprz0fkM3WUCWYpJdlczXozz3OXAVpILQG/efAwHa4lt8cP2uAw==
X-Received: by 2002:a17:906:cad7:b0:a8d:1774:eb59 with SMTP id a640c23a62f3a-a991bed41a1mr17539266b.54.1727978384019;
        Thu, 03 Oct 2024 10:59:44 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 12/19] xen: Update header guards - KEXEC
Date: Thu,  3 Oct 2024 18:59:12 +0100
Message-Id: <20241003175919.472774-13-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003175919.472774-1-frediano.ziglio@cloud.com>
References: <20241003175919.472774-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to KEXEC.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/include/xen/kexec.h  | 6 +++---
 xen/include/xen/kimage.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/include/xen/kexec.h b/xen/include/xen/kexec.h
index e66eb6a8e5..d9d79902a9 100644
--- a/xen/include/xen/kexec.h
+++ b/xen/include/xen/kexec.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_KEXEC_H__
-#define __XEN_KEXEC_H__
+#ifndef XEN__KEXEC_H
+#define XEN__KEXEC_H
 
 #include <xen/keyhandler.h>
 
@@ -94,7 +94,7 @@ static inline void set_kexec_crash_area_size(u64 system_ram) {}
 
 #endif
 
-#endif /* __XEN_KEXEC_H__ */
+#endif /* XEN__KEXEC_H */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
index 348f07f5c8..139d4366ab 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_KIMAGE_H__
-#define __XEN_KIMAGE_H__
+#ifndef XEN__KIMAGE_H
+#define XEN__KIMAGE_H
 
 #define IND_DESTINATION  0x1
 #define IND_INDIRECTION  0x2
@@ -55,7 +55,7 @@ int kimage_build_ind(struct kexec_image *image, mfn_t ind_mfn,
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* __XEN_KIMAGE_H__ */
+#endif /* XEN__KIMAGE_H */
 
 /*
  * Local variables:
-- 
2.34.1



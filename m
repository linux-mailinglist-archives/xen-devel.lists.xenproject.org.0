Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F479877E0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 18:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805751.1216954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strlC-0001cE-24; Thu, 26 Sep 2024 16:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805751.1216954; Thu, 26 Sep 2024 16:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1strlB-0001Vm-U8; Thu, 26 Sep 2024 16:54:33 +0000
Received: by outflank-mailman (input) for mailman id 805751;
 Thu, 26 Sep 2024 16:54:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukdd=QY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1strlA-0001SU-Hb
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 16:54:32 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 001742f4-7c28-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 18:54:31 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso231486066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 09:54:31 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2979e00sm16981566b.158.2024.09.26.09.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 09:54:29 -0700 (PDT)
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
X-Inumbo-ID: 001742f4-7c28-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727369671; x=1727974471; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyQZLVu1mMzTaGyKX8oda+NFy3jMOBImmEzHcbevgZ0=;
        b=PB8EpGCXAXXY7Yv7vp9W75XsX0eSCfdE5A8/mRX9zh628uc6bDJRV7ATEEUu3uKmIn
         3CP0UeojdDB20q1BoOkaYJ+nTSvug43Efcvc6w981oaAjsCjVFCreES2oZCSsC6K17og
         l7VkC3uNDxIQdkr/uFf3sHwjNSp/zAzOYBzfvKoavuPUEkN8fjSi521fhwD8YGAbmxnG
         OWiybuYZIfYHRJBjxbshMaCdJudGgSRi+sO42sFNZ6VghQwyluZ9egyti6j2dcd37nCI
         YxHAv3uewwApSyUpB7lYKVCO8OkhZO6GqzEfSsaRZKjsEmP3buzKgyXQrVEvOOBzLwZT
         8SUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727369671; x=1727974471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyQZLVu1mMzTaGyKX8oda+NFy3jMOBImmEzHcbevgZ0=;
        b=U0KEtVneaTLxtoKHhjfTmrqaI0EqRji9kUpWIX0hSmfSPvvIIjZKiP3I1Ct2OWWX44
         YsSphUr9LhzuUSCfzDlUwqM7f11GIpS7BrysqUPx3VmeiNZUqU1a7Vbtcwy5WxRqkK2o
         a9gqeO8Wdn9+wdmJjuT1GjK+gXSLbIEtG5a3/HOB0Bnptg1J2BWQS/kVL/cifKadGjtl
         E4snBZDvePKEODZdSzz7RJ2FKOZtUZ+1F5w9uE5ipl3FRZxOqyp/Xpn9Hve8d6+rFZNf
         GTrNrlwYeTxwSgiGN6zdpfUHS/zsLTxfChNdrvre9z5wcn3ek4oyFV5TGFwpiWOa9m+G
         aT6Q==
X-Gm-Message-State: AOJu0Yxd9LqxJAItrNw4nV66bH16HyEAtFF1YYKBlEIczuWXibLDChEs
	nKOCNtDDIaYpMRLXzJqBDvBqsB+FJFoU+ZkeED+K7/rvUsUjXtheuH/bTg==
X-Google-Smtp-Source: AGHT+IGO7LzsF8sL7T87A5FWyFu7zhWF2lc2XGmHrBVsJ9IfeJqByhupnamafALDKTWao2T7nT6fTg==
X-Received: by 2002:a17:906:4fd2:b0:a7a:afe8:1013 with SMTP id a640c23a62f3a-a93c3094cbbmr61577066b.1.1727369670418;
        Thu, 26 Sep 2024 09:54:30 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 1/6] xen: introduce SIMPLE_DECL_SECTION
Date: Thu, 26 Sep 2024 18:54:20 +0200
Message-ID: <413dfb16280c3ec541df8775d31902a4b12a64fe.1727365854.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727365854.git.oleksii.kurochko@gmail.com>
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce SIMPLE_DECL_SECTION to cover the case when
an architecture wants to declare a section without specifying
of load address for the section.

Update x86/xen.lds.S to use SIMPLE_DECL_SECTION.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - new patch
---
 xen/arch/x86/xen.lds.S    | 6 ++++--
 xen/include/xen/xen.lds.h | 6 ++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index b60d2f0d82..9275a566e1 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -3,6 +3,10 @@
 
 #include <xen/cache.h>
 #include <xen/lib.h>
+
+#ifdef EFI
+#define SIMPLE_DECL_SECTION
+#endif
 #include <xen/xen.lds.h>
 #include <asm/page.h>
 #undef ENTRY
@@ -12,9 +16,7 @@
 
 #define FORMAT "pei-x86-64"
 #undef __XEN_VIRT_START
-#undef DECL_SECTION
 #define __XEN_VIRT_START __image_base__
-#define DECL_SECTION(x) x :
 
 ENTRY(efi_start)
 
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 24b8900ffe..8135732756 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -5,6 +5,8 @@
  * Common macros to be used in architecture specific linker scripts.
  */
 
+#ifndef SIMPLE_DECL_SECTION
+
 /*
  * Declare a section whose load address is based at PA 0 rather than
  * Xen's virtual base address.
@@ -15,6 +17,10 @@
 # define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
 #endif
 
+#else /* SIMPLE_DECL_SECTION */
+#define DECL_SECTION(x) x :
+#endif
+
 /*
  * To avoid any confusion, please note that the EFI macro does not correspond
  * to EFI support and is used when linking a native EFI (i.e. PE/COFF) binary,
-- 
2.46.1



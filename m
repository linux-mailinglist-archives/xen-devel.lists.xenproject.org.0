Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEB097C57C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 10:01:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800547.1210480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srC5b-0008RO-Ep; Thu, 19 Sep 2024 08:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800547.1210480; Thu, 19 Sep 2024 08:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srC5b-0008O8-BT; Thu, 19 Sep 2024 08:00:35 +0000
Received: by outflank-mailman (input) for mailman id 800547;
 Thu, 19 Sep 2024 08:00:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1exg=QR=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1srC5a-00089b-6b
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 08:00:34 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f2bcf75-765d-11ef-a0b8-8be0dac302b0;
 Thu, 19 Sep 2024 10:00:33 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d43657255so75177166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2024 01:00:33 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b3833sm686196966b.128.2024.09.19.01.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 01:00:32 -0700 (PDT)
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
X-Inumbo-ID: 3f2bcf75-765d-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726732833; x=1727337633; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LC8M6s/MVpQRIQSwMvY2TOhq+jsgpFyl0gaX8hEkFeg=;
        b=Bqxnlq65gXEBY8AvxRAWX5V7JSmWJl24yDTY1v2oEnc3gf0Z+kxpvNPDtpDczd8Nid
         zUrq9bjh/YrXdkN601hc3JKQi/X8H2u8o6MgzfnpxENszxcdSGs96oZCfVAPJMj0IygD
         ydnIIkTT9ywWtBDgbY2wnfBPDuw8yupIrtaBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726732833; x=1727337633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LC8M6s/MVpQRIQSwMvY2TOhq+jsgpFyl0gaX8hEkFeg=;
        b=DaxWU7x/PpnFr4Za3K1nQGGnooCq+6ZjJuO4WCiAtCLvRVQQLOELGscqqk6HPGHXGx
         XiJMJ10o4OdgoI6SV1JhK73p9WMaLs1QNxO0pzFAMEXvP2LFfflNhrNmVziWrvdC2+Av
         QMyep97FEprrkjp7OmZlojHYvjRvNnkN/o/BtwFjiAEyzSlSag6Gucn/uK3SufINhx8p
         dIAZQoesrswjPa6Skr0isNtJzm8sf13k8cqcFNHfGSH3AfZfDmNe+sM0YIFV40DZX+W7
         3F379b9sVRMdIhzWsVraysW+B3W4pI1ECQ5g2m43rG0GyHvFPqWtoQMN+zFlocr40HRr
         7NEw==
X-Gm-Message-State: AOJu0YytPkNmgd07tecADuyA49Sbe3htdCjhtPy/HeeSHbQWA2SDef1O
	hKuIa8mqWAkk1eGrt2xSEtutU2iV3qmm+SgI8FDuWcqi7A9+yr5ZZv/YMjAvNPzEoTl6YbzJ8lN
	W
X-Google-Smtp-Source: AGHT+IGOsZNYCuv/0HbieXRUQDMoMUEOCgm6cKCkRH3yQfSv2nuJkEEBFPCrsnP8EALdPW7R9A9HHA==
X-Received: by 2002:a17:907:60cd:b0:a7a:9144:e23a with SMTP id a640c23a62f3a-a904804371dmr1973443666b.43.1726732832925;
        Thu, 19 Sep 2024 01:00:32 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 3/3] x86: Align output sections for UEFI CA memory mitigation requirements
Date: Thu, 19 Sep 2024 09:00:21 +0100
Message-Id: <20240919080021.20155-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919080021.20155-1-frediano.ziglio@cloud.com>
References: <20240919080021.20155-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All loadable sections should be page aligned.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/xen.lds.S | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index b0b952dd9c..ef446e0a71 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -208,6 +208,10 @@ SECTIONS
 
   } PHDR(text)
 
+#ifdef EFI
+  /* align to satisfy UEFI CA memory mitigation */
+  . = ALIGN(PAGE_SIZE);
+#endif
   DECL_SECTION(.init.data) {
        *(.init.bss.stack_aligned)
 
@@ -262,6 +266,10 @@ SECTIONS
        __ctors_end = .;
   } PHDR(text)
 
+#ifdef EFI
+  /* align to satisfy UEFI CA memory mitigation */
+  . = ALIGN(PAGE_SIZE);
+#endif
   DECL_SECTION(.init.trampoline) {
        *(.init.trampoline)
   } PHDR(text)
-- 
2.34.1



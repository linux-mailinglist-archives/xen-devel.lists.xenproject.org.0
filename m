Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 949C397C57F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 10:01:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800549.1210494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srC5c-0000JD-Vi; Thu, 19 Sep 2024 08:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800549.1210494; Thu, 19 Sep 2024 08:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srC5c-0000D2-QZ; Thu, 19 Sep 2024 08:00:36 +0000
Received: by outflank-mailman (input) for mailman id 800549;
 Thu, 19 Sep 2024 08:00:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1exg=QR=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1srC5b-00089h-8t
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 08:00:35 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e84af72-765d-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 10:00:32 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c42bd0386cso700801a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2024 01:00:32 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b3833sm686196966b.128.2024.09.19.01.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 01:00:31 -0700 (PDT)
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
X-Inumbo-ID: 3e84af72-765d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726732832; x=1727337632; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlJV860CHFIhZUFAaTj7LRdFO7tQVpGEeYCyJLyCLTE=;
        b=KoOHRS8F6HjQkAnSy8wJ64qoCiAuLg5lvxM5MvnVX/edg+uQqTF3FoUY1Y37+OeCjK
         r7Kt8F5U9kfNl4Dxncvg/9csMoxRpPOlbhnchWjvLajf1PVRZbHj83W8UsaStD2nZnqA
         JBl6gYoZjOzd+wMOY0HKgMK5Ori3CaJk+ruGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726732832; x=1727337632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlJV860CHFIhZUFAaTj7LRdFO7tQVpGEeYCyJLyCLTE=;
        b=KB+hDwkOh5/oyyRXB91sUSv/z31Y4jeH8nhBHf9GVKfaFSXK9uR0ZaaaMaQVQLwtkr
         yYKQ8WPtWfT5LvvjhYg5CdBSGpQfwv2sRsRz6SMpUqcnWVBjcx25w0RNYR1hkW78PBfg
         70mQahxDDo+9jdDb6g1ZmOrCYKrw00wV+M4LRzwuASozaSh86xdQ58bbNpRaI1wywlod
         IvbCZcfxMJot85Zn+hr4zJnBzycgZ5fu6wq2ThNxNgPpvpnnSUoqFMBCGU1tkkNAzqDY
         BTYgGOAGd9zG1lEJx2TKmvHHbDG3/Jio9z+zIwrOTFo7uUgkJh+x8OlGADyeDu9B9+62
         cMgQ==
X-Gm-Message-State: AOJu0Yy8B/btGBWvad93Sn8qut4j0efLaDKf121VhqYEgfILmd8JpsZ5
	5N8RhQo9cWvECnTTA9ftw6GaTaLdL5iGaVd7faho7J+KEeZx01Tm+OaI+AtToABFPyGQvmN0mu3
	3
X-Google-Smtp-Source: AGHT+IFuM1neyyvkiv8/7X9CBi7JjqlypIO++ycMpb0mRa3IK/kvKtWpocgbbS+asR8PGMc1YflBag==
X-Received: by 2002:a17:906:794d:b0:a8b:154b:7643 with SMTP id a640c23a62f3a-a90295a2e51mr2608125366b.28.1726732831744;
        Thu, 19 Sep 2024 01:00:31 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 2/3] x86: Split output sections for UEFI CA memory mitigation requirements
Date: Thu, 19 Sep 2024 09:00:20 +0100
Message-Id: <20240919080021.20155-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919080021.20155-1-frediano.ziglio@cloud.com>
References: <20240919080021.20155-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split code and data to satisfy W^X requirement.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/xen.lds.S | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 22fb7d8458..b0b952dd9c 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -194,11 +194,7 @@ SECTIONS
   __2M_init_start = .;         /* Start of 2M superpages, mapped RWX (boot only). */
   . = ALIGN(PAGE_SIZE);             /* Init code and data */
   __init_begin = .;
-#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
-  DECL_SECTION(.init) {
-#else
   DECL_SECTION(.init.text) {
-#endif
        _sinittext = .;
        *(.init.text)
        *(.text.startup)
@@ -210,12 +206,9 @@ SECTIONS
         */
        *(.altinstr_replacement)
 
-#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
-       . = ALIGN(SMP_CACHE_BYTES);
-#else
   } PHDR(text)
+
   DECL_SECTION(.init.data) {
-#endif
        *(.init.bss.stack_aligned)
 
        . = ALIGN(POINTER_ALIGN);
-- 
2.34.1



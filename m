Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B627EB273
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:38:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632620.986893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uYs-0004j6-M9; Tue, 14 Nov 2023 14:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632620.986893; Tue, 14 Nov 2023 14:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uYs-0004gF-Iq; Tue, 14 Nov 2023 14:38:42 +0000
Received: by outflank-mailman (input) for mailman id 632620;
 Tue, 14 Nov 2023 14:38:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uYr-0003vI-CM
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:38:41 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80fed492-82fb-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 15:38:40 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9ae2cc4d17eso851790866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:38:40 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 j2-20020a170906094200b009ad7fc17b2asm5613097ejd.224.2023.11.14.06.38.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:38:40 -0800 (PST)
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
X-Inumbo-ID: 80fed492-82fb-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972720; x=1700577520; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBdIXHGvx5/0R2xC8Q+GilhuZtCQOtnJ9hpGFyppJEE=;
        b=VfrsxR0BlBurVaHJ2Y5Iwqs2Y84fBd/VZRQCgMebzbhGTkhHdXqBTtqt17aXU1E8Cg
         ruN/+VH+iKd6Zqs/y+UWyz7zvR8PciuJ/MZeFoJ4Usa6NQ0cXaV7Cbl3XwTFuWj1nzV/
         FaRZ20NXSeMJ3xBZsg7zqa3Ze9D2B3QFpT/41BKwsnimQldIlmfpZih1MqqUB/L+bmE4
         mxrBS2D9OTH+XxLN9IaqcWZVOYVAQBAJ/CqD2Tw3jBku5AHs5iWAI42xb152MrZYMgyL
         EB1TaSuEGHjMebeAL/1RB7G/z5phTYqe8xku/KpVYFXORyIpZbjHonOxUwo7Z5Bq8fqP
         IxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972720; x=1700577520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBdIXHGvx5/0R2xC8Q+GilhuZtCQOtnJ9hpGFyppJEE=;
        b=COPJUGP2sxffgimmf8e2ETn2SE7L4ExawWGIDlUvl4GvM5JlOYZpVDZv6rLYLvTWiR
         +/iQ8uUK+SlxUGpYU6ujardlgHktLwxPL16RM4ROzNE2wO3mTmyoqMm17ye8nr2ft/DN
         oQG1zpEKrnTJ4/ks8OouyO+VTWNuCCyvuL/5XWCiSkNky5xNlIuYCSjh3nWHIlC25yXf
         10k0N9/t7QdaF8ZEIO/MWkAP+EvEBpLt1EDy8JjgDD5TV108mVIJoCb4cVXA7sDytoyy
         1EVe6BgmhvRdMmnW2My1MUCZM7STXGzHcKvh93JvtuuvnrTdEKB4XhgQayf/apJkdS6J
         4Pog==
X-Gm-Message-State: AOJu0YxM3pVYm6bDmf/wkZZtOficNnftunrlUsTp4f151fGjT4G2yhnn
	lYA799pfD4nUslhTrw44I+1+zJfmbTJIkPgIHis=
X-Google-Smtp-Source: AGHT+IFii/vTCRNAFXoxhgp7tKdZ5NzaA4D0hMTO7kCC4hnZ5p3PauJ+Zda1OHH5OQndb4HCu48Kbw==
X-Received: by 2002:a17:906:6b97:b0:9d2:e2f6:45b2 with SMTP id l23-20020a1709066b9700b009d2e2f645b2mr7411114ejr.71.1699972720502;
        Tue, 14 Nov 2023 06:38:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 v2 03/19] sysemu/xen-mapcache: Check Xen availability with CONFIG_XEN_IS_POSSIBLE
Date: Tue, 14 Nov 2023 15:37:59 +0100
Message-ID: <20231114143816.71079-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"sysemu/xen.h" defines CONFIG_XEN_IS_POSSIBLE as a target-agnostic
version of CONFIG_XEN accelerator.
Use it in order to use "sysemu/xen-mapcache.h" in target-agnostic files.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/sysemu/xen-mapcache.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/xen-mapcache.h b/include/sysemu/xen-mapcache.h
index c8e7c2f6cf..10c2e3082a 100644
--- a/include/sysemu/xen-mapcache.h
+++ b/include/sysemu/xen-mapcache.h
@@ -10,10 +10,11 @@
 #define XEN_MAPCACHE_H
 
 #include "exec/cpu-common.h"
+#include "sysemu/xen.h"
 
 typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
                                          ram_addr_t size);
-#ifdef CONFIG_XEN
+#ifdef CONFIG_XEN_IS_POSSIBLE
 
 void xen_map_cache_init(phys_offset_to_gaddr_t f,
                         void *opaque);
-- 
2.41.0



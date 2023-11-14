Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67FE7EB26E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632619.986883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uYm-0004Kx-EX; Tue, 14 Nov 2023 14:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632619.986883; Tue, 14 Nov 2023 14:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2uYm-0004Ix-AT; Tue, 14 Nov 2023 14:38:36 +0000
Received: by outflank-mailman (input) for mailman id 632619;
 Tue, 14 Nov 2023 14:38:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uYk-0003vI-V7
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:38:34 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d282fe8-82fb-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 15:38:34 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-545ed16b137so8048513a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:38:34 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 ha17-20020a170906a89100b009dd8473559dsm5543525ejb.110.2023.11.14.06.38.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:38:33 -0800 (PST)
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
X-Inumbo-ID: 7d282fe8-82fb-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972714; x=1700577514; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7OOTLwbh53U5+FgsPEU5EGeXSv4SaNpAAr4X/+o3UA=;
        b=Zx4iGlb/hwXpGeAFtoNCjTotHy//WhwBt/kIXlOjCEwXomxHfYFqAkVx21n62olVfJ
         x/WyOlFu+GasSC/OyfaDXo9q+69t0FEBd8wdR89Clet5dnY4lHyH4xsDUm75V5Z2nAbR
         jTVERu5OAesS3UMkgDkQzkeGwj05q2jKNuT8qA0s7OWlqRfvZRRKcJO7Gd2rrpHjVBFA
         MHlFz/Cvuzw3JLUMdMxPyWlWkiJwaaCRVoBLN5uWnbMopnI/vTNmwCKBDjbig6BHreNt
         GgEsoXf56ayZlT18o7u0qDJabAVhYkWFWg3GxvyZX7zW+jK/naJvbjTb7XPANmFJ5MBE
         TpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972714; x=1700577514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7OOTLwbh53U5+FgsPEU5EGeXSv4SaNpAAr4X/+o3UA=;
        b=Z3zNDq5r0oGHcU7EwBzvBbvA/vXoFCJixVeYmyUjKVyB2nNI/KI+iZF9b5amD7L+ZI
         PBEe59Zfw6uZCbq1xDLou65jnPCJhwPbLYW6ZjpaPw0/D1678K6EMa9xBcaJSLV2lJFH
         OX1AovNvxLnZe/I2h1PuNyt11UcUaZJzCZgHROkuAhF6uEJokS72TYZFao38Ol6CNQ7J
         IfeV4wo7BzRBQvpyKcjkV+wK4jeCNH6lTCmhIH6CE6jmychkYrW16z8sGF1mOLO8NrqU
         bu38qNajR7/rKICk9eRbMcYm3I9sFmoXlZvmWXDAwPYWVwizxpUVL4h0WoZmEdFPpnUD
         u5sw==
X-Gm-Message-State: AOJu0Ywy4GwWFrG/5cNonjqdAYLe3EqcZgxCegcfOh059aC5uBpC4Kze
	jESJD5iv0O6EnqSbCZhpmMUlLQ==
X-Google-Smtp-Source: AGHT+IELhzs9bxNKpuVpMav1CIPsLfztJ8ibvFnuauNtaNuW/pX7cLT4uf7lQThdsPSioUMrMZEBQA==
X-Received: by 2002:a17:906:ca5b:b0:9be:30c2:b8ff with SMTP id jx27-20020a170906ca5b00b009be30c2b8ffmr7193715ejb.61.1699972713904;
        Tue, 14 Nov 2023 06:38:33 -0800 (PST)
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
Subject: [PATCH-for-9.0 v2 02/19] sysemu/xen: Forbid using Xen headers in user emulation
Date: Tue, 14 Nov 2023 15:37:58 +0100
Message-ID: <20231114143816.71079-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen is a system specific accelerator, it makes no sense
to include its headers in user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/sysemu/xen.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
index bc13ad5692..a9f591f26d 100644
--- a/include/sysemu/xen.h
+++ b/include/sysemu/xen.h
@@ -10,6 +10,10 @@
 #ifndef SYSEMU_XEN_H
 #define SYSEMU_XEN_H
 
+#ifdef CONFIG_USER_ONLY
+#error Cannot include sysemu/xen.h from user emulation
+#endif
+
 #include "exec/cpu-common.h"
 
 #ifdef NEED_CPU_H
@@ -26,16 +30,13 @@ extern bool xen_allowed;
 
 #define xen_enabled()           (xen_allowed)
 
-#ifndef CONFIG_USER_ONLY
 void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
                    struct MemoryRegion *mr, Error **errp);
-#endif
 
 #else /* !CONFIG_XEN_IS_POSSIBLE */
 
 #define xen_enabled() 0
-#ifndef CONFIG_USER_ONLY
 static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
 {
     /* nothing */
@@ -45,7 +46,6 @@ static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
 {
     g_assert_not_reached();
 }
-#endif
 
 #endif /* CONFIG_XEN_IS_POSSIBLE */
 
-- 
2.41.0



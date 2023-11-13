Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E917E9FC7
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631691.985285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Ykg-0006Jq-Fh; Mon, 13 Nov 2023 15:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631691.985285; Mon, 13 Nov 2023 15:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Ykg-0006HR-CI; Mon, 13 Nov 2023 15:21:26 +0000
Received: by outflank-mailman (input) for mailman id 631691;
 Mon, 13 Nov 2023 15:21:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DPbO=G2=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2Yke-0005il-Ty
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:21:24 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e8d3b90-8238-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 16:21:24 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9e62ab773f1so450000066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 07:21:24 -0800 (PST)
Received: from m1x-phil.lan ([176.164.221.204])
 by smtp.gmail.com with ESMTPSA id
 dx15-20020a170906a84f00b009adcb6c0f0esm4204593ejb.193.2023.11.13.07.21.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Nov 2023 07:21:23 -0800 (PST)
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
X-Inumbo-ID: 4e8d3b90-8238-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888884; x=1700493684; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0n+efnCwqYZSgvX5xA6BN1n520F2bZNMKVl3gVhASA=;
        b=Fj6N6HceDCT5lmsTGLuL8jOKrWVDWDB/6msLjIH/8VMWntJ3ljGFdugMW/6Dop+kBm
         ReiY9Cn8iKzS4fK1Tq4TWBJ40HVwZuT/fuWtYyGPJwoebZqF5GDElNJ4nmV5Cgy4g+t9
         6pyjXIzRMNLgq9Hy9Zuqv3VyjDFK4ao3mA8j5RwtU5oG3iKKGG97E/i41mRjRr2Spx5A
         pxai4ZqCar5KXY/6cOOvS1FV1miFPUnDYN7WRrqWpZpQCO5LSGh0DcFcDKODgZ2kukmw
         v+hyGavTZwFSMVzEqDWhimIAYnMV02mWts0k3VWK9gnjFYL/wNtvTwLZ+Z1NCOekjlGI
         drhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888884; x=1700493684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0n+efnCwqYZSgvX5xA6BN1n520F2bZNMKVl3gVhASA=;
        b=rx+ijbGuRI7Nvu9y4T/l/rkTHb+86SFz7SRKNp6sxCuss5dutHYBHmk79weOM7Sra6
         qeIEZom8x6VJt8EUaNFRduhZDjgSkGI/FUIMizqfflQ9+Z5hW+mw7MZtxuHYl4koEHeD
         jX9FQPcj7YWOJfivwi0PjrPwB1LlE7k9eh/JoGIdlsqpmIjw4WQ+t0Nb3uscD/2s6zvQ
         OqIow2ur2HkJhnCj3QjC4IMwr2YixNiYA2oxVW2dGTNKOqTHItkZ63/zHMk2RIGASBkh
         LUgLp9EIaVWErbD60rThUbS6PWkGcrGDCO9v4pzcdd6eGLdqQrwzWAxwoc6eVC0vB+YT
         a17w==
X-Gm-Message-State: AOJu0YyN4HF8svXnd3f2KrjLcCdUKwQC/0R1kVil2x6Up7CtXgKARLbI
	YYIoNhXMF5h5MnmWfydeehZ2Gw==
X-Google-Smtp-Source: AGHT+IH6xxb8oSsdvX/Qxe7SX73ROr6di4a0tnTAF45WIy9EC8KmTSkElWDjJsGSvtz6GSstCFLdyw==
X-Received: by 2002:a17:906:4c84:b0:9cb:5a8a:b19d with SMTP id q4-20020a1709064c8400b009cb5a8ab19dmr4350360eju.5.1699888883852;
        Mon, 13 Nov 2023 07:21:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 01/10] sysemu/xen: Forbid using Xen headers in user emulation
Date: Mon, 13 Nov 2023 16:21:04 +0100
Message-ID: <20231113152114.47916-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen is a system specific accelerator, it makes no sense
to include its headers in user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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



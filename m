Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7248C792284
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 14:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595653.929253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdV45-0001iv-4N; Tue, 05 Sep 2023 12:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595653.929253; Tue, 05 Sep 2023 12:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdV44-0001gC-VI; Tue, 05 Sep 2023 12:21:52 +0000
Received: by outflank-mailman (input) for mailman id 595653;
 Tue, 05 Sep 2023 12:21:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddRg=EV=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qdV42-0000wD-Ql
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 12:21:50 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca0faf5e-4be6-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 14:21:50 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bd0d19a304so39825711fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Sep 2023 05:21:50 -0700 (PDT)
Received: from localhost.localdomain ([37.69.27.38])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c1c1600b00402be2666bcsm12497901wms.6.2023.09.05.05.21.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Sep 2023 05:21:49 -0700 (PDT)
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
X-Inumbo-ID: ca0faf5e-4be6-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693916509; x=1694521309; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fom2vgYtrw2N7/lqmr4BnBWCA2ps570z0kqcY4sB1MA=;
        b=ck71Hs7ixqPkjiOaa5EbuK0QCCHF4QhJSwo9WilH9lHmaF1lYw/xBMtSVCUjL/cCaO
         P3fetjDX/IHfff5XGA3kHj+7LrZqt+eCYg5++FKtc8va80toaDlsJfiACJJXno1cGE9F
         mCfCQxql0/M1kfar9Y6alPvB281YaNgJPGF96/lirYh5eCIVKoBalkcUbOrNcYUeWyl9
         9ekGwpodTLjhYAJEzzLbvCplEMueresgzXeuxMOVVzVazodIdfe58DdQSW32Nc6m2csh
         DrR0NI2d8NPOdysJa/l3JegKOVwA3NaGlLqN8704IN8gXRg+dyfIFGS96alpjTYqbBum
         yRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693916509; x=1694521309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fom2vgYtrw2N7/lqmr4BnBWCA2ps570z0kqcY4sB1MA=;
        b=YP2pxZbAMfg7fIT7Uo8IRJfrOXVMG47LYrjLLLq8C7T5eRY3aoGZ9aWZPlFJe2q2Ny
         sTWAz+LeB5+ykCMDLTnRwAycls0JUjYWqGsdB9aONrvpiS8cKj/Oj1/MzvQly5DKoTZD
         gy1dMc2NqWg1J7NjTD5k3PAQIPZKcQiACo2v95QF8ueTWEelncdovFUy6Ocz7Dn5i8ra
         lHTZX8b8YxecTnxGMUW5cRbGnWA47PD7kFPJBrt6cJJRKolsHILKc+mLwVOBjpiWU0kG
         cKBRuVkcGnK+D4ge+MKRu4o056WbqAagEMx2MoS8zSt80Wu+KfsuDEvknwe8Q7z6mXlQ
         vYvQ==
X-Gm-Message-State: AOJu0YxRqbgVEiy0g8RgKP3s39yCwARNU3XB0A0TFoUC5CbGqjyKNssU
	Lo5nKIS9ou3Ei+K5Xx952gFKJw==
X-Google-Smtp-Source: AGHT+IGMdsgf/s9WMe8CesBc8Ve0lvCwfg45DPh1IToTH7tHvHwDiyDho3ZmRnkrYkRDDX1PPf9pqQ==
X-Received: by 2002:a2e:b045:0:b0:2bc:df55:eec7 with SMTP id d5-20020a2eb045000000b002bcdf55eec7mr9131145ljl.40.1693916509654;
        Tue, 05 Sep 2023 05:21:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/3] sysemu/xen: Remove unuseful CONFIG_USER_ONLY header guard
Date: Tue,  5 Sep 2023 14:21:40 +0200
Message-ID: <20230905122142.5939-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905122142.5939-1-philmd@linaro.org>
References: <20230905122142.5939-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In commit da278d58a0 ("accel: Move Xen accelerator code under
accel/xen/") we used include/sysemu/kvm.h as a template for
include/sysemu/xen.h, using the CONFIG_USER_ONLY header guard.
In retrospective, it is not used / useful, so remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/xen.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
index bc13ad5692..9b2d0b21ff 100644
--- a/include/sysemu/xen.h
+++ b/include/sysemu/xen.h
@@ -26,16 +26,14 @@ extern bool xen_allowed;
 
 #define xen_enabled()           (xen_allowed)
 
-#ifndef CONFIG_USER_ONLY
 void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
                    struct MemoryRegion *mr, Error **errp);
-#endif
 
 #else /* !CONFIG_XEN_IS_POSSIBLE */
 
 #define xen_enabled() 0
-#ifndef CONFIG_USER_ONLY
+
 static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
 {
     /* nothing */
@@ -45,7 +43,6 @@ static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
 {
     g_assert_not_reached();
 }
-#endif
 
 #endif /* CONFIG_XEN_IS_POSSIBLE */
 
-- 
2.41.0



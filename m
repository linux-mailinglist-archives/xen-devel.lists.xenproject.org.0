Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F33792285
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 14:22:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595655.929262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdV4C-00026l-E7; Tue, 05 Sep 2023 12:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595655.929262; Tue, 05 Sep 2023 12:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdV4C-00024A-BP; Tue, 05 Sep 2023 12:22:00 +0000
Received: by outflank-mailman (input) for mailman id 595655;
 Tue, 05 Sep 2023 12:21:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddRg=EV=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qdV4A-0000wD-S1
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 12:21:58 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cef0c38c-4be6-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 14:21:58 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31c479ede21so2167621f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Sep 2023 05:21:58 -0700 (PDT)
Received: from localhost.localdomain ([37.69.27.38])
 by smtp.gmail.com with ESMTPSA id
 bp5-20020a5d5a85000000b0031f07d1edbcsm14680949wrb.77.2023.09.05.05.21.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Sep 2023 05:21:54 -0700 (PDT)
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
X-Inumbo-ID: cef0c38c-4be6-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693916515; x=1694521315; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzxK/xbqt7oVpzvsNE0mB2t8RXiKOYU8OLm+TL14vNw=;
        b=N0i0yfEEbsmUkpTa1E44uiuVksl9e1A5b3rfK08X6RqLTI1DAMpnVrubYQ/bMRTB0D
         cDAWp5dOpl5vN/F3YqOMbwmKZwylLMcDCxBNBKQFKU1O8W6lXbadZtUZDva3HW9JhEOE
         oDxtlsdbQKjQmBOoN063yXcmAnEgY2qVPqoMNXZDsINvutuHLla0cZPw7nzbs7WYCx8d
         RV7Jo1XqRjP/Uk+qofjPPnbfpJUdUmKTFNJ9uQAuuAsPPXeDtNY1jr3B1eH0t1VD0IxL
         iDlaS0SGNpAjSNF+yx2FAKJ5WQi51v62FCAMr1lZsdhKT9Xd84cdBDh+rIOvL5zQ7PP/
         UXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693916515; x=1694521315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzxK/xbqt7oVpzvsNE0mB2t8RXiKOYU8OLm+TL14vNw=;
        b=dsvI0rCzwAdmEonBLHJd0LvrcxI48i+tr/SB2BYgiIxVqjhkdOv008zjGUkUN9v9xV
         qOJObH/c9t5drY+q5pZIjToPTgtw1G0xErJ68QQ8OWEGciBH0VIVzEbUhCbiUASH0eeT
         Nnjb4lj4Mxr91hBLf8hvAKcoe7j0eAEhJ7asKeH2pEW7c+bcr1DX7MLAj23tmvbC2O+c
         T4XOIP4paKBAZX6lbYyDDJ8WQLT8oAPN0+JaAybxldsQ7k1WIKFh/GBcA4kPrdn2/sgk
         wYEcX1UDmRj77gy9GLjOancq0q2EtlH2GphOvtng+BfN5k0xLSc2sr40E8HIjXycRjUc
         UGPg==
X-Gm-Message-State: AOJu0YzfccbpI8+iJtKGK1P851Lm0AQaeLTHyYP6BihrZEXOsi6amwaO
	vXAQRENa/y+G7BaKZ9rTk0ai8g==
X-Google-Smtp-Source: AGHT+IHbz5YkYNFi6ne5hl8VA0Ok/qvzggQRihAZp+7XxeX9TpfDtJE/W1Zlywnx0kt8k7q4Mg47Ow==
X-Received: by 2002:a5d:56c7:0:b0:314:3a3d:5d1f with SMTP id m7-20020a5d56c7000000b003143a3d5d1fmr9789209wrw.19.1693916514769;
        Tue, 05 Sep 2023 05:21:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/3] sysemu/xen: Remove unreachable xen_ram_alloc() code
Date: Tue,  5 Sep 2023 14:21:41 +0200
Message-ID: <20230905122142.5939-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905122142.5939-1-philmd@linaro.org>
References: <20230905122142.5939-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The xen_ram_alloc() call in softmmu/physmem.c is guarded
by checking for xen_enabled(), which evaluate to 'false'
when XEN is not built in. The compiler elide the function
call, and thus the inlined function is not used. Remove it.

Inspired-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/xen.h | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
index 9b2d0b21ff..1f797a9abe 100644
--- a/include/sysemu/xen.h
+++ b/include/sysemu/xen.h
@@ -27,8 +27,6 @@ extern bool xen_allowed;
 #define xen_enabled()           (xen_allowed)
 
 void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length);
-void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
-                   struct MemoryRegion *mr, Error **errp);
 
 #else /* !CONFIG_XEN_IS_POSSIBLE */
 
@@ -38,12 +36,10 @@ static inline void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
 {
     /* nothing */
 }
-static inline void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
-                                 MemoryRegion *mr, Error **errp)
-{
-    g_assert_not_reached();
-}
 
 #endif /* CONFIG_XEN_IS_POSSIBLE */
 
+void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size,
+                   struct MemoryRegion *mr, Error **errp);
+
 #endif
-- 
2.41.0



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AFD877385
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 20:23:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690969.1076667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2HF-0000cM-BA; Sat, 09 Mar 2024 19:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690969.1076667; Sat, 09 Mar 2024 19:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2HF-0000ai-8A; Sat, 09 Mar 2024 19:22:37 +0000
Received: by outflank-mailman (input) for mailman id 690969;
 Sat, 09 Mar 2024 19:22:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmSm=KP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rj2HD-0000Lp-9w
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 19:22:35 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 614e9094-de4a-11ee-a1ee-f123f15fe8a2;
 Sat, 09 Mar 2024 20:22:33 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a4604c8bd61so45581866b.2
 for <xen-devel@lists.xenproject.org>; Sat, 09 Mar 2024 11:22:33 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 sd21-20020a170906ce3500b00a45f3524ac3sm1161512ejb.118.2024.03.09.11.22.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:22:32 -0800 (PST)
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
X-Inumbo-ID: 614e9094-de4a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012153; x=1710616953; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXABjAaMhxHgVCCn4BlGHy0+qqoq0gDIyiPdTnOnZyc=;
        b=nPcRDCmZ1T2jOk7q0fXylebJDqvb13cUqGxZo8BL10LZ9daa+9J7fhQQHryzXPF5Pd
         RrkkvfcbBCXPRecf1+w4QzeupkbIsS+sPcbpdAIHrymO7dnDR57g42qeb3AR5yU8MowN
         NStnv9KC3DdC4MH3wXlRJj6wtKsAz3+MaEPrP81QRIwmq3MUiKPJSqR/LH+4MqJXXAKN
         4fy1cBqw60WkzJW62c5RntSfd1/zaz9j97iesz5BvOjc5+je4wuKAiURoaKserUYf6Wb
         vsfjYLKONtslnYSgxfbcKNYmJg9T6QXoc65YU+sWfpXdeN+cXJaJBPVuf91iz5BkzS1H
         Ke5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012153; x=1710616953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXABjAaMhxHgVCCn4BlGHy0+qqoq0gDIyiPdTnOnZyc=;
        b=XE7XCw4kYToKSJ0ITTLdBDgxQsWnDFUAE3EFgbn82S6ggjLg2F1p7nn/DiK5Z2Ym5E
         A/m7j0ulCXZIHN5Py+sJXE4tLgltytgAi9dfm8My5+JA6B+Zkxfhm8AcCDXqOipw2LOR
         xQg12j1BhbLjceu6NxlKoDfexc+ye234G6xfA0Z9EL3y+X3dzGZ9REXpiteKA7h20VRi
         5Sqjay8kjFG5+a3vcsqXRZXLnva+HdGpVQtwKdzwZRK6tmn5Pn79bxhu6A3FjRRrB8qG
         SneUwLjtqMOBbU6zddixK5p4QhOqr6BKq23ER7dCre8MnkF2lvlHJu8JH1SPyplfjAwP
         /T5g==
X-Forwarded-Encrypted: i=1; AJvYcCVZDG3hcKf2ELc7Qe7KfW40nDAIoFcgaBavtXGWpOzMZnDniCKuCu15ZknfrNFhMjmDjVR90EnbuFSThT4+OUh99GIl49mSR5VnvxB9aZw=
X-Gm-Message-State: AOJu0YzlTPJ8ICUre1QqLAwQIF8iLAu6yid/fKm5yWsv5tLwJlu4a6Vi
	oWEEkNKg2SvdPuuyZ5XnxLsKQwMeJqIxSYSpgqj23di4qmqXTkLN3A4Rre0+f2s=
X-Google-Smtp-Source: AGHT+IG1/vyvQGvmM09S/M6+IuzayHPuZieilQc2Rg23/rY/x2WN2KV9nhRWH7snP7zUoE6gG7SZXw==
X-Received: by 2002:a17:906:4f02:b0:a44:446b:e99e with SMTP id t2-20020a1709064f0200b00a44446be99emr1256763eju.31.1710012153357;
        Sat, 09 Mar 2024 11:22:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PULL 03/43] sysemu/xen-mapcache: Check Xen availability with CONFIG_XEN_IS_POSSIBLE
Date: Sat,  9 Mar 2024 20:21:30 +0100
Message-ID: <20240309192213.23420-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"sysemu/xen.h" defines CONFIG_XEN_IS_POSSIBLE as a target-agnostic
version of CONFIG_XEN accelerator.
Use it in order to use "sysemu/xen-mapcache.h" in target-agnostic files.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Message-Id: <20231114143816.71079-4-philmd@linaro.org>
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



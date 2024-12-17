Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 577BD9F4F05
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 16:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859299.1271432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNZG8-0006uX-SQ; Tue, 17 Dec 2024 15:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859299.1271432; Tue, 17 Dec 2024 15:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNZG8-0006rN-PQ; Tue, 17 Dec 2024 15:13:16 +0000
Received: by outflank-mailman (input) for mailman id 859299;
 Tue, 17 Dec 2024 15:13:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ1q=TK=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tNZG7-0006c0-B8
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 15:13:15 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f2c8657-bc89-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 16:13:13 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-385e1fcb0e1so2974749f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 07:13:13 -0800 (PST)
Received: from localhost.localdomain ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80162ddsm11384835f8f.37.2024.12.17.07.13.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Dec 2024 07:13:12 -0800 (PST)
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
X-Inumbo-ID: 6f2c8657-bc89-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734448393; x=1735053193; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FH/72suxrUOMAatoct7CthEOn0DQXdaIvd71YSiEkl8=;
        b=O+1iYhE5S5QxXTDTkArjshFQxaipY+fJw+RBQDG+1q317qF4VKyK1h6OQ3yuy3POMb
         5TqXq66FTMwZmk3lDGNqm2IoWBrCS/CrddTLx+HbCEuVc+WVksQHzZtBlJqEvvIkDD79
         VhaEpsZwonB1I0cIMRFJFqfDQAOMkSDzE0tBsKu5GVAUEi+Wb8mxVkuSghvDg6IRnWdQ
         tFntYyBIArjskZusRHIYDUQMt1BTTE8R2JMP1qAZidMz2zP4ZfoP3/lr5wmL2FQnkNPv
         18v9KZBvi2L+OgwgVc5UaEmVLMW/JW8AGkrsjdeVRJY3oSsp6tjbnigXkdAJGRod8Rkf
         y9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734448393; x=1735053193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FH/72suxrUOMAatoct7CthEOn0DQXdaIvd71YSiEkl8=;
        b=uhDMw9xKoRdaR7BpiLtwaepWvCQ4FIvRe59UHZ9/BNMmqN6tgPOPMRqnRFu6UyaTCd
         gZ9aDV6s0DdizaiWhQqP4YjWWJj9LC9lZjVZgVxsrjB8PRXVYybZQbgmbRHTe7AHU4MS
         P8yf7T0RzeLtQo4t4zUgYyW9+rn3Cd5jnxMX8ZYumvtiDp8Whg+NJFVOdd8Pq4OCSrkZ
         Goevq50ZaZY4bShiW9FdjMXhpOKaHUMXrt/xs9XiaR18PUVV3Maedt0xDgmNSKZDiRtm
         kIZhB7AzQdxjIqJRoAaIOGfIYyZOB1VXG3dwuo4XsxtneGnO8eFW/DsN5DhKOlbBOyWq
         JX2A==
X-Forwarded-Encrypted: i=1; AJvYcCUcUy+kATN8mi0uGcjsdqrLnbIFY4Kqj0z0ejrQSTjPpeQJ5A05LilTS2YCODrKuvYijm/8YxiJWkE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEZBtxVKGfI2VrCnHCz1sQ8f4YHzZbKjuZpdpVg99SpdQIjZhN
	q64rZ/Z6ib1zpVzByK48ULq2p5TJmLLglOjOaKWVczyEi1J+HsHalC8+N+2Yfc4=
X-Gm-Gg: ASbGncsiBfedCnlRt1rPyVitZ886sxN+qUan0Imfhf7RvP0LJdx5LhkAkdNqtLUHjwb
	foyJ/q00vyPgB6AVxFUpKTqtSYB2s4E9MstrUn+++ES298aHSVmFJtOwq34gfX6anwiZKpfgmPx
	E8nlAeqf3upmjcMjLeLiodx47W5d6heEnOMhRlq9pQ7CKr+BT55AiaxZ+BCSYQTMnR0IkXu4YwC
	Mzug8RwJdpEEuRm0G7LcOyuNpedFlsidaOFvsU8omkHRyGNzpaI5XwM9VVUZ6LBDd4pdV49qQFR
	vs8c
X-Google-Smtp-Source: AGHT+IE3RmiEs/P0yDnumj2ykAGCoV0c6wATPDpTgTGtoE5l2Mfa/4IktujX2VH2nZS0c49GlFQyYw==
X-Received: by 2002:a05:6000:4715:b0:385:e1e5:fff3 with SMTP id ffacd0b85a97d-388da5b7cc2mr3362824f8f.57.1734448392938;
        Tue, 17 Dec 2024 07:13:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Anton Johansson <anjo@rev.ng>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/3] hw/xen: Remove unnecessary 'exec/cpu-common.h' header
Date: Tue, 17 Dec 2024 16:13:03 +0100
Message-ID: <20241217151305.29196-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217151305.29196-1-philmd@linaro.org>
References: <20241217151305.29196-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Nothing requires definitions from "exec/cpu-common.h",
do not include this header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index ecb89ecfc14..e94c6e5a318 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -24,8 +24,6 @@
 #define __XEN_INTERFACE_VERSION__ 0x00040e00
 #endif
 
-#include "exec/cpu-common.h"
-
 /* xen-machine.c */
 enum xen_mode {
     XEN_DISABLED = 0, /* xen support disabled (default) */
-- 
2.45.2



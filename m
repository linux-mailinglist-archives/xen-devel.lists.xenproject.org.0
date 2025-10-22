Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5D0BFC59E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 16:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148150.1480340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZPF-0003sQ-15; Wed, 22 Oct 2025 14:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148150.1480340; Wed, 22 Oct 2025 14:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZPE-0003pM-UO; Wed, 22 Oct 2025 14:01:36 +0000
Received: by outflank-mailman (input) for mailman id 1148150;
 Wed, 22 Oct 2025 14:01:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vj3f=47=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vBZPD-0003oA-4M
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 14:01:35 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e5c4e6c-af4f-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 16:01:34 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-475c1f433d8so12743565e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 07:01:34 -0700 (PDT)
Received: from localhost.localdomain ([88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496cf3b51sm37114995e9.9.2025.10.22.07.01.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Oct 2025 07:01:31 -0700 (PDT)
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
X-Inumbo-ID: 9e5c4e6c-af4f-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761141694; x=1761746494; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HjNE4Xkg6Ebkq5X/NZT8seGp5EoTUwdTjpH6KQ8QUA=;
        b=cmWP+8HiMW+gMQYbyzsmixHWAZFjDIDK9BiCtDOJNasZWPJAV2YdcBMEPQSf6lRo37
         x9ql21bEejCHrsOlUV8cP1/SUsQQ6rAny98WlTgcc+TKMfaWNLDAIzQi4CQZ6dFL/Axe
         iXhAEJAcXkV2wKB0rQaVx06KjNobx1E+wOt5259tVeylTjSGjxOmCBq0lFucizrN3Jg7
         U7HeRTMOwkWzxPEyMWEJb+GWdYIJ3pMGoO5FGBGXxRZUyp0QEiwF+7fSd23jiYUZrk7Y
         cQdvz7YYkiTySIud8EjRYuPVjy5geIOgaT6dcEJ0myTWtIgt1os8I/gbFdHbMp/Xm6me
         iPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761141694; x=1761746494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HjNE4Xkg6Ebkq5X/NZT8seGp5EoTUwdTjpH6KQ8QUA=;
        b=OiVOK0oF4d7usiWs3JMeAV+tIyxmfMWWHc2SgoHMqgCo6jcipCMi5G95gW5Sbl24ze
         C7FXrGZJwGCf8Qg1B3/OQ1y/w2U36vL/mjBeLLVAAmQhEEscgMsJCLWUgdTtIg+Hih96
         ggOwYhX3aCKkpEzV7iw/IqZZYCmvGX8qofm2w6GLbSbtHAIOMy/ptM6TmfpruA3rMwrJ
         YhINaw17gy+BDC4mzXZ8x5XrIn0rNs7g7D3/mXKgJ+rGtEx8CbOjMZYqMNmZJ4EU4UIT
         cJ+knT64AP6KiW6vveVRcZuIn3a7hpvDh1mUWbX2poZ0yH/UKz9X+pDngXO08kP//FEa
         ZtKw==
X-Forwarded-Encrypted: i=1; AJvYcCXsB38KzVkLBJWHrJWhv2VrHFHRfBGEN1MsxvzD8D+8sA5plOBnhA4fGLOgcD04lUI5dixvwYafZI4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXTAGWXSjkmYl9Zo7ItRW8iQul21nHflXNpWPDb0OYpmRgGN76
	aolrhNbp8BlXezy2okN5uz9kxLSbNZvpcvAzRakwxISSxHVSxf9ZDZ/rP0kuJzraRYs=
X-Gm-Gg: ASbGncsM5xojJ0uU4/gYp2Vk3N8U9JB0t5ZLdhApJeI2MLZl0u+ksTLnEPITMpzwyhn
	hBntNKR2eWoj3jTjL8vksoFWIPup3Zse4WLRi78QdgGb6zHU8P0YXtadj2WPTJGPv/VdsqVxCfb
	LPBTVyE7B8P2BqwQXNZuDB7kTwzWLPT8eUpmSq4Y5znpsQkHGk9yNpL0+Zh7RjCIdbpXhA1UTj0
	f/qZ+oA4PjJa4E+vXAa1DpSkks9CTglOOeeI4w72xiO47dVG4Lv+iXR3xwMhFFaACxDQdcae86q
	ogp3J6WT+ISp+uNbsdndb+IrWMS9fqgpEq0MfJlDjtjIKmQhk1stZJfmRKk8G16UJnpeg/fjZqS
	HodaibD4bULYCfJkrm+Hii5IQyXBy0xOcccGeZxtKbEVr8QR86jHyWCi1lbIzeEHB+FKZU8ebb9
	NkTEDEX9IoPjp/BXAblV9skT9dwL2BuA==
X-Google-Smtp-Source: AGHT+IFQ7L4fBGIJoJXHNjn08SD4wzUmt9U1mWP674dDSbDfSAlvpQwuJQwgI77QmiqDAnGzdB8FEQ==
X-Received: by 2002:a05:600c:4511:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-47117907a5dmr135379745e9.21.1761141692085;
        Wed, 22 Oct 2025 07:01:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anton Johansson <anjo@rev.ng>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/3] hw/xen: Use BITS_PER_BYTE & MAKE_64BIT_MASK() in req_size_bits()
Date: Wed, 22 Oct 2025 16:01:11 +0200
Message-ID: <20251022140114.72372-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022140114.72372-1-philmd@linaro.org>
References: <20251022140114.72372-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace magic 8 by BITS_PER_BYTE, use MAKE_64BIT_MASK()
instead of open coding it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xen/xen-hvm-common.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 52e2cce397a..258014370e1 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -1,5 +1,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/bitops.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "exec/target_long.h"
@@ -448,12 +449,14 @@ static void cpu_ioreq_config(XenIOState *state, ioreq_t *req)
 
 static void handle_ioreq(XenIOState *state, ioreq_t *req)
 {
+    size_t req_size_bits = req->size * BITS_PER_BYTE;
+
     trace_handle_ioreq(req, req->type, req->dir, req->df, req->data_is_ptr,
                        req->addr, req->data, req->count, req->size);
 
     if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
             (req->size < sizeof (target_ulong))) {
-        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
+        req->data &= MAKE_64BIT_MASK(0, req_size_bits);
     }
 
     if (req->dir == IOREQ_WRITE)
-- 
2.51.0



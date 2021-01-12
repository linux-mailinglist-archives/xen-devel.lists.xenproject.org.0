Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED0A2F3C00
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:59:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66086.117306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRgt-0003pi-4G; Tue, 12 Jan 2021 21:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66086.117306; Tue, 12 Jan 2021 21:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzRgs-0003nL-NC; Tue, 12 Jan 2021 21:59:02 +0000
Received: by outflank-mailman (input) for mailman id 66086;
 Tue, 12 Jan 2021 21:59:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzRcF-0002PK-Jm
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:54:15 +0000
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 672ce908-4a2c-4f0d-b403-2a40745f87d5;
 Tue, 12 Jan 2021 21:53:07 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id i63so3214347wma.4
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 13:53:07 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 138sm6574053wma.41.2021.01.12.13.53.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:53:06 -0800 (PST)
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
X-Inumbo-ID: 672ce908-4a2c-4f0d-b403-2a40745f87d5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LLGfBggyWdYRwwW0ml3hX58E1A20s8FdtzBMFvcEooY=;
        b=Cu6yH0wsrNVLtjzeE2TIZhrHBhX7wc3sYH+G7Kl/gEjiuAz/IZPOPt8w2NyVfM259+
         +MTM65/Tx/3ICPcVTyjtMzg0eoryaIQmi/iN66/ET7jBm9NHVuxU0FQQAQBecwG7YVhm
         b9WgU9CUPodfv8tYjcUPOzbd0jeJ708AX1xDLwFnY/PyyTIk/agR7skBC3xXUM29I9iy
         V7Y/cFjAIYh4UsT/9rKd95H0TRBg+Hzew4nLYMGjDK4NaTJPSAFffvjkqT+oOlSid6LM
         TiGK6VK4ktjqk3R2Lm50KeuanBP8M+/IQwXl3agBojvb4YECogVs5/ZLa6fYK2j3aUC/
         DnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LLGfBggyWdYRwwW0ml3hX58E1A20s8FdtzBMFvcEooY=;
        b=RDNLnPdsEyrUjirgyxWGCNG7fXtwhqniPoC16ldLtNoWdtdIfbzP/w22Brpj12fc2I
         c6g6jd0Gi3/WrKQPYKgP7o0srNE2mtLvXFWEXV7PAaYTFxLbdk1GEDiclpwnPFB0CVwV
         +7Tpw5THC8JALObXI4Uf2cRPr5zXHcir5K1qbXnVhziIdVVoMKscGGQdIMhpyZkLP03g
         CuQ5MfmsL9z/adYI+uFa3qxmxge4jphWbgBeitFLVjSGsJpDvY7Idutx4M68/XyEwDkR
         fTE1ROQ7wlgad8QIsZaKcQ1szb27fqjfJ9fH5262Zfzyi0C4Aho4LcpinFMqTF5Nn4iB
         rMug==
X-Gm-Message-State: AOAM531E3YrpUjVsruOLEOug03a0+zxqtIIaN/InpiSRqOrD57Nre8Pr
	Ch9RBv0HxcdRexX3sGCiQdvf9NUW0nLBuA==
X-Google-Smtp-Source: ABdhPJwKs8f6oRDiw7sgwHGdQPLp4lt4N8HltFSQl1XLQ/oDA9QMnqcj/5Ol1jDlZ20c7w5+lfhrQQ==
X-Received: by 2002:a1c:7c09:: with SMTP id x9mr1148510wmc.98.1610488386987;
        Tue, 12 Jan 2021 13:53:06 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V4 13/24] xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
Date: Tue, 12 Jan 2021 23:52:21 +0200
Message-Id: <1610488352-18494-14-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The cmpxchg() in ioreq_send_buffered() operates on memory shared
with the emulator domain (and the target domain if the legacy
interface is used).

In order to be on the safe side we need to switch
to guest_cmpxchg64() to prevent a domain to DoS Xen on Arm.

As there is no plan to support the legacy interface on Arm,
we will have a page to be mapped in a single domain at the time,
so we can use s->emulator in guest_cmpxchg64() safely.

Thankfully the only user of the legacy interface is x86 so far
and there is not concern regarding the atomics operations.

Please note, that the legacy interface *must* not be used on Arm
without revisiting the code.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien.grall@arm.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch

Changes V1 -> V2:
   - move earlier to avoid breaking arm32 compilation
   - add an explanation to commit description and hvm_allow_set_param()
   - pass s->emulator

Changes V2 -> V3:
   - update patch description

Changes V3 -> V4:
   - add Stefano's A-b
   - drop comment from arm/hvm.c
---
 xen/common/ioreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index d233a49..d5f4dd3 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -29,6 +29,7 @@
 #include <xen/trace.h>
 #include <xen/vpci.h>
 
+#include <asm/guest_atomics.h>
 #include <asm/hvm/ioreq.h>
 
 #include <public/hvm/ioreq.h>
@@ -1185,7 +1186,7 @@ static int ioreq_send_buffered(struct ioreq_server *s, ioreq_t *p)
 
         new.read_pointer = old.read_pointer - n * IOREQ_BUFFER_SLOT_NUM;
         new.write_pointer = old.write_pointer - n * IOREQ_BUFFER_SLOT_NUM;
-        cmpxchg(&pg->ptrs.full, old.full, new.full);
+        guest_cmpxchg64(s->emulator, &pg->ptrs.full, old.full, new.full);
     }
 
     notify_via_xen_event_channel(d, s->bufioreq_evtchn);
-- 
2.7.4



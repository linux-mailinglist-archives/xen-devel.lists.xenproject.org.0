Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E9B30837A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:59:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77623.140715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J3w-0006nX-KA; Fri, 29 Jan 2021 01:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77623.140715; Fri, 29 Jan 2021 01:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J3w-0006mI-Dq; Fri, 29 Jan 2021 01:59:04 +0000
Received: by outflank-mailman (input) for mailman id 77623;
 Fri, 29 Jan 2021 01:59:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5IvM-0004da-LP
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:50:12 +0000
Received: from mail-lj1-x22d.google.com (unknown [2a00:1450:4864:20::22d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c53fa3e-e9dd-472f-8070-be4f663585fb;
 Fri, 29 Jan 2021 01:49:20 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id l12so8725118ljc.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:49:20 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z128sm1840238lfa.72.2021.01.28.17.49.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:49:18 -0800 (PST)
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
X-Inumbo-ID: 0c53fa3e-e9dd-472f-8070-be4f663585fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+Vn/s2UgbHBcNmmFjtnirXqLZd6G2KyfqANVIyYRlQM=;
        b=eCyLHT/9o9sgSNEmSBjbh34KrgvfIKFC8ChvKoT8LafJfwrFVe4ShDimURBY29DwVA
         w10/I7ngHQ3GVLf4RkX5uyqpd8vxXZZpp3faalYT5gG9kLOyHgSYLww+Z+CF5y3w/p1i
         7ybik4VnFJl4jjB9IqUHhjPw+UNUa9VslVBi7ywXl1Oz9HtstXtT2jKS14gtU3dUQFuq
         pOdJDcn3XuvDWUdGiVxFwBxMNc8Jv0iEGHLyxAGI2Zch+JLYsN/zjk61t5BP3bjHfold
         j+3YWGL/01+dM/bkwVVDgmtW5uiNWm3csG2odIcrJ2UbaLdGJhwG+Q6yzNwMGxm6t9lc
         OoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+Vn/s2UgbHBcNmmFjtnirXqLZd6G2KyfqANVIyYRlQM=;
        b=k403mKA3ej64jlfgDJq0X31h4lMTYjsQlbo3jPUnvIxQCXZTSowyqcNmCBkShgY3WQ
         QTjbmHKlvOa8jkVAWJg9ry1h0EfaAKoc7h7hjD7QGMYTEsrpIbKI3Nf8ghAO49N6VOdx
         Tb6/tzws+tCRLGx/vTYnMLyfPZGU8JF5C8COZWhfZ9IIHIUlR0SYnyLibHmLAYKKqe3V
         59PdxvrL4oO+S/5Cb3EpgesJwJAZU8Ao5uC5yM13pijwdizVPqONphH0dRR34U5taFwK
         NqJP0k53RGvgSzc5tLTCUzEFY4Rv60wrp69W3eM4fkfQzjyQr6b6JiRyA2op89DcQhrY
         xVYA==
X-Gm-Message-State: AOAM530btp30mZaPLsE+ThwBiWFNsj0jXZRuhqQY9BVOMpRTxyRTqJ90
	7sU/83lQzfwDtyEVEqHgt/5FcI/MHlA2qQ==
X-Google-Smtp-Source: ABdhPJyoN1FHzod313arC9Mf2MqGv1JQpwEFvGe4YTIiET0mT6EM7GiQxdyb3OCAJRzVtno7Zoo9GQ==
X-Received: by 2002:a2e:918f:: with SMTP id f15mr1111443ljg.357.1611884959313;
        Thu, 28 Jan 2021 17:49:19 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V6 13/24] xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
Date: Fri, 29 Jan 2021 03:48:41 +0200
Message-Id: <1611884932-1851-14-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The cmpxchg() in ioreq_send_buffered() operates on memory shared
with the emulator domain (and the target domain if the legacy
interface is used).

In order to be on the safe side we need to switch
to guest_cmpxchg64() to prevent a domain to DoS Xen on Arm.
The point to use 64-bit version of helper is to support Arm32
since the IOREQ code uses cmpxchg() with 64-bit value.

As there is no plan to support the legacy interface on Arm,
we will have a page to be mapped in a single domain at the time,
so we can use s->emulator in guest_cmpxchg64() safely.

Thankfully the only user of the legacy interface is x86 so far
and there is not concern regarding the atomics operations.

Please note, that the legacy interface *must* not be used on Arm
without revisiting the code.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Paul Durrant <paul@xen.org>
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

Changes V4 -> V5:
   - update patch description
   - rebase
   - add Paul's R-b

Changes V5 -> V6:
   - no changes

---
---
 xen/common/ioreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index de3066a..07572a5 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -29,6 +29,7 @@
 #include <xen/trace.h>
 #include <xen/vpci.h>
 
+#include <asm/guest_atomics.h>
 #include <asm/ioreq.h>
 
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



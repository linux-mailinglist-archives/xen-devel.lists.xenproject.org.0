Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F60D2650B9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 22:26:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGT9J-0005IK-LB; Thu, 10 Sep 2020 20:26:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQLO=CT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGT6X-0004JK-UJ
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:23:37 +0000
X-Inumbo-ID: 7eb5e5d9-1390-4a5a-b0da-896028325392
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7eb5e5d9-1390-4a5a-b0da-896028325392;
 Thu, 10 Sep 2020 20:22:48 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y4so9845206ljk.8
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 13:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wMz8YwG4hLPOu/VkOCrkUjbnYq7kx2pzPFeHLacOB04=;
 b=S9htPGkIJziemFEpfWHTP154Y3fr9m7c8NCDDEGbWZ7hbLg1v/vm9Po/hePEQdCQ2l
 chAcCWTcDQxrmTGQK858OMCg6p6+lDn9/SxqlYyXq04JJy+B70TQ/4rCw55oGkp96Wyu
 7I47U5iIq1IkBndlTqNlpSvGqzy4+zGhLC6Nl4083JoY2dcRMfHzyw5Tg6Syooc7z6zq
 9s7X5MLfFGTBrZfYG1qb5BKAZU9XaPq2zXAEeKfJDb4h0gmrXXUVNxSzmSo3dcIc/O//
 l4jWN0S8TZDr5I3i5qzXZnMRHpm1fPfLNnZhSCPYCAIpUZW3XP9TDsZO0O3Les9KUuEI
 xdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wMz8YwG4hLPOu/VkOCrkUjbnYq7kx2pzPFeHLacOB04=;
 b=GPUu5m3QElkAbi93VkBrmyIY8bmVz76mUNOhKNIBzwhqsuGR7Cu5XtVw6LuG8YcXok
 s/23UKFH2b2acPrMbWCDLjGJo0qCxS+QTO+jjq2Fwyv8+Ea36nJMZ3xHcbr0VNYNuUxW
 3Tq1ct27SjxNSG2MUbszxaLhiu+BVTXWjyDkAuSeTBKZY1lLV6qpC5QLP5WXPjjHnkbk
 KsU91Sp8OA6r3DgNs5C19Kb+7SwzKQG28dg2BcMIce49XlD/fGOgxRbrJ7FGlFweJOxo
 0/vsGpgqaTS9V0g9+FUY2sfoedp8yhrX4hO+E742SCmdwdex6TAIoWPEGaWzx3N35/y/
 Av4A==
X-Gm-Message-State: AOAM531pkS/MwowWsJpv2qNvkL02xuqcCxTLCmB9rsPieOP1fEBJe/rp
 GYduTG9x521E54MVF4eiJE+fzjOu7Peeiw==
X-Google-Smtp-Source: ABdhPJwLVRkdcLqQoTKA4OdD4dzufexmHm7MPhAolwgcsdlgJDcUfZ0fTdqT40V0S70R1EFM2q5HEA==
X-Received: by 2002:a2e:7307:: with SMTP id o7mr5227551ljc.323.1599769367224; 
 Thu, 10 Sep 2020 13:22:47 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u5sm1584375lfq.17.2020.09.10.13.22.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:22:46 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <jgrall@amazon.com>
Subject: [PATCH V1 14/16] xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
Date: Thu, 10 Sep 2020 23:22:08 +0300
Message-Id: <1599769330-17656-15-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The cmpxchg() in hvm_send_buffered_ioreq() operates on memory shared
with the emulator. In order to be on the safe side we need to switch
to guest_cmpxchg64() to prevent a domain to DoS Xen on Arm.

CC: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Please note, this patch depends on the following patch on a review:
https://patchwork.kernel.org/patch/11715559/

Changes RFC -> V1:
   - new patch
---
---
 xen/common/ioreq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index e24a481..645d8a1 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -30,6 +30,8 @@
 #include <xen/trace.h>
 #include <xen/vpci.h>
 
+#include <asm/guest_atomics.h>
+
 #include <public/hvm/dm_op.h>
 #include <public/hvm/ioreq.h>
 #include <public/hvm/params.h>
@@ -1325,7 +1327,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
 
         new.read_pointer = old.read_pointer - n * IOREQ_BUFFER_SLOT_NUM;
         new.write_pointer = old.write_pointer - n * IOREQ_BUFFER_SLOT_NUM;
-        cmpxchg(&pg->ptrs.full, old.full, new.full);
+        guest_cmpxchg64(d, &pg->ptrs.full, old.full, new.full);
     }
 
     notify_via_xen_event_channel(d, s->bufioreq_evtchn);
-- 
2.7.4



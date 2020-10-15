Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEA828F732
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:53:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7612.20080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VD-0007DE-0C; Thu, 15 Oct 2020 16:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7612.20080; Thu, 15 Oct 2020 16:53:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VC-0007By-KH; Thu, 15 Oct 2020 16:53:18 +0000
Received: by outflank-mailman (input) for mailman id 7612;
 Thu, 15 Oct 2020 16:53:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6O3-0004yr-6v
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:55 +0000
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f79a2b4f-f75a-40b3-8756-6dcebdebe072;
 Thu, 15 Oct 2020 16:45:07 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id l2so4404508lfk.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:07 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:45:05 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6O3-0004yr-6v
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:55 +0000
X-Inumbo-ID: f79a2b4f-f75a-40b3-8756-6dcebdebe072
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f79a2b4f-f75a-40b3-8756-6dcebdebe072;
	Thu, 15 Oct 2020 16:45:07 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id l2so4404508lfk.0
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=N4sHZjBrvdP2nIgCwj1N8kQLOeVN1MHVkf9kqSUqzcc=;
        b=By1+sZx/D6fqGrtAeMnWCLm09vNkxpnpy1Oh0Ydg6B/fHRp9Eviq44+yZSendm4Mlz
         eClZjLs66cfhBMRPcJRLl3oYkHIXXnFNtscK2P8CI8eyvnAWyra3P/bzaUXqW2CAK8wa
         QL3Xjbg/T0W2xOI7Ijx+p9QHpNJ28y4Q+89b3dpHDO1RvWmpO94UpPBNC6prmpqpp/oS
         OxriwipPOOH7AEEe6BkOwWjlIrbAXg8HHRPx+8kh39tJ8GSpnw7HLGZwMpt/Fw8Z5UaE
         VFbBBQ9Y38smL9Np9XmjvQjiE8qHCySg/II1Rl+LI42vhBJefGorQzGy0B8WJ3TpfiXO
         Olpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=N4sHZjBrvdP2nIgCwj1N8kQLOeVN1MHVkf9kqSUqzcc=;
        b=IqW703Q9/JUAg1mvP2iG/5Ab0eZ2OEpS+erqwBPKzIa7tudreTRfswHUM+u1AcF+nr
         RsmckKlxW5CSCsitmOMEwpa3UtKJAqg670FKG1OMY1rDru03GfF1e391gjpXEOzRejaN
         mqUo+5SHlKPA/uuekd0YySeFnUu6vhd0BI7gJAqLFBEqRRFg97UBssec/O0lQ7iCdFL2
         VMKEcRAQw8RAwfiz+qIOZKjCz9KDM/ML9OiTeMqmtWoqHVyME1lhFOCJK7Srm5SttXFX
         jdC+kAXuD+RY1aRLNH8jzn/uDhn/uvX0/5Xj5yUZ/5AS01Th8DYU2AnYgJfE3BIuLuGl
         C9Dg==
X-Gm-Message-State: AOAM53196ntoFRXDeQk7WwRt3u7WYmT+uWJlMM0O496JSQxcBP3/6pc4
	tZbyIzaUw3R0x0zA7zSp3//NPXV5iTAA4w==
X-Google-Smtp-Source: ABdhPJwhpoAS/UbyhzkuTItYICvt8rJ4Yol/uOLfyGdXlBHd66uiyGvQNddJO4lJY91mCIZH3jo+ww==
X-Received: by 2002:a19:824f:: with SMTP id e76mr1281242lfd.572.1602780306328;
        Thu, 15 Oct 2020 09:45:06 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:45:05 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V2 13/23] xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
Date: Thu, 15 Oct 2020 19:44:24 +0300
Message-Id: <1602780274-29141-14-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The cmpxchg() in hvm_send_buffered_ioreq() operates on memory shared
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
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch

Changes V1 -> V2:
   - move earlier to avoid breaking arm32 compilation
   - add an explanation to commit description and hvm_allow_set_param()
   - pass s->emulator
---
 xen/arch/arm/hvm.c | 4 ++++
 xen/common/ioreq.c | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
index 8951b34..9694e5a 100644
--- a/xen/arch/arm/hvm.c
+++ b/xen/arch/arm/hvm.c
@@ -31,6 +31,10 @@
 
 #include <asm/hypercall.h>
 
+/*
+ * The legacy interface (which involves magic IOREQ pages) *must* not be used
+ * without revisiting the code.
+ */
 static int hvm_allow_set_param(const struct domain *d, unsigned int param)
 {
     switch ( param )
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 98fffae..8612159 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -28,6 +28,7 @@
 #include <xen/trace.h>
 #include <xen/vpci.h>
 
+#include <asm/guest_atomics.h>
 #include <asm/hvm/ioreq.h>
 
 #include <public/hvm/ioreq.h>
@@ -1317,7 +1318,7 @@ static int send_buffered_ioreq(struct ioreq_server *s, ioreq_t *p)
 
         new.read_pointer = old.read_pointer - n * IOREQ_BUFFER_SLOT_NUM;
         new.write_pointer = old.write_pointer - n * IOREQ_BUFFER_SLOT_NUM;
-        cmpxchg(&pg->ptrs.full, old.full, new.full);
+        guest_cmpxchg64(s->emulator, &pg->ptrs.full, old.full, new.full);
     }
 
     notify_via_xen_event_channel(d, s->bufioreq_evtchn);
-- 
2.7.4



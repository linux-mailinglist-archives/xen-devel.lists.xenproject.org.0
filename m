Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E56452C8274
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:44:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40929.73988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgfX-0003np-4u; Mon, 30 Nov 2020 10:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40929.73988; Mon, 30 Nov 2020 10:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgfW-0003n3-U6; Mon, 30 Nov 2020 10:44:30 +0000
Received: by outflank-mailman (input) for mailman id 40929;
 Mon, 30 Nov 2020 10:44:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgUO-0000Uu-DP
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:33:00 +0000
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 475c828b-c025-4108-a7fe-694966bbda51;
 Mon, 30 Nov 2020 10:32:13 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id d8so20627634lfa.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:32:13 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.32.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:32:11 -0800 (PST)
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
X-Inumbo-ID: 475c828b-c025-4108-a7fe-694966bbda51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nMA1D5QyuY6nqUL9SQWis4OrJ06p7JM6vXYO/WRZnDQ=;
        b=jK99CXJOBFidWNf8C240OVzB5yoEfyU15B2+M7W/8Daf5lmtZuXDIdsAjV2s85dKMH
         eg4p9Iv9wIom4ohIKNtmwsW+6oTfdv68QLZOfizUCAyswBWvgxQufepXuZlbzu6AoMMN
         /xE9QZ8huIFDaNz5yg8MCyAqB/ZlNj+zhyJo+M5arDeh1cJOVwlQkg7VypkVWKsq/6wN
         /rsMncuE1LNTSTz1LsFriaHeg8m4W4b8LP90fIWctCmPO56de5xK36yGGIxz07Rr48ax
         Sthgqur8dsVIPh9KrmXiiZyBwwrf/0wBMLG9I84eg3IbbHf5ODdtUmd4dAPG2RGiLX7a
         7yag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nMA1D5QyuY6nqUL9SQWis4OrJ06p7JM6vXYO/WRZnDQ=;
        b=PAi4uMJ4G1cc4sWeTsrPLwgAGjmx2Gkny0UDLNm9SXui+BmgmPBCZrvDY+fbzRCAJ6
         mlCoGm/LYlBSXXIQ9m4sPmvMtaqGqy9a7mNvDddmIuu3tIu6axymWIGlthqDSr/NU+e7
         UbbKJBhjZpDN2tn33JpQtgNsmHvZWQcReotHwNUmX/ynSD7RCzqOvNWINqYtFpb4FizV
         ackTI04zxTBSZPDCPf1Aw20Z3E1cf9TAxaIb8LyFivyTEtIUVOMKNmUCtVSLRd02Ejgd
         u2vj35AAjuoxT2PPuiVMUcgZht1o10pud4bVKZW/o7e8jdIXpOqvgMGxpPU8ZexmEDEc
         qIWQ==
X-Gm-Message-State: AOAM530dWcEWcM6YLO2zOGpe6JsxtaveQve7CYYM40FXwpbDMNesFcE9
	zw/eoSXr/6AlymOnWxVQPRVh+vGXc4+A/Q==
X-Google-Smtp-Source: ABdhPJyPEH5EGMt8g7+ksXyuOES+H1T4Dvl+dgtWK2QVenb8rwRLrqqN7nDDLL9ibneLpMfhtYE4tw==
X-Received: by 2002:a19:248a:: with SMTP id k132mr9638514lfk.387.1606732332030;
        Mon, 30 Nov 2020 02:32:12 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V3 13/23] xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
Date: Mon, 30 Nov 2020 12:31:28 +0200
Message-Id: <1606732298-22107-14-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>

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

Changes V2 -> V3:
   - update patch description
---
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
index 3ca5b96..4855dd8 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -29,6 +29,7 @@
 #include <xen/trace.h>
 #include <xen/vpci.h>
 
+#include <asm/guest_atomics.h>
 #include <asm/hvm/ioreq.h>
 
 #include <public/hvm/ioreq.h>
@@ -1182,7 +1183,7 @@ static int ioreq_send_buffered(struct ioreq_server *s, ioreq_t *p)
 
         new.read_pointer = old.read_pointer - n * IOREQ_BUFFER_SLOT_NUM;
         new.write_pointer = old.write_pointer - n * IOREQ_BUFFER_SLOT_NUM;
-        cmpxchg(&pg->ptrs.full, old.full, new.full);
+        guest_cmpxchg64(s->emulator, &pg->ptrs.full, old.full, new.full);
     }
 
     notify_via_xen_event_channel(d, s->bufioreq_evtchn);
-- 
2.7.4



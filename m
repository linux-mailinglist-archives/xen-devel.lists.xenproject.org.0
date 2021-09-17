Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2041840F45B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 10:47:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189091.338584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR9Vd-0003CP-Dd; Fri, 17 Sep 2021 08:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189091.338584; Fri, 17 Sep 2021 08:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR9Vd-0003AV-A4; Fri, 17 Sep 2021 08:46:13 +0000
Received: by outflank-mailman (input) for mailman id 189091;
 Fri, 17 Sep 2021 08:46:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OQJ=OH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mR9Vb-0003AJ-Bv
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 08:46:11 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb5656a5-9797-4987-ab65-05c08dbf14b4;
 Fri, 17 Sep 2021 08:46:09 +0000 (UTC)
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
X-Inumbo-ID: eb5656a5-9797-4987-ab65-05c08dbf14b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631868369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=ZQl96R3uvW4xzr4o62S9ScZWcGCrnlnt7bSHNhrnNaU=;
  b=V09bcFVy7+SVBcd2ifwZ9uUI2NgUFkIDiv8RWdrtnTHdsI72C71Zuv6U
   8hiuP1JyMU69fOBqdoVykwrFgVXYgOA7mtS9J/JsNkY/G7I3CrOBlAiwl
   pbR9NukIr4KDwzPRXiq125RSue9+26K5NF6LTF++8Fq/FfmuccjHeXglO
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2HwSl0Wy37iCWqK1V2Atl+jEb9D23bzvNaTNjZfsfml/Qw0LbobFvO+2H51Am8NEvA6N9q8F3U
 u54mHzrzOLsXTfuzDuba9XHO80bbx50yLrOKpjJlie+FkcH9SSI4iGEvZFN/2jIBQkK4hSFCrN
 ESafWK9rZpDjulP0SBHVmGpclH4boiTG5a38st7j+ffVkR2f9kwwh2zVl3pappV6OUpt08Rzjb
 qm1niSeRnGMQNgqCA5iucmJl/mIrXSmfsQ0AHQKoA0UsIE+Fe9NJJL4/A4aT4PVYSb2tMjDUVZ
 ZJsjGLJZTw8khpJpO+cCA3ce
X-SBRS: 5.1
X-MesageID: 54750985
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fbU+dqkyrGYGByzO8oRKKlTo5gx9IURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWCG6Pbq2LazDxKooga9+/pE5VsZ/cztFmT1Rqq3swHiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09c32YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 I8dtICxQjUzBKr3ydUiWCYANCBRBYQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKqBO
 pJIOWcHgBLoSCZJJls3B4wFrb2ku0HmY21WrXWxuv9ii4TU5FMoi+W8WDbPQfSIWMFUk0Cwt
 m/AuWPjDXkyFvaS1D6E+XKEnfLUkGXwX4d6PLG2//FlgVqXx0QIFQYbE1C8pJGRlUqWS99Zb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6YGWosXjNHcMYhtsI9WXotz
 FDht8jyGTVlvbmRSHSc3rSZtzW/PW4SN2BqWMMfZVJbuZ+5+th110+RCIY4eEKosjHrMWugw
 iyLpxokvbIo3P803Jrj2lHouxv58/AlUTUJChXrsnONt10iPdP0ONP2sDA3/t4bc93IFQDpU
 Gws3pHEtbFQV8nleDmlHb1VdIxF8cppJ9E1bbRHJJAn6z3l0HqqZ4k4DNpWdRoxb5psldMEZ
 ibuVeJtCH17ZyDCgUxfOdvZ5yEWIU7IToyNuhf8NIEmX3SJXFXblByCnGbJt4wXrKTJrU3ZE
 czDGSpLJS1BYZmLMRLsH7tNuVPV7nlmmAs/uqwXPzz4iOHDNRZ5uJ8uMUeUb/BR0U93iFyOq
 L5i2z+x40wHCoXWO3CPmaZKdAxiBSVrVPje9p0MHsbec1UOJY3UI6KIqV/XU9c+xPo9eyah1
 izVZ3K0P3Kk2SSceFnVMys6AF4tNL4mxU8G0eUXFQ7A8xAejUyHtc/zrrM7Iusq8vJN1/lxQ
 6VXcsmMGK0XGD/G5y4cfd/2q4k7LEanggeHPiyEZjkjfsE/G1yVq4G8Jga/pjMTCieXtNclp
 +Hy3A3sXpdeFR9pC9zbaazzwgrp72Qdgu97Q2DBPsJXJBf36IFvJiGo1q03LsgAJA/t3Dyf0
 wrKUx4UqfOU+90+8cXThLDCpICsSrMsEk1fFmjdzLC3KSiFoTbznd4eCL6FJGmPWnn19aOuY
 fRu48v9aPBXzkxXt4dcEqpwyf5s7dXYuLIHnB9vG2/Gbgr3B+o4cGWGx8RGqoZE2qRd5VmtQ
 kuK99RXZeeJNcfiHAJDLQYpdL3eh/Qdmz2U5vUpOkTqoiRw+ePfA0lVOhCNjg1bLad0b9x5k
 btw5pZO5lztkAcuP/aHkjtQpjaFIXE3Wqk6so0XXd3wgQ0xx1AeOZHRB0caOn1Uhwmg5qXyH
 gKpuQ==
IronPort-HdrOrdr: A9a23:TYb2g61ZJvQfTtENkAZnJQqjBLAkLtp133Aq2lEZdPRUGvb3qy
 nOpoVj6faaslYssR0b9exofZPwJE80lqQFh7X5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtsp
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.85,300,1624334400"; 
   d="scan'208";a="54750985"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: [PATCH 1/6] xen/trace: Don't over-read trace objects
Date: Fri, 17 Sep 2021 09:45:54 +0100
Message-ID: <20210917084559.22673-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210917084559.22673-1-andrew.cooper3@citrix.com>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

In the case that 'extra' isn't a multiple of uint32_t, the calculation rounds
the number of bytes up, causing later logic to read unrelated bytes beyond the
end of the object.

Also, asserting that the object is within TRACE_EXTRA_MAX, but truncating it
in release builds is rude.

Instead, reject any out-of-spec records, leaving enough of a message to
identify the faulty caller.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Dario Faggioli <dfaggioli@suse.com>

I've eyeballed the code and can't spot any problematic callers, but I came
very close to accidentally introducing some when trying to fix the stack
rubble leaks in subsequent patches.
---
 xen/common/trace.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/xen/common/trace.c b/xen/common/trace.c
index a2a389a1c7c3..25af6e1bd25e 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -686,22 +686,21 @@ void __trace_var(u32 event, bool_t cycles, unsigned int extra,
     unsigned long flags;
     u32 bytes_to_tail, bytes_to_wrap;
     unsigned int rec_size, total_size;
-    unsigned int extra_word;
     bool_t started_below_highwater;
 
     if( !tb_init_done )
         return;
 
-    /* Convert byte count into word count, rounding up */
-    extra_word = (extra / sizeof(u32));
-    if ( (extra % sizeof(u32)) != 0 )
-        extra_word++;
-    
-    ASSERT(extra_word <= TRACE_EXTRA_MAX);
-    extra_word = min_t(int, extra_word, TRACE_EXTRA_MAX);
-
-    /* Round size up to nearest word */
-    extra = extra_word * sizeof(u32);
+    /*
+     * Trace records require extra data which is an exact multiple of
+     * uint32_t.  Reject out-of-spec records.  Any failure here is an error in
+     * the caller.
+     */
+    if ( extra % sizeof(uint32_t) ||
+         extra / sizeof(uint32_t) > TRACE_EXTRA_MAX )
+        return printk_once(XENLOG_WARNING
+                           "Trace event %#x bad size %u, discarding\n",
+                           event, extra);
 
     if ( (tb_event_mask & event) == 0 )
         return;
-- 
2.11.0



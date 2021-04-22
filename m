Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F333682B3
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 16:50:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115504.220396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZaek-0004yC-Tz; Thu, 22 Apr 2021 14:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115504.220396; Thu, 22 Apr 2021 14:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZaek-0004xp-QZ; Thu, 22 Apr 2021 14:50:14 +0000
Received: by outflank-mailman (input) for mailman id 115504;
 Thu, 22 Apr 2021 14:50:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZaej-0004xj-E9
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:50:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9b0d180-a439-4877-9c45-42c6449251d1;
 Thu, 22 Apr 2021 14:50:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DBFB9B177;
 Thu, 22 Apr 2021 14:50:11 +0000 (UTC)
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
X-Inumbo-ID: c9b0d180-a439-4877-9c45-42c6449251d1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619103012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+QdQWxNcKE7APKYxJnP/WcIc9s52TlEnJpEVbzCgqbg=;
	b=e3PtmwVNBCYQunHtm0GS0/Knk0Q82wV/Vg2een4wPBNxR2Xuc8jPezfKm2//rVxqgIm88k
	EEVMG6y5gJKG6tkSNyGQjb6/b6KqFe3XdYwtL0U0S6Z9j+QflvW/uBqSpxE+fwWfXC1mjE
	JPCbTjuL8H4Z1M5Mb+slvDTIQZP+7l4=
Subject: [PATCH v3 10/22] x86/CPUID: adjust extended leaves out of range
 clearing
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <b274066d-b9b3-a60b-dc6b-64d9e380dffa@suse.com>
Date: Thu, 22 Apr 2021 16:50:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

A maximum extended leaf input value with the high half different from
0x8000 should not be considered valid - all leaves should be cleared in
this case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
TBD: Andrew suggested to drop this patch, but that sub-thread still has
     a loose end. Hence, until I'm convinced otherwise, I've retained
     this patch here. I don't think it conflicts with any of the
     subsequent ones.
---
v2: Integrate into series.

--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -519,11 +519,22 @@ static void test_cpuid_out_of_range_clea
             },
         },
         {
+            .name = "no extd",
+            .nr_markers = 0,
+            .p = {
+                /* Clears all markers. */
+                .extd.max_leaf = 0,
+
+                .extd.vendor_ebx = 0xc2,
+                .extd.raw_fms = 0xc2,
+            },
+        },
+        {
             .name = "extd",
             .nr_markers = 1,
             .p = {
                 /* Retains marker in leaf 0.  Clears others. */
-                .extd.max_leaf = 0,
+                .extd.max_leaf = 0x80000000,
                 .extd.vendor_ebx = 0xc2,
 
                 .extd.raw_fms = 0xc2,
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -232,7 +232,9 @@ void x86_cpuid_policy_clear_out_of_range
                     ARRAY_SIZE(p->xstate.raw) - 1);
     }
 
-    zero_leaves(p->extd.raw, (p->extd.max_leaf & 0xffff) + 1,
+    zero_leaves(p->extd.raw,
+                ((p->extd.max_leaf >> 16) == 0x8000
+                 ? (p->extd.max_leaf & 0xffff) + 1 : 0),
                 ARRAY_SIZE(p->extd.raw) - 1);
 }
 



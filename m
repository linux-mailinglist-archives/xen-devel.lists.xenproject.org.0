Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BF42C0D89
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:32:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34499.65620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCtU-0000Y9-BX; Mon, 23 Nov 2020 14:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34499.65620; Mon, 23 Nov 2020 14:32:40 +0000
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
	id 1khCtU-0000Xf-7d; Mon, 23 Nov 2020 14:32:40 +0000
Received: by outflank-mailman (input) for mailman id 34499;
 Mon, 23 Nov 2020 14:32:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCtR-0000Wz-U9
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:32:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62aab5dd-6404-4f46-bcf3-de15ee685f36;
 Mon, 23 Nov 2020 14:32:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 69685AC23;
 Mon, 23 Nov 2020 14:32:36 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCtR-0000Wz-U9
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:32:37 +0000
X-Inumbo-ID: 62aab5dd-6404-4f46-bcf3-de15ee685f36
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 62aab5dd-6404-4f46-bcf3-de15ee685f36;
	Mon, 23 Nov 2020 14:32:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606141956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jzhBWTNHQY0ajJi4n63Xj/QfqXX25ivh2dwdvwKI0Bs=;
	b=IevHifplCTH5SXR+OiqrdnoyQMgAtZ1l5ZnNoL/wBZXkYlsClhQkihvQW9u6P9T92oqDeZ
	2fgN2kV+Ku/uylj/2s/aJDYDiMgvAiQyNmfZ/NCRyt8iRwy1ralnCRM5GNkR1xLJRjJXha
	YH4rYoy5e1O4ZZ6lbTnifO7clE/1Eek=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 69685AC23;
	Mon, 23 Nov 2020 14:32:36 +0000 (UTC)
Subject: [PATCH v2 11/17] x86/CPUID: adjust extended leaves out of range
 clearing
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Message-ID: <0f04f568-e55a-ef20-aa97-fbb199dfae37@suse.com>
Date: Mon, 23 Nov 2020 15:32:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

A maximum extended leaf input value with the high half different from
0x8000 should not be considered valid - all leaves should be cleared in
this case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Integrate into series.

--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -516,11 +516,22 @@ static void test_cpuid_out_of_range_clea
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
 


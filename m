Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFF62ADADA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 16:51:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23509.50304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcVus-00005h-Fs; Tue, 10 Nov 2020 15:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23509.50304; Tue, 10 Nov 2020 15:50:42 +0000
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
	id 1kcVus-00005H-CY; Tue, 10 Nov 2020 15:50:42 +0000
Received: by outflank-mailman (input) for mailman id 23509;
 Tue, 10 Nov 2020 15:50:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcVuq-00005B-H5
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 15:50:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59ae3b8d-8070-4964-9580-eba431b7172e;
 Tue, 10 Nov 2020 15:50:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C145ABD1;
 Tue, 10 Nov 2020 15:50:38 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcVuq-00005B-H5
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 15:50:40 +0000
X-Inumbo-ID: 59ae3b8d-8070-4964-9580-eba431b7172e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 59ae3b8d-8070-4964-9580-eba431b7172e;
	Tue, 10 Nov 2020 15:50:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605023438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YlOWlGaIVwjiekIPN3oYInbRbb4q51d2Wrgr9lUiRAY=;
	b=h/p4GKGdiIER9zmLfolzr5Qg1UNfO2UlCybLQm3u3nXZaT5JUGuuZdZow2xktpGDQDtK6p
	Spy6uylIq9Oic4SjoEDK2cVJSCQHfeLJ10nWMflBaWN+tUdXqoV2xYCjShDq8YrOCVIGTM
	9eE0qLgxRAglqWEjecyXsb+WojNppGM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9C145ABD1;
	Tue, 10 Nov 2020 15:50:38 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/CPUID: adjust extended leaves out of range clearing
Message-ID: <c40f524a-b991-b26d-317e-7faaa9b9e23c@suse.com>
Date: Tue, 10 Nov 2020 16:50:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

A maximum extended leaf input value with the high half different from
0x8000 should not be considered valid - all leaves should be cleared in
this case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
 


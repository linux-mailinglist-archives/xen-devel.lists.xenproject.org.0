Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99AD1BE059
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 16:11:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTnQn-0005sG-PW; Wed, 29 Apr 2020 14:11:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTnQm-0005sB-D9
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 14:11:20 +0000
X-Inumbo-ID: 4c1f8c00-8a23-11ea-9951-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c1f8c00-8a23-11ea-9951-12813bfff9fa;
 Wed, 29 Apr 2020 14:11:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1C4D1AC6C;
 Wed, 29 Apr 2020 14:11:18 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/CPUID: correct error indicator for max extended leaf
Message-ID: <fa32442e-158f-f855-efad-09f4d6696adf@suse.com>
Date: Wed, 29 Apr 2020 16:11:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

With the max base leaf using 0, this one should be using the extended
leaf counterpart thereof, rather than some arbitrary extended leaf.

Fixes: 588a966a572e ("libx86: Introduce x86_cpu_policies_are_compatible()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -570,7 +570,7 @@ static void test_is_compatible_failure(v
         {
             .name = "Host extd.max_leaf out of range",
             .guest_cpuid.extd.max_leaf = 1,
-            .e = { 0x80000008, -1, -1 },
+            .e = { 0x80000000, -1, -1 },
         },
         {
             .name = "Host no CPUID faulting, Guest wanted",
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -19,7 +19,7 @@ int x86_cpu_policies_are_compatible(cons
         FAIL_CPUID(0, NA);
 
     if ( guest->cpuid->extd.max_leaf > host->cpuid->extd.max_leaf )
-        FAIL_CPUID(0x80000008, NA);
+        FAIL_CPUID(0x80000000, NA);
 
     /* TODO: Audit more CPUID data. */
 


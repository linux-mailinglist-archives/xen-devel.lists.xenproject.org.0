Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33E91B71F3
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 12:25:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRvW6-0007XV-9V; Fri, 24 Apr 2020 10:25:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2qtr=6I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRvW5-0007XP-Kx
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 10:25:05 +0000
X-Inumbo-ID: dcebbdd8-8615-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcebbdd8-8615-11ea-b4f4-bc764e2007e4;
 Fri, 24 Apr 2020 10:25:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 82DD3AB8F;
 Fri, 24 Apr 2020 10:25:03 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: drop cpu_has_ffxsr
Message-ID: <55bcfe11-251c-606e-6f0f-a03880efa390@suse.com>
Date: Fri, 24 Apr 2020 12:24:59 +0200
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

It's definition is bogus when it comes to Hygon CPUs, but since we don't
use it anywhere drop it rather than correcting it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -66,8 +66,6 @@
 
 /* CPUID level 0x80000001.edx */
 #define cpu_has_nx              boot_cpu_has(X86_FEATURE_NX)
-#define cpu_has_ffxsr           ((boot_cpu_data.x86_vendor == X86_VENDOR_AMD) \
-                                 && boot_cpu_has(X86_FEATURE_FFXSR))
 #define cpu_has_page1gb         boot_cpu_has(X86_FEATURE_PAGE1GB)
 #define cpu_has_rdtscp          boot_cpu_has(X86_FEATURE_RDTSCP)
 #define cpu_has_3dnow_ext       boot_cpu_has(X86_FEATURE_3DNOWEXT)


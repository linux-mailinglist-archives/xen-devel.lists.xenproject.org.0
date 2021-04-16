Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B56C3620BF
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 15:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111732.213694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXOOI-0000JJ-NZ; Fri, 16 Apr 2021 13:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111732.213694; Fri, 16 Apr 2021 13:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXOOI-0000Iu-KX; Fri, 16 Apr 2021 13:20:10 +0000
Received: by outflank-mailman (input) for mailman id 111732;
 Fri, 16 Apr 2021 13:20:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vDum=JN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lXOOH-0000Io-EC
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 13:20:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b56f86bc-1101-4907-82e2-99d0d9f5d287;
 Fri, 16 Apr 2021 13:20:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 953C1B1BD;
 Fri, 16 Apr 2021 13:20:07 +0000 (UTC)
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
X-Inumbo-ID: b56f86bc-1101-4907-82e2-99d0d9f5d287
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618579207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ufOnfHp0O3E+Vzmx++SRiq0i7FViNrJkcL0Lqmis+28=;
	b=sVzyghNDqdAJnWjuJlB2F2Lozc1my8GqDYUe2F38JEkK3x/c7DHeaGxGNg4lCgVNsgjBqX
	qJa8G1gbOBfHej6yJnHWwL4T4/VwRIiFcaovF8COkPFhsuh1wSHzEtIqFOQWk9AE7JnxC1
	M0CrMJhL1HaygMw1G+XbIlYN6FyNVWg=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/AMD: also determine L3 cache size
Message-ID: <7ffeec9f-2ce4-9122-4699-32c3ffb06a5d@suse.com>
Date: Fri, 16 Apr 2021 15:20:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

For Intel CPUs we record L3 cache size, hence we should also do so for
AMD and alike.

While making these additions, also make sure (throughout the function)
that we don't needlessly overwrite prior values when the new value to be
stored is zero.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I have to admit though that I'm not convinced the sole real use of the
field (in flush_area_local()) is a good one - flushing an entire L3's
worth of lines via CLFLUSH may not be more efficient than using WBINVD.
But I didn't measure it (yet).

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -240,28 +240,41 @@ int get_model_name(struct cpuinfo_x86 *c
 
 void display_cacheinfo(struct cpuinfo_x86 *c)
 {
-	unsigned int dummy, ecx, edx, l2size;
+	unsigned int dummy, ecx, edx, size;
 
 	if (c->extended_cpuid_level >= 0x80000005) {
 		cpuid(0x80000005, &dummy, &dummy, &ecx, &edx);
-		if (opt_cpu_info)
-			printk("CPU: L1 I cache %dK (%d bytes/line),"
-			              " D cache %dK (%d bytes/line)\n",
-			       edx>>24, edx&0xFF, ecx>>24, ecx&0xFF);
-		c->x86_cache_size=(ecx>>24)+(edx>>24);	
+		if ((edx | ecx) >> 24) {
+			if (opt_cpu_info)
+				printk("CPU: L1 I cache %uK (%u bytes/line),"
+				              " D cache %uK (%u bytes/line)\n",
+				       edx >> 24, edx & 0xFF, ecx >> 24, ecx & 0xFF);
+			c->x86_cache_size = (ecx >> 24) + (edx >> 24);
+		}
 	}
 
 	if (c->extended_cpuid_level < 0x80000006)	/* Some chips just has a large L1. */
 		return;
 
-	ecx = cpuid_ecx(0x80000006);
-	l2size = ecx >> 16;
-	
-	c->x86_cache_size = l2size;
-
-	if (opt_cpu_info)
-		printk("CPU: L2 Cache: %dK (%d bytes/line)\n",
-		       l2size, ecx & 0xFF);
+	cpuid(0x80000006, &dummy, &dummy, &ecx, &edx);
+
+	size = ecx >> 16;
+	if (size) {
+		c->x86_cache_size = size;
+
+		if (opt_cpu_info)
+			printk("CPU: L2 Cache: %uK (%u bytes/line)\n",
+			       size, ecx & 0xFF);
+	}
+
+	size = edx >> 18;
+	if (size) {
+		c->x86_cache_size = size * 512;
+
+		if (opt_cpu_info)
+			printk("CPU: L3 Cache: %uM (%u bytes/line)\n",
+			       (size + (size & 1)) >> 1, edx & 0xFF);
+	}
 }
 
 static inline u32 _phys_pkg_id(u32 cpuid_apic, int index_msb)


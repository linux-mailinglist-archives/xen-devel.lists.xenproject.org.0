Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F241376242
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 10:40:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123839.233681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lew2H-0006bS-BH; Fri, 07 May 2021 08:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123839.233681; Fri, 07 May 2021 08:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lew2H-0006Za-8A; Fri, 07 May 2021 08:40:37 +0000
Received: by outflank-mailman (input) for mailman id 123839;
 Fri, 07 May 2021 08:40:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rJTn=KC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lew2F-0006ZU-9S
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 08:40:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c57a31a-961e-4422-bd31-daa7bc2dffe5;
 Fri, 07 May 2021 08:40:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 477F3AF1F;
 Fri,  7 May 2021 08:40:33 +0000 (UTC)
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
X-Inumbo-ID: 7c57a31a-961e-4422-bd31-daa7bc2dffe5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620376833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lSP494LFhPRsS9tN9QB1W7zthLUosYhvW9R78Mu49p0=;
	b=VWOOTltafbDR208fCN3YxKjNbvWpYFimCIeMFcvUYqIGLyrIo9tcj7XebO8RnurwqRf6tW
	7BWDIdGPQaAnNH8D15zB2bf+PxkyIxZ07EJB0e33/1F9SbXD5WveWkFti52FOTWwi9K9oy
	kc56ChdF3NWnM2WC99yWhnoeFtkrFpA=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/CPUID: don't shrink hypervisor leaves
Message-ID: <0f5fe8d3-4c43-e60f-c585-67b2f23383ab@suse.com>
Date: Fri, 7 May 2021 10:40:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is a partial revert of 540d911c2813 ("x86/CPUID: shrink
max_{,sub}leaf fields according to actual leaf contents"). Andrew points
out that XXX.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Obviously the XXX wants filling in. So far I did not really understand
what bad consequences there might be, but I can agree with the undoing
of this part of the original change along the lines of why the Viridian
side adjustment was also requested to be dropped (before the patch went
in).

--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -964,15 +964,13 @@ void cpuid_hypervisor_leaves(const struc
     uint32_t base = is_viridian_domain(d) ? 0x40000100 : 0x40000000;
     uint32_t idx  = leaf - base;
     unsigned int limit = is_viridian_domain(d) ? p->hv2_limit : p->hv_limit;
-    unsigned int dflt = is_pv_domain(d) ? XEN_CPUID_MAX_PV_NUM_LEAVES
-                                        : XEN_CPUID_MAX_HVM_NUM_LEAVES;
 
     if ( limit == 0 )
         /* Default number of leaves */
-        limit = dflt;
+        limit = XEN_CPUID_MAX_NUM_LEAVES;
     else
         /* Clamp toolstack value between 2 and MAX_NUM_LEAVES. */
-        limit = min(max(limit, 2u), dflt);
+        limit = min(max(limit, 2u), XEN_CPUID_MAX_NUM_LEAVES + 0u);
 
     if ( idx > limit )
         return;
--- a/xen/include/public/arch-x86/cpuid.h
+++ b/xen/include/public/arch-x86/cpuid.h
@@ -113,10 +113,6 @@
 /* Max. address width in bits taking memory hotplug into account. */
 #define XEN_CPUID_MACHINE_ADDRESS_WIDTH_MASK (0xffu << 0)
 
-#define XEN_CPUID_MAX_PV_NUM_LEAVES 5
-#define XEN_CPUID_MAX_HVM_NUM_LEAVES 4
-#define XEN_CPUID_MAX_NUM_LEAVES \
-    (XEN_CPUID_MAX_PV_NUM_LEAVES > XEN_CPUID_MAX_HVM_NUM_LEAVES ? \
-     XEN_CPUID_MAX_PV_NUM_LEAVES : XEN_CPUID_MAX_HVM_NUM_LEAVES)
+#define XEN_CPUID_MAX_NUM_LEAVES 5
 
 #endif /* __XEN_PUBLIC_ARCH_X86_CPUID_H__ */


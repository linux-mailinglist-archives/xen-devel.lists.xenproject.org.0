Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2372299178
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 16:54:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12395.32275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX4os-0002Dr-SA; Mon, 26 Oct 2020 15:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12395.32275; Mon, 26 Oct 2020 15:54:02 +0000
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
	id 1kX4os-0002DS-On; Mon, 26 Oct 2020 15:54:02 +0000
Received: by outflank-mailman (input) for mailman id 12395;
 Mon, 26 Oct 2020 15:54:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kX4or-0002DK-3X
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 15:54:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbd63557-167b-4689-8293-7fbe2b755cf8;
 Mon, 26 Oct 2020 15:54:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47282ACAA;
 Mon, 26 Oct 2020 15:53:59 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8IcS=EB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kX4or-0002DK-3X
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 15:54:01 +0000
X-Inumbo-ID: dbd63557-167b-4689-8293-7fbe2b755cf8
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id dbd63557-167b-4689-8293-7fbe2b755cf8;
	Mon, 26 Oct 2020 15:54:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603727639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8lM7HOM92Lc5vba5OG73OTC9FwXE+Z/RKzE2Ig5AFIo=;
	b=ZqOC5aI8NEK9Js/Rr0HQVMI6HVMXR+swCIMEo3WoWRT2QnzczU8FTTjzR9EMUYsMXrWOCT
	BeTsNiNy99vK/ZLY9Qx0gJYEFAyYwZUHAIpxj/tFWBALCWBaTLpL8204T4QnIRo31kj0Gq
	Po3s4Q3YI6OjDJHGC/eLUpzwWSQiNZc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 47282ACAA;
	Mon, 26 Oct 2020 15:53:59 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: don't open-code vmap_to_mfn()
Message-ID: <d1aeb904-6ae1-2ca8-220a-920f2be5416d@suse.com>
Date: Mon, 26 Oct 2020 16:53:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -333,21 +333,14 @@ void unmap_domain_page_global(const void
 mfn_t domain_page_map_to_mfn(const void *ptr)
 {
     unsigned long va = (unsigned long)ptr;
-    const l1_pgentry_t *pl1e;
 
     if ( va >= DIRECTMAP_VIRT_START )
         return _mfn(virt_to_mfn(ptr));
 
     if ( va >= VMAP_VIRT_START && va < VMAP_VIRT_END )
-    {
-        pl1e = virt_to_xen_l1e(va);
-        BUG_ON(!pl1e);
-    }
-    else
-    {
-        ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
-        pl1e = &__linear_l1_table[l1_linear_offset(va)];
-    }
+        return vmap_to_mfn(va);
 
-    return l1e_get_mfn(*pl1e);
+    ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
+
+    return l1e_get_mfn(__linear_l1_table[l1_linear_offset(va)]);
 }


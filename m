Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9198366E97
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114796.218837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEIH-0008Cy-4V; Wed, 21 Apr 2021 14:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114796.218837; Wed, 21 Apr 2021 14:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEIH-0008CY-1H; Wed, 21 Apr 2021 14:57:33 +0000
Received: by outflank-mailman (input) for mailman id 114796;
 Wed, 21 Apr 2021 14:57:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZEIG-0008C3-2j
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:57:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d6531b3-bb27-4ca8-b846-0279e2bc27c4;
 Wed, 21 Apr 2021 14:57:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 15918B2E8;
 Wed, 21 Apr 2021 14:57:28 +0000 (UTC)
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
X-Inumbo-ID: 4d6531b3-bb27-4ca8-b846-0279e2bc27c4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619017048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RGVbQa+GqVgOa2I76yheTEF5apAHeScJZb/syJB8fWc=;
	b=iCbgVqwxeyO8ueX3j8mD4gW5zxPGiIyrUDdwtYTpofx/l22VMOn7HAi8CArS2cP8VVHSXN
	xB0bdA86HaYqMjXByGH2jU7ZQMpcSZ0/jnRBc2PoisRihq18wEIHL/VEBSWswZmB7XEZhc
	zls4CFd5rPloiko0Z6H+waDyELBxx5w=
Subject: [PATCH v2 4/8] x86/IRQ: avoid over-alignment in alloc_pirq_struct()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
Message-ID: <8906088c-d76a-12ac-31d3-1375016a2148@suse.com>
Date: Wed, 21 Apr 2021 16:57:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In particular in the PV case xzalloc_bytes() forcing SMP_CACHE_BYTES
alignment is counterproductive, as the allocation size there is only 40
bytes. And if the code really cared about such higher than default
alignment, it should request so explicitly rather than using a type-
unsafe interface. Plus if e.g. cache line sharing was a concern, the
allocator itself should arrange to avoid such.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1313,9 +1313,12 @@ void cleanup_domain_irq_mapping(struct d
 
 struct pirq *alloc_pirq_struct(struct domain *d)
 {
-    size_t sz = is_hvm_domain(d) ? sizeof(struct pirq) :
-                                   offsetof(struct pirq, arch.hvm);
-    struct pirq *pirq = xzalloc_bytes(sz);
+    union pirq_pv {
+        char space[offsetof(struct pirq, arch.hvm)];
+        void *align;
+    };
+    struct pirq *pirq = is_hvm_domain(d) ? xzalloc(struct pirq)
+                                         : (void *)xzalloc(union pirq_pv);
 
     if ( pirq )
     {



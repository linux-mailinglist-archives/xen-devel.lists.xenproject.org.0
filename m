Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BC82D0E64
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:49:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46208.81988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmE4t-00010z-7D; Mon, 07 Dec 2020 10:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46208.81988; Mon, 07 Dec 2020 10:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmE4t-00010a-3w; Mon, 07 Dec 2020 10:49:11 +0000
Received: by outflank-mailman (input) for mailman id 46208;
 Mon, 07 Dec 2020 10:49:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmE4s-00010V-2l
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:49:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 814d90b4-8668-42ce-b61a-04ac8e2d1836;
 Mon, 07 Dec 2020 10:49:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 60659AC9A;
 Mon,  7 Dec 2020 10:49:08 +0000 (UTC)
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
X-Inumbo-ID: 814d90b4-8668-42ce-b61a-04ac8e2d1836
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607338148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q6U3UDuJapJmS5xECijJLyHuigwT4okcrlFsn/wiRJY=;
	b=ju1MuFtVenTC/NSK++/36htzpKe5oG2ylbNcjXqcSNWqyFrCVXpCTB2RX0MOlY7nXoGXSi
	LMQujVtxoJOiD5SMTqgMga8B1aPZzRQ5IVrU4Lj+Zq21Ij25ZfY/O2eVg+wSYUaO0aHfun
	b1nYnoR2DChS55nMDHSrxt2ahsxGiBQ=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/vIO-APIC: make use of xmalloc_flex_struct()
Message-ID: <a5a2e6e9-7bfa-75e8-7890-5d102b09835f@suse.com>
Date: Mon, 7 Dec 2020 11:49:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

... instead of effectively open-coding it in a type-unsafe way. Drop
hvm_vioapic_size() altogether, folding the other use in a memset()
invocation into the subsequent loop.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -622,9 +622,9 @@ void vioapic_reset(struct domain *d)
         unsigned int nr_pins = vioapic->nr_pins, base_gsi = vioapic->base_gsi;
         unsigned int pin;
 
-        memset(vioapic, 0, hvm_vioapic_size(nr_pins));
+        memset(vioapic, 0, offsetof(typeof(*vioapic), redirtbl));
         for ( pin = 0; pin < nr_pins; pin++ )
-            vioapic->redirtbl[pin].fields.mask = 1;
+            vioapic->redirtbl[pin] = (union vioapic_redir_entry){ .fields.mask = 1 };
 
         if ( !is_hardware_domain(d) )
         {
@@ -685,7 +685,8 @@ int vioapic_init(struct domain *d)
         }
 
         if ( (domain_vioapic(d, i) =
-              xmalloc_bytes(hvm_vioapic_size(nr_pins))) == NULL )
+              xmalloc_flex_struct(struct hvm_vioapic, redirtbl,
+                                  nr_pins)) == NULL )
         {
             vioapic_free(d, nr_vioapics);
             return -ENOMEM;
--- a/xen/include/asm-x86/hvm/vioapic.h
+++ b/xen/include/asm-x86/hvm/vioapic.h
@@ -56,7 +56,6 @@ struct hvm_vioapic {
     };
 };
 
-#define hvm_vioapic_size(cnt) offsetof(struct hvm_vioapic, redirtbl[cnt])
 #define domain_vioapic(d, i) ((d)->arch.hvm.vioapic[i])
 #define vioapic_domain(v) ((v)->domain)
 


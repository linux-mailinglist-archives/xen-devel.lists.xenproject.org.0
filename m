Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346E4358311
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 14:16:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107229.204969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTac-0003NG-63; Thu, 08 Apr 2021 12:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107229.204969; Thu, 08 Apr 2021 12:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTac-0003Mr-2e; Thu, 08 Apr 2021 12:16:50 +0000
Received: by outflank-mailman (input) for mailman id 107229;
 Thu, 08 Apr 2021 12:16:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUTab-0003Mm-2R
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:16:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d25c10aa-527d-42d8-b670-624b41a06f87;
 Thu, 08 Apr 2021 12:16:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3BCCDB2D3;
 Thu,  8 Apr 2021 12:16:47 +0000 (UTC)
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
X-Inumbo-ID: d25c10aa-527d-42d8-b670-624b41a06f87
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617884207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eDvHAwIF6mX0AlxLLrgGKEgwtN3OOz7sw/+4M1PC1Ao=;
	b=Jh10VdM3VM36k/09nhklM42jup0OlzVtOlN26h+O5CKp2dy9zekrqWlkFkZxhrAdMVXPE+
	wtv8awxlYvw/qGHwnGaDtc+1jY3Q9k1hYsKGcYeLlClgLGHL/LdjhEWsDd1uInPxEiJvxf
	ScWViD8W3wCUgazRsQwS7IgsQ2lTt7g=
Subject: [PATCH 01/11] x86/HVM: avoid effectively open-coding
 xzalloc_flex_struct()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Message-ID: <a6a27d6b-58de-1654-1f2f-8631a34a1281@suse.com>
Date: Thu, 8 Apr 2021 14:16:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Drop hvm_irq_size(), which exists for just this purpose.

There is a difference in generated code: xzalloc_bytes() forces
SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
actually don't want it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -642,7 +642,8 @@ int hvm_domain_initialise(struct domain
     d->arch.hvm.params = xzalloc_array(uint64_t, HVM_NR_PARAMS);
     d->arch.hvm.io_handler = xzalloc_array(struct hvm_io_handler,
                                            NR_IO_HANDLERS);
-    d->arch.hvm.irq = xzalloc_bytes(hvm_irq_size(nr_gsis));
+    d->arch.hvm.irq = xzalloc_flex_struct(struct hvm_irq,
+                                          gsi_assert_count, nr_gsis);
 
     rc = -ENOMEM;
     if ( !d->arch.hvm.pl_time || !d->arch.hvm.irq ||
--- a/xen/include/asm-x86/hvm/irq.h
+++ b/xen/include/asm-x86/hvm/irq.h
@@ -98,7 +98,6 @@ struct hvm_irq {
 #define hvm_pci_intx_link(dev, intx) \
     (((dev) + (intx)) & 3)
 #define hvm_domain_irq(d) ((d)->arch.hvm.irq)
-#define hvm_irq_size(cnt) offsetof(struct hvm_irq, gsi_assert_count[cnt])
 
 #define hvm_isa_irq_to_gsi(isa_irq) ((isa_irq) ? : 2)
 



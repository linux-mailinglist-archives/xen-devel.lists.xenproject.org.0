Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F48307884
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 15:48:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77114.139499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58ad-00088b-8i; Thu, 28 Jan 2021 14:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77114.139499; Thu, 28 Jan 2021 14:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58ad-00088B-4f; Thu, 28 Jan 2021 14:48:07 +0000
Received: by outflank-mailman (input) for mailman id 77114;
 Thu, 28 Jan 2021 14:48:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY0C=G7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l58ab-000882-QN
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:48:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de339bd3-d126-42f4-9d44-8437d222389c;
 Thu, 28 Jan 2021 14:48:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2DE36ACBA;
 Thu, 28 Jan 2021 14:48:04 +0000 (UTC)
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
X-Inumbo-ID: de339bd3-d126-42f4-9d44-8437d222389c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611845284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tI101rdws8S8QrrRhoEwqvoto1+NPzPP1Q9en7PJHPA=;
	b=pi3y//QVHLidCmACwz8h2e7BhEZHm/DtXfSdXYBO8Pf1qGlX53NGweXFW1LfRYvgnVjEZ7
	QmT4jWmaG5ucYCvHd3ZF9QVc3Qdx0a98+FHMZYAhyCf2mZPSkaELNhszS9G1BJJ9LbU5Lp
	yd+C3Otb0usEHexAdANri4wM4xKtMrs=
Subject: Re: [PATCH v3] x86/mm: Short circuit damage from "fishy"
 ref/typecount failure
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210119094122.23713-1-andrew.cooper3@citrix.com>
 <20210119130254.27058-1-andrew.cooper3@citrix.com>
 <98f64276-ec5d-7242-f10f-126fe7ee1f7e@suse.com>
 <45f5d1f0-1a89-706f-f202-91ddb1d8b094@citrix.com>
 <dd59ad75-c0f1-4d14-a0b6-06dd9e095b36@suse.com>
 <0c279f99-e74e-ced0-4947-b9a104160671@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <144d3985-67fe-10d3-11ef-3452b6f2656a@suse.com>
Date: Thu, 28 Jan 2021 15:48:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <0c279f99-e74e-ced0-4947-b9a104160671@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 25.01.2021 18:59, Andrew Cooper wrote:
> I am literally not changing the current behaviour.  Xen *will* hit a
> BUG() if any of these domain_crash() paths are taken.
> 
> If you do not believe me, then please go and actually check what happens
> when simulating a ref-acquisition failure.

Okay, I've started with the debugging patch below. After the
other error handling fixed (see the patch just sent), this
works fine and - with the changes not marked "//temp" - even
stops leaking the page in that case. This latter fact proves
(to me) that at least on this path there's no ref lost
anywhere, and there's also no BUG() elsewhere that we would
trigger. As re-assurance I observed subsequent run attempts
of the same guest to end up re-using this same page for this
same purpose in a number of cases.

You patch altered two other, similar paths, and I can't
exclude there to be a problem there. Since the exercise was
useful for fixing the other two bugs anyway, I guess I'll do
the same for those paths later on and see what I get.

Jan

--- unstable.orig/xen/arch/x86/hvm/vmx/vmx.c
+++ unstable/xen/arch/x86/hvm/vmx/vmx.c
@@ -3076,13 +3076,22 @@ static int vmx_alloc_vlapic_mapping(stru
     if ( !pg )
         return -ENOMEM;
 
-    if ( !get_page_and_type(pg, d, PGT_writable_page) )
+printk("%pd: APIC access MFN: %lx (c=%lx t=%lx)\n", d, mfn_x(page_to_mfn(pg)), pg->count_info, pg->u.inuse.type_info);//temp
+//temp    if ( !get_page_and_type(pg, d, PGT_writable_page) )
     {
         /*
          * The domain can't possibly know about this page yet, so failure
          * here is a clear indication of something fishy going on.
          */
         domain_crash(d);
+        if ( get_page(pg, d) )
+        {
+            put_page_alloc_ref(pg);
+printk("%pd: MFN %lx: (c=%lx t=%lx)\n", d, mfn_x(page_to_mfn(pg)), pg->count_info, pg->u.inuse.type_info);//temp
+            put_page(pg);
+        }
+        else
+            printk("%pd: leaking MFN %lx\n", d, mfn_x(page_to_mfn(pg)));
         return -ENODATA;
     }
 



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AE4308846
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 12:30:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78037.141768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RyL-0006BL-TT; Fri, 29 Jan 2021 11:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78037.141768; Fri, 29 Jan 2021 11:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RyL-0006Aw-QC; Fri, 29 Jan 2021 11:29:53 +0000
Received: by outflank-mailman (input) for mailman id 78037;
 Fri, 29 Jan 2021 11:29:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5RyK-0006Ar-6v
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 11:29:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d507d10-857c-4514-a33f-f6d60a1d3f74;
 Fri, 29 Jan 2021 11:29:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4B02AC41;
 Fri, 29 Jan 2021 11:29:48 +0000 (UTC)
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
X-Inumbo-ID: 9d507d10-857c-4514-a33f-f6d60a1d3f74
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611919789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKeH9xctSYSty6bmkhGqcwTWRY5TfJ4Rn37MZSo+DB4=;
	b=kGFjSAvdKNWORvWE7kSyybdTSXEupXubavFhEuZI02YQDWtOBVuZo/TGaeIjnO4JIf2Ivu
	jUNc5QS43Yw97zJVz6YeHvA8lNOdi7gcM+ntkQQ3Y3QMaGpqOEs09meOR/z3w5LEaAtbkD
	HDhj5uxndbcqz2syQb79BFiV4G2i2ik=
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
Message-ID: <a2ea0bc0-3644-a2c1-c0b2-f3085b1aa0b5@suse.com>
Date: Fri, 29 Jan 2021 12:29:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0c279f99-e74e-ced0-4947-b9a104160671@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 25.01.2021 18:59, Andrew Cooper wrote:
> On 20/01/2021 08:06, Jan Beulich wrote:
>> Also, as far as "impossible" here goes - the constructs all
>> anyway exist only to deal with what we consider impossible.
>> The question therefore really is of almost exclusively
>> theoretical nature, and hence something like a counter
>> possibly overflowing imo needs to be accounted for as
>> theoretically possible, albeit impossible with today's
>> computers and realistic timing assumptions. If a counter
>> overflow occurred, it definitely wouldn't be because of a
>> bug in Xen, but because of abnormal behavior elsewhere.
>> Hence I remain unconvinced it is appropriate to deal with
>> the situation by BUG().
> 
> I'm not sure how to be any clearer.
> 
> I am literally not changing the current behaviour.  Xen *will* hit a
> BUG() if any of these domain_crash() paths are taken.
> 
> If you do not believe me, then please go and actually check what happens
> when simulating a ref-acquisition failure.

So I've now also played the same game on the ioreq path (see
debugging patch below, and again with some non-"//temp"
changes actually improving overall behavior in that "impossible"
case). No BUG()s hit, no leaks (thanks to the extra changes),
no other anomalies observed.

Hence I'm afraid it is now really up to you to point out the
specific BUG()s (and additional context as necessary) that you
either believe could be hit, or that you have observed being hit.

Jan

--- unstable.orig/xen/arch/x86/hvm/ioreq.c
+++ unstable/xen/arch/x86/hvm/ioreq.c
@@ -366,13 +366,23 @@ static int hvm_alloc_ioreq_mfn(struct hv
     if ( !page )
         return -ENOMEM;
 
-    if ( !get_page_and_type(page, s->target, PGT_writable_page) )
+printk("%pd: %sioreq MFN: %lx (c=%lx t=%lx)\n", s->target, buf ? "buf" : "", mfn_x(page_to_mfn(page)), page->count_info, page->u.inuse.type_info);//temp
+//temp    if ( !get_page_and_type(page, s->target, PGT_writable_page) )
+if((buf == (s->target->domain_id & 1)) || !get_page_and_type(page, s->target, PGT_writable_page))//temp
     {
         /*
          * The domain can't possibly know about this page yet, so failure
          * here is a clear indication of something fishy going on.
          */
-        domain_crash(s->emulator);
+        domain_crash(is_control_domain(s->emulator) ? s->target : s->emulator);
+        if ( get_page(page, s->target) )
+        {
+            put_page_alloc_ref(page);
+printk("%pd: MFN %lx: (c=%lx t=%lx)\n", s->target, mfn_x(page_to_mfn(page)), page->count_info, page->u.inuse.type_info);//temp
+            put_page(page);
+        }
+        else
+            printk("%pd: leaking %pd MFN %lx\n", s->emulator, s->target, mfn_x(page_to_mfn(page)));
         return -ENODATA;
     }
 
@@ -385,6 +395,7 @@ static int hvm_alloc_ioreq_mfn(struct hv
     return 0;
 
  fail:
+printk("%pd: %sioreq mfn: %lx (c=%lx t=%lx)\n", s->target, buf ? "buf" : "", mfn_x(page_to_mfn(page)), page->count_info, page->u.inuse.type_info);//temp
     put_page_alloc_ref(page);
     put_page_and_type(page);
 
@@ -404,6 +415,7 @@ static void hvm_free_ioreq_mfn(struct hv
     unmap_domain_page_global(iorp->va);
     iorp->va = NULL;
 
+printk("%pd: %sioreq mfn: %lx [c=%lx t=%lx]\n", s->target, buf ? "buf" : "", mfn_x(page_to_mfn(page)), page->count_info, page->u.inuse.type_info);//temp
     put_page_alloc_ref(page);
     put_page_and_type(page);
 }


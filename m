Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 417942FCC57
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 09:08:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71248.127435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l28Vz-0007kQ-IM; Wed, 20 Jan 2021 08:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71248.127435; Wed, 20 Jan 2021 08:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l28Vz-0007k1-FD; Wed, 20 Jan 2021 08:06:55 +0000
Received: by outflank-mailman (input) for mailman id 71248;
 Wed, 20 Jan 2021 08:06:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l28Vy-0007jw-88
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 08:06:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c3e5f30-2a7c-4a52-a6a2-4e8fd913b0ad;
 Wed, 20 Jan 2021 08:06:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFD0DAE87;
 Wed, 20 Jan 2021 08:06:51 +0000 (UTC)
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
X-Inumbo-ID: 6c3e5f30-2a7c-4a52-a6a2-4e8fd913b0ad
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611130012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TdcCm0lLuDJF5W85yOmp2w6A9SFJer/K+JpruxLN/dw=;
	b=bNNa96FGgunGDnxCcms8ld3xEk1U9enZzPLKULv9+tlUz2iJjvhHD/0VVHI60NdPFTd6TF
	rLiYOZEm+LDLfO9hPfXPCCG+VCuTS7xX0t90kpmf/f6kdYIQr+ctb/uXYDklBAhRAaLVey
	MDHJFlbU79HjSptaDHUwJ/Aw0J2dDRQ=
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dd59ad75-c0f1-4d14-a0b6-06dd9e095b36@suse.com>
Date: Wed, 20 Jan 2021 09:06:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <45f5d1f0-1a89-706f-f202-91ddb1d8b094@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.01.2021 19:09, Andrew Cooper wrote:
> On 19/01/2021 16:48, Jan Beulich wrote:
>> On 19.01.2021 14:02, Andrew Cooper wrote:
>>> This code has been copied in 3 places, but it is problematic.
>>>
>>> All cases will hit a BUG() later in domain teardown, when a the missing
>>> type/count reference is underflowed.
>> I'm afraid I could use some help with this: Why would there
>> be a missing reference, when the getting of one failed?
> 
> Look at the cleanup logic for the associated fields.
> 
> Either the plain ref fails (impossible without other fatal refcounting
> errors AFAICT), or the typeref fails (a concern, but impossible AFAICT).

In principle I would agree, if there wasn't the question of
count overflows. The type count presently is 56 bits wide,
while the general refcount has 54 bits. It'll be a long time
until they overflow, but it's not impossible. The underlying
problem there that I see is - where do we draw the line
between "can't possibly overflow in practice" (as we would
typically assume for 64-bit counters) and "is to be expected
to overflow (as we would typically assume for 32-bit
counters)?

Also, as far as "impossible" here goes - the constructs all
anyway exist only to deal with what we consider impossible.
The question therefore really is of almost exclusively
theoretical nature, and hence something like a counter
possibly overflowing imo needs to be accounted for as
theoretically possible, albeit impossible with today's
computers and realistic timing assumptions. If a counter
overflow occurred, it definitely wouldn't be because of a
bug in Xen, but because of abnormal behavior elsewhere.
Hence I remain unconvinced it is appropriate to deal with
the situation by BUG().

But yes, if otoh we assume the failure here to be the result
of a bug elsewhere in Xen (and not an overflow), then BUG()
may be warranted. Yet afaic these constructs weren't meant
to deal with bugs elsewhere in Xen, but with the
"impossible". So if we change our collective mind here, I
think the conversion to BUG() would then need accompanying
by respective commentary.

> When the plain ref fails, put_page_alloc_ref() spots the underflow with
> a BUG, while if the typeref fails, it is _put_page_type()'s BUG which
> spots the underflow.

put_page_alloc_ref() puts the ref installed by assign_pages()
aiui. If that one underflows, a bad put must have been invoked
elsewhere, which then is the one to fix. _put_page_type()
spotting an underflow also means either that very invocation
shouldn't have happened, or an earlier one was issued in
error.

At the example of hvm_alloc_ioreq_mfn(), in case of hitting
the path in question the only ref to the page that exists is
the one from assign_pages(). And that's the only one that
will get dropped when the domain gets cleaned up. The page,
in particular, hasn't been recorded in iorp just yet. So I
don't see where any other put (general or type) would come
from.

>> IOW
>> I'm not (yet) convinced you don't make the impact more
>> severe in the (supposedly) impossible case of these paths
>> getting hit, by converting a domain crash into a host one.
> 
> I have test cases.  I didn't go searching for the BUG()s by code inspection.

I'd be curious to see what exactly they do, and why exactly
a BUG() results.

>> It is in particular relevant that a PV guest may be able to
>> cheat and "guess" an MFN to obtain references for before a
>> certain hypercall (or other operation) actually completed.
> 
> And do what with it?  PV guest's can't force typerefs for
> pgtable/segdesc because we prohibited cross-pg_owner scenarios many XSAs
> ago.  A PV guest also can't force it to none or shared.

Hmm, yes, the owning domain always is a HVM one. So even by
cooperating the type can't become other than PGT_writable_page.

> That only leaves PGT_writable_page, which is the ref we're interested in
> taking.
> 
>>> v2:
>>>  * Reword the commit message.
>>>  * Switch BUG() to BUG_ON() to further reduce code volume.
>> Short of us explicitly agreeing that such is fine to use, I
>> think we ought to stick to the previously (long ago) agreed
>> rule that BUG_ON() controlling expressions should not have
>> side effects, for us not wanting to guarantee it will now
>> and forever _not_ behave like ASSERT() wrt to evaluating
>> the expression.
> 
> So what you want is v1 of this patch.

Looks like so (assuming my concerns above can get sorted); the
versions came in so rapid succession that I didn't get around
to look at the earlier versions.

Jan


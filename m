Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ED5294B3A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 12:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9972.26320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVBKx-0005bu-4R; Wed, 21 Oct 2020 10:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9972.26320; Wed, 21 Oct 2020 10:27:19 +0000
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
	id 1kVBKx-0005bV-1U; Wed, 21 Oct 2020 10:27:19 +0000
Received: by outflank-mailman (input) for mailman id 9972;
 Wed, 21 Oct 2020 10:27:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVBKv-0005bQ-Dq
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:27:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f46a4776-59bb-4428-a178-af3e3ae58343;
 Wed, 21 Oct 2020 10:27:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6897EACD9;
 Wed, 21 Oct 2020 10:27:15 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVBKv-0005bQ-Dq
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 10:27:17 +0000
X-Inumbo-ID: f46a4776-59bb-4428-a178-af3e3ae58343
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f46a4776-59bb-4428-a178-af3e3ae58343;
	Wed, 21 Oct 2020 10:27:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603276035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHNd1S3yTsyFbS3ZcMZ+fi6ZJD4zjmufIMU5+ykiN00=;
	b=uSGZEhiowsQRzIF/nyZR8JsrqLvxTob37Jn/yiFNwqCdfnFeLrIyb6L78W9t72qQ4nP86p
	6mzanFnN4mldhEvBEDmlDH/kgghVT0tbTHyYry82/zFA4B73xQpw/pY3di/ae6RbYGFXNF
	7kY8flTiyMH/TtG20W6l0yIw4Q0vngc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6897EACD9;
	Wed, 21 Oct 2020 10:27:15 +0000 (UTC)
Subject: Re: [PATCH] x86/pv: Flush TLB in response to paging structure changes
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201020152405.26892-1-andrew.cooper3@citrix.com>
 <a50a19ce-321a-ceef-55e4-95ffbebff59d@suse.com>
 <c359adee-1826-032b-2d07-c06c545e3b96@citrix.com>
 <b24c21b0-607b-6add-e156-a37fcf7f2352@citrix.com>
 <9b54113c-9df2-2f44-1545-67ffe4831934@citrix.com>
 <da2d9140-c70d-33a4-a375-9615e806d7d4@suse.com>
 <6df749cd-bb2a-edd9-e74d-4e2f658e8929@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eeeabfa2-df36-42d7-326a-570f4a9373f9@suse.com>
Date: Wed, 21 Oct 2020 12:27:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <6df749cd-bb2a-edd9-e74d-4e2f658e8929@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.10.2020 12:01, Andrew Cooper wrote:
> On 21/10/2020 07:55, Jan Beulich wrote:
>> On 20.10.2020 20:46, Andrew Cooper wrote:
>>> On 20/10/2020 18:10, Andrew Cooper wrote:
>>>> On 20/10/2020 17:20, Andrew Cooper wrote:
>>>>> On 20/10/2020 16:48, Jan Beulich wrote:
>>>>>> On 20.10.2020 17:24, Andrew Cooper wrote:
>>>>>>> With MMU_UPDATE, a PV guest can make changes to higher level pagetables.  This
>>>>>>> is from Xen's point of view (as the update only affects guest mappings), and
>>>>>>> the guest is required to flush suitably after making updates.
>>>>>>>
>>>>>>> However, Xen's use of linear pagetables (UPDATE_VA_MAPPING, GNTTABOP_map,
>>>>>>> writeable pagetables, etc.) is an implementation detail outside of the
>>>>>>> API/ABI.
>>>>>>>
>>>>>>> Changes in the paging structure require invalidations in the linear pagetable
>>>>>>> range for subsequent accesses into the linear pagetables to access non-stale
>>>>>>> mappings.  Xen must provide suitable flushing to prevent intermixed guest
>>>>>>> actions from accidentally accessing/modifying the wrong pagetable.
>>>>>>>
>>>>>>> For all L2 and higher modifications, flush the full TLB.  (This could in
>>>>>>> principle be an order 39 flush starting at LINEAR_PT_VIRT_START, but no such
>>>>>>> mechanism exists in practice.)
>>>>>>>
>>>>>>> As this combines with sync_guest for XPTI L4 "shadowing", replace the
>>>>>>> sync_guest boolean with flush_flags and accumulate flags.  The sync_guest case
>>>>>>> now always needs to flush, there is no point trying to exclude the current CPU
>>>>>>> from the flush mask.  Use pt_owner->dirty_cpumask directly.
>>>>>> Why is there no point? There's no need for the FLUSH_ROOT_PGTBL
>>>>>> part of the flushing on the local CPU. The draft you had sent
>>>>>> earlier looked better in this regard.
>>>>> This was the area which broke.  It is to do with subtle difference in
>>>>> the scope of L4 updates.
>>>>>
>>>>> ROOT_PGTBL needs to resync current (if in use), and be broadcasted if
>>>>> other references to the pages are found.
>>>>>
>>>>> The TLB flush needs to be broadcast to the whole domain dirty mask, as
>>>>> we can't (easily) know if the update was part of the current structure.
>>>> Actually - we can know whether an L4 update needs flushing locally or
>>>> not, in exactly the same way as the sync logic currently works.
>>>>
>>>> However, unlike the opencoded get_cpu_info()->root_pgt_changed = true,
>>>> we can't just flush locally for free.
>>>>
>>>> This is quite awkward to express.
>>> And not safe.  Flushes may accumulate from multiple levels in a batch,
>>> and pt_owner may not be equal to current.
>> I'm not questioning the TLB flush - this needs to be the scope you
>> use (but just FLUSH_TLB as per my earlier reply). I'm questioning
>> the extra ROOT_PGTBL sync (meaning changes to levels other than L4
>> don't matter), which is redundant with the explicit setting right
>> after the call to mod_l4_entry(). But I guess since now you need
>> to issue _some_ flush_mask() for the local CPU anyway, perhaps
>> it's rather the explicit setting of ->root_pgt_changed which wants
>> dropping?
> 
> No.  That was the delta which delayed posting in the first place.  Dom0
> crashes very early without it.
> 
> The problem, as I said, is the asymmetry.
> 
> As dom0 is booting, the "only one use of this L4" logic kicks in, and
> skips setting ROOT_PGTBL, which then causes the flush_mask() not to
> flush on the local CPU either.

Ah, I think I finally got it. This asymmetry wants expressing then
in two different sets of flush flags (not sure whether two different
variables are needed), since - as per other replies - the local CPU
has different requirements anyway.

- all CPUs need FLUSH_TLB
- the local CPU may additionally need FLUSH_ROOT_PGTBL
- other CPUs may additionally (or instead, if you like) need
  FLUSH_ROOT_PGTBL | FLUSH_TLB_GLOBAL

But then of course the local CPU can as well have its
->root_pgt_changed updated directly - there's no difference whether
it gets done this way or by passing FLUSH_ROOT_PGTBL to flush_local().

Jan


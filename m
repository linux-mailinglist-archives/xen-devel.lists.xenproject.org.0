Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D116A466B1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 17:35:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897025.1305756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnKMt-0007A9-4r; Wed, 26 Feb 2025 16:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897025.1305756; Wed, 26 Feb 2025 16:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnKMt-00078g-2B; Wed, 26 Feb 2025 16:34:43 +0000
Received: by outflank-mailman (input) for mailman id 897025;
 Wed, 26 Feb 2025 16:34:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GPjD=VR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnKMr-00078Z-SH
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 16:34:41 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92e06ee9-f45f-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 17:34:39 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38f29a1a93bso5735677f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 08:34:39 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd91093dsm6069018f8f.101.2025.02.26.08.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 08:34:38 -0800 (PST)
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
X-Inumbo-ID: 92e06ee9-f45f-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740587679; x=1741192479; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1Dx2UlX9jdQVkW39pdtobaXQ2K7fJTyXjkyClar7dg8=;
        b=p5QFBWgEGO0WPosridzMz7Cs0okHdwUYkTJL53wNZAnrkku356RfHDpMShsLI4CU5R
         k1ZJsqL5NBYJHo+SmDvOVuboon1AfCqdlzuzY4QmpIzRUnY2k3aUiYXGfrSIQg9wCIU4
         mr9a4NTNB3H3OPn63AdiMUYKJ5bqbSsNegaWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740587679; x=1741192479;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Dx2UlX9jdQVkW39pdtobaXQ2K7fJTyXjkyClar7dg8=;
        b=vbhTu3T3cLgFypBN9nZg7jLHNomajRXrTxldkjE9/0Ah9kEz0k0h0Hdl/EIph6zmmE
         NFvvCLYo8UKOUUPSqs/SAiTUcNXC0X09KaXoynkUZTFiil95oFvXuyrI7YleI86SiPCB
         xKJPEGrvDfp3rdbllwQ8bjxoUWlCy1Jrn2wUlYVTayoyAxUyCtsTPaZp07EbZCrmD9fo
         iv3bqk01q+lIPEU29c4Kf62bjfoL2lIHJSPUXjBegK631t3a1IZFjrIOuXdaWiwuHpOo
         79YvemwCT4WxQub3oVB87Pdtdu5wA4dAOkrD3xqFr+KeWocLGf2oyMdjFsG/dHXh3WNN
         exfQ==
X-Gm-Message-State: AOJu0Yz8dXq9MVTUGdpGEg3LECuyd1mkIhqrUF+dTiKTpOcNPm1xfAzP
	KIWmECci9mcqdO+40k6m6Ww2GidI6Oz7lbYq+GEy38vDqE17QwIYQFZZae6NCuI=
X-Gm-Gg: ASbGncv94IClcfMiVEy9xadPoTR9PiT8XNzVr2rJOjSD27YaCY/RgcQQdDfGAgOmh7H
	HZbY+j3Y6OxMl0PohPU/zIKnD9BSxhMHD1hNdL2PrY63OqX6VTi6Prv2S7DWKUYI0MXpM+dscVl
	QXFu0avjlThqiex3LZzdb0WtgcNMxJa8cWZujhj0uJuUbzA9FuXYglawC3l2sArA3alHiFTKBJr
	h0a4/b3rbJcAIMd8hgWMg3ZoVhE0xvD7kGLw5mjlkO7V8Yw5kKm9LlTnN3VGdAqVPhP5MPrptMU
	r9ZpCTKY33yL1rh0bqwBhAC30gaBG0/6Dd2sKz55tERNSPjz+6SrpBpW107tGtGSgg==
X-Google-Smtp-Source: AGHT+IFI1Gu2TIgq3OikD1eJqGQHyIvd3Sc1YLl0VdDvpOu+Ib0oLIZpsTHkgBOtrPY4yh/RXNJVmA==
X-Received: by 2002:a05:6000:1863:b0:38f:4f64:8a22 with SMTP id ffacd0b85a97d-390d4fa3c1fmr2956641f8f.52.1740587679004;
        Wed, 26 Feb 2025 08:34:39 -0800 (PST)
Message-ID: <52adb963-9501-4d6b-a2cc-ec0e461baaf0@citrix.com>
Date: Wed, 26 Feb 2025 16:34:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <Z78djoAU7vjGepjr@macbook.local>
 <a9d4384c-770b-4947-b099-cf4bba1583a5@suse.com>
 <Z78lJfzqH9btDMrM@macbook.local>
 <292f8373-705a-4405-bbdb-af750eb5f0ac@suse.com>
 <Z787fHY6L0ssFDjG@macbook.local>
 <f30a8fcf-5bb2-41ff-bc9f-25e421665ab2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f30a8fcf-5bb2-41ff-bc9f-25e421665ab2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/02/2025 4:06 pm, Jan Beulich wrote:
> On 26.02.2025 17:04, Roger Pau Monné wrote:
>> On Wed, Feb 26, 2025 at 03:36:33PM +0100, Jan Beulich wrote:
>>> On 26.02.2025 15:28, Roger Pau Monné wrote:
>>>> On Wed, Feb 26, 2025 at 03:08:33PM +0100, Jan Beulich wrote:
>>>>> On 26.02.2025 14:56, Roger Pau Monné wrote:
>>>>>> On Mon, Feb 24, 2025 at 01:27:24PM +0000, Alejandro Vallejo wrote:
>>>>>>> --- a/xen/common/page_alloc.c
>>>>>>> +++ b/xen/common/page_alloc.c
>>>>>>> @@ -490,13 +490,11 @@ static long outstanding_claims; /* total outstanding claims by all domains */
>>>>>>>  
>>>>>>>  unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>>>>>>>  {
>>>>>>> -    long dom_before, dom_after, dom_claimed, sys_before, sys_after;
>>>>>>> -
>>>>>>>      ASSERT(rspin_is_locked(&d->page_alloc_lock));
>>>>>>>      d->tot_pages += pages;
>>>>>>>  
>>>>>>>      /*
>>>>>>> -     * can test d->claimed_pages race-free because it can only change
>>>>>>> +     * can test d->outstanding_pages race-free because it can only change
>>>>>>>       * if d->page_alloc_lock and heap_lock are both held, see also
>>>>>>>       * domain_set_outstanding_pages below
>>>>>>>       */
>>>>>>> @@ -504,17 +502,16 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>>>>>>>          goto out;
>>>>>> I think you can probably short-circuit the logic below if pages == 0?
>>>>>> (and avoid taking the heap_lock)
>>>>> Are there callers passing in 0?
>>>> Not sure, but if there are no callers expected we might add an ASSERT
>>>> to that effect then.
>>>>
>>>>>>>      spin_lock(&heap_lock);
>>>>>>> -    /* adjust domain outstanding pages; may not go negative */
>>>>>>> -    dom_before = d->outstanding_pages;
>>>>>>> -    dom_after = dom_before - pages;
>>>>>>> -    BUG_ON(dom_before < 0);
>>>>>>> -    dom_claimed = dom_after < 0 ? 0 : dom_after;
>>>>>>> -    d->outstanding_pages = dom_claimed;
>>>>>>> -    /* flag accounting bug if system outstanding_claims would go negative */
>>>>>>> -    sys_before = outstanding_claims;
>>>>>>> -    sys_after = sys_before - (dom_before - dom_claimed);
>>>>>>> -    BUG_ON(sys_after < 0);
>>>>>>> -    outstanding_claims = sys_after;
>>>>>>> +    BUG_ON(outstanding_claims < d->outstanding_pages);
>>>>>>> +    if ( pages > 0 && d->outstanding_pages < pages )
>>>>>>> +    {
>>>>>>> +        /* `pages` exceeds the domain's outstanding count. Zero it out. */
>>>>>>> +        outstanding_claims -= d->outstanding_pages;
>>>>>>> +        d->outstanding_pages = 0;
>>>>>>> +    } else {
>>>>>>> +        outstanding_claims -= pages;
>>>>>>> +        d->outstanding_pages -= pages;
>>>>>> I wonder if it's intentional for a pages < 0 value to modify
>>>>>> outstanding_claims and d->outstanding_pages, I think those values
>>>>>> should only be set from domain_set_outstanding_pages().
>>>>>> domain_adjust_tot_pages() should only decrease the value, but never
>>>>>> increase either outstanding_claims or d->outstanding_pages.
>>>>>>
>>>>>> At best the behavior is inconsistent, because once
>>>>>> d->outstanding_pages reaches 0 there will be no further modification
>>>>>> from domain_adjust_tot_pages().
>>>>> Right, at that point the claim has run out. While freeing pages with an
>>>>> active claim means that the claim gets bigger (which naturally needs
>>>>> reflecting in the global).
>>>> domain_adjust_tot_pages() is not exclusively called when freeing
>>>> pages, see steal_page() for example.
>>> Or also when pages were allocated. steal_page() ...
>>>
>>>> When called from steal_page() it's wrong to increase the claim, as
>>>> it assumes that the page removed from d->tot_pages is freed, but
>>>> that's not the case.  The domain might end up in a situation where
>>>> the claim is bigger than the available amount of memory.
>>> ... is a case that likely wasn't considered when the feature was added.
>>>
>>> I never really liked this; I'd be quite happy to see it ripped out, as
>>> long as we'd be reasonably certain it isn't in active use by people.
>> What do you mean with 'it' in the above sentence, the whole claim
>> stuff?
> Yes.
>
>>  Or just getting rid of allowing the claim to increase as a
>> result of pages being removed from a domain?
> No.

Alejandro and I discussed this earlier in the week.

The claim infrastructure stuff is critical for a toolstack capable of
doing things in parallel.

However, it is also nonsensical for there to be a remaining claim by the
time domain construction is done.

If creation_finished were a concrete thing, rather than a bodge hacked
into domain_unpause_by_systemcontroller(), it ought to be made to fail
if there were an outstanding claim.  I suggested that we follow through
on a previous suggestion of making it a real hypercall (which is needed
by the encrypted VM crowd too).

~Andrew


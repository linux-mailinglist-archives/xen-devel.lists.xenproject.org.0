Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B32C85B8D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 16:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172020.1497091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNul2-0004gA-S3; Tue, 25 Nov 2025 15:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172020.1497091; Tue, 25 Nov 2025 15:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNul2-0004eD-PW; Tue, 25 Nov 2025 15:15:08 +0000
Received: by outflank-mailman (input) for mailman id 1172020;
 Tue, 25 Nov 2025 15:15:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BAQ+=6B=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vNul2-0004e5-19
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 15:15:08 +0000
Received: from sender3-of-o50.zoho.com (sender3-of-o50.zoho.com
 [136.143.184.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85635abd-ca11-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 16:15:06 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1764083700855102.12441115903425;
 Tue, 25 Nov 2025 07:15:00 -0800 (PST)
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
X-Inumbo-ID: 85635abd-ca11-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; t=1764083703; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dyB1xRiuBOuGIfEAxVcCsgM4nSXxmqJLWF2QMiz2/iD0QR8y353nlO+ATHRaZtI6mCWxh0f+L4wKy4LARiDIWKVEBYor9Deh1tzpH5wHgYWG1qr23Buvz7BRB934AQpOe8K9f3al1f+S9Wm/Jx8YigK2aWo+dHN+uuIfX+m51dU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764083703; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mpY+NLSrCR6NCga9NoJmYIaV14kT2racyE6PQxP+bTI=; 
	b=iSEaXb89/OOF66beXNStj+rRXm8honFCIatR9PcNp2YHCRHJ76AjSOpxcwg0xcv24yV7xLK9Twcmij+vuGoUS5GuMfm8qOoHVqRnCL/S8YpPlVETpRG0VNfrkbIsuh5r2MfmU0SXsiPrro5N95Z3xz6rS+hgISA8+v5bx8/quGI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764083703;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mpY+NLSrCR6NCga9NoJmYIaV14kT2racyE6PQxP+bTI=;
	b=PZIMuZjA/JwDk9CiZKkpsi0vmDmV81A7YwDgT4yIg/sbK7jHbPCUNu00xg+zdatr
	9n3VA1w0tgxdNLAEdcpYLmGIwkN1sXQVJhSfL9rImjMLjNu9imVVSBuSA3dcPVvzPOE
	55CN11kt4yOoA2Ec9yQl3AUZGVxuvlygP2ZfT+8U=
Message-ID: <b13572b6-d343-4616-aea4-674739c6589f@apertussolutions.com>
Date: Tue, 25 Nov 2025 10:14:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] EFI/runtime: switch to xv[mz]alloc_array()
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <41b7e14c-59ef-40f5-8c43-69bdc5fb4531@suse.com>
 <761b584a-51fb-403d-948e-3366501cea50@apertussolutions.com>
 <755dd957-514b-4316-82f5-3619c19cbb15@suse.com>
 <9f9f24f0-c16a-4f55-b3c2-a3f4b485c403@apertussolutions.com>
 <2d93e9a7-abef-4ef6-bcbc-9081661edb58@suse.com>
 <052e7926-f114-4b16-b197-8a4303f6b5d1@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <052e7926-f114-4b16-b197-8a4303f6b5d1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/25/25 7:06 AM, Jan Beulich wrote:
> On 14.08.2025 08:46, Jan Beulich wrote:
>> On 14.08.2025 02:29, Daniel P. Smith wrote:
>>> On 8/12/25 02:12, Jan Beulich wrote:
>>>> On 12.08.2025 02:19, Daniel P. Smith wrote:
>>>>> On 7/23/25 09:39, Jan Beulich wrote:
>>>>>> Use the more "modern" form, thus doing away with effectively open-coding
>>>>>> xmalloc_array() at the same time. While there is a difference in
>>>>>> generated code, as xmalloc_bytes() forces SMP_CACHE_BYTES alignment, if
>>>>>> code really cared about such higher than default alignment, it should
>>>>>> request so explicitly.
>>>>>
>>>>> While I don't object to the change itself, I think this description is a
>>>>> bit over simplification of the change. If the allocation is under
>>>>> PAGE_SIZE, then they are equivalent, but if it is over the page size
>>>>> there are a few more differences than just cache alignment. It
>>>>> completely changes the underlying allocator. I personally also find it a
>>>>> bit of a stretch to call xmalloc_bytes(size) an open coded version of
>>>>> xmalloc_array(char, size).
>>>>
>>>> My take is that xmalloc_bytes() should never have existed. Hence why I
>>>> didn't add xzmalloc_bytes() when introducing that family of interfaces.
>>>
>>> Right, which would be a valid argument for replacing it with
>>> xmalloc_array(). Though, I would note that there is an xzalloc_bytes().
>>> My concern was that you stated there was an open coding, which had me
>>> expecting there was a line of the form, xmanlloc_bytes(count *
>>> size_of_something bigger), being replaced by
>>> xvmalloc_arryay(something_bigger, count).
>>
>> Both fir this and ...
>>
>>> IMHO, while the C spec does specify char as 1 byte and thus
>>> interchangeable, I would agree that from a contextual perspective,
>>> xmalloc_array() is the more appropriate call. The use of the allocation
>>> is a character array and not a chunk of bytes for an arbitrary buffer.
>>
>> ... for this: Hence my wording using "effectively".
>>
>>>>> With a stronger description of the change,
>>>>
>>>> So what exactly do you mean by "stronger"? I can add that in the unlikely
>>>> event that one of the allocations is (near) PAGE_SIZE or larger, we now
>>>> wouldn't require contiguous memory anymore. Yet based on your comment at
>>>> the top I'm not quite sure if that's what you're after and/or enough to
>>>> satisfy your request.
>>>
>>> The phrasing stronger was meant to be more clear on the change/effect,
>>> specifically that the underlying allocator is being changed when the
>>> allocation is greater than a PAGE_SIZE. Not necessarily a long
>>> explanation, just the fact that the allocation will be coming from the
>>> dom heap allocator as opposed to the xen heap allocator. There are
>>> implications to changing the allocater, e.g.,  at a minimum the
>>> allocation order and nonphysical vs. physically contiguous effects.
>>> Having it noted in the commit makes it more obvious what this change is
>>> actually doing. Which may not be obvious when seeing the simple line
>>> changes occurring in the diff. Later, if there is an unexpected
>>> consequence caused by this change, a stronger commit will be helpful
>>> with the bisection investigations.
>>
>> First: I don't think each and every such change (there are going to be many)
>> should re-explain the switch to the xvmalloc() family of functions. This is
>> already stated clearly at the top of xvmalloc.h: Over time, the entire code
>> base is meant to be switched.
>>
>> Beyond that, to achieve the stronger wording you're after, would it perhaps
>> suffice to have the first sentence say "..., thus also doing away ..."?
>> Otherwise, may I ask that you please make a more concrete suggestion?
> 
> Ping. I'd like to get this in, yet I still don't know how exactly to satisfy
> your request for a stronger description.
> 
> Jan

This fell off my plate and not fair to Jan, I will just rescind my concern.

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>


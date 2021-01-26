Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C3A303A46
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 11:30:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74805.134475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Lc1-00068l-VP; Tue, 26 Jan 2021 10:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74805.134475; Tue, 26 Jan 2021 10:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Lc1-00068Q-SD; Tue, 26 Jan 2021 10:30:17 +0000
Received: by outflank-mailman (input) for mailman id 74805;
 Tue, 26 Jan 2021 10:30:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4Lc0-00068L-Ih
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 10:30:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be5a1c43-d2ed-4a0d-8d65-036024c4e7da;
 Tue, 26 Jan 2021 10:30:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B9FBACC6;
 Tue, 26 Jan 2021 10:30:14 +0000 (UTC)
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
X-Inumbo-ID: be5a1c43-d2ed-4a0d-8d65-036024c4e7da
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611657014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rihgQxu0kDBylzjVGXt442humeEmTk9je3eLtI/zoYs=;
	b=owl+JV6DcryNM19LKY1g9j6u4xh57DXLF19nnRpZB/IGAxLHvZNdBaX1OqnQO19nHRB9pb
	Dh37UbMOeBtEPpU6QKSf2gO0hvC8Looc/AN2r7XPj3nGxgRBZ5nQWOSX26AI5DXQuYUpfQ
	B248IhGZeaxdsT4gPiNx0o5V06vxhts=
Subject: Re: [PATCH v7 04/10] xen/memory: Add a vmtrace_buf resource type
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-5-andrew.cooper3@citrix.com>
 <7702d1d6-86c9-af43-c9a9-f5ec082bad2d@suse.com>
 <226c4857-b0f7-f7f8-f353-e7331cce6e46@suse.com>
 <d062a1cb-1a6c-8a9a-1ea0-c3eff941e870@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <259b316b-8db2-145a-4e43-8955c2bbb62f@suse.com>
Date: Tue, 26 Jan 2021 11:30:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <d062a1cb-1a6c-8a9a-1ea0-c3eff941e870@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.01.2021 10:58, Andrew Cooper wrote:
> On 26/01/2021 07:37, Jan Beulich wrote:
>> On 25.01.2021 17:31, Jan Beulich wrote:
>>> On 21.01.2021 22:27, Andrew Cooper wrote:
>>>> +static int acquire_vmtrace_buf(
>>>> +    struct domain *d, unsigned int id, unsigned long frame,
>>>> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
>>>> +{
>>>> +    const struct vcpu *v = domain_vcpu(d, id);
>>>> +    unsigned int i;
>>>> +    mfn_t mfn;
>>>> +
>>>> +    if ( !v || !v->vmtrace.buf ||
>>>> +         nr_frames > d->vmtrace_frames ||
>>>> +         (frame + nr_frames) > d->vmtrace_frames )
>>>> +        return -EINVAL;
>>>
>>> I think that for this to guard against overflow, the first nr_frames
>>> needs to be replaced by frame (as having the wider type), or else a
>>> very large value of frame coming in will not yield the intended
>>> -EINVAL.
>> Actually, besides this then wanting to be >= instead of >, this
>> wouldn't take care of the 32-bit case (or more generally the
>> sizeof(long) == sizeof(int) one). So I think you want
>>
>>     if ( !v || !v->vmtrace.buf ||
>>          (frame + nr_frames) < frame ||
>>          (frame + nr_frames) > d->vmtrace_frames )
>>         return -EINVAL;
>>
>>> If you agree, with this changed,
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> This holds.
> 
> I slipped this buggy version in to prove a point.

IOW you've been intentionally submitting buggy code. Very
interesting.

> You're now 3 or 4 attempts into "simplifying" my original version, and
> have on at least 2 attempts made your R-b conditional on a buggy version.

In which way is the last proposed version buggy, and in which
way was the intermediate proposal problematic beyond the
aspects I did recognize myself? (I also see no problem with
taking a number of iterations to arrive at the correct result,
and I also wouldn't view this happening as an indication that
an initial comment was wrong then, unless the final result of
this iterative process matches what there was originally.)

> This form is clearly too complicated to reason about correctly, and it
> is definitely more complicated than I am happy taking.
> 
> 
> I am either going to go with my original version, which is trivially and
> obviously correct,

I've just tried to locate your "original version" in my mailbox.
I don't have an earlier patch there with this same title.
Without being able to locate the prior suggestion of mine, I'm
afraid I won't be able to verify if indeed I did suggest the
variant above before; I wouldn't consider it very likely though.
In any event I think it would have helped more if you had
proven to me where I'm wrong; I can be convinced, but calling
something "trivially and obviously correct" is not a technical
statement in such a situation. It instead feels more like a
killer phrase.

By implication, you saying "trivially and obviously correct"
can really mean only one of two things if indeed I had found a
need to comment on this same piece of code (under a different
title) earlier on: I'm trivially and obviously stupid (and
would better go away), or you're wrong with the statement (at
least in assuming what's trivial and obvious to you also
necessarily is to everyone else). I'm sorry to say it this
bluntly, but your reply above feels pretty blunt as well.

> or I'm considering reducing frame to 32 bits at the
> top level to fix this width nonsense throughout Xen.

I wouldn't mind this (and I've been wondering about the
"unsigned long" a number of times), but I'm afraid I don't see
how your construct above would be correctly rejecting all
overflowing cases then.

Jan


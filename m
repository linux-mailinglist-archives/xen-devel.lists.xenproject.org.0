Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740E930A961
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 15:12:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79904.145703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ZwC-0005aA-DD; Mon, 01 Feb 2021 14:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79904.145703; Mon, 01 Feb 2021 14:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ZwC-0005Zl-A8; Mon, 01 Feb 2021 14:12:20 +0000
Received: by outflank-mailman (input) for mailman id 79904;
 Mon, 01 Feb 2021 14:12:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6ZwB-0005Zg-Oh
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 14:12:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f959a94-ab87-411b-9746-450bd3d34564;
 Mon, 01 Feb 2021 14:12:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C4B89B12A;
 Mon,  1 Feb 2021 14:12:17 +0000 (UTC)
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
X-Inumbo-ID: 6f959a94-ab87-411b-9746-450bd3d34564
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612188737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e6NTAuMLffaGsyeg7ykeVAQ3bGgrjQJ8c8hL8Z+d/4U=;
	b=krwd+A3hydspkJx1NcKNjQOpToVoTP8TC4HRw7V7n6U6oHXWWY1v9hotcyHe5e+ZSl/A1H
	BKFLaoCTOdocOludZunGuLKzEj2ZRZZJLVGTM7VQ+uDurvBawDWin4LznEVXLJXaUN0T5V
	xM0R2/0oerPaJqrM0Tovo5LiZtsTnAQ=
Subject: Re: [PATCH v3 5/7] xen/memory: Improve compat XENMEM_acquire_resource
 handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
 <20210112194841.1537-6-andrew.cooper3@citrix.com>
 <e8162d0a-b85f-abc4-790e-60ea93a8dc6b@suse.com>
 <cf8408e3-4869-8fae-fb33-b651ee1f8948@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9659b4f2-ebd7-e398-fc0a-7bd451c4ebe0@suse.com>
Date: Mon, 1 Feb 2021 15:12:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cf8408e3-4869-8fae-fb33-b651ee1f8948@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.01.2021 00:32, Andrew Cooper wrote:
> On 15/01/2021 15:37, Jan Beulich wrote:
>> On 12.01.2021 20:48, Andrew Cooper wrote:
>>> @@ -446,6 +430,31 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>>  
>>>  #undef XLAT_mem_acquire_resource_HNDL_frame_list
>>>  
>>> +            if ( xen_frame_list && cmp.mar.nr_frames )
>>> +            {
>>> +                /*
>>> +                 * frame_list is an input for translated guests, and an output
>>> +                 * for untranslated guests.  Only copy in for translated guests.
>>> +                 */
>>> +                if ( paging_mode_translate(currd) )
>>> +                {
>>> +                    compat_pfn_t *compat_frame_list = (void *)xen_frame_list;
>>> +
>>> +                    if ( !compat_handle_okay(cmp.mar.frame_list,
>>> +                                             cmp.mar.nr_frames) ||
>>> +                         __copy_from_compat_offset(
>>> +                             compat_frame_list, cmp.mar.frame_list,
>>> +                             0, cmp.mar.nr_frames) )
>>> +                        return -EFAULT;
>>> +
>>> +                    /*
>>> +                     * Iterate backwards over compat_frame_list[] expanding
>>> +                     * compat_pfn_t to xen_pfn_t in place.
>>> +                     */
>>> +                    for ( int x = cmp.mar.nr_frames - 1; x >= 0; --x )
>>> +                        xen_frame_list[x] = compat_frame_list[x];
>> Just as a nit, without requiring you to adjust (but with the
>> request to consider adjusting) - x getting used as array index
>> would generally suggest it wants to be an unsigned type (despite
>> me guessing the compiler ought to be able to avoid an explicit
>> sign-extension for the actual memory accesses):
>>
>>                     for ( unsigned int x = cmp.mar.nr_frames; x--; )
>>                         xen_frame_list[x] = compat_frame_list[x];
> 
> Signed numbers are not inherently evil.  The range of x is between 0 and
> 1020 so there is no issue with failing to enter the loop.
> 
> It is the compilers job to make this optimisation.  It is a very poor
> use of a developers time to write logic which takes extra effort to
> figure out whether it is correct or not.

I don't see why my suggested alternative is any more difficult to
understand. It's one less expression, so perhaps even less cognitive
load. But yes, this is easily getting subjective.

> You know what my attitude will be towards a compiler which is incapable
> of making the optimisation, and you've got to go back a decade to find a
> processor old enough to not have identical performance between the
> unoptimised signed and unsigned forms.

I'm not sure I see how the compiler could transform this to using
unsigned int. By observation, gcc10 doesn't, despite -O2 (release
build). It still emits an otherwise unnecessary MOVSXD, and the
loop body is one insn shorter with an unsigned induction variable
(albeit that's likely just a side effect in this specific example).

> Both signs of numbers have their uses, and a rigid policy of using
> unsigned numbers does more harm than good (in this case, concerning the
> simplicity of the code).

Of course. But array accesses are where we'd better limit ourselves
to unsigned indexing variables, imo.

Jan


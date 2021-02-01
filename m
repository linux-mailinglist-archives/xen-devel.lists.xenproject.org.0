Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B0E30A9CB
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 15:32:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79913.145739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6aFM-0007sS-JC; Mon, 01 Feb 2021 14:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79913.145739; Mon, 01 Feb 2021 14:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6aFM-0007s3-GC; Mon, 01 Feb 2021 14:32:08 +0000
Received: by outflank-mailman (input) for mailman id 79913;
 Mon, 01 Feb 2021 14:32:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6aFL-0007ry-3c
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 14:32:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 288ab814-50d9-4a0d-b9c7-8d86337b0b91;
 Mon, 01 Feb 2021 14:32:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5AAFAABD5;
 Mon,  1 Feb 2021 14:32:05 +0000 (UTC)
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
X-Inumbo-ID: 288ab814-50d9-4a0d-b9c7-8d86337b0b91
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612189925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JsQrQiVZAcpllfsI2rXmpiIJAp8HlUSCrYlYpdPS2d0=;
	b=HELZbpW/JKdE91nbmyMfUXMwRTrutbeFmAoRh+Aaz95K1TjF9dKrDMs60YAPefC0GRIn3h
	AOWAa6rywy3INmRw4qeMfGOZX43W4urZfD6exvAn8ydHhE4336Xelh7+4sjQLkOWBHtPwN
	kD4svgE9zz+cm8lHBBzUJFJ1BfAMAdQ=
Subject: Re: [PATCH v8 06/16] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <20210130025852.12430-7-andrew.cooper3@citrix.com>
 <YBfTpTzi+wo7AFSH@Air-de-Roger>
 <53a26fb9-9c43-d1c4-90cd-bb29d57e106b@citrix.com>
 <28e8d116-9d5f-3c73-b366-63d5b047b085@suse.com>
 <8c4ef206-8378-8fa4-60cd-199491a136c6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <af358c3a-8d8c-b576-22e5-d6464e167ef2@suse.com>
Date: Mon, 1 Feb 2021 15:32:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <8c4ef206-8378-8fa4-60cd-199491a136c6@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.02.2021 15:04, Andrew Cooper wrote:
> On 01/02/2021 13:03, Jan Beulich wrote:
>> On 01.02.2021 12:11, Andrew Cooper wrote:
>>> On 01/02/2021 10:10, Roger Pau Monné wrote:
>>>> On Sat, Jan 30, 2021 at 02:58:42AM +0000, Andrew Cooper wrote:
>>>>> @@ -636,15 +662,45 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>>>>                      compat_frame_list[i] = frame;
>>>>>                  }
>>>>>  
>>>>> -                if ( __copy_to_compat_offset(cmp.mar.frame_list, 0,
>>>>> +                if ( __copy_to_compat_offset(cmp.mar.frame_list, start_extent,
>>>>>                                               compat_frame_list,
>>>>> -                                             cmp.mar.nr_frames) )
>>>>> +                                             done) )
>>>>>                      return -EFAULT;
>>>> Is it fine to return with a possibly pending continuation already
>>>> encoded here?
>>>>
>>>> Other places seem to crash the domain when that happens.
>>> Hmm.  This is all a total mess.  (Elsewhere the error handling is also
>>> broken - a caller who receives an error can't figure out how to recover)
>>>
>>> But yes - I think you're right - the only thing we can do here is `goto
>>> crash;` and woe betide any 32bit kernel which passes a pointer to a
>>> read-only buffer.
>> I'd like to ask you to reconsider the "goto crash", both the one
>> you mention above and the other one already present in the patch.
>> Wiring all the cases where we mean to crash the guest into a
>> single domain_crash() invocation has the downside that when
>> observing such a case one can't remotely know which path has led
>> there. Therefore I'd like to suggest individual domain_crash()
>> invocations on every affected path. Elsewhere in the file there
>> already is such an instance, commented "Cannot cancel the
>> continuation...".
> 
> But they're all logically the same, are they not?

Depends on what "logically the same" here means. To me different
paths and different causes aren't necessarily "the same".

Jan


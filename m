Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D6427C2F9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 12:58:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.23.109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNDKy-0005vC-4H; Tue, 29 Sep 2020 10:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23.109; Tue, 29 Sep 2020 10:58:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNDKy-0005um-0N; Tue, 29 Sep 2020 10:58:24 +0000
Received: by outflank-mailman (input) for mailman id 23;
 Tue, 29 Sep 2020 10:58:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNDKw-0005uh-LB
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 10:58:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8017fece-636a-4206-b0e6-0b8f3f431312;
 Tue, 29 Sep 2020 10:58:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AD8CBAD08;
 Tue, 29 Sep 2020 10:58:20 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNDKw-0005uh-LB
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 10:58:22 +0000
X-Inumbo-ID: 8017fece-636a-4206-b0e6-0b8f3f431312
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8017fece-636a-4206-b0e6-0b8f3f431312;
	Tue, 29 Sep 2020 10:58:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601377100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x6IpLui/4Eta8QE2K6m07lhcE6P4rR9dZ9Jed2RadjY=;
	b=kYwmQTy8uh+nrGmpxGD4rS+Y/R/dJaxSuBdsMtj1E+DIitkYZGa+7BFNjDJezJqAY41Djl
	gY2xJdYuGDUPOITLr0TMAX+P9q2AY6JnkflRGjYGwmY7eVVGtBJZEVx5wwVHGAejcdIR41
	rKy/RNKyFdSVNy7zq712xPqAaX8NdWc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AD8CBAD08;
	Tue, 29 Sep 2020 10:58:20 +0000 (UTC)
Subject: Re: Ping: [PATCH 2/2] x86/vpic: also execute dpci callback for
 non-specific EOI
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20200820153442.28305-1-roger.pau@citrix.com>
 <20200820153442.28305-3-roger.pau@citrix.com>
 <625060e6-bdd0-c72c-c7fc-9a31588511b3@citrix.com>
 <4ac81e8f-f6e5-7226-49c7-135aa88a7b12@suse.com>
 <8e21a5fc-6c76-171f-8493-4a084ac1a779@suse.com>
 <20200929102746.GQ19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b1e90afe-1e9f-3230-a5d8-1e3e2307da3d@suse.com>
Date: Tue, 29 Sep 2020 12:58:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929102746.GQ19254@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.09.2020 12:27, Roger Pau Monné wrote:
> On Mon, Sep 21, 2020 at 12:05:51PM +0200, Jan Beulich wrote:
>> On 21.08.2020 09:45, Jan Beulich wrote:
>>> On 20.08.2020 18:28, Andrew Cooper wrote:
>>>> On 20/08/2020 16:34, Roger Pau Monne wrote:
>>>>> Currently the dpci EOI callback is only executed for specific EOIs.
>>>>> This is wrong as non-specific EOIs will also clear the ISR bit and
>>>>> thus end the interrupt. Re-arrange the code a bit so that the common
>>>>> EOI handling path can be shared between all EOI modes.
>>>>>
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>> ---
>>>>>  xen/arch/x86/hvm/vpic.c | 10 +++++-----
>>>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
>>>>> index feb1db2ee3..3cf12581e9 100644
>>>>> --- a/xen/arch/x86/hvm/vpic.c
>>>>> +++ b/xen/arch/x86/hvm/vpic.c
>>>>> @@ -249,15 +249,15 @@ static void vpic_ioport_write(
>>>>>                  if ( priority == VPIC_PRIO_NONE )
>>>>>                      break;
>>>>>                  pin = (priority + vpic->priority_add) & 7;
>>>>> -                vpic->isr &= ~(1 << pin);
>>>>> -                if ( cmd == 5 )
>>>>> -                    vpic->priority_add = (pin + 1) & 7;
>>>>> -                break;
>>>>> +                goto common_eoi;
>>>>> +
>>>>>              case 3: /* Specific EOI                */
>>>>>              case 7: /* Specific EOI & Rotate       */
>>>>>                  pin = val & 7;
>>>>
>>>> You'll need a /* Fallthrough */ here to keep various things happy.
>>>
>>> Are you sure? There's ...
>>>
>>>> Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>
>>>> Can fix on commit if you're happy.
>>>>
>>>>> +
>>>>> +            common_eoi:
>>>
>>> ... an ordinary label here, not a case one.
>>
>> I would have wanted to commit this, but it's still not clear to me
>> whether the adjustment you ask for is really needed.
> 
> Was about to send a further series I have on top of this and saw this
> is still on my patch queue. I'm happy with either way, but I would
> like to get this committed if possible (as I think from a technical
> PoV we all agree it's correct).

Hmm, did you mean to send this _to_ Andrew, with me on _cc_? There's
nothing I can do without his further input.

Jan


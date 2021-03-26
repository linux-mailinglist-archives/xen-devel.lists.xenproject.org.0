Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F6D34A934
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 15:03:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101843.195056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPn2t-0002rr-FE; Fri, 26 Mar 2021 14:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101843.195056; Fri, 26 Mar 2021 14:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPn2t-0002rV-Bu; Fri, 26 Mar 2021 14:02:39 +0000
Received: by outflank-mailman (input) for mailman id 101843;
 Fri, 26 Mar 2021 14:02:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G+eI=IY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPn2s-0002rQ-EZ
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:02:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30e4fb7c-4bf5-425f-95c7-f4d1272e32ef;
 Fri, 26 Mar 2021 14:02:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D7F6AC6A;
 Fri, 26 Mar 2021 14:02:36 +0000 (UTC)
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
X-Inumbo-ID: 30e4fb7c-4bf5-425f-95c7-f4d1272e32ef
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616767356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6CTX9kVf2wzcBi/c7IGV/cdbIcuVu/9B07tfs5pNXg=;
	b=pPqCwvIEt2ghLGRRLVozVBVAiHCRBAdYUgJXIrrxr5M79GjxxXnxSvLAALOUqeA6pIzQSC
	qFUVz0c73LclFQ6k9vtOyms8sS80bsAkxlRo5jIbwmjtuJW6izpeyxLK3WW3lyOsleG0g+
	Fr4Hr0X3SbxA5ToRqEfKlfnN+JMFW6w=
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode
 unconditionally
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
 <20210325172132.14980-1-andrew.cooper3@citrix.com>
 <24669.52641.499147.88002@mariner.uk.xensource.com>
 <24669.54213.173154.400771@mariner.uk.xensource.com>
 <e768ad29-55e3-945a-f398-05050b46e927@suse.com> <YF3lHjYdrILNA1y9@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ca84ee11-7264-1887-b68b-204d74eab957@suse.com>
Date: Fri, 26 Mar 2021 15:02:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YF3lHjYdrILNA1y9@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.03.2021 14:43, Marek Marczykowski-Górecki wrote:
> On Fri, Mar 26, 2021 at 02:30:09PM +0100, Jan Beulich wrote:
>> On 26.03.2021 13:29, Ian Jackson wrote:
>>> I wrote:
>>>> I'm sorry, but I think it is too late for 4.15 to do this.  I prefer
>>>> Jan's patch which I have alread release-acked.
>>>>
>>>> Can someone qualified please provide a maintainer review for this,
>>>> ideally today ?
>>>
>>> I asked Andrew on IRC:
>>>
>>> 12:08 <Diziet> andyhhp__: Are you prepared to maintainer-ack Jan's
>>>                more-minimal hpet workaround approach ?
>>> 12:16 <andyhhp__> Diziet: honestly, no.  I don't consider that
>>>                   acceptable behaviour, and it is a fairly big "f you"
>>>                   (this was literally feedback I got in private) to
>>>                   the downstreams who've spent years trying to get us
>>>                   to fix this bug, and have now backported the first
>>>                   version.
>>> 12:16 <andyhhp__> I'm looking into the feedback on my series
>>> 12:17 <andyhhp__> one way or another, the moment we enter the fallback
>>>                   path for interrupt routing, something is very broken
>>>                   on the system
>>> 12:19 <andyhhp__> so the tradeoff is an unspecified bug on one ancient
>>>                   laptop which can't be tested now, vs 5 years of Atom
>>>                   CPUs, 2 years of latop CPUs, and the forthcoming
>>>                   Server line of Intel CPUs
>>> 12:19 <andyhhp__> or whatever other compromise we can work on
>>>
>>> I'm sorry that this bug is going to continue to be not properly fixed.
>>
>> Actually I had another thought here in the morning, but then didn't
>> write it down: While Andrew's approach indeed would (hopefully)
>> improve user experience, it'll reduce the incentive of actually
>> fixing the issue. Normally I might not be that concerned, but seeing
>> how long it took to even arrive at a workaround, I'm afraid now I am
>> concerned.
> 
> I assume "the issue" you meant "Xen using legacy stuff that stops being
> supported by the hardware", right? Yes it is an issue. But for most
> users of Xen, having it broken more likely will results in "lets switch
> to something that works" (perhaps not after the first such case, but
> this is definitely not the first one) instead of "lets spend some hours
> on debugging this very low level issue".

Like sadly is the case in so many areas nowadays, this to me suggests
that you value short term benefits over things working correctly long
term. Yes, it is important to be attractive to users. But this would
better not be at the price of keeping in place workarounds for overly
long periods of time, possible even forever. Such is likely to bite
us (perhaps by way of biting some of our users) down the road.

To be honest, I find it very strange that the original report over a
month ago was never followed up by the necessary technical detail.
Andrew did tell me that outside of the report on the mailing list he
did explicitly ask for such. (I can't rule out that meanwhile he was
given the info, but really all of this would better be on xen-devel.)

> And to be honest, this is more and more appealing option, even though
> all the deficiencies of KVM...

Well, feel free to throw more engineering resources into Xen's
(upstream) maintenance. There being a much larger community of
engineers around KVM is perhaps the main reason here.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BE52345E9
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:36:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UGC-0007B2-VJ; Fri, 31 Jul 2020 12:35:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PAbA=BK=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k1UGA-0007Ax-Pw
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:35:38 +0000
X-Inumbo-ID: 56476fd6-d32a-11ea-8e30-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56476fd6-d32a-11ea-8e30-bc764e2007e4;
 Fri, 31 Jul 2020 12:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7x0o0L0QJhcX08av8K+blTV8Kwsa/HFa1+pEqgQILCQ=; b=kite1M/YeKNZF0AT2nxZCg+Y2t
 u2ngiYG6AON6f5Vx+M9xAst2JbYhHzZpEK+CBPZLyI9FCzB37yMk4LLShRyCYI3FUnbyeZ6QJ4MVL
 w/94YtM3KK6NUqIvwZ4e8rlaSg9reeghNz+xQ6k0Wzl1xKLt0ToksfMMnGJ2q9vUT2w4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1UG9-00012C-8C; Fri, 31 Jul 2020 12:35:37 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1UG8-0006yz-Ua; Fri, 31 Jul 2020 12:35:37 +0000
Subject: Re: [PATCH] x86/vhpet: Fix type size in timer_int_route_valid
To: Jan Beulich <jbeulich@suse.com>, Eslam Elnikety <elnikety@amazon.com>
References: <20200728083357.77999-1-elnikety@amazon.com>
 <a55fba45-a008-059e-ea8c-b7300e2e8b7d@citrix.com>
 <278f0f31-619b-a392-6627-e75e65d0d14f@suse.com>
 <076df48e-0010-bb8d-891f-dc89aa4b9439@amazon.com>
 <cd9b283b-5c10-d186-93ef-8d8c07302e26@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <534c831a-4635-45b0-2580-4bd5812f49e8@xen.org>
Date: Fri, 31 Jul 2020 13:35:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <cd9b283b-5c10-d186-93ef-8d8c07302e26@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.co.uk>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 31/07/2020 10:53, Jan Beulich wrote:
> On 31.07.2020 10:38, Eslam Elnikety wrote:
>> On 28.07.20 19:51, Jan Beulich wrote:
>>> On 28.07.2020 11:26, Andrew Cooper wrote:
>>>> --- a/xen/include/asm-x86/hvm/vpt.h
>>>> +++ b/xen/include/asm-x86/hvm/vpt.h
>>>> @@ -73,7 +73,13 @@ struct hpet_registers {
>>>>        uint64_t isr;               /* interrupt status reg */
>>>>        uint64_t mc64;              /* main counter */
>>>>        struct {                    /* timers */
>>>> -        uint64_t config;        /* configuration/cap */
>>>> +        union {
>>>> +            uint64_t config;    /* configuration/cap */
>>>> +            struct {
>>>> +                uint32_t _;
>>>> +                uint32_t route;
>>>> +            };
>>>> +        };
>>>
>>> So long as there are no static initializers for this construct
>>> that would then suffer the old-gcc problem, this is of course a
>>> fine arrangement to make.
>>
>> I have to admit that I have no clue what the "old-gcc" problem is. I am
>> curious, and I would appreciate pointers to figure out if/how to
>> resolve. Is that an old, existing problem? Or a problem that was present
>> in older versions of gcc?
> 
> Well, as already said - the problem is with old gcc not dealing
> well with initializers of structs/unions with unnamed fields.

You seem to know quite well the problem. So would you mind to give us 
more details on which GCC version is believed to be broken?

> 
>> If the latter, is that a gcc version that we still care about?
> 
> Until someone makes a (justified) proposal what the new minimum
> version(s) ought to be, I'm afraid we still have to care. This
> topic came up very recently in another context, and I've proposed
> to put it on the agenda of the next community call.

I don't think Eslam was requesting to change the limits. He was just 
asking whether one of the compiler we support is affected.

Cheers,


-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E1B1C83A3
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 09:40:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWb8O-0006Kp-NC; Thu, 07 May 2020 07:39:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWb8N-0006Kk-Ji
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 07:39:55 +0000
X-Inumbo-ID: f13b0fc6-9035-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f13b0fc6-9035-11ea-b9cf-bc764e2007e4;
 Thu, 07 May 2020 07:39:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 17780ADD2;
 Thu,  7 May 2020 07:39:56 +0000 (UTC)
Subject: Re: [PATCH v2 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: paul@xen.org
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-2-paul@xen.org>
 <d5013c9d-b1a9-6139-a120-741332d6e086@suse.com>
 <009601d623c5$9547abc0$bfd70340$@xen.org>
 <63772836-3b3c-753a-18e5-d9fe3a6666a2@suse.com>
 <00ab01d62441$ef2630e0$cd7292a0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4ac9fc33-393d-d550-c656-94814d8f5467@suse.com>
Date: Thu, 7 May 2020 09:39:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <00ab01d62441$ef2630e0$cd7292a0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.05.2020 09:34, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 07 May 2020 08:22
>>
>> On 06.05.2020 18:44, Paul Durrant wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 29 April 2020 12:02
>>>>
>>>> On 07.04.2020 19:38, Paul Durrant wrote:
>>>>> +int domain_load_begin(struct domain_context *c, unsigned int tc,
>>>>> +                      const char *name, const struct vcpu *v, size_t len,
>>>>> +                      bool exact)
>>>>> +{
>>>>> +    if ( c->log )
>>>>> +        gdprintk(XENLOG_INFO, "%pv load: %s (%lu)\n", v, name,
>>>>> +                 (unsigned long)len);
>>>>> +
>>>>> +    BUG_ON(tc != c->desc.typecode);
>>>>> +    BUG_ON(v->vcpu_id != c->desc.vcpu_id);
>>>>> +
>>>>> +    if ( (exact && (len != c->desc.length)) ||
>>>>> +         (len < c->desc.length) )
>>>>> +        return -EINVAL;
>>>>
>>>> How about
>>>>
>>>>     if ( exact ? len != c->desc.length
>>>>                : len < c->desc.length )
>>>>
>>>
>>> Yes, that doesn't look too bad.
>>>
>>>> ? I'm also unsure about the < - don't you mean > instead? Too
>>>> little data would be compensated by zero padding, but too
>>>> much data can't be dealt with. But maybe I'm getting the sense
>>>> of len wrong ...
>>>
>>> I think the < is correct. The caller needs to have at least enough
>>> space to accommodate the context record.
>>
>> But this is load, not save - the caller supplies the data. If
>> there's less data than can be fit, it'll be zero-extended. If
>> there's too much data, the excess you don't know what to do
>> with (it might be okay to tolerate it being all zero).
>>
> 
> But this is a callback. The outer load function iterates over
> the records calling the appropriate hander for each one. Those
> handlers then call this function saying how much data they
> expect and whether they want exactly that amount, or whether
> they can tolerate less (i.e. zero-extend). Hence
> len < c->desc.length is an error, because it means the
> descriptor contains more data than the hander knows how to
> handle.

Oh, I see - "But maybe I'm getting the sense of len wrong ..."
then indeed applies.

Any thoughts on tolerating the excess data being zero?

Jan


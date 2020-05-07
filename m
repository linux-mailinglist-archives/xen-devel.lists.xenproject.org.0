Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8521C8359
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 09:22:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWaqj-0005G6-Qb; Thu, 07 May 2020 07:21:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWaqi-0005G1-40
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 07:21:40 +0000
X-Inumbo-ID: 64319ae0-9033-11ea-9ee5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64319ae0-9033-11ea-9ee5-12813bfff9fa;
 Thu, 07 May 2020 07:21:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B2C4CABB2;
 Thu,  7 May 2020 07:21:40 +0000 (UTC)
Subject: Re: [PATCH v2 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: paul@xen.org
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-2-paul@xen.org>
 <d5013c9d-b1a9-6139-a120-741332d6e086@suse.com>
 <009601d623c5$9547abc0$bfd70340$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <63772836-3b3c-753a-18e5-d9fe3a6666a2@suse.com>
Date: Thu, 7 May 2020 09:21:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <009601d623c5$9547abc0$bfd70340$@xen.org>
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

On 06.05.2020 18:44, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 29 April 2020 12:02
>>
>> On 07.04.2020 19:38, Paul Durrant wrote:
>>> +int domain_load_begin(struct domain_context *c, unsigned int tc,
>>> +                      const char *name, const struct vcpu *v, size_t len,
>>> +                      bool exact)
>>> +{
>>> +    if ( c->log )
>>> +        gdprintk(XENLOG_INFO, "%pv load: %s (%lu)\n", v, name,
>>> +                 (unsigned long)len);
>>> +
>>> +    BUG_ON(tc != c->desc.typecode);
>>> +    BUG_ON(v->vcpu_id != c->desc.vcpu_id);
>>> +
>>> +    if ( (exact && (len != c->desc.length)) ||
>>> +         (len < c->desc.length) )
>>> +        return -EINVAL;
>>
>> How about
>>
>>     if ( exact ? len != c->desc.length
>>                : len < c->desc.length )
>>
> 
> Yes, that doesn't look too bad.
> 
>> ? I'm also unsure about the < - don't you mean > instead? Too
>> little data would be compensated by zero padding, but too
>> much data can't be dealt with. But maybe I'm getting the sense
>> of len wrong ...
> 
> I think the < is correct. The caller needs to have at least enough
> space to accommodate the context record.

But this is load, not save - the caller supplies the data. If
there's less data than can be fit, it'll be zero-extended. If
there's too much data, the excess you don't know what to do
with (it might be okay to tolerate it being all zero).

>>> +        if ( (!handlers[i].per_vcpu && c.desc.vcpu_id) ||
>>> +             (c.desc.vcpu_id >= d->max_vcpus) )
>>> +            break;
>>> +
>>> +        v = d->vcpu[c.desc.vcpu_id];
>>> +
>>> +        if ( flags & DOMAIN_SAVE_FLAG_IGNORE )
>>> +        {
>>> +            /* Sink the data */
>>> +            rc = domain_load_entry(&c, c.desc.typecode, "IGNORED",
>>> +                                   v, NULL, c.desc.length, true);
>>
>> IOW the read handlers need to be able to deal with a NULL dst?
>> Sounds a little fragile to me. Is there a reason
>> domain_load_data() can't skip the call to read()?
> 
> Something has to move the cursor so sinking the data using a
> NULL dst seemed like the best way to avoid the need for a
> separate callback function.

And domain_load_data() can't itself advance the cursor in such
a case, with no callback involved at all?

>>> +    uint16_t typecode;
>>> +    /*
>>> +     * Each entry will contain either to global or per-vcpu domain state.
>>> +     * Entries relating to global state should have zero in this field.
>>
>> Is there a reason to specify zero?
>>
> 
> Not particularly but I thought it best to at least specify a value in all cases.

A specific value is certainly a good idea; I wonder though whether
an obviously invalid one (like ~0) wouldn't be better then,
allowing this ID to later be assigned meaning in such cases if
need be.

>>> +     */
>>> +    uint16_t vcpu_id;
>>
>> Seeing (possibly) multi-instance records in HVM state (PIC, IO-APIC, HPET),
>> wouldn't it be better to generalize this to ID, meaning "vCPU ID" just for
>> per-vCPU state?
> 
> True, a generic 'instance' would be needed for such records. I'll so as you suggest.

Which, along with my comment on domain_save_begin() taking a
struct vcpu * right now, will then indeed require changing
to a (struct domain *, unsigned int instance) tuple, I guess.

>>> +#define DOMAIN_SAVE_BEGIN(_x, _c, _v, _len) \
>>> +        domain_save_begin((_c), DOMAIN_SAVE_CODE(_x), #_x, (_v), (_len))
>>
>> In new code I'd like to ask for no leading underscores on macro
>> parameters as well as no unnecessary parenthesization of macro
>> parameters (e.g. when they simply get passed on to another macro
>> or function without being part of a larger expression).
> 
> Personally I think it is generally good practice to parenthesize
> but I can drop if you prefer.

To be honest - it's more than just "prefer": Excess parentheses
hamper readability. There shouldn't be too few, and since macros
already require quite a lot of them, imo we should strive to
have exactly as many as are needed.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D714B1D9AFC
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 17:18:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb40S-0007lV-HH; Tue, 19 May 2020 15:18:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jb40R-0007lQ-HR
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 15:18:11 +0000
X-Inumbo-ID: f2eb2f24-99e3-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2eb2f24-99e3-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 15:18:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D6670B227;
 Tue, 19 May 2020 15:18:11 +0000 (UTC)
Subject: Re: [PATCH v3 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: paul@xen.org
References: <20200514104416.16657-1-paul@xen.org>
 <20200514104416.16657-2-paul@xen.org>
 <c1da7ff1-2c3a-02d1-cfa1-18840db37566@suse.com>
 <000401d62de6$7cb6efa0$7624cee0$@xen.org>
 <080a1fa3-eb1e-e3b2-c52e-5c7ffdabc6eb@suse.com>
 <000601d62def$b4f64380$1ee2ca80$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0ee39765-bc1a-e795-5b20-52ba7026e8d4@suse.com>
Date: Tue, 19 May 2020 17:18:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <000601d62def$b4f64380$1ee2ca80$@xen.org>
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

On 19.05.2020 17:10, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 19 May 2020 15:24
>>
>> On 19.05.2020 16:04, Paul Durrant wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 19 May 2020 14:04
>>>>
>>>> On 14.05.2020 12:44, Paul Durrant wrote:
>>>>> +/*
>>>>> + * Register save and restore handlers. Save handlers will be invoked
>>>>> + * in order of DOMAIN_SAVE_CODE().
>>>>> + */
>>>>> +#define DOMAIN_REGISTER_SAVE_RESTORE(_x, _save, _load)            \
>>>>> +    static int __init __domain_register_##_x##_save_restore(void) \
>>>>> +    {                                                             \
>>>>> +        domain_register_save_type(                                \
>>>>> +            DOMAIN_SAVE_CODE(_x),                                 \
>>>>> +            #_x,                                                  \
>>>>> +            &(_save),                                             \
>>>>> +            &(_load));                                            \
>>>>> +                                                                  \
>>>>> +        return 0;                                                 \
>>>>> +    }                                                             \
>>>>> +    __initcall(__domain_register_##_x##_save_restore);
>>>>
>>>> I'm puzzled by part of the comment: Invoking by save code looks
>>>> reasonable for the saving side (albeit END doesn't match this rule
>>>> afaics), but is this going to be good enough for the consuming side?
>>>
>>> No, this only relates to the save side which is why the comment
>>> says 'Save handlers'. I do note that it would be more consistent
>>> to use 'load' rather than 'restore' here though.
>>>
>>>> There may be dependencies between types, and with fixed ordering
>>>> there may be no way to insert a depended upon type ahead of an
>>>> already defined one (at least as long as the codes are meant to be
>>>> stable).
>>>>
>>>
>>> The ordering of load handlers is determined by the stream. I'll
>>> add a sentence saying that.
>>
>> I.e. the consumer of the "get" interface (and producer of the stream)
>> is supposed to take apart the output it gets, bring records into
>> suitable order (which implies it knows of all the records, and which
>> hence means this code may need updating in cases where I'd expect
>> only the hypervisor needs), and only then issue to the stream?
> 
> The intention is that the stream is always in a suitable order so the
> load side does not have to do any re-ordering.

I understood this to be the intention, but what I continue to not
understand is where / how the save side orders it suitably. "Save
handlers will be invoked in order of DOMAIN_SAVE_CODE()" does not
allow for any ordering, unless at the time of the introduction of
a particular code you already know what others it may depend on
in the future, reserving appropriate codes.

And as said - END also doesn't look to fit this comment.

Jan


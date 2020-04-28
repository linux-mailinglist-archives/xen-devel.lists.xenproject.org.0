Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2C81BC1E0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 16:51:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTRa4-0000pq-Fh; Tue, 28 Apr 2020 14:51:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DYx7=6M=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jTRa3-0000pl-2D
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 14:51:27 +0000
X-Inumbo-ID: bc0e917e-895f-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc0e917e-895f-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 14:51:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 228A3AD88;
 Tue, 28 Apr 2020 14:51:24 +0000 (UTC)
Subject: Re: [PATCH v4] docs/designs: re-work the xenstore migration
 document...
To: paul@xen.org, 'Julien Grall' <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20200427155035.668-1-paul@xen.org>
 <7ab25832-66e6-020f-b343-059f21771054@xen.org>
 <f13de8bc-ca5d-2341-3797-b34f9f2c70ef@suse.com>
 <2087b3dd-7d2c-3ab3-d6ce-a4d132f7ec4d@xen.org>
 <000c01d61d5b$00bc05c0$02341140$@xen.org>
 <bb0a87e5-4112-107a-b15b-0edf1e616f87@suse.com>
 <000f01d61d6c$5583e8f0$008bbad0$@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <39de560f-4bda-387c-6d6e-5b9495642d0c@suse.com>
Date: Tue, 28 Apr 2020 16:51:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <000f01d61d6c$5583e8f0$008bbad0$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.04.20 16:50, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jürgen Groß <jgross@suse.com>
>> Sent: 28 April 2020 13:56
>> To: paul@xen.org; 'Julien Grall' <julien@xen.org>; xen-devel@lists.xenproject.org
>> Cc: 'Paul Durrant' <pdurrant@amazon.com>; 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap'
>> <george.dunlap@citrix.com>; 'Ian Jackson' <ian.jackson@eu.citrix.com>; 'Jan Beulich'
>> <jbeulich@suse.com>; 'Stefano Stabellini' <sstabellini@kernel.org>; 'Wei Liu' <wl@xen.org>
>> Subject: Re: [PATCH v4] docs/designs: re-work the xenstore migration document...
>>
>> On 28.04.20 14:46, Paul Durrant wrote:
>>>> -----Original Message-----
>>>> From: Julien Grall <julien@xen.org>
>>>> Sent: 28 April 2020 11:23
>>>> To: Jürgen Groß <jgross@suse.com>; Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
>>>> Cc: Paul Durrant <pdurrant@amazon.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
>>>> <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Jan Beulich
>> <jbeulich@suse.com>;
>>>> Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
>>>> Subject: Re: [PATCH v4] docs/designs: re-work the xenstore migration document...
>>>>
>>>> Hi Juergen,
>>>>
>>>> On 28/04/2020 11:10, Jürgen Groß wrote:
>>>>> On 28.04.20 11:05, Julien Grall wrote:
>>>>>>> -where tx_id is the non-zero identifier values of an open transaction.
>>>>>>> +| Field     | Description                                       |
>>>>>>> +|-----------|---------------------------------------------------|
>>>>>>> +| `domid`   | The domain-id that owns the shared page           |
>>>>>>> +|           |                                                   |
>>>>>>> +| `tdomid`  | The domain-id that `domid` acts on behalf of if   |
>>>>>>> +|           | it has been subject to an SET_TARGET              |
>>>>>>> +|           | operation [2] or DOMID_INVALID [3] otherwise      |
>>>>>>> +|           |                                                   |
>>>>>>> +| `flags`   | Must be zero                                      |
>>>>>>> +|           |                                                   |
>>>>>>> +| `evtchn`  | The port number of the interdomain channel used   |
>>>>>>> +|           | by `domid` to communicate with xenstored          |
>>>>>>> +|           |                                                   |
>>>>>>> +| `mfn`     | The MFN of the shared page for a live update or   |
>>>>>>> +|           | ~0 (i.e. all bits set) otherwise                  |
>>>>>>> -### Protocol Extension
>>>>>>> +Since the ABI guarantees that entry 1 in `domid`'s grant table will
>>>>>>> always
>>>>>>> +contain the GFN of the shared page, so for a live update `mfn` can
>>>>>>> be used to
>>>>>>> +give confidence that `domid` has not been re-cycled during the update.
>>>>>>
>>>>>> I am confused, there is no way a XenStored running in an Arm domain
>>>>>> can map the MFN of the shared page. So how is this going to work out?
>>>>>
>>>>> I guess this will be a MFN for PV guests and a guest PFN else.
>>>>
>>>> If we use Xen terminology (xen/include/xen/mm.h), this would be a GFN.
>>>>
>>>
>>> TBH I'm not sure a GFN would give much confidence about domain recycling as it would likely be the
>> same for many domains, I think. We really need a UUID.
>>
>> No, we need a per-host domain value, which is associated with a domain
>> and which is unique during the life-time of the host.
>>
>> E.g. a global counter, which is incremented at each domain creation and
>> stored in struct domain.
>>
> 
> Can we just drop this and fall back on the fact that libxl now prevents domids from being recycled for 60s?

In any case this discussion does not belong to this patch IMO.


Juergen


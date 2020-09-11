Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842AD266103
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 16:14:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGjoS-0008KO-83; Fri, 11 Sep 2020 14:14:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DvaW=CU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kGjoR-0008KG-C9
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 14:14:03 +0000
X-Inumbo-ID: 95e03641-3e25-4306-85dd-24a58ea2e213
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95e03641-3e25-4306-85dd-24a58ea2e213;
 Fri, 11 Sep 2020 14:14:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 733EDADC2;
 Fri, 11 Sep 2020 14:14:16 +0000 (UTC)
Subject: Re: [PATCH] xen/hypfs: fix writing of custom parameter
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20200911053043.29445-1-jgross@suse.com>
 <77ebc474-966e-885c-a08d-9da538671cb0@citrix.com>
 <6f639c2d-e4d8-3607-e89b-d11ae6c19a05@suse.com>
 <39c1ad46-1f92-2033-f70a-44fdee1cb5f1@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <52392f41-e6f1-00e8-9203-be50b0a82679@suse.com>
Date: Fri, 11 Sep 2020 16:14:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <39c1ad46-1f92-2033-f70a-44fdee1cb5f1@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.09.20 16:02, Andrew Cooper wrote:
> On 11/09/2020 13:28, Jürgen Groß wrote:
>> On 11.09.20 14:14, Andrew Cooper wrote:
>>> On 11/09/2020 06:30, Juergen Gross wrote:
>>>> Today the maximum allowed data length for writing a hypfs node is
>>>> tested in the generic hypfs_write() function. For custom runtime
>>>> parameters this might be wrong, as the maximum allowed size is derived
>>>> from the buffer holding the current setting, while there might be ways
>>>> to set the parameter needing more characters than the minimal
>>>> representation of that value.
>>>>
>>>> One example for this is the "ept" parameter. Its value buffer is sized
>>>> to be able to hold the string "exec-sp=0" or "exec-sp=1", while it is
>>>> allowed to use e.g. "no-exec-sp" or "exec-sp=yes" for setting it.
>>>
>>> If you're looking for silly examples, exec-sp=disabled is also legal
>>> boolean notation for Xen.
>>>
>>>>
>>>> Fix that by moving the length check one level down to the type
>>>> specific write function.
>>>>
>>>> In order to avoid allocation of arbitrary sized buffers use a new
>>>> MAX_PARAM_SIZE macro as an upper limit for custom writes. The value
>>>> of MAX_PARAM_SIZE is the same as the limit in parse_params() for a
>>>> single parameter.
>>>>
>>>> Fixes: 5b5ccafb0c42 ("xen: add basic hypervisor filesystem support")
>>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>
>>> This does fix my bug, so Tested-by: Andrew Cooper
>>> <andrew.cooper3@citrix.com>
>>>
>>> This does need backporting to 4.14, so maybe is best to take in this
>>> form for now.
>>>
>>> However, I'm rather uneasy about the approach.
>>>
>>> Everything here derives from command line semantics, and it's probably
>>> not going to be long until we get runtime modification of two sub
>>> parameters.
>>>
>>> In a theoretical world where all the EPT suboptions were runtime
>>> modifiable, it would be legal to try and pass
>>>
>>> ept=exec-sp,pml,no-pml,no-ad,ad,no-ad
>>
>> Correct.
>>
>>> While being fairly nonsensical, it is well formed on the command line.
>>> We go left to right, and latest takes precedence.
>>
>> Yes.
>>
>>> Given that we do have buffer containing everything provided by
>>> userspace, and all internal logic organised with const char *, why do we
>>> need an intermediate allocation at all?
>>
>> Which intermediate allocation?
> 
> Sorry.  Intermediate buffer.
> 
>>
>>> Can't we just pass that all the way down, rather than leaving the same
>>> bug to hit at some point when we do have a parameter which legitimately
>>> takes 128 characters of configuration?
>>
>> The problem is we can't just set the current value with the string
>> passed in from the user.
> 
> Why ever not?  It is parsed as per the command line, not taken
> verbatim.  It has no bearing on size of the output buffer.

We have a user area copied to the hypervisor buffer. This buffer is then
parsed like the command line and the result is stored in the internal
variables of the hypervisor (e.g. as boolean, int, multiple variables,
what ever).

Then a static buffer is filled with a textual representation reflecting
the internal variable values in order to have a complete picture of the
current setting of the param.

So what do you want to do differently here?

> 
>>
>> Imagine above example with ept, just two calls with:
>>
>> ept=exec-sp
>> ept=no-pml
>>
>> Your idea is to return only no-pml, while the truth would be
>> exec-sp=1,pml=0 (in the notation produced by the current code).
> 
> In this example,
> 
> The semantic gap is that "xenhypfs cat /params/ept" doesn't mean "tell
> me what the user (last?) put on the command line for ept=".  It means
> "tell me the current state of the ept= runtime options".

Right.

> 
> I agree that reading it should always return something of the form
> exec-sp=X,pml=Y.
> 
> However, writing it should not require the user to provide both in one
> go.  Its a horrible (and racy) interface when you only want to change
> one of the options.

Right again.

> 
> Specifically, the following should work:
> 
> # xenhypfs cat /params/ept
> exec-sp=A,pml=B
> # xenhypfs write /params/ept exec-sp=C
> # xenhypfs cat /params/ept
> exec-sp=C,pml=B
> # xenhypfs write /params/ept pml=D
> # xenhypfs cat /params/ept
> exec-sp=C,pml=D

And the current design is to achieve exactly this behavior.

> 
> ~Andrew
> 
> P.S. What stability guarantees have we made about the structure layout?
> Didn't we agree that a top level /params/ wasn't necessarily the best
> hierarchy to turn into an ABI.

I can't remember having seen such a remark.


Juergen


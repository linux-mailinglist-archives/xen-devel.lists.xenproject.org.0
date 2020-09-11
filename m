Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7E265F87
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 14:28:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGiA4-0004pP-Gr; Fri, 11 Sep 2020 12:28:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DvaW=CU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kGiA3-0004pK-9z
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 12:28:15 +0000
X-Inumbo-ID: a9fd98b3-d585-45b7-92ab-39eecb8cb2a8
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9fd98b3-d585-45b7-92ab-39eecb8cb2a8;
 Fri, 11 Sep 2020 12:28:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EC93AAE7B;
 Fri, 11 Sep 2020 12:28:28 +0000 (UTC)
Subject: Re: [PATCH] xen/hypfs: fix writing of custom parameter
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20200911053043.29445-1-jgross@suse.com>
 <77ebc474-966e-885c-a08d-9da538671cb0@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6f639c2d-e4d8-3607-e89b-d11ae6c19a05@suse.com>
Date: Fri, 11 Sep 2020 14:28:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <77ebc474-966e-885c-a08d-9da538671cb0@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.09.20 14:14, Andrew Cooper wrote:
> On 11/09/2020 06:30, Juergen Gross wrote:
>> Today the maximum allowed data length for writing a hypfs node is
>> tested in the generic hypfs_write() function. For custom runtime
>> parameters this might be wrong, as the maximum allowed size is derived
>> from the buffer holding the current setting, while there might be ways
>> to set the parameter needing more characters than the minimal
>> representation of that value.
>>
>> One example for this is the "ept" parameter. Its value buffer is sized
>> to be able to hold the string "exec-sp=0" or "exec-sp=1", while it is
>> allowed to use e.g. "no-exec-sp" or "exec-sp=yes" for setting it.
> 
> If you're looking for silly examples, exec-sp=disabled is also legal
> boolean notation for Xen.
> 
>>
>> Fix that by moving the length check one level down to the type
>> specific write function.
>>
>> In order to avoid allocation of arbitrary sized buffers use a new
>> MAX_PARAM_SIZE macro as an upper limit for custom writes. The value
>> of MAX_PARAM_SIZE is the same as the limit in parse_params() for a
>> single parameter.
>>
>> Fixes: 5b5ccafb0c42 ("xen: add basic hypervisor filesystem support")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> This does fix my bug, so Tested-by: Andrew Cooper
> <andrew.cooper3@citrix.com>
> 
> This does need backporting to 4.14, so maybe is best to take in this
> form for now.
> 
> However, I'm rather uneasy about the approach.
> 
> Everything here derives from command line semantics, and it's probably
> not going to be long until we get runtime modification of two sub
> parameters.
> 
> In a theoretical world where all the EPT suboptions were runtime
> modifiable, it would be legal to try and pass
> 
> ept=exec-sp,pml,no-pml,no-ad,ad,no-ad

Correct.

> While being fairly nonsensical, it is well formed on the command line.
> We go left to right, and latest takes precedence.

Yes.

> Given that we do have buffer containing everything provided by
> userspace, and all internal logic organised with const char *, why do we
> need an intermediate allocation at all?

Which intermediate allocation?

> Can't we just pass that all the way down, rather than leaving the same
> bug to hit at some point when we do have a parameter which legitimately
> takes 128 characters of configuration?

The problem is we can't just set the current value with the string
passed in from the user.

Imagine above example with ept, just two calls with:

ept=exec-sp
ept=no-pml

Your idea is to return only no-pml, while the truth would be
exec-sp=1,pml=0 (in the notation produced by the current code).

You need to create a correct value based on all valid sub-option
values currently active. And the static buffer for this value is
sized to be able to hold the largest possible value. The only
problem at hand was that the input string could be larger.

And as all parameters today already share the restriction of 128
characters (at least when entered as boot parameters) I don't see
a major problem with this approach.

What I could do easily is to limit the length to:

max(MAX_PARAM_SIZE, sizeof(static_buffer))

in order to allow special runtime-only custom parameters with
larger values.


Juergen


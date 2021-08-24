Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8648F3F5EA2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 15:05:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171348.312680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIW63-0006Gf-G4; Tue, 24 Aug 2021 13:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171348.312680; Tue, 24 Aug 2021 13:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIW63-0006Dr-Bh; Tue, 24 Aug 2021 13:04:07 +0000
Received: by outflank-mailman (input) for mailman id 171348;
 Tue, 24 Aug 2021 13:04:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZFsk=NP=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1mIW61-0006DV-MQ
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 13:04:05 +0000
Received: from mx.upb.ro (unknown [141.85.13.241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9c545b9-9376-41b2-9a15-44ae422e3082;
 Tue, 24 Aug 2021 13:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 929A4B560093;
 Tue, 24 Aug 2021 16:04:01 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id cSGrAMfHrVk1; Tue, 24 Aug 2021 16:03:59 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id E7EE9B5600BF;
 Tue, 24 Aug 2021 16:03:58 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Lavvaq5g65IU; Tue, 24 Aug 2021 16:03:58 +0300 (EEST)
Received: from [192.168.1.35] (unknown [86.121.144.181])
 by mx.upb.ro (Postfix) with ESMTPSA id 23AA9B560093;
 Tue, 24 Aug 2021 16:03:58 +0300 (EEST)
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
X-Inumbo-ID: c9c545b9-9376-41b2-9a15-44ae422e3082
X-Virus-Scanned: amavisd-new at upb.ro
Subject: Re: [PATCH v2 1/4] public: Add page related definitions for accessing
 guests memory
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1629395092.git.costin.lupu@cs.pub.ro>
 <1d9338102d2013addfabc0cf9275ef156fd5080f.1629395092.git.costin.lupu@cs.pub.ro>
 <69747133-3d42-4179-2606-12b1d1a9c8a6@suse.com>
 <c942c080-183a-ddb2-f523-dd3354f5b4a0@cs.pub.ro>
 <a2d0be78-f53e-a100-838a-5af2a8ef1459@xen.org>
 <8ed65d58-2547-d4cf-0db7-74a2ab114a71@suse.com>
 <6dbe57f9-6355-d584-382f-a06779aa9121@xen.org>
From: Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <99049e35-3b74-f094-dca9-465126abf5ed@cs.pub.ro>
Date: Tue, 24 Aug 2021 16:03:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6dbe57f9-6355-d584-382f-a06779aa9121@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi guys,

On 8/23/21 8:16 PM, Julien Grall wrote:
> Hi Jan,
>=20
> On 20/08/2021 10:26, Jan Beulich wrote:
>> On 20.08.2021 11:08, Julien Grall wrote:
>>> On 20/08/2021 08:44, Costin Lupu wrote:
>>>> On 8/20/21 9:52 AM, Jan Beulich wrote:
>>>>>> --- /dev/null
>>>>>> +++ b/xen/include/public/page.h
>>>>>> @@ -0,0 +1,36 @@
>>>>>> +/****************************************************************=
**************
>>>>>>
>>>>>> + * page.h
>>>>>> + *
>>>>>> + * Page definitions for accessing guests memory
>>>>>> + *
>>>>>> + * Permission is hereby granted, free of charge, to any person
>>>>>> obtaining a copy
>>>>>> + * of this software and associated documentation files (the
>>>>>> "Software"), to
>>>>>> + * deal in the Software without restriction, including without
>>>>>> limitation the
>>>>>> + * rights to use, copy, modify, merge, publish, distribute,
>>>>>> sublicense, and/or
>>>>>> + * sell copies of the Software, and to permit persons to whom the
>>>>>> Software is
>>>>>> + * furnished to do so, subject to the following conditions:
>>>>>> + *
>>>>>> + * The above copyright notice and this permission notice shall be
>>>>>> included in
>>>>>> + * all copies or substantial portions of the Software.
>>>>>> + *
>>>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
>>>>>> KIND, EXPRESS OR
>>>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>>>>> MERCHANTABILITY,
>>>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
>>>>>> EVENT SHALL THE
>>>>>> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
>>>>>> OR OTHER
>>>>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>>>>>> OTHERWISE, ARISING
>>>>>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>>>>>> OTHER
>>>>>> + * DEALINGS IN THE SOFTWARE.
>>>>>> + *
>>>>>> + * Copyright (c) 2021, Costin Lupu
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef __XEN_PUBLIC_PAGE_H__
>>>>>> +#define __XEN_PUBLIC_PAGE_H__
>>>>>> +
>>>>>> +#include "xen.h"
>>>>>> +
>>>>>> +#define XEN_PAGE_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 12
>>>>>> +#define XEN_PAGE_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (xen_mk_long(1) << XEN_PAGE_SHIFT)
>>>
>>> This will use UL whereas on Arm a page frame should always be 64-bit
>>> regardless the bitness. Shouldn't this be converted to use xen_ulong_=
t
>>> instead?
>>
>> As pointed out on v1, XEN_PAGE_SIZE would better not end up as a
>> value of signed type, for ...
>=20
> Did you mean "not end up as a value of **unsigned** type"...
>=20
>>
>>>>>> +#define XEN_PAGE_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (~(XEN_PAGE_SIZE - 1))
>>
>> ... this to suitably sign-extend to wider types is necessary.
>=20
> ... because, if I am not mistaken, the sign-extension wouldn't happen
> with unsigned type. But then on v1 you wrote:
>=20
> "Imo the smallest type this should evaluate to is xen_ulong_t"
>=20
> Which I interpreted as this value should be 64-bit on Arm32. If this no=
t
> what you meant then I am lost.
>=20
>>
>> Also unless you expect someone to use typeof(XEN_PAGE_SIZE) I'm
>> afraid I don't see where the constant being long vs xen_long_t
>> (if such existed) might matter.
>> Otoh perhaps xen_mk_ulong() would
>> better have produced a xen_ulong_t typed values in the first
>> place, but I'm afraid we can't alter the existing macro.
>=20
> We can create a new one.
>=20
>>> Our stable ABI has not been designed with multiple page granularity i=
n
>>> mind. We could introduce a hypercall to query the page size used by t=
he
>>> ABI. But then, I don't think we have the full picture of how this is
>>> going to pan out (I haven't try to use another page size on Xen yet).
>>>
>>> I think we have three choices here:
>>> =C2=A0=C2=A0=C2=A0 1) Stick with the existing definition in the tools
>>> =C2=A0=C2=A0=C2=A0 2) Move the definition in the public headers and o=
nly expose them to
>>> the tools.
>>> =C2=A0=C2=A0=C2=A0 3) Query the page size via a new hypervisor
>>>
>>> As I wrote above, 3) is going to take some time to get it right. So t=
he
>>> question here is whether 2) is temporarily better than 1).
>>
>> Because I understand 3) is some way out, and because I think 2) is
>> better than 1), I wrote "might be an option" for what you call 2).
>> But I could see people (Andrew for example) to take a different
>> position and object to such a temporary measure.
>=20
> I think we need to make a decision so Costin doesn't keep sending
> version on something that can't be merged. What does the others thinks?

From what I understood, in his last reply to 'stubdom: foreignmemory:
Fix build after 0dbb4be739c5' thread, Andrew was OK with solution 2).

Cheers,
Costin


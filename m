Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2536D39E63E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 20:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138123.255774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqJh0-00019w-GK; Mon, 07 Jun 2021 18:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138123.255774; Mon, 07 Jun 2021 18:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqJh0-000181-CG; Mon, 07 Jun 2021 18:09:42 +0000
Received: by outflank-mailman (input) for mailman id 138123;
 Mon, 07 Jun 2021 18:09:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lqJgy-00017u-DV
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 18:09:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lqJgy-00067F-7m; Mon, 07 Jun 2021 18:09:40 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lqJgy-0002Ia-1W; Mon, 07 Jun 2021 18:09:40 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=vgsRX0lG9uOSjZmvwi1ft0z5cXXen+jh/q5I+lX7JWI=; b=V4ddJ4CBT5bHEO7SwAp5KwKgup
	e7ptOacjwnjYpGiiaCPgwUZ79CxS5+VByHuVvXdfoamehwVf5U7GukGXgpUDIRSLOeI387BvcLe22
	ylty4RPT2Q4iQYhTaPFK634gaB0DcpHYwF90Lysx5qNwC8K0TA+qqCKkkuzn94lzrpck=;
Subject: Re: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
To: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-2-penny.zheng@arm.com>
 <e1b90f06-92d2-11da-c556-4081907124b8@xen.org>
 <VE1PR08MB521519C6F09E92EDB9C9A1AEF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <66e32065-ea2d-d000-1a70-e5598a182b6a@xen.org>
 <VE1PR08MB5215C1F5041860102BBAD595F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <14fb6fe4-c293-6994-8cbc-872d3bd8a3ac@xen.org>
 <VE1PR08MB52152792B6771236A6DF37E7F73D9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <4251e0e2-fb53-b8a3-0323-f4ce892cf21e@xen.org>
 <alpine.DEB.2.21.2106031408320.7272@sstabellini-ThinkPad-T480s>
 <CAJ=z9a234ANQDR7BmtSm4AT0k3jrCn67s4b3zZ+jdkUgBMahbw@mail.gmail.com>
 <alpine.DEB.2.21.2106031625530.7272@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <113937c2-f1a7-c27f-8e2e-79de729ea3ce@xen.org>
Date: Mon, 7 Jun 2021 19:09:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2106031625530.7272@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 04/06/2021 00:55, Stefano Stabellini wrote:
> On Thu, 3 Jun 2021, Julien Grall wrote:
>> On Thu, 3 Jun 2021 at 22:33, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>> On Thu, 3 Jun 2021, Julien Grall wrote:
>>>> On 02/06/2021 11:09, Penny Zheng wrote:
>>>>> I could not think a way to fix it properly in codes, do you have any
>>>>> suggestion? Or we just put a warning in doc/commits.
>>>>
>>>> The correct approach is to find the parent of staticmemdomU1 (i.e.
>>>> reserved-memory) and use the #address-cells and #size-cells from there.
>>>
>>> Julien is right about how to parse the static-memory.
>>>
>>> But I have a suggestion on the new binding. The /reserved-memory node is
>>> a weird node: it is one of the very few node (the only node aside from
>>> /chosen) which is about software configurations rather than hardware
>>> description.
>>>
>>> For this reason, in a device tree with multiple domains /reserved-memory
>>> doesn't make a lot of sense: for which domain is the memory reserved?
>>
>> IHMO, /reserved-memory refers to the memory that the hypervisor should
>> not touch. It is just a coincidence that most of the domains are then
>> passed through to dom0.
>>
>> This also matches the fact that the GIC, /memory is consumed by the
>> hypervisor directly and not the domain..
> 
> In system device tree one of the key principles is to distinguish between
> hardware description and domains configuration. The domains
> configuration is under /domains (originally it was under /chosen then
> the DT maintainers requested to move it to its own top-level node), while
> everything else is for hardware description.
> 
> /chosen and /reserved-memory are exceptions. They are top-level nodes
> but they are for software configurations. In system device tree
> configurations go under the domain node. This makes sense: Xen, dom0 and
> domU can all have different reserved-memory and chosen configurations.
> 
> /domains/domU1/reserved-memory gives us a clear way to express
> reserved-memory configurations for domU1.
> 
> Which leaves us with /reserved-memory. Who is that for? It is for the
> default domain.
> 
> The default domain is the one receiving all devices by default. In a Xen
> setting, it is probably Dom0. 

Let's take an example, let say in the future someone wants to allocate a 
specific region for the memory used by the GICv3 ITS.

 From what you said above, /reserved-memory would be used by dom0. So 
how would you be able to tell the hypervisor that the region is reserved 
for itself?

> In this case, we don't want to add
> reserved-memory regions for DomUs to Dom0's list. Dom0's reserved-memory
> list is for its own drivers. We could also make an argument that the
> default domain is Xen itself. From a spec perspective, that would be
> fine too. In this case, /reserved-memory is a list of memory regions
> reserved for Xen drivers. 

We seem to have a different way to read the binding description in [1]. 
For convenience, I will copy it here:

"Reserved memory is specified as a node under the /reserved-memory node.
The operating system shall exclude reserved memory from normal usage
one can create child nodes describing particular reserved (excluded from
normal use) memory regions. Such memory regions are usually designed for
the special usage by various device drivers.
"

I read it as this can be used to exclude any memory from the allocator 
for a specific purpose. They give the example of device drivers, but 
they don't exclude other purpose. So...

> Either way, I don't think is a great fit for
> domains memory allocations.

... I don't really understand why this is not a great fit. The regions 
have been *reserved* for a purpose.

>>>
>>> So I don't think we want to use reserved-memory for this, either
>>> /reserved-memory or /chosen/domU1/reserved-memory. Instead it would be
>>> good to align it with system device tree and define it as a new property
>>> under domU1.
>>
>> Do you have any formal documentation of the system device-tree?
> 
> It lives here:
> https://github.com/devicetree-org/lopper/tree/master/specification
> 
> Start from specification.md. It is the oldest part of the spec, so it is
> not yet written with a formal specification language.
> 
> FYI there are a number of things in-flight in regards to domains that
> we discussed in the last call but they are not yet settled, thus, they
> are not yet committed (access flags definitions and hierarchical
> domains). However, they don't affect domains memory allocations so from
> that perspective nothing has changed.

Thanks!

> 
> 
>>> In system device tree we would use a property called "memory" to specify
>>> one or more ranges, e.g.:
>>>
>>>      domU1 {
>>>          memory = <0x0 0x500000 0x0 0x7fb00000>;
>>>
>>> Unfortunately for xen,domains we have already defined "memory" to
>>> specify an amount, rather than a range. That's too bad because the most
>>> natural way to do this would be:
>>>
>>>      domU1 {
>>>          size = <amount>;
>>>          memory = <ranges>;
>>>
>>> When we'll introduce native system device tree support in Xen we'll be
>>> able to do that. For now, we need to come up with a different property.
>>> For instance: "static-memory" (other names are welcome if you have a
>>> better suggestion).
>>>
>>> We use a new property called "static-memory" together with
>>> #static-memory-address-cells and #static-memory-size-cells to define how
>>> many cells to use for address and size.
>>>
>>> Example:
>>>
>>>      domU1 {
>>>          #static-memory-address-cells = <2>;
>>>          #static-memory-size-cells = <2>;
>>>          static-memory = <0x0 0x500000 0x0 0x7fb00000>;
>>
>> This is pretty similar to what Penny suggested. But I dislike it
>> because of the amount of code that needs to be duplicated with the
>> reserved memory.
> 
> Where is the code duplication? In the parsing itself?

So the problem is we need an entire new way to parse and walk yet 
another binding that will describe memory excluded from normal allocator 
hypervisor.

The code is pretty much the same as parsing /reserved-memory except it 
will be on a different address cells, size cells, property.

> 
> If there is code duplication, can we find a way to share some of the
> code to avoid the duplication?

Feel free to propose one. I suggested to use /reserved-memory because 
this is the approach that makes the most sense to me (see my reply above).

TBH, even after your explanation, I am still a bit puzzled into why 
/reserved-memory cannot be leveraged to exclude domain region from the 
hypervisor allocator.

Cheers,

[1] 
https://www.kernel.org/doc/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt

-- 
Julien Grall


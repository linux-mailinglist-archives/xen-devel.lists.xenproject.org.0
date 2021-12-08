Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB9B46D58A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 15:20:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242286.419087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muxnV-0000gS-4s; Wed, 08 Dec 2021 14:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242286.419087; Wed, 08 Dec 2021 14:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muxnV-0000eJ-17; Wed, 08 Dec 2021 14:19:53 +0000
Received: by outflank-mailman (input) for mailman id 242286;
 Wed, 08 Dec 2021 14:19:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5L+7=QZ=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1muxnU-0000eD-6R
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 14:19:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e733c3d1-5831-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 15:19:50 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 554BCD6E;
 Wed,  8 Dec 2021 06:19:49 -0800 (PST)
Received: from [10.57.6.53] (unknown [10.57.6.53])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB3313F73B;
 Wed,  8 Dec 2021 06:19:48 -0800 (PST)
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
X-Inumbo-ID: e733c3d1-5831-11ec-9d12-4777fae47e2b
Subject: Re: Aarch64 stand-alone application for Xen
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <CANLsYkzKn7Nkika=KpHtSyi9=FQwS7Wt94Odbg2HuH+1PFUTzA@mail.gmail.com>
 <B34490D7-5FE3-41D4-9792-41E2BD25EF05@arm.com>
 <CANLsYkywEbLHhxsAJQ8_HPnjdsDXZMO+5-+zbSuqmcUV1Dr4iA@mail.gmail.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <074326cc-f910-2cad-be1f-e27480f53b67@arm.com>
Date: Wed, 8 Dec 2021 15:19:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANLsYkywEbLHhxsAJQ8_HPnjdsDXZMO+5-+zbSuqmcUV1Dr4iA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Mathieu,

On 08.12.2021 01:06, Mathieu Poirier wrote:
> Hi Bertrand,
> 
> On Fri, 26 Nov 2021 at 03:32, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>>
>> Hi Mathieu,
>>
>>> On 25 Nov 2021, at 22:59, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>>>
>>> Good day,
>>>
>>> I am in the process of adding support for aarch64 to the xen-sys
>>> crate[1].  The crate currently supports x86_64 and includes a
>>> stand-alone "oxerun" application that can be used to validate
>>> hypercalls.  My goal is to provide the same functionality on arm64.  I
>>> am looking for a stand-alone aarch64 example, something like an "hello
>>> world" to help me with the assembler startup code.
>>
>> We are working on porting XTF to arm64 and already have something running.
>> I think it could be a good starting point for you:
>> https://github.com/orzelmichal/xtf/tree/arm-devel
> 
> Quick one - have you been able to get the "test-arm-64le-example"
> application to run?  So far Xen gives me the following error:
> 
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Unable to copy the kernel in the hwdom memory
> (XEN) ****************************************
> 
> I wanted to check with you before starting to dig into it.
> 

ICYDK, 64le environment is used to create non-MMU domain in contrast to mmu64le.
It lacks support for PV console and other important features of Xen.
But we are able to run it without any issue.
Please keep in mind that as there is no MMU you need to pay attention to the load address.
By default for non-MMU domain, the address is 0x40000000 which is the correct address if you use XTF as a guest.
If you want to run non-MMU XTF as dom0, you need to specify the correct load address by passing CONFIG_LOAD_ADDRESS=<address>
when invoking make. For example on QEMU it would be CONFIG_LOAD_ADDRESS=0x80000000.

> Thanks,
> Mathieu
> 
>>
>> Regards
>> Bertrand
>>
>>>
>>> Many thanks for the consideration,
>>> Mathieu
>>>
>>> [1]. https://crates.io/crates/xen-sys
>>>
>>
> 
Cheers,
Michal


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FD41B0AD7
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 14:51:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQVtL-0004p4-PG; Mon, 20 Apr 2020 12:51:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JPG3=6E=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jQVtK-0004oz-8o
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 12:51:14 +0000
X-Inumbo-ID: 9df0a5f2-8305-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9df0a5f2-8305-11ea-b58d-bc764e2007e4;
 Mon, 20 Apr 2020 12:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tK8XpUBJH/bCZBQEfI5zHBmTZGkN3X/Q4OvyGS2xYq8=; b=kD+EwccCUb2qqCAE3/rPO53r0B
 9Fy7Xdg/CQkqLHY/Gu8O3F59lY4UOdikQHvTZB2h9jrG5bGpBCyAR3+AxoTlIrVCB7c8jqRyYfWDR
 C8PDjCmrtpJ2ecQvL1sT9D9b5VN1PlEQJGsSRKEeYC597iMQZFzbq0ViJ8KWJVC9LyTE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQVtJ-0004Rx-4F; Mon, 20 Apr 2020 12:51:13 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQVtI-0002xx-Sm; Mon, 20 Apr 2020 12:51:13 +0000
Subject: Re: [PATCH 3/6] x86/mem-paging: use guest handle for
 XENMEM_paging_op_prep
To: Jan Beulich <jbeulich@suse.com>
References: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
 <f3c57792-d372-a70f-691b-87681b83e898@suse.com>
 <d340e170-1c08-e20a-b170-c176eb00b4dd@xen.org>
 <5e1dc7fd-f780-31bc-670d-4736061f46af@suse.com>
 <80621ca8-6c08-2868-ada6-bf0ef41fc699@xen.org>
 <802bfbad-a0d7-8d7a-716d-76f0b83c5707@suse.com>
 <136f8a16-3160-04f7-55f3-667f578e505e@xen.org>
 <f281c763-42ea-ae6f-7c1c-2a5523a64db9@suse.com>
 <5f1298c1-3931-2bf2-381e-51cc8afcdca9@xen.org>
 <d4b276dd-6ebc-6c43-bda5-37a1cd19d384@suse.com>
 <9deece3d-fd3c-8d94-f4ed-7bfe77d3a47e@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6c693204-21a4-100a-d2c0-32dffb804551@xen.org>
Date: Mon, 20 Apr 2020 13:51:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9deece3d-fd3c-8d94-f4ed-7bfe77d3a47e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 20/04/2020 13:35, Jan Beulich wrote:
> On 20.04.2020 14:31, Jan Beulich wrote:
>> On 20.04.2020 14:20, Julien Grall wrote:
>>> On 20/04/2020 13:12, Jan Beulich wrote:
>>>> On 20.04.2020 14:08, Julien Grall wrote:
>>>> Are the unions plain ones? I could see room for behavior like
>>>> the one you describe with transparent unions, albeit still
>>>> not quite like you describe it. Getting handle types to be
>>>> properly type-checked by the compiler is pretty imperative imo.
>>>
>>> It looks like x86 is using structure, but arm is using plain union:
>>>
>>> #define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \
>>>      typedef union { type *p; unsigned long q; }                 \
>>>          __guest_handle_ ## name;                                \
>>>      typedef union { type *p; uint64_aligned_t q; }              \
>>>          __guest_handle_64_ ## name
>>
>> I don't see how this would make a difference, and hence ...
>>
>>> I will look at introducing a union on Arm.
>>
>> ... how this would help. I must be missing something, or there
>> must be a very curious bug in only the Arm gcc.
> 
> Compiling this (for x86) properly raises two errors:
> 
> union u1 { void *p; unsigned long v; };
> union u2 { void *p; unsigned long v; };
> 
> void test(union u1 u1, union u2 u2) {
> 	test(u1, u1);
> 	test(u2, u2);
> }

You are right. It is just me not compiling properly. Sorry for the noise :(

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5061B0959
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 14:32:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQVaR-0002qF-Vd; Mon, 20 Apr 2020 12:31:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQVaR-0002qA-Bm
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 12:31:43 +0000
X-Inumbo-ID: e323cca6-8302-11ea-9057-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e323cca6-8302-11ea-9057-12813bfff9fa;
 Mon, 20 Apr 2020 12:31:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ADB5DABCE;
 Mon, 20 Apr 2020 12:31:39 +0000 (UTC)
Subject: Re: [PATCH 3/6] x86/mem-paging: use guest handle for
 XENMEM_paging_op_prep
To: Julien Grall <julien@xen.org>
References: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
 <f3c57792-d372-a70f-691b-87681b83e898@suse.com>
 <d340e170-1c08-e20a-b170-c176eb00b4dd@xen.org>
 <5e1dc7fd-f780-31bc-670d-4736061f46af@suse.com>
 <80621ca8-6c08-2868-ada6-bf0ef41fc699@xen.org>
 <802bfbad-a0d7-8d7a-716d-76f0b83c5707@suse.com>
 <136f8a16-3160-04f7-55f3-667f578e505e@xen.org>
 <f281c763-42ea-ae6f-7c1c-2a5523a64db9@suse.com>
 <5f1298c1-3931-2bf2-381e-51cc8afcdca9@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d4b276dd-6ebc-6c43-bda5-37a1cd19d384@suse.com>
Date: Mon, 20 Apr 2020 14:31:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5f1298c1-3931-2bf2-381e-51cc8afcdca9@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 20.04.2020 14:20, Julien Grall wrote:
> Hi,
> 
> On 20/04/2020 13:12, Jan Beulich wrote:
>> On 20.04.2020 14:08, Julien Grall wrote:
>>> On 20/04/2020 08:26, Jan Beulich wrote:
>>>> On 17.04.2020 19:13, Julien Grall wrote:
>>>>> FWIW, the different matters on Arm. Although, it looks like the
>>>>> compiler will not warn you if you are using the wrong handler :(.
>>>>
>>>> I find this highly suspicious, but can't check myself until back
>>>> in the office - these are distinct compound types after all, so
>>>> this shouldn't just be a warning, but an error. Or did you merely
>>>> mean there's no warning on x86?
>>>
>>> I mean on Arm 32-bit. I have changed one of the function to use XEN_GUEST_HANDLE_PARAM() rather than XEN_GUEST_HANDLE() but not changing the caller.
>>>
>>> It is probably because they are both defined using an union. Interestly, the type will also not be checked, so the code a function will happily accept a XEN_GUEST_HANDLE_PARAM(uint8) even if the prototype requested XEN_GUEST_HANDLE_PARAM(uint64).
>>>
>>> This looks rather messy, maybe we should use a structure (and some alignment) to add more safety.
>>
>> Are the unions plain ones? I could see room for behavior like
>> the one you describe with transparent unions, albeit still
>> not quite like you describe it. Getting handle types to be
>> properly type-checked by the compiler is pretty imperative imo.
> 
> It looks like x86 is using structure, but arm is using plain union:
> 
> #define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \
>     typedef union { type *p; unsigned long q; }                 \
>         __guest_handle_ ## name;                                \
>     typedef union { type *p; uint64_aligned_t q; }              \
>         __guest_handle_64_ ## name

I don't see how this would make a difference, and hence ...

> I will look at introducing a union on Arm.

... how this would help. I must be missing something, or there
must be a very curious bug in only the Arm gcc.

Jan


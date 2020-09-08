Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881B2260C99
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 09:55:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFYT1-0000KV-Jj; Tue, 08 Sep 2020 07:55:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBuC=CR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFYT0-0000KM-E9
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 07:55:02 +0000
X-Inumbo-ID: ea1fa73f-bb6e-4663-8ccd-70829b0d195c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea1fa73f-bb6e-4663-8ccd-70829b0d195c;
 Tue, 08 Sep 2020 07:55:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B47A8B6CD;
 Tue,  8 Sep 2020 07:55:00 +0000 (UTC)
Subject: Re: [PATCH] EFI: Enable booting unified hypervisor/kernel/initrd
 images
To: Julien Grall <julien@xen.org>
Cc: Trammell Hudson <hudson@trmm.net>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
 <96966138-552f-c86a-2d14-85b2f7af50e6@xen.org>
 <kxO4Q0LRhrdqHcPTtg_JQYmf2jaNOF-nUvckzLF_IhHTicunRP3-_CWWMDw2Jg7_-RSg56X_4ULzsL5rU84eIjWV9apUH9sRnu2rVf-6_Mk=@trmm.net>
 <c629d643-6275-4fc0-b36b-9da5b8ce88e9@xen.org>
 <0dfeeaf9-850c-e8e5-9d0f-d80a50a7f19b@suse.com>
 <cbdba1bf-c40c-2a5b-aad0-ef4506042728@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <831ba4db-4b92-199b-24ce-570f13508818@suse.com>
Date: Tue, 8 Sep 2020 09:54:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cbdba1bf-c40c-2a5b-aad0-ef4506042728@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.09.2020 20:07, Julien Grall wrote:
> 
> 
> On 07/09/2020 08:11, Jan Beulich wrote:
>> On 04.09.2020 19:35, Julien Grall wrote:
>>> On 04/09/2020 11:06, Trammell Hudson wrote:
>>>> On Friday, September 4, 2020 5:29 AM, Julien Grall <julien@xen.org> wrote:
>>>>
>>>>> On 28/08/2020 12:51, Trammell Hudson wrote:
>>>>>
>>>>>> -   /* PE32+ Subsystem type */
>>>>>>       +#if defined(ARM)
>>>>>>
>>>>>
>>>>> Shouldn't this be defined(aarch64) ?
>>>>
>>>> To be honest I'm not sure and don't have a way to check if
>>>> this code works on ARM.
>>>
>>> The code looks generic enough. I will give a try to build it.
>>>
>>>> Does an Xen EFI build on ARM even
>>>> use the PE32+ format?
>>>
>>> So far, we only support EFI and AArch64. This is built using PE32+ format.
>>
>> But this gets done by some custom means iirc, not by linking to that
>> format? (I'm not certain whether this matters here, so I'm sorry for
>> the noise if it doesn't.)
> 
> The header is written manually in .S but the final binary is looking 
> like a PE32+:
> 
> 42sh> file xen/xen 
> 
> xen/xen: MS-DOS executable, MZ for MS-DOS
> 
> As you asked the question, you must be concerned with this approach. Can 
> you outline what could be the issue?

My thinking merely is: If it's not linked "normally", maybe there are
further odd things? I have no specific concern.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1C026043F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 20:08:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFLYb-0004jX-2h; Mon, 07 Sep 2020 18:07:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Tp4=CQ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kFLYa-0004jS-5B
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 18:07:56 +0000
X-Inumbo-ID: 5f2e859b-1ecc-435e-aceb-f5070c65284c
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f2e859b-1ecc-435e-aceb-f5070c65284c;
 Mon, 07 Sep 2020 18:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=SOonG5j/QtD88a2eLgrz/InfW8W/08jBZbSqpNUkVWQ=; b=6o5aV7sVULuwWr1W1qw5dDz9Zy
 03talrIdr8zmR93r74vephTaBZQPUDyy0pyZFBjNwQ/9RKXSQmugSPPHwPBJGe3gA+TXN+Tkl5LVe
 eqJvgHUp0d+UtFeE60emHWvdIgAAV2m3zXQaIPOnsHp/WJFfOxR4E6aA1UCAADNlPjN4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kFLYY-00073h-JQ; Mon, 07 Sep 2020 18:07:54 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kFLYY-0007Wf-CQ; Mon, 07 Sep 2020 18:07:54 +0000
Subject: Re: [PATCH] EFI: Enable booting unified hypervisor/kernel/initrd
 images
To: Jan Beulich <jbeulich@suse.com>
Cc: Trammell Hudson <hudson@trmm.net>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
 <96966138-552f-c86a-2d14-85b2f7af50e6@xen.org>
 <kxO4Q0LRhrdqHcPTtg_JQYmf2jaNOF-nUvckzLF_IhHTicunRP3-_CWWMDw2Jg7_-RSg56X_4ULzsL5rU84eIjWV9apUH9sRnu2rVf-6_Mk=@trmm.net>
 <c629d643-6275-4fc0-b36b-9da5b8ce88e9@xen.org>
 <0dfeeaf9-850c-e8e5-9d0f-d80a50a7f19b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cbdba1bf-c40c-2a5b-aad0-ef4506042728@xen.org>
Date: Mon, 7 Sep 2020 19:07:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0dfeeaf9-850c-e8e5-9d0f-d80a50a7f19b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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



On 07/09/2020 08:11, Jan Beulich wrote:
> On 04.09.2020 19:35, Julien Grall wrote:
>> On 04/09/2020 11:06, Trammell Hudson wrote:
>>> On Friday, September 4, 2020 5:29 AM, Julien Grall <julien@xen.org> wrote:
>>>
>>>> On 28/08/2020 12:51, Trammell Hudson wrote:
>>>>
>>>>> -   /* PE32+ Subsystem type */
>>>>>       +#if defined(ARM)
>>>>>
>>>>
>>>> Shouldn't this be defined(aarch64) ?
>>>
>>> To be honest I'm not sure and don't have a way to check if
>>> this code works on ARM.
>>
>> The code looks generic enough. I will give a try to build it.
>>
>>> Does an Xen EFI build on ARM even
>>> use the PE32+ format?
>>
>> So far, we only support EFI and AArch64. This is built using PE32+ format.
> 
> But this gets done by some custom means iirc, not by linking to that
> format? (I'm not certain whether this matters here, so I'm sorry for
> the noise if it doesn't.)

The header is written manually in .S but the final binary is looking 
like a PE32+:

42sh> file xen/xen 

xen/xen: MS-DOS executable, MZ for MS-DOS

As you asked the question, you must be concerned with this approach. Can 
you outline what could be the issue?

Cheers,

-- 
Julien Grall


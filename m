Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2102764CBD3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 15:07:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462281.720449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5SOm-0006gm-MW; Wed, 14 Dec 2022 14:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462281.720449; Wed, 14 Dec 2022 14:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5SOm-0006dm-Is; Wed, 14 Dec 2022 14:06:16 +0000
Received: by outflank-mailman (input) for mailman id 462281;
 Wed, 14 Dec 2022 14:06:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5SOk-0006dg-Rt
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 14:06:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5SOi-00020w-GG; Wed, 14 Dec 2022 14:06:12 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.3.68])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5SOi-0007Yl-7n; Wed, 14 Dec 2022 14:06:12 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=NQmmUEVqnaEVHtjmWZ3bVrGGtwdmOoI/sc4Wt9EdboU=; b=41CyXtVhq5atZojHtD9YTnFyZI
	szqZi73iMh0OaPDoLjjkRnybd4hkGfSEIhHGh3U1cSZScjL68HSHNg615sXDAk4+BZiVd4yHH4g5k
	dTd59qdJ+O4AFrco1fsECZD9T7k1NxACPc8IfseO/yeZRmZLM6KR9DuE835AVO5//lfs=;
Message-ID: <37c9f4c7-34f6-c53e-dd0b-6d9d8c844097@xen.org>
Date: Wed, 14 Dec 2022 14:06:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 "Smith, Jackson" <rsmith@riversideresearch.org>
Cc: "Brookes, Scott" <sbrookes@riversideresearch.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org> <Y5j7KQ9g5Yb/ufn+@itl-email>
 <901d2088-49e7-634f-f55b-e4ea2e706fed@xen.org>
In-Reply-To: <901d2088-49e7-634f-f55b-e4ea2e706fed@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 13/12/2022 23:05, Julien Grall wrote: > On 13/12/2022 22:22, Demi 
Marie Obenour wrote:
>> On Tue, Dec 13, 2022 at 08:55:28PM +0000, Julien Grall wrote:
>>> On 13/12/2022 19:48, Smith, Jackson wrote:
>>>> Hi Xen Developers,
>>>
>>> Hi Jackson,
>>>
>>> Thanks for sharing the prototype with the community. Some 
>>> questions/remarks
>>> below.
>>
>> [snip]
>>
>>>> With this technique, we protect the integrity and confidentiality of
>>>> guest memory. However, a compromised hypervisor can still read/write
>>>> register state during traps, or refuse to schedule a guest, denying
>>>> service. We also recognize that because this technique precludes
>>>> modifying Xen's page tables after startup, it may not be compatible
>>>> with all of Xen's potential use cases. On the other hand, there are
>>>> some uses cases (in particular statically defined embedded systems)
>>>> where our technique could be adopted with minimal friction.
>>>
>>>  From what you wrote, this sounds very much like the project Citrix and
>>> Amazon worked on called "Secret-free hypervisor" with a twist. In 
>>> your case,
>>> you want to prevent the hypervisor to map/unmap the guest memory.
>>>
>>> You can find some details in [1]. The code is x86 only, but I don't 
>>> see any
>>> major blocker to port it on arm64.
>>
>> Is there any way the secret-free hypervisor code could be upstreamed?
> This has been in my todo list for more than year but didn't yet find 
> anyone to finish the work.
> 
> I need to have a look how much left the original work it is left to do. 

I have looked at the series. It looks like there are only 16 patches 
left to be reviewed.

They are two years old but the code hasn't changed too much. So I will 
look at porting them over the next few days and hopefully I can respin 
the series before Christmas.

Cheers,
-- 
Julien Grall


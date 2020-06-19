Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0502A2008F2
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 14:47:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmGQJ-00052e-1M; Fri, 19 Jun 2020 12:47:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m4t/=AA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jmGQH-00052Z-Fn
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 12:47:09 +0000
X-Inumbo-ID: fc977758-b22a-11ea-b7bb-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc977758-b22a-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 12:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HTgC+hpoU6gPMr/gJxnOul3qmLpvAZ+e4obyg0AhgNc=; b=mKoYCMH7WCJi/A0cnUFuJFr75p
 YCVEHPYtnrT+dkdGeYXLGrIOcsJcHDlrtXefz6v7zOz/43uPsBPzlZGcQzjWTMXCRctpMQ5tPm6sw
 4vnP33Tu/RWZf1HvcYe9n7EfRTShYhI27/yVgUGVaAIj6cDMBXdjJrYTQK5uq9pX2jUQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jmGQE-0006yE-Fs; Fri, 19 Jun 2020 12:47:06 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jmGQD-0000tm-Mx; Fri, 19 Jun 2020 12:47:06 +0000
Subject: Re: UEFI support in ARM DomUs
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
 <17a14578-6fc7-925d-6f69-8b2fcbf40ff3@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9d4a6e78-49d3-01c3-251b-6d66f56c2761@xen.org>
Date: Fri, 19 Jun 2020 13:47:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <17a14578-6fc7-925d-6f69-8b2fcbf40ff3@epam.com>
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
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Oleksandr,

On 19/06/2020 13:32, Oleksandr Andrushchenko wrote:
> 
> On 6/19/20 1:49 AM, Julien Grall wrote:
>> On Thu, 18 Jun 2020 at 23:00, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>> On Thu, 18 Jun 2020, Julien Grall wrote:
>>>> On 18/06/2020 06:22, Oleksandr Andrushchenko wrote:
>>>>> On 6/4/20 6:31 PM, Stefano Stabellini wrote:
>>>>>> On Thu, 4 Jun 2020, Oleksandr Andrushchenko wrote:
>>>>>>> On 6/4/20 4:57 AM, Peng Fan wrote:
>>>>>>>> Grall <julien@xen.org>;
>>>>>>>>> Nataliya Korovkina <malus.brandywine@gmail.com>
>>>>>>>>> Subject: UEFI support in ARM DomUs
>>>>>>>> We have made U-Boot run inside XEN DomU, but just only PV console
>>>>>>>> part,
>>>>>>>> not implement other frontend drivers currently. Would this help for
>>>>>>>> your
>>>>>>>> case if enable EFI in U-Boot?
>>>>>>> Well, we have a working PV block implementation on top of that on iMX8
>>>>>>>
>>>>>>> platform, mostly ported from mini-os. Currently we are finalizing the
>>>>>>> work
>>>>>>>
>>>>>>> and cleaning up (it's going to take a week or so hopefully). Then, we
>>>>>>> we'll post
>>>>>>>
>>>>>>> it on our public github. We are also thinking about upstreaming the
>>>>>>> work, but it may
>>>>>>>
>>>>>>> take quite some time if the whole idea fits u-boot's view on such an
>>>>>>> extension at all.
>>>>>> Yes please to both of you! :-)
>>>>>>
>>>>>> In the meantime, while we wait for those changes to go upstream in
>>>>>> uboot, could you please post a branch on github and a link on this email
>>>>>> thread?
>>>>> It took a bit more time than we expected, but here we go [1]:
>>>>>
>>>>> this is in form of a pull-request as we would love to hear from the
>>>>>
>>>>> community and it is easier to discuss the code (please leave comments there)
>>>>>
>>>>> 1. There is code originating from MiniOS and work done by Peng, so we
>>>>>
>>>>> would like to ask the respective copyright owners to raise their hands and
>>>> Not everyone are closely watching xen-devel. So if you want to find out who
>>>> are the copyright owners, then your best solution is to go through the git log
>>>> and CC the authors.
>>> That is true. But why do you want to contact them? It doesn't look like
>>> there would be any licensing issues.
>>   From the sentence, I wasn't entirely sure whether he wanted to contact
>> the copyright owner for crediting them in the headers.
>>
>>>>> 5. We use -D__XEN__ to access some of the hidden defines we need such as
>>>>>
>>>>> GUEST_RAM0_BASE and the friends as there is no other way but manually
>>>>> defining the
>>>>>
>>>>> same which is not cute.
>>>> I have replied to this in the pull request. But I want to bring the
>>>> conversation here to have a wider discussion.
>>>>
>>>> For a first, __XEN__ should really only be defined by the hypervisor and not
>>>> used by the guest. This is used to gate non-stable ABI (such as the tools) and
>>>> anything behind it hasn't been vetted to work in other build configuration
>>>> that the one used by Xen.
>>>>
>>>> In general, we expect the guest to discover everything for the device-tree
>>>> because the memory layout is not stable (we want to be able to reshuffle as we
>>>> add more features).
>>>>
>>>> I know that EDK2/Tianocore can be built once and work on every Xen
>>>> configuration. It would be ideal that U-boot follow the same. If it is really
>>>> not possible, then we should explore a path that is preventing to define
>>>> __XEN__.
>>>>
>>>> How much does U-boot expect to know about the memory layout? Does it require
>>>> to know all the memory banks? Or would it be sufficient for it to know the
>>>> start address of the first bank and the minimum of RAM?
>>> Copy/pasting here from my comment on the pull request plus additional
>>> thoughts.
>>>
>>> Uboot is one of those embedded projects that typically assumes that all
>>> the information about the platform is available at *build time*. It is
>>> meant to be built tailored for a specific version of a specific board. A
>>> Uboot binary is not expected to be "portable" across different versions
>>> of the platform or different platforms. In other words, it is not
>>> expected to be portable across Xen versions.
>> Can you define "version" here? Do you refer to the difference in terms
>> of memory?
>>
>>> This is a different model meant for different use-cases. I don't think
>>> it is a problem "philosophically" to let Uboot know about Xen details at
>>> build time. Yes, that is not what we did historically but it is very
>>> much in the spirit of Uboot.
>> TBH, I don't particularly mind that U-boot is built against a specific
>> version of Xen. I am more concerned about the long term implication if
>> we endorse it
>> and then try to change the memory layout in depth.
>>
>>> But of course the least Uboot depends on these details the better
>>> because it will be more flexible, but it could very well be that we
>>> won't be able to reach the point where the binary works on any version
>>> like we did with Tianocore. The two projects work differently.
>> Can we have a list of things U-boot require to know at compile time?
>>
>> In particular, I would like to understand if it would be sufficient to
>> only be aware of the first bank. If it is, then my preference would be
>> to standardize that bit of the layout.
> 
> Well, my bad, I was not right about PIE. We are lucky that it is supported
> 
> for ARM64, so we can avoid using GUEST_RAM0_BASE.

Cool!

> 
> With respect to the number of banks I see no big issue if we do not use
> 
> GUEST_RAM_BANKS, but set it to 1.

I am guessing U-boot wouldn't be able to load modules into the second 
bank. Am I corre
> The last thing at the moment that I am not sure of is GUEST_MAGIC_{BASE|SIZE}:
> 
> those can be retrieved from the device tree and I'll have to check if
> 
> fdt is available at the very early boot stage so we can get that when it is needed.

They will not be available from the fdt, but you can retrieve them with 
an hypervisor call (see HVM_PARAM_STORE_PFN, HVM_PARAM_CONSOLE_PFN).
One question though, why do you need to map them in advance? Couldn't 
you map them on demand?
Cheers,

-- 
Julien Grall


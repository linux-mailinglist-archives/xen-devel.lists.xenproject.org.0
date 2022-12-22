Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A532653DC3
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 10:52:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468369.727454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8IFO-0003pu-5L; Thu, 22 Dec 2022 09:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468369.727454; Thu, 22 Dec 2022 09:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8IFO-0003o0-0T; Thu, 22 Dec 2022 09:52:18 +0000
Received: by outflank-mailman (input) for mailman id 468369;
 Thu, 22 Dec 2022 09:52:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p8IFM-0003ns-Eg
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 09:52:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8IFK-0008I3-NC; Thu, 22 Dec 2022 09:52:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8IFK-0005Dz-Ew; Thu, 22 Dec 2022 09:52:14 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=y6SlIRVrsyiNATTgM47pJVH+rp8ITO4g7OQALs/4YmA=; b=wRk2v4I3CSe8BTa8/MtAXTnx+S
	sLSGOW9K7gW9Ki0SqiH+eR0FEaPCTbT15UerdVckYhxplQlDi4nXsD95q3DRlBTmo8C7Ce18aYqvG
	7mbqz4l+EFrl3s3jYydk6f8O8fsV5xSZ/guuG0fasU2LfNbWZ/MpAakaPempIqWYFOUs=;
Message-ID: <6cf27ac5-6371-9a9c-2df4-7f33812993f1@xen.org>
Date: Thu, 22 Dec 2022 09:52:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 "Smith, Jackson" <rsmith@RiversideResearch.org>
Cc: "Brookes, Scott" <sbrookes@RiversideResearch.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "demi@invisiblethingslab.com" <demi@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org>
 <BN0P110MB1642A6DCBD15780CD8767B8CCFE19@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <513d0cc3-a305-5029-32f7-67993ae83c55@xen.org>
 <alpine.DEB.2.22.394.2212151725090.315094@ubuntu-linux-20-04-desktop>
 <7a7a7156-138d-a53c-fb65-a210e14bd8c1@xen.org>
 <BN0P110MB16429FF1A9FF3507A684C5B2CFEA9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <alpine.DEB.2.22.394.2212211638100.4079@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2212211638100.4079@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 22/12/2022 00:38, Stefano Stabellini wrote:
> On Tue, 20 Dec 2022, Smith, Jackson wrote:
>>> Hi Stefano,
>>>
>>> On 16/12/2022 01:46, Stefano Stabellini wrote:
>>>> On Thu, 15 Dec 2022, Julien Grall wrote:
>>>>>>> On 13/12/2022 19:48, Smith, Jackson wrote:
>>>>>> Yes, we are familiar with the "secret-free hypervisor" work. As
>> you
>>>>>> point out, both our work and the secret-free hypervisor remove the
>>>>>> directmap region to mitigate the risk of leaking sensitive guest
>>>>>> secrets. However, our work is slightly different because it
>>>>>> additionally prevents attackers from tricking Xen into remapping a
>>> guest.
>>>>>
>>>>> I understand your goal, but I don't think this is achieved (see
>>>>> above). You would need an entity to prevent write to TTBR0_EL2 in
>>>>> order to fully protect it.
>>>>
>>>> Without a way to stop Xen from reading/writing TTBR0_EL2, we
>>> cannot
>>>> claim that the guest's secrets are 100% safe.
>>>>
>>>> But the attacker would have to follow the sequence you outlines
>>> above
>>>> to change Xen's pagetables and remap guest memory before
>>> accessing it.
>>>> It is an additional obstacle for attackers that want to steal other
>>> guests'
>>>> secrets. The size of the code that the attacker would need to inject
>>>> in Xen would need to be bigger and more complex.
>>>
>>> Right, that's why I wrote with a bit more work. However, the nuance
>>> you mention doesn't seem to be present in the cover letter:
>>>
>>> "This creates what we call "Software Enclaves", ensuring that an
>>> adversary with arbitrary code execution in the hypervisor STILL cannot
>>> read/write guest memory."
>>>
>>> So if the end goal if really to protect against *all* sort of
>> arbitrary
>>> code,
>>> then I think we should have a rough idea how this will look like in
>> Xen.
>>>
>>>   From a brief look, it doesn't look like it would be possible to
>> prevent
>>> modification to TTBR0_EL2 (even from EL3). We would need to
>>> investigate if there are other bits in the architecture to help us.
>>>
>>>>
>>>> Every little helps :-)
>>>
>>> I can see how making the life of the attacker more difficult is
>>> appealing.
>>> Yet, the goal needs to be clarified and the risk with the approach
>>> acknowledged (see above).
>>>
>>
>> You're right, we should have mentioned this weakness in our first email.
>> Sorry about the oversight! This is definitely still a limitation that we
>> have not yet overcome. However, we do think that the increase in
>> attacker workload that you and Stefano are discussing could still be
>> valuable to security conscious Xen users.
>>
>> It would nice to find additional architecture features that we can use
>> to close this hole on arm, but there aren't any that stand out to me
>> either.
>>
>> With this limitation in mind, what are the next steps we should take to
>> support this feature for the xen community? Is this increase in attacker
>> workload meaningful enough to justify the inclusion of VMF in Xen?
> 
> I think it could be valuable as an additional obstacle for the attacker
> to overcome. The next step would be to port your series on top of
> Julien's "Remove the directmap" patch series
> https://marc.info/?l=xen-devel&m=167119090721116
> 
> Julien, what do you think?

If we want Xen to be used in confidential compute, then we need a 
compelling story and prove that we are at least as secure as other 
hypervisors.

So I think we need to investigate a few areas:
    * Can we protect the TTBR? I don't think this can be done with the 
HW. But maybe I overlook it.
    * Can VMF be extended to more use-cases? For instances, for 
hypercalls, we could have bounce buffer.
    * If we can't fully secure VMF, can the attack surface be reduced 
(e.g. disable hypercalls at runtime/compile time)? Could we use a 
different architecture (I am thinking something like pKVM [1])?

Cheers,

[1] https://lwn.net/Articles/836693/

-- 
Julien Grall


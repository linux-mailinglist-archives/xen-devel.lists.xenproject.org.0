Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B897653D7F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 10:32:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468319.727388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Hvd-0006y9-1F; Thu, 22 Dec 2022 09:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468319.727388; Thu, 22 Dec 2022 09:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Hvc-0006vJ-U1; Thu, 22 Dec 2022 09:31:52 +0000
Received: by outflank-mailman (input) for mailman id 468319;
 Thu, 22 Dec 2022 09:31:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p8Hvb-0006vD-Hu
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 09:31:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8HvY-0007il-OV; Thu, 22 Dec 2022 09:31:48 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8HvY-0004Ke-F9; Thu, 22 Dec 2022 09:31:48 +0000
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
	bh=QGQrN1O7xS47CHUa4uUGh8c+JqFnaDHXyZLhVsFdlAI=; b=jBIBtslqKpyHda5uc80KK/txK/
	baO+9yx2HQvA4oDgqJ6k+DRQR4SBwdfxHh1oIAlHcABAV54yT55VvRirRowVGnYaVgbLi3r996VKe
	ieK+xqbEDsg3IMP1CNnfnhPfirYbjD0o9+368CdS2hu7Jhdn9ueX+0JTC8UtyQlASOVs=;
Message-ID: <af62bf3c-1046-3ed2-8662-e79375fe4794@xen.org>
Date: Thu, 22 Dec 2022 09:31:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: "Smith, Jackson" <rsmith@riversideresearch.org>,
 "Brookes, Scott" <sbrookes@riversideresearch.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org>
 <BN0P110MB1642A6DCBD15780CD8767B8CCFE19@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <513d0cc3-a305-5029-32f7-67993ae83c55@xen.org>
 <alpine.DEB.2.22.394.2212151725090.315094@ubuntu-linux-20-04-desktop>
 <7a7a7156-138d-a53c-fb65-a210e14bd8c1@xen.org>
 <BN0P110MB16429FF1A9FF3507A684C5B2CFEA9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <Y6I3oqYdTKa/57I/@itl-email>
 <alpine.DEB.2.22.394.2212211639070.4079@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2212211639070.4079@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 22/12/2022 00:53, Stefano Stabellini wrote:
> On Tue, 20 Dec 2022, Demi Marie Obenour wrote:
>> On Tue, Dec 20, 2022 at 10:17:24PM +0000, Smith, Jackson wrote:
>>>> Hi Stefano,
>>>>
>>>> On 16/12/2022 01:46, Stefano Stabellini wrote:
>>>>> On Thu, 15 Dec 2022, Julien Grall wrote:
>>>>>>>> On 13/12/2022 19:48, Smith, Jackson wrote:
>>>>>>> Yes, we are familiar with the "secret-free hypervisor" work. As
>>> you
>>>>>>> point out, both our work and the secret-free hypervisor remove the
>>>>>>> directmap region to mitigate the risk of leaking sensitive guest
>>>>>>> secrets. However, our work is slightly different because it
>>>>>>> additionally prevents attackers from tricking Xen into remapping a
>>>> guest.
>>>>>>
>>>>>> I understand your goal, but I don't think this is achieved (see
>>>>>> above). You would need an entity to prevent write to TTBR0_EL2 in
>>>>>> order to fully protect it.
>>>>>
>>>>> Without a way to stop Xen from reading/writing TTBR0_EL2, we
>>>> cannot
>>>>> claim that the guest's secrets are 100% safe.
>>>>>
>>>>> But the attacker would have to follow the sequence you outlines
>>>> above
>>>>> to change Xen's pagetables and remap guest memory before
>>>> accessing it.
>>>>> It is an additional obstacle for attackers that want to steal other
>>>> guests'
>>>>> secrets. The size of the code that the attacker would need to inject
>>>>> in Xen would need to be bigger and more complex.
>>>>
>>>> Right, that's why I wrote with a bit more work. However, the nuance
>>>> you mention doesn't seem to be present in the cover letter:
>>>>
>>>> "This creates what we call "Software Enclaves", ensuring that an
>>>> adversary with arbitrary code execution in the hypervisor STILL cannot
>>>> read/write guest memory."
>>>>
>>>> So if the end goal if really to protect against *all* sort of
>>> arbitrary
>>>> code,
>>>> then I think we should have a rough idea how this will look like in
>>> Xen.
>>>>
>>>>   From a brief look, it doesn't look like it would be possible to
>>> prevent
>>>> modification to TTBR0_EL2 (even from EL3). We would need to
>>>> investigate if there are other bits in the architecture to help us.
>>>>
>>>>>
>>>>> Every little helps :-)
>>>>
>>>> I can see how making the life of the attacker more difficult is
>>>> appealing.
>>>> Yet, the goal needs to be clarified and the risk with the approach
>>>> acknowledged (see above).
>>>>
>>>
>>> You're right, we should have mentioned this weakness in our first email.
>>> Sorry about the oversight! This is definitely still a limitation that we
>>> have not yet overcome. However, we do think that the increase in
>>> attacker workload that you and Stefano are discussing could still be
>>> valuable to security conscious Xen users.
>>>
>>> It would nice to find additional architecture features that we can use
>>> to close this hole on arm, but there aren't any that stand out to me
>>> either.
>>>
>>> With this limitation in mind, what are the next steps we should take to
>>> support this feature for the xen community? Is this increase in attacker
>>> workload meaningful enough to justify the inclusion of VMF in Xen?
>>
>> Personally, I don’t think so.  The kinds of workloads VMF is usable
>> for (no hypercalls) are likely easily portable to other hypervisors,
>> including formally verified microkernels such as seL4 that provide...
> 
> What other hypervisors might or might not do should not be a factor in
> this discussion and it would be best to leave it aside.

To be honest, Demi has a point. At the moment, VMF is a very niche 
use-case (see more below). So you would end up to use less than 10% of 
the normal Xen on Arm code. A lot of people will likely wonder why using 
Xen in this case?

> 
>  From an AMD/Xilinx point of view, most of our customers using Xen in
> productions today don't use any hypercalls in one or more of their VMs.
This suggests a mix of guests are running (some using hypercalls and 
other not). It would not be possible if you were using VMF.

> Xen is great for these use-cases and it is rather common in embedded.
> It is certainly a different configuration from what most are come to
> expect from Xen on the server/desktop x86 side. There is no question
> that guests without hypercalls are important for Xen on ARM. >
> As a Xen community we have a long history and strong interest in making
> Xen more secure and also, more recently, safer (in the ISO 26262
> safety-certification sense). The VMF work is very well aligned with both
> of these efforts and any additional burder to attackers is certainly
> good for Xen.

I agree that we have a strong focus on making Xen more secure. However, 
we also need to look at the use cases for it. As it stands, there will no:
   - IOREQ use (don't think about emulating TPM)
   - GICv3 ITS
   - stage-1 SMMUv3
   - decoding of instructions when there is no syndrome
   - hypercalls (including event channels)
   - dom0

That's a lot of Xen features that can't be used. Effectively you will 
make Xen more "secure" for a very few users.

> 
> Now the question is what changes are necessary and how to make them to
> the codebase. And if it turns out that some of the changes are not
> applicable or too complex to accept, the decision will be made purely
> from a code maintenance point of view and will have nothing to do with
> VMs making no hypercalls being unimportant (i.e. if we don't accept one
> or more patches is not going to have anything to do with the use-case
> being unimportant or what other hypervisors might or might not do).
I disagree, I think this is also about use cases. On the paper VMF look 
very great, but so far it still has a big flaw (the TTBR can be changed) 
and it would restrict a lot what you can do.

To me, if you can't secure the TTBR, then there are other way to improve 
the security of Xen for the same setup and more.

The biggest attack surface of Xen on Arm today are the hypercalls. So if 
you remove hypercalls access to the guest (or even compile out), then 
there is a lot less chance for an attacker to compromise Xen.

This is not exactly the same guarantee as VMF. But as I wrote before, if 
the attacker has access to Xen, then you are already doomed because you 
have to assume they can switch the TTBR.

Cheers,

-- 
Julien Grall


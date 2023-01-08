Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D45196616AF
	for <lists+xen-devel@lfdr.de>; Sun,  8 Jan 2023 17:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473198.733702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEYYy-0001nE-RF; Sun, 08 Jan 2023 16:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473198.733702; Sun, 08 Jan 2023 16:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEYYy-0001lH-OQ; Sun, 08 Jan 2023 16:30:24 +0000
Received: by outflank-mailman (input) for mailman id 473198;
 Sun, 08 Jan 2023 16:30:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEYYx-0001lB-7b
 for xen-devel@lists.xenproject.org; Sun, 08 Jan 2023 16:30:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEYYu-0003KX-74; Sun, 08 Jan 2023 16:30:20 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEYYu-0004dP-09; Sun, 08 Jan 2023 16:30:20 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=VqVrJAhAwMQZyArxthFYx4Bi7j19mKF+UQf2Vp0behw=; b=wyBgwnw1ukLAB2drrYM1VA2lQk
	fUiUHCf0C+5mDIzder8uOpk0YCHZyQbuhU781JBLgJcKQZXF/LBlJp7UPH1bQ4CrpliKw6Ey8JApk
	vAY9ZOuj0SyAbVbMWvdGSyzyd1NFXr1LoDANwQJANlArhatBwoF+M1QMeRp9HVjIeVLs=;
Message-ID: <7b0435dd-bf2b-fa26-daba-7dec43f9c88e@xen.org>
Date: Sun, 8 Jan 2023 16:30:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
 "Smith, Jackson" <rsmith@riversideresearch.org>,
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
 <af62bf3c-1046-3ed2-8662-e79375fe4794@xen.org>
 <alpine.DEB.2.22.394.2212221109220.4079@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen
In-Reply-To: <alpine.DEB.2.22.394.2212221109220.4079@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 22/12/2022 21:28, Stefano Stabellini wrote:
> On Thu, 22 Dec 2022, Julien Grall wrote:
>>> What other hypervisors might or might not do should not be a factor in
>>> this discussion and it would be best to leave it aside.
>>
>> To be honest, Demi has a point. At the moment, VMF is a very niche use-case
>> (see more below). So you would end up to use less than 10% of the normal Xen
>> on Arm code. A lot of people will likely wonder why using Xen in this case?
> 
> [...]
> 
>>>   From an AMD/Xilinx point of view, most of our customers using Xen in
>>> productions today don't use any hypercalls in one or more of their VMs.
>> This suggests a mix of guests are running (some using hypercalls and other
>> not). It would not be possible if you were using VMF.
> 
> It is true that the current limitations are very restrictive.
> 
> In embedded, we have a few pure static partitioning deployments where no
> hypercalls are required (Linux is using hypercalls today but it could do
> without), so maybe VMF could be enabled, but admittedly in those cases
> the main focus today is safety and fault tolerance, rather than
> confidential computing.
> 
> 
>>> Xen is great for these use-cases and it is rather common in embedded.
>>> It is certainly a different configuration from what most are come to
>>> expect from Xen on the server/desktop x86 side. There is no question
>>> that guests without hypercalls are important for Xen on ARM. >
>>> As a Xen community we have a long history and strong interest in making
>>> Xen more secure and also, more recently, safer (in the ISO 26262
>>> safety-certification sense). The VMF work is very well aligned with both
>>> of these efforts and any additional burder to attackers is certainly
>>> good for Xen.
>>
>> I agree that we have a strong focus on making Xen more secure. However, we
>> also need to look at the use cases for it. As it stands, there will no:
>>    - IOREQ use (don't think about emulating TPM)
>>    - GICv3 ITS
>>    - stage-1 SMMUv3
>>    - decoding of instructions when there is no syndrome
>>    - hypercalls (including event channels)
>>    - dom0
>>
>> That's a lot of Xen features that can't be used. Effectively you will make Xen
>> more "secure" for a very few users.
> 
> Among these, the main problems affecting AMD/Xilinx users today would be:
> - decoding of instructions
> - hypercalls, especially event channels
> 
> Decoding of instructions would affect all our deployments. For
> hypercalls, even in static partitioning deployments, sometimes event
> channels are used for VM-to-VM notifications.
> 
> 
>>> Now the question is what changes are necessary and how to make them to
>>> the codebase. And if it turns out that some of the changes are not
>>> applicable or too complex to accept, the decision will be made purely
>>> from a code maintenance point of view and will have nothing to do with
>>> VMs making no hypercalls being unimportant (i.e. if we don't accept one
>>> or more patches is not going to have anything to do with the use-case
>>> being unimportant or what other hypervisors might or might not do).
>> I disagree, I think this is also about use cases. On the paper VMF look very
>> great, but so far it still has a big flaw (the TTBR can be changed) and it
>> would restrict a lot what you can do.
> 
> We would need to be very clear in the commit messages and documentation
> that with the current version of VMF we do *not* achieve confidential
> computing and we do *not* offer protections comparable to AMD SEV. It is
> still possible for Xen to access guest data, it is just a bit harder.
> 
>  From an implementation perspective, if we can find a way to implement it
> that would be easy to maintain, then it might still be worth it. It
> would probably take only a small amount of changes on top of the "Remove
> the directmap" series to make it so "map_domain_page" doesn't work
> anymore after boot.

None of the callers of map_domain_page() expect the function to fais. So 
some treewide changes will be needed in order to deal with 
map_domain_page() not working. This is not something I am willing to 
accept if the only user is VMF (at the moment I can't think of any other).

So instead, we would need to come up with a way where map_domain_page() 
will never be called at runtime when VMF is in use (maybe by compiling 
out some code?). I haven't really looked in details to say whether 
that's feasiable.

> 
> That might be worth exploring if you and Jackson agree?

I am OK to continue explore it because I think some bits will be still 
useful for the general use. As for the full solution, I will wait and 
see the results before deciding whether this is something that I would 
be happy to merge/maintain.

Cheers,

-- 
Julien Grall


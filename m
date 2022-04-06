Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A342C4F57BD
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 10:25:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299706.510798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc0yC-0003WR-GK; Wed, 06 Apr 2022 08:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299706.510798; Wed, 06 Apr 2022 08:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc0yC-0003TD-CC; Wed, 06 Apr 2022 08:24:52 +0000
Received: by outflank-mailman (input) for mailman id 299706;
 Wed, 06 Apr 2022 08:24:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nc0yB-0003T7-RN
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 08:24:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nc0yA-0007rg-PP; Wed, 06 Apr 2022 08:24:50 +0000
Received: from [54.239.6.190] (helo=[192.168.16.200])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nc0yA-00088y-JE; Wed, 06 Apr 2022 08:24:50 +0000
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
	bh=iDwHrl3G4uo/L2wdiMF0moB8OtYhdjYTRGlg7QX8MEU=; b=lWDXnR+i/9i19dmHgI6a8Xiqw7
	y1MZk514nrClHSO7VjHgAK8GayiLsc0bIZWMJCu063r9bWuACOsq9wldH+4d4kG/2289ZiWt2n+W9
	x2VEI7OgFdcnmJkPXwq3DiMGAxCfTFtvTLI3FCVoBvMd7gg/8qwgnWg7DUlE/oe580T4=;
Message-ID: <e16b4652-a740-3d2e-5e54-0c2d3250e9f7@xen.org>
Date: Wed, 6 Apr 2022 09:24:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 13/19] xen/arm: Move fixmap definitions in a separate
 header
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-14-julien@xen.org>
 <alpine.DEB.2.22.394.2204051411510.2910984@ubuntu-linux-20-04-desktop>
 <ddfdefed-21e6-06ee-182b-731fd130794a@xen.org>
 <alpine.DEB.2.22.394.2204051705010.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2204051705010.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/04/2022 01:10, Stefano Stabellini wrote:
> On Tue, 5 Apr 2022, Julien Grall wrote:
>> On 05/04/2022 22:12, Stefano Stabellini wrote:
>>>> +/* Map a page in a fixmap entry */
>>>> +extern void set_fixmap(unsigned map, mfn_t mfn, unsigned attributes);
>>>> +/* Remove a mapping from a fixmap entry */
>>>> +extern void clear_fixmap(unsigned map);
>>>> +
>>>> +#endif /* __ASSEMBLY__ */
>>>> +
>>>> +#endif /* __ASM_FIXMAP_H */
>>>
>>>
>>> It is a good idea to create fixmap.h, but I think it should be acpi.h to
>>> include fixmap.h, not the other way around.
>>
>> As I wrote in the commit message, one definition in fixmap.h rely on define
>> from acpi.h (i.e NUM_FIXMAP_ACPI_PAGES). So if we don't include it, then user
>> of FIXMAP_PMAP_BEGIN (see next patch) will requires to include acpi.h in order
>> to build.
>>
>> Re-ordering the values would not help because the problem would exactly be the
>> same but this time the acpi users would have to include pmap.h to define
>> NUM_FIX_PMAP.
>>
>>>
>>> The appended changes build correctly on top of this patch.
>>
>> That's expected because all the users of FIXMAP_ACPI_END will be including
>> acpi.h. But after the next patch, we would need pmap.c to include acpi.h.
>>
>> I don't think this would be right (and quite likely you would ask why
>> this is done). Hence this approach.
> 
> 
> I premise that I see your point and I don't feel very strongly either
> way. In my opinion the fixmap is the low level "library" that others
> make use of, so it should be acpi.h and pmap.h (the clients of the
> library) that include fixmap.h and not the other way around.

That's one way to see it. The way I see it is each component decide how 
much entries they need. So I think it is better to move the definition 
to each components as they are best suited to decide the value.

> However, I won't insist if you don't like it. Rough
> patch below for reference.

I want to stay close to what x86 is doing to avoid any headers mess. 
This is what my patch is doing. Now, if x86 folks are happy to move the 
definition per-arch or in a xen/fixmap.h. Then I can look at it.

Andrew, Jan, Roger, Wei, what do you think?

Cheers,

-- 
Julien Grall


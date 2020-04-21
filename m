Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF8E1B2FBF
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 21:04:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQyCC-0006kB-LZ; Tue, 21 Apr 2020 19:04:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wEXD=6F=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jQyCA-0006je-Ne
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 19:04:34 +0000
X-Inumbo-ID: efea3e4c-8402-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efea3e4c-8402-11ea-83d8-bc764e2007e4;
 Tue, 21 Apr 2020 19:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=61JhVvefd6IQbuaphx3kk8843mhSQvEv4uW1B7wrSL0=; b=464WjS5zWb+EP0G0MWg1tnCXUs
 pbzZd+CZ/IIzBdynh2cGVWWswkauoJ96MwQdGoIRaKx8AbqmB8JMKIYgv+3t6SL5QUEZLrtB5DSXE
 n3x07KxCeDa7ETH0Yr3bJRwZI2Rrq/vMkSlcvS/fAfqcVhJ8syg4exsCH93gDuXPJeTY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQyC6-0007GP-Lf; Tue, 21 Apr 2020 19:04:30 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQyC6-0002kG-7q; Tue, 21 Apr 2020 19:04:30 +0000
Subject: Re: [PATCH][RESEND] xen/arm: vgic-v3: fix GICD_ISACTIVER range
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200417221609.19928-1-sstabellini@kernel.org>
 <CAJ=z9a2yCLfOGChD8YL3K7H50spGyifcpeLq_dz_T7aFV8VGQQ@mail.gmail.com>
 <alpine.DEB.2.21.2004171600580.32540@sstabellini-ThinkPad-T480s>
 <aa8013f5-2209-ed0d-6ef4-e6a195bff75a@xen.org>
 <alpine.DEB.2.21.2004211131461.24585@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <125309d6-0a81-b6b5-2cf7-4cb3912b7144@xen.org>
Date: Tue, 21 Apr 2020 20:04:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004211131461.24585@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, George.Dunlap@citrix.com,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 21/04/2020 19:49, Stefano Stabellini wrote:
> + George
> 
> On Sat, 18 Apr 2020, Julien Grall wrote:
>> Hi,
>>
>> On 18/04/2020 00:12, Stefano Stabellini wrote:
>>> On Fri, 17 Apr 2020, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> The title claim this is a resend, but this is actually not the latest
>>>> version of this patch. Can you explain why you decided to use v1
>>>> rather than v2?
>>>
>>> Because v2 added a printk for every read, and I thought you only wanted
>>> the range fix. Also, the printk is not a "warn once" so after the
>>> discussion where it became apparent that the register can be read many
>>> times, it sounded undesirable.
>>
>> You previously mentionned that you will use Peng's patch. From my perspective,
>> this meant you are using the latest version of a patch not a previous one.
>>
>> So this was a bit of a surprised to me.
>>
>>>
>>> Nonetheless I don't have a strong preference between the two. If you
>>> prefer v2 it is here:
>>>
>>> https://marc.info/?l=xen-devel&m=157440872522065
>> I understand the "warn" issue but we did agree with it back then. I am ok to
>> drop it. However, may I request to be more forthcoming in your patch in the
>> future?
>>
>> For instance in this case, this a link to the original patch and an
>> explanation why you selected v1 would have been really useful.
> 
> That's a good point, I can add it. So, for clarity, I'll keep v1 but
> expand on the commit message to say that we kept v1 to avoid spamming
> the console.

I am fine with that:

Acked-by: Julien Grall <jgrall@amazon.com>

> 
> 
>>> Do you need me to resent it? If it is OK for you as-is, you can give
>>> your ack here, and I'll go ahead and commit it.
>>>
>>>
>>>> On Fri, 17 Apr 2020 at 23:16, Stefano Stabellini <sstabellini@kernel.org>
>>>> wrote:
>>>>>
>>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>>
>>>>> The end should be GICD_ISACTIVERN not GICD_ISACTIVER.
>>>>>
>>>>> (See https://marc.info/?l=xen-devel&m=158527653730795 for a discussion
>>>>> on
>>>>> what it would take to implement GICD_ISACTIVER/GICD_ICACTIVER properly.)
>>>>>
>>>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>>
>>>> I don't think you can be at the same time an author of the patch and a
>>>> reviewer. Otherwise, I could review my own patch ;).
>>>
>>> Yeah ... that was not the intention. I changed the commit message so I
>>> had to add my signed-off-by for copyright reasons.
>>> At the same time I
>>> reviewed it even before changing the commit message so I added the
>>> reviewed-by. I agree it looks kind of weird.
>>
>> I don't feel this should go as-is. It is not clear in the commit message the
>> changes you did and could lead confusion once merged. One may think you
>> reviewed your own patch.
>>
>> In general when I tweak a commit message, I will not add my signed-off-by but
>> just add [julieng: Tweak commit message] above my reviewed-by/acked-by tag.
>>
>> Alternatively, you can remove your reviewed-by and let another maintainer
>> reviewing it.
>>
>> I will let you decide your preference and resend the patch appropriately.
>   
> The Linux policy on Signed-off-by is really strict: basically any time a
> person touches a patch, even just to commit the patch (no changes to
> it), they add a Signed-off-by. So it is common there and other projects
> to have both Signed-off-by and Reviewed-by from the same individual. For
> instance on Linux:

I don't think we used this policy so far for Xen Project. Before 
pointing out the Signed-off-by vs Reviewed-by, I actually looked online 
but I wasn't able to find why Signed-off-by and Reviewed-by was added 
together.

> 
> 
> commit b2a84de2a2deb76a6a51609845341f508c518c03
> 
>      Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
>      Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
>      Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>      Signed-off-by: Will Deacon <will@kernel.org>
>      Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> commit 33e45234987ea3ed4b05fc512f4441696478f12d
> 
>      Reviewed-by: Kees Cook <keescook@chromium.org>
>      Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>      Reviewed-by: Vincenzo Frascino <Vincenzo.Frascino@arm.com>
>      Signed-off-by: Kristina Martsenko <kristina.martsenko@arm.com>
>      [Amit: Modified secondary cores key structure, comments]
>      Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
>      Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> 
> On QEMU:
> 
> 
> commit 22cd0945b8429f818a2d90f06f02bb526bfb319d
> 
>      Signed-off-by: Francisco Iglesias <frasse.iglesias@gmail.com>
>      Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>      Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>      Message-id: 20180503214201.29082-2-frasse.iglesias@gmail.com
>      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> commit 133d23b3ad1be53105b9950fb18858cf059f2da6
> 
>      Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>      Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>      Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> 
> 
> Your suggestion of adding something between brackets like:
> 
>    [stefano: update commit message]
> 
> is good because it clarifies things and I'd like to do that. But still,
> I think it would require the addition of my Signed-off-by. At the same
> time it doesn't look like we want to avoiding adding a Reviewed-by
> because a reviewer made a change to the commit message too?

Agree, I also think we need to clarify in this case as it is more 
difficult to understand if the signed-off-by was by a contributor or 
someone who merged it.

> 
> 
> Of course, for this patch, I am happy to drop my Reviewed-by and resend
> and I'll do that. But I think it would be worth clarifying this point at
> the project level. George, do we or the LinuxFoundation have a policy on
> whether we can or cannot have reviewed-by and signed-off-by from the same
> individual?

Cheers,

-- 
Julien Grall


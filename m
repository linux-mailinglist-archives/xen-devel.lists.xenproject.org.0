Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52221C2815
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 21:44:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUy3L-00033T-E5; Sat, 02 May 2020 19:43:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L6si=6Q=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jUy3J-00033N-RZ
 for xen-devel@lists.xenproject.org; Sat, 02 May 2020 19:43:57 +0000
X-Inumbo-ID: 42fdcb28-8cad-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42fdcb28-8cad-11ea-b07b-bc764e2007e4;
 Sat, 02 May 2020 19:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kW0zjqnP9wTG7XNLFLNKwa2GDumnd5MVp8hUu8yOTO8=; b=tOS889RZ4gH6WWmkCA3SePCKL9
 aEfOptqFCfVByEScs91tnPy8LwnixqYI9kgCa1mWwdYvC+EglHkCDdSeBDv+rkHKjWN+bXgG/ogK3
 wpSOTigpPg94TUdeJdkhAcJiyDq3bYGKdlljrOUEr4PZZML6Xgj5AixkAAWAjG2l5GsY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jUy3I-0004pG-F8; Sat, 02 May 2020 19:43:56 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jUy3I-0005cz-7K; Sat, 02 May 2020 19:43:56 +0000
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
To: Elliott Mitchell <ehem+xen@m5p.com>, Corey Minyard <minyard@acm.org>
References: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
 <20200501114201.GE9902@minyard.net>
 <CAMmSBy_h9=5cjMv3+-BKHYhBikgna731DoA+t-8FK-2tbPUH-A@mail.gmail.com>
 <20200502021647.GG9902@minyard.net>
 <4f6ef562-e213-8952-66d6-0f083bf8c593@xen.org>
 <20200502173529.GH9902@minyard.net> <20200502184836.GA96674@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <00800979-6202-b2c1-7e1f-d05184d187a6@xen.org>
Date: Sat, 2 May 2020 20:43:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200502184836.GA96674@mattapan.m5p.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Roman Shaposhnik <roman@zededa.com>, jeff.kubascik@dornerworks.com,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Elliott,

On 02/05/2020 19:48, Elliott Mitchell wrote:
> On Sat, May 02, 2020 at 12:35:29PM -0500, Corey Minyard wrote:
>> On Sat, May 02, 2020 at 12:46:14PM +0100, Julien Grall wrote:
>>>
>>> On 02/05/2020 03:16, Corey Minyard wrote:
>>>>
>>>> Nope.  If you say 4096M of RAM, your issue is almost certainly DMA, but
>>>> it's not (just) the Linux code.  On the Raspberry Pi 4, several devices
>>>> cannot DMA to above 1024M of RAM, but Xen does not handle this.  The
>>>> 1024M of RAM is a limitation you will have to live with until Xen has a
>>>> fix.
>>>
>>> IIUC, dom0 would need to have some memory below 1GB for this to work, am I
>>> correct?
>>
>> No.  If I am understanding this correctly, all the memory in dom0 below
>> 1GB would have to be physically below 1GB.
>>
>> The Linux patch set starts at:
>>
>> https://lore.kernel.org/linux-iommu/20191015174616.GO13874@arrakis.emea.arm.com/t/
>>
> 
> Actually, things get worse.  What if someone wants to run an X-server in
> DomU and have a DomU accessing the graphics hardware?  Really needs to be
> a case of allocating DMA-capable memory means talking to Xen.

I am confused, if you passthrough a device to your DomU then you most 
likely going to want to protect using an IOMMU. So are you talking with 
or without IOMMU?

Lets imagine that you want to do without an IOMMU. The easiest way would 
be to direct-map your domain (e.g host physical == guest physical) 
because you require no modification in your guest. Only the toolstack 
and Xen would require modification.

Stefano has been working on a solution in the dom0less case (see [1]). 
The approach is to let the user select the region of RAM to use for a 
given guest.


> As pointed out in that discussion different boards are going to have the
> DMA-borderline in different places.  There could be enough variation that
> it needs to be settable at run time.  Then some boards might have some
> DMA devices which can access all memory, and some which cannot (full-DMA
> versus limited-DMA?).
> 
> 

Cheers,

[1] 
https://lore.kernel.org/xen-devel/91b9d1d9-6e6f-c8b9-55ac-a3477b20a17b@xen.org/T/#t

-- 
Julien Grall


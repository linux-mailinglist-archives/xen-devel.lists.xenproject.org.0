Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2281B1FD8C6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 00:30:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlgY9-0000vV-J6; Wed, 17 Jun 2020 22:28:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMs+=76=huskydog.org.uk=xen@srs-us1.protection.inumbo.net>)
 id 1jlgY7-0000vQ-Lw
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 22:28:51 +0000
X-Inumbo-ID: ea75c224-b0e9-11ea-bb8b-bc764e2007e4
Received: from gordon.huskydog.org.uk (unknown [81.187.95.156])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ea75c224-b0e9-11ea-bb8b-bc764e2007e4;
 Wed, 17 Jun 2020 22:28:49 +0000 (UTC)
Received: from [10.137.3.12] (percyq.huskydog.org.uk [10.42.42.111])
 by gordon.huskydog.org.uk (Postfix) with ESMTP id 987C5B318A;
 Wed, 17 Jun 2020 23:28:48 +0100 (BST)
Subject: Re: ARM - Successful install on RockPro64
To: Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <46497134-fb7c-3d1f-6414-539138856480@huskydog.org.uk>
 <6AB44468-BD6A-4140-B0EF-3D2E5EDC99A0@arm.com>
 <e0420114-95df-dcaa-8235-7726042c427d@huskydog.org.uk>
 <8013f2db-3732-0679-81f6-7b274b39c44f@xen.org>
From: Richard Simpson <xen@huskydog.org.uk>
Message-ID: <49e5b539-145a-726a-fb80-a93e65e44ca0@huskydog.org.uk>
Date: Wed, 17 Jun 2020 23:28:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <8013f2db-3732-0679-81f6-7b274b39c44f@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello Julien,

I have just tried 4.14-rc2 and it seems to work fine.

I think that the most useful page regarding the board is the one for the 
Ibox3399 since this refers to the RK3399 chip which the RockPro64 uses 
(shouldn't the page actually be called RK3399 to make it more generic).

Perhaps I can most usefully record what I did by updating that page and 
making sure that the instructions work correctly. If there is additional 
stuff relevant to the RockPro64 over and above the generic RK3399 info 
then I'll give some thought to how to best record it.  I will eventually 
be writing a fuller report on my progress on my blog at 
funfoodfreedom.huskydog.org.uk.

I now need to finish automating the boot process (still requires manual 
u-boot command) and figure out how to get the console log to work.  
Currently I can either see the xen and linux kernel boot messages OR see 
the dom0 console, but not both.  I then want to wipe the install and 
start again without all the blind alleys that I went down the first time 
(mostly a function of my ignorance). This should allow me to clearly 
document what is actually required from both a Xen and Gentoo perspective.

I'll also try to more of the Xen config options to see what works and 
what is actually needed.

On one more related note:  I suspect that Xen would run on the 
PineBookPro as well as I get the impression that it uses very similar 
hardware.  Of course that would rely on the GPU etc which I haven't 
tested at all as I am using the serial console.

Finally, when I joined this mailing list I asked for a daily digest.  
However I seem to be getting a new digest every hour or so.  Is this right?

Regards,

     Richard

On 6/16/20 11:26 AM, Julien Grall wrote:
> Hello,
>
> On 16/06/2020 09:33, Richard Simpson wrote:
>> I would be happy to try to report my success via the smoke test page 
>> (https://wiki.xenproject.org/wiki/Xen_ARM_Manual_Smoke_Test/Results) 
>> if I can figure out how.  Strangely, I can't see anything listed 
>> under "Test Results" from anyone else.  Perhaps it is a problem with 
>> my browser.
> This is not a browser problem :). In the past, we did attempt to list 
> all the boards we know works on a given version of Xen. But this never 
> really gain any momentum.
>
> If there is any specific setup you need for your board (e.g. 
> non-upstream kernel, a new U-boot...), then I would suggest to create 
> a new page with steps to boot Xen the platform. You can have a look 
> how we list the other boards in [1].
>
>>
>> I also notice an instruction which reads "Test hypervisor 
>> functionalities: clone raisin on the platform and run ./raise test".  
>> I can try to do this if it will help.  Do I just run "git clone <link 
>> from web page>" and then presumably the test prints out some results?
>
> It is just meant to be an easy way to test basic functionality of Xen 
> (e.g booting a guest). You seem to have done it manually, so it should 
> be sufficient.
>
>>
>> Happy to try a beta version of Xen if you decide to include the patch 
>> and I can also try some of the interrupt config options if you want.
>
> The patch should already be included in xen 4.14-rc2. Would you mind 
> to give a spin?
>
> Best regards,
>
> [1] 
> https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions
>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C9F20C434
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jun 2020 22:59:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpHuR-0002kP-O6; Sat, 27 Jun 2020 20:58:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rrob=AI=huskydog.org.uk=xen@srs-us1.protection.inumbo.net>)
 id 1jpHuQ-0002kK-Ok
 for xen-devel@lists.xenproject.org; Sat, 27 Jun 2020 20:58:46 +0000
X-Inumbo-ID: fcfc6084-b8b8-11ea-8402-12813bfff9fa
Received: from gordon.huskydog.org.uk (unknown [81.187.95.156])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fcfc6084-b8b8-11ea-8402-12813bfff9fa;
 Sat, 27 Jun 2020 20:58:44 +0000 (UTC)
Received: from [10.137.3.12] (percyq.huskydog.org.uk [10.42.42.111])
 by gordon.huskydog.org.uk (Postfix) with ESMTP id 82B783E45;
 Sat, 27 Jun 2020 21:58:43 +0100 (BST)
Subject: Re: ARM - Successful install on RockPro64
To: Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <46497134-fb7c-3d1f-6414-539138856480@huskydog.org.uk>
 <6AB44468-BD6A-4140-B0EF-3D2E5EDC99A0@arm.com>
 <e0420114-95df-dcaa-8235-7726042c427d@huskydog.org.uk>
 <8013f2db-3732-0679-81f6-7b274b39c44f@xen.org>
 <49e5b539-145a-726a-fb80-a93e65e44ca0@huskydog.org.uk>
 <e786262c-d326-66d0-e3ed-bfb9e6e3bd93@xen.org>
From: Richard Simpson <xen@huskydog.org.uk>
Message-ID: <db52de90-23d7-6376-b842-bab50a92a22f@huskydog.org.uk>
Date: Sat, 27 Jun 2020 21:58:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <e786262c-d326-66d0-e3ed-bfb9e6e3bd93@xen.org>
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

Hello Julien, yes the clk_ignored_unused option fixed the boot message 
problem.  I would never have worked that out for myself.

The relevant lines now read:

Xen: console=dtuart dtuart=serial2

Linux: console=hvc0 earlyprintk=xen clk_ignore_unused

inittab: h0:12345:respawn:/sbin/agetty 1500000 hvc0 vt100

I have added a note to the Xen Serial Console Wiki page which - I was 
shocked to observe - hadn't been updated since 2014.  I'll add it to my 
list of pages to refresh, noting that I only have Xen on this one ARM 
SBC (excluding my QubesOS laptop) so I can only check anything I write 
relative to that.

Regards,

     Richard

On 6/24/20 1:42 PM, Julien Grall wrote:
>
>
> On 17/06/2020 23:28, Richard Simpson wrote:
>> Hello Julien,
>
> Hello Richard,
>
> Apologies for the late answer.
>
>> I have just tried 4.14-rc2 and it seems to work fine.
>
> Glad to hear that. Thank you for the testing!
>
>> I think that the most useful page regarding the board is the one for 
>> the Ibox3399 since this refers to the RK3399 chip which the RockPro64 
>> uses (shouldn't the page actually be called RK3399 to make it more 
>> generic).
>
> I agree with the renaming here.
>
>> Perhaps I can most usefully record what I did by updating that page 
>> and making sure that the instructions work correctly. If there is 
>> additional stuff relevant to the RockPro64 over and above the generic 
>> RK3399 info then I'll give some thought to how to best record it.  I 
>> will eventually be writing a fuller report on my progress on my blog 
>> at funfoodfreedom.huskydog.org.uk.
>
> Any additional content on the wiki will be greatly appreciated. By 
> default new wiki account doesn't have write permission, but we can 
> enable it for you if you provide us your username.
>
>>
>> I now need to finish automating the boot process (still requires 
>> manual u-boot command) and figure out how to get the console log to 
>> work. 
>
> I wrote a small u-boot script in the past to try to automate the boot 
> (see [2]).
>
> I vaguely remember some quoting issue and missing 0x in front of 
> values depending on the U-boot configuration you use. So you may have 
> to tweak it a bit.
>
>> Currently I can either see the xen and linux kernel boot messages OR 
>> see the dom0 console, but not both.
>
> Can you provide the kernel/xen command lines you use in the two cases?
>
> As an aside, I know that on some setup Linux will try to disable the 
> clock of the UART used by Xen. One of the symptoms is the UART is 
> becoming completely unusable half way through Linux boot.
>
> You may want to try to pass clk_ignored_unused to see if it helps.
>
>> On one more related note:  I suspect that Xen would run on the 
>> PineBookPro as well as I get the impression that it uses very similar 
>> hardware.  Of course that would rely on the GPU etc which I haven't 
>> tested at all as I am using the serial console.
> I wouldn't expect any issue to use the GPU in dom0 at least if you 
> don't have an IOMMU on the platform. The trouble may be more with the 
> bootloader if it doesn't drop you in hypervisor mode.
>
>>
>> Finally, when I joined this mailing list I asked for a daily digest. 
>> However I seem to be getting a new digest every hour or so.  Is this 
>> right?
>
> I haven't used the digest myself. I CC Ian Jackson who may be able to 
> help you.
>
> Cheers,
>
> [2] https://xenbits.xen.org/people/julieng/load-xen-tftp.scr.txt
>


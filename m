Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1E53AC071
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 03:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144317.265635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu2xn-0008WM-SJ; Fri, 18 Jun 2021 01:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144317.265635; Fri, 18 Jun 2021 01:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu2xn-0008UX-Om; Fri, 18 Jun 2021 01:06:27 +0000
Received: by outflank-mailman (input) for mailman id 144317;
 Fri, 18 Jun 2021 01:06:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AHJ/=LM=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1lu2xl-0008UR-Su
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 01:06:26 +0000
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1627529-ce36-4d3a-ae9f-2af7dd13f274;
 Fri, 18 Jun 2021 01:06:23 +0000 (UTC)
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:51070
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1lu32K-0007qg-Iu; Fri, 18 Jun 2021 03:11:08 +0200
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
X-Inumbo-ID: e1627529-ce36-4d3a-ae9f-2af7dd13f274
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Fd1zkhbHbgLlW8EB8x79t8JJ4Wq3JOq8GZOSFxBd4ZA=; b=YKxs40SrY3dKlnlP+qZO1JSMMn
	W34a+umSP0S5guWCtNnmZ8r8iBsisO67qgf7zhnAmLj+xOm98sv9MynCbEsThQ1dD24mUHACc3fZb
	5KlRJce1fIM9rquXYX4Z5ZE3WOTwHyXluEdp0S9oHW6JxAju0dQ/U6dMZTBAHbxgWTIg=;
Subject: Re: Linux 5.13-rc6 regression to 5.12.x: kernel OOM and panic during
 kernel boot in low memory Xen VM's (256MB assigned memory).
From: Sander Eikelenboom <linux@eikelenboom.it>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Juergen Gross <jgross@suse.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ee8bf04c-6e55-1d9b-7bdb-25e6108e8e1e@eikelenboom.it>
 <CAHk-=wjgg67NMBNG99naEQ1cM0mXBBzdhCJaYFH-kC+mLK+J2g@mail.gmail.com>
 <9108c22e-3521-9e24-6124-7776d947b788@rasmusvillemoes.dk>
 <0b12f27b-1109-b621-c969-10814b2c1c2f@eikelenboom.it>
 <7338064f-10b6-545d-bc6c-843d04aafe28@eikelenboom.it>
Message-ID: <e7f9c4f8-1669-75ce-b052-1030350a159e@eikelenboom.it>
Date: Fri, 18 Jun 2021 03:06:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7338064f-10b6-545d-bc6c-843d04aafe28@eikelenboom.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17/06/2021 21:39, Sander Eikelenboom wrote:
> On 17/06/2021 20:02, Sander Eikelenboom wrote:
>> On 17/06/2021 17:37, Rasmus Villemoes wrote:
>>> On 17/06/2021 17.01, Linus Torvalds wrote:
>>>> On Thu, Jun 17, 2021 at 2:26 AM Sander Eikelenboom <linux@eikelenboom.it> wrote:
>>>>>
>>>>> I just tried to upgrade and test the linux kernel going from the 5.12 kernel series to 5.13-rc6 on my homeserver with Xen, but ran in some trouble.
>>>>>
>>>>> Some VM's boot fine (with more than 256MB memory assigned), but the smaller (memory wise) PVH ones crash during kernel boot due to OOM.
>>>>> Booting VM's with 5.12(.9) kernel still works fine, also when dom0 is running 5.13-rc6 (but it has more memory assigned, so that is not unexpected).
>>>>
>>>> Adding Rasmus to the cc, because this looks kind of like the async
>>>> roofs population thing that caused some other oom issues too.
>>>
>>> Yes, that looks like the same issue.
>>>
>>>> Rasmus? Original report here:
>>>>
>>>>       https://lore.kernel.org/lkml/ee8bf04c-6e55-1d9b-7bdb-25e6108e8e1e@eikelenboom.it/
>>>>
>>>> I do find it odd that we'd be running out of memory so early..
>>>
>>> Indeed. It would be nice to know if these also reproduce with
>>> initramfs_async=0 on the command line.
>>>
>>> But what is even more curious is that in the other report
>>> (https://lore.kernel.org/lkml/20210607144419.GA23706@xsang-OptiPlex-9020/),
>>> it seemed to trigger with _more_ memory - though I may be misreading
>>> what Oliver was telling me:
>>>
>>>> please be noted that we use 'vmalloc=512M' for both parent and this
>>> commit.
>>>> since it's ok on parent but oom on this commit, we want to send this
>>> report
>>>> to show the potential problem of the commit on some cases.
>>>>
>>>> we also tested by changing to use 'vmalloc=128M', it will succeed.
>>>
>>> Those tests were done in a VM with 16G memory, and then he also wrote
>>>
>>>> we also tried to follow exactly above steps to test on
>>>> some local machine (8G memory), but cannot reproduce.
>>>
>>> Are there some special rules for what memory pools PID1 versus the
>>> kworker threads can dip into?
>>>
>>>
>>> Side note: I also had a ppc64 report with different symptoms (the
>>> initramfs was corrupted), but that turned out to also reproduce with
>>> e7cb072eb98 reverted, so that is likely unrelated. But just FTR that
>>> thread is here:
>>> https://lore.kernel.org/lkml/CA+QYu4qxf2CYe2gC6EYnOHXPKS-+cEXL=MnUvqRFaN7W1i6ahQ@mail.gmail.com/
>>>
>>> Rasmus
>>>
>>
>> I choose to first finish the bisection attempt, not so suprising it ends up with:
>> e7cb072eb988e46295512617c39d004f9e1c26f8 is the first bad commit
>>
>> So at least that link is confirmed.
>>
>> I also checked out booting with "initramfs_async=0" and now the guest boots with the 5.13-rc6-ish kernel which fails without that.
>>
>> --
>> Sander
>>
> 
> CC'ed Juergen.
> 
> Juergen, do you know how the direct kernel boot works and if that could interfere
> with this commit ?
> 
> After reading the last part of the commit message e7cb072eb98 namely:
> 
>       Should one of the initcalls done after rootfs_initcall time (i.e., device_
>       and late_ initcalls) need something from the initramfs (say, a kernel
>       module or a firmware blob), it will simply wait for the initramfs
>       unpacking to be done before proceeding, which should in theory make this
>       completely safe.
>       
>       But if some driver pokes around in the filesystem directly and not via one
>       of the official kernel interfaces (i.e.  request_firmware*(),
>       call_usermodehelper*) that theory may not hold - also, I certainly might
>       have missed a spot when sprinkling wait_for_initramfs().  So there is an
>       escape hatch in the form of an initramfs_async= command line parameter.
> 
> It dawned on me I'm using "direct kernel boot" functionality, which lets you boot a guest
> were the kernel and initramfs get copied in from dom0, that works great, but perhaps it
> pokes around as the last part of the commit message warns about ?
> 
> (I think the feature was called "direct kernel boot", what I mean is using the for example:
>       kernel      = '/boot/vmlinuz-5.13.0-rc6-20210617-doflr-mac80211debug+'
>       ramdisk     = '/boot/initrd.img-5.13.0-rc6-20210617-doflr-mac80211debug+'
>       cmdline     = 'root=UUID=2f757320-caca-4215-868d-73a4aacf12aa ro nomodeset xen_blkfront.max_ring_page_order=1 console=hvc0 earlyprintk=xen initramfs_async=0'
> 
> options in the xen guest config file to boot the (in this case PVH) guest.
> )
> 
> --
> Sander
> 

OK, done some experimentation and it seems with 256M assigned to the VM it was almost at the edge of OOM with the 5.12 kernel as well in the config I am using it.
With v5.12 when I assign 240M it boots, with 230M it doesn't. With 5.13 the tipping point seems to be around 265M and 270M, so my config was already quite close to the edge.

The "direct kernel boot" feature I'm using just seems somewhat memory hungry, but using another compression algorithm for the kernel and initramfs already helped in my case.

So sorry for the noise, clearly user-error.

--
Sander





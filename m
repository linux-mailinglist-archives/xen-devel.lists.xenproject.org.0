Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7301C24CE
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 13:46:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUqb9-0004xp-GY; Sat, 02 May 2020 11:46:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L6si=6Q=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jUqb8-0004xf-Dl
 for xen-devel@lists.xenproject.org; Sat, 02 May 2020 11:46:22 +0000
X-Inumbo-ID: 8a4540a8-8c6a-11ea-9ba8-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a4540a8-8c6a-11ea-9ba8-12813bfff9fa;
 Sat, 02 May 2020 11:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zfYKVIXfWGSHzghCifTnqfjpwaipvBibQ0SKLEC6gbs=; b=2LDGd2VRZuxMsxnPDKgR1ie8Ay
 2m3UkjUsZi/LhIr0r/M5NORDfJugCOw0wSrI4wGg+sXiEubMVvYogTX10w/grM9wd+h5XE5mNDHtb
 ixk040Lu0uk+su02CrSjgXsrIt6uKfLLgmVjp5DF5a8vfLdtnfyz13daJZfS6ItDOy6o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jUqb2-0003tM-Tq; Sat, 02 May 2020 11:46:16 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jUqb2-0000HB-If; Sat, 02 May 2020 11:46:16 +0000
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
To: minyard@acm.org, Roman Shaposhnik <roman@zededa.com>
References: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
 <20200501114201.GE9902@minyard.net>
 <CAMmSBy_h9=5cjMv3+-BKHYhBikgna731DoA+t-8FK-2tbPUH-A@mail.gmail.com>
 <20200502021647.GG9902@minyard.net>
From: Julien Grall <julien@xen.org>
Message-ID: <4f6ef562-e213-8952-66d6-0f083bf8c593@xen.org>
Date: Sat, 2 May 2020 12:46:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200502021647.GG9902@minyard.net>
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 jeff.kubascik@dornerworks.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 02/05/2020 03:16, Corey Minyard wrote:
> On Fri, May 01, 2020 at 06:06:11PM -0700, Roman Shaposhnik wrote:
>> On Fri, May 1, 2020 at 4:42 AM Corey Minyard <minyard@acm.org> wrote:
>>>
>>> On Thu, Apr 30, 2020 at 07:20:05PM -0700, Roman Shaposhnik wrote:
>>>> Hi!
>>>>
>>>> I'm trying to run Xen on Raspberry Pi 4 with 5.6.1 stock,
>>>> upstream kernel. The kernel itself works perfectly well
>>>> on the board. When I try booting it as Dom0 under Xen,
>>>> it goes into a stacktrace (attached).
>>>
>>> Getting Xen working on the Pi4 requires a lot of moving parts, and they
>>> all have to be right.
>>
>> Tell me about it! It is a pretty frustrating journey to align
>> everything just right.
>> On the other hand -- it seems worth to enable RPi as an ARM development
>> platform for Xen given how ubiquitous it is.
>>
>> Hence me trying to combine pristine upstream kernel (5.6.1) with
>> pristine upstream
>> Xen to enable 100% upstream developer workflow on RPi.
>>
>>>> Looking at what nice folks over at Dornerworks have previously
>>>> done to make RPi kernels boot as Dom0 I've come across these
>>>> 3 patches:
>>>>      https://github.com/dornerworks/xen-rpi4-builder/tree/master/patches/linux
>>>>
>>>> The first patch seems irrelevant (unless I'm missing something
>>>> really basic here).
>>>
>>> It might be irrelevant for your configuration, assuming that Xen gets
>>> the right information from EFI.  I haven't tried EFI booting.
>>
>> I'd doing a bit of belt-and-suspenders strategy really -- I'm actually
>> using UEFI u-boot implementation that pre-populates device trees
>> and then I'm also forcing an extra copy of it to be load explicitly
>> via the GRUB devicetree command (GRUB runs as a UEFI payload).
>>
>> I also have access to the semi-official TianoCore RPi4 port that seems
>> to be working pretty well: https://github.com/pftf/RPi4/releases/tag/v1.5
>> for booting all sort of UEFI payloads on RPi4.
>>
>>>> The 2nd patch applied with no issue (but
>>>> I don't think it is related) but the 3d patch failed to apply on
>>>> account of 5.6.1 kernel no longer having:
>>>>      dev->archdata.dev_dma_ops
>>>> E.g.
>>>>      https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/mm/dma-mapping.c?h=v5.6.1#n55
>>>>
>>>> I've tried to emulate the effect of the patch by simply introducing
>>>> a static variable that would signal that we already initialized
>>>> dev->dma_ops -- but that didn't help at all.
>>>>
>>>> I'm CCing Jeff Kubascik to see if the original authors of that Corey Minyard
>>>> to see if may be they have any suggestions on how this may be dealt
>>>> with.
>>>>
>>>> Any advice would be greatly appreciated!
>>>
>>> What's your Pi4 config.txt file look like? The GIC is not being handled
>>> correctly, and I'm guessing that configuration is wrong.  You can't use
>>> the stock config.txt file with Xen, you have to modify the configuration a
>>> bit.
>>
>> Understood. I'm actually using a custom one:
>>      https://github.com/lf-edge/eve/blob/master/pkg/u-boot/rpi/config.txt
>>
>> I could swear that I had a GIC setting in it -- but apparently no -- so
>> I added the following at the top of what you could see at the URL above:
>>
>> total_mem=4096
>> enable_gic=1
>>
>>> I think just adding:
>>>
>>> enable_gic=1
>>> total_mem=1024
>>
>> Right -- but my board has 4G memory -- so I think what I did above should work.
> 
> Nope.  If you say 4096M of RAM, your issue is almost certainly DMA, but
> it's not (just) the Linux code.  On the Raspberry Pi 4, several devices
> cannot DMA to above 1024M of RAM, but Xen does not handle this.  The
> 1024M of RAM is a limitation you will have to live with until Xen has a
> fix.

IIUC, dom0 would need to have some memory below 1GB for this to work, am 
I correct?

If so could you try the following patch?

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 430708753642..002f49dba74b 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -282,7 +282,7 @@ static void __init allocate_memory_11(struct domain *d,
       */
      while ( order >= min_low_order )
      {
-        for ( bits = order ; bits <= (lowmem ? 32 : PADDR_BITS); bits++ )
+        for ( bits = order ; bits <= (lowmem ? 30 : PADDR_BITS); bits++ )
          {
              pg = alloc_domheap_pages(d, order, MEMF_bits(bits));
              if ( pg != NULL )
@@ -313,7 +313,7 @@ static void __init allocate_memory_11(struct domain *d,
      order = get_allocation_size(kinfo->unassigned_mem);
      while ( kinfo->unassigned_mem && kinfo->mem.nr_banks < NR_MEM_BANKS )
      {
-        pg = alloc_domheap_pages(d, order, lowmem ? MEMF_bits(32) : 0);
+        pg = alloc_domheap_pages(d, order, lowmem ? MEMF_bits(30) : 0);
          if ( !pg )
          {
              order --;


Cheers,

-- 
Julien Grall


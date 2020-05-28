Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA0C1E6590
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 17:12:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeKCK-0001St-EP; Thu, 28 May 2020 15:11:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lRPh=7K=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jeKCI-0001So-Le
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 15:11:54 +0000
X-Inumbo-ID: 906ffd52-a0f5-11ea-9947-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 906ffd52-a0f5-11ea-9947-bc764e2007e4;
 Thu, 28 May 2020 15:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vO6WjParInOWM48KFMRaowrG8Fo/bPpHLEYdvF3UWeQ=; b=nEUkb+5pdnfpmk7pfAoz5PPpKR
 a4tTaKm1Zy3UPoY+yArdx31GUPlzOtiBUDsmJS6vnjdqqzz0QZkCPetcI184Au6CNWn7L1sJMxEfp
 LpVTbJIrOtrB3TscL8de1MEiR7IOVRf7OM7gxllPJSX6FQMuZYgfik6OluIy3g0DU3Ss=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeKCH-0006T8-On; Thu, 28 May 2020 15:11:53 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeKCH-0004rX-H0; Thu, 28 May 2020 15:11:53 +0000
Subject: Re: [OSSTEST PATCH 22/38] buster: Extend guest bootloader workaround
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
 <20200519190230.29519-23-ian.jackson@eu.citrix.com>
 <7747c676-f9da-cb97-bd93-78dc13138d03@xen.org>
 <24261.17724.382954.918761@mariner.uk.xensource.com>
 <e4e7e515-587a-ad81-c9b7-b7cfa69108be@xen.org>
 <24271.53336.125796.634580@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d4fc0391-9f40-86ad-f304-70bb0cd73e9b@xen.org>
Date: Thu, 28 May 2020 16:11:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <24271.53336.125796.634580@mariner.uk.xensource.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 28/05/2020 15:53, Ian Jackson wrote:
> Julien Grall writes ("Re: [OSSTEST PATCH 22/38] buster: Extend guest bootloader workaround"):
>> On 20/05/2020 15:57, Ian Jackson wrote:
>>> Julien Grall writes ("Re: [OSSTEST PATCH 22/38] buster: Extend guest bootloader workaround"):
>>>> On 19/05/2020 20:02, Ian Jackson wrote:
>>>>>     	# Debian doesn't currently know what bootloader to install in
>>>>>     	# a Xen guest on ARM. We install pv-grub-menu above which
>>>>
>>>> OOI, what does Debian install for x86 HVM guest? Is there any ticket
>>>> tracking this issue?
>>>
>>> On x86, it installes grub.  (grub2, x86, PC, to be precise.)
>>
>> I have just realized that on x86 you will always have a firmware in the
>> guest. On Arm we commonly boot the kernel directly.
> 
> Yes.  At leave, for HVM.
> 
>> So maybe we are closer to PV here. Do you also install GRUB in that case?
> 
> It's Complicated.  There are several options, but the usual ones are:
> 
> 1. pygrub: Install some version of grub, which generates
>     /boot/grub.cfg.  It doesn't matter very much which version of grub
>     because grub.cfg is read by pygrub in dom0 and that fishes out the
>     kernel and initrd.  Many of osstest's tests do this.
> 
> 2. host kernel: Simply pass the dom0 kernel *and initramfs* as the
>     kernel image to the guest.  This works if the kernel has the right
>     modules for the guest storage, which it can easily do.  On x86 an
>     amd64 kernel can run an i386 userland.
> 
> 3. pvgrub.

Thanks for the explanation. How do you select it in the Osstest today?

Is it a option for the debian installer or you do it manually as part
of your install script?
>> Note that we do support EDK2 at least on Arm64. It would be nice to get
>> some tests for it in Osstest in the future.
> 
> Is this the same as "EADK" ?  I'm afraid I don't follow...

Sorry, I should have been more precise. I meant that we are able to boot 
a Arm guest using UEFI as we added support in EDK2 (I think in Xen we 
use the term ovmf).

When using EFI, the guest can boot exactly the same way as it would on 
baremetal. The toolstack is just loading the firmware in the guest memory.

IIRC we have already regular EFI testing on x86 in Osstest. I am 
thinking to extend them to Arm at some point.

> 
>>> I'm not aware of any ticket or bug about this.
>>
>> It might be worth creating one then.
> 
> Where should I do that ?  I guess I mean, in which bugtracker ?

 From the comment in the code, I would assume this is a bug/enhancement 
against the Debian installer. But I may have misundertood it.

Cheers,

-- 
Julien Grall


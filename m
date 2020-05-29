Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3041E7668
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 09:15:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeZCt-0004YY-5K; Fri, 29 May 2020 07:13:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mKAR=7L=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jeZCr-0004YT-H0
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 07:13:29 +0000
X-Inumbo-ID: e50bd01c-a17b-11ea-9947-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e50bd01c-a17b-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 07:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9BfMUNsA5Hr7jzdeY81E1fcOyOfgkOlgUqotF7hKDdw=; b=PIc6KJxTJcJyf3dnhRyoAsUkPW
 DbSTjaa8YlCvA1l9/ymIYNTazyhc/yV+E8F79OhKpdm/Oj7OVv4xuJyp8gcLh04A96VByluvq5Gz/
 KgZZjStrAsXz+LcrpYFS9DNJlQZjL//oWfdmEKPo3OrgiizOndOrOMizSqmYsAGI1X5s=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeZCp-0004dR-BS; Fri, 29 May 2020 07:13:27 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeZCp-00004v-5K; Fri, 29 May 2020 07:13:27 +0000
Subject: Re: [OSSTEST PATCH 22/38] buster: Extend guest bootloader workaround
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
 <20200519190230.29519-23-ian.jackson@eu.citrix.com>
 <7747c676-f9da-cb97-bd93-78dc13138d03@xen.org>
 <24261.17724.382954.918761@mariner.uk.xensource.com>
 <e4e7e515-587a-ad81-c9b7-b7cfa69108be@xen.org>
 <24271.53336.125796.634580@mariner.uk.xensource.com>
 <d4fc0391-9f40-86ad-f304-70bb0cd73e9b@xen.org>
 <24271.56227.367257.277033@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1b9dc551-48f1-1ec0-939b-63c46428fd89@xen.org>
Date: Fri, 29 May 2020 08:13:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <24271.56227.367257.277033@mariner.uk.xensource.com>
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

On 28/05/2020 16:41, Ian Jackson wrote:
> Julien Grall writes ("Re: [OSSTEST PATCH 22/38] buster: Extend guest bootloader workaround"):
>> On 28/05/2020 15:53, Ian Jackson wrote:
>>> It's Complicated.  There are several options, but the usual ones are:
>>>
>>> 1. pygrub: Install some version of grub, which generates
>>>      /boot/grub.cfg.  It doesn't matter very much which version of grub
>>>      because grub.cfg is read by pygrub in dom0 and that fishes out the
>>>      kernel and initrd.  Many of osstest's tests do this.
>>>
>>> 2. host kernel: Simply pass the dom0 kernel *and initramfs* as the
>>>      kernel image to the guest.  This works if the kernel has the right
>>>      modules for the guest storage, which it can easily do.  On x86 an
>>>      amd64 kernel can run an i386 userland.
>>>
>>> 3. pvgrub.
>>
>> Thanks for the explanation. How do you select it in the Osstest today?
> 
> I think osstest does all three (not very sure about (2).  Installs
> made with the Debian xen-tools package tend to do (2) by default.
> Installs made with d-i can do (2) or (3).
> 
>>> Is this the same as "EADK" ?  I'm afraid I don't follow...
>>
>> Sorry, I should have been more precise. I meant that we are able to boot
>> a Arm guest using UEFI as we added support in EDK2 (I think in Xen we
>> use the term ovmf).
> 
> Right.
> 
>> When using EFI, the guest can boot exactly the same way as it would on
>> baremetal. The toolstack is just loading the firmware in the guest memory.
>>
>> IIRC we have already regular EFI testing on x86 in Osstest. I am
>> thinking to extend them to Arm at some point.
> 
> Our arm64 boxes are all booting via UEFI right now.
> 
> We have to do a different bodge to load xen.efi rather than grub;
> osstest makes a xen.cfg.  That bodge is extended to buster by
> 
>    Subject: [OSSTEST PATCH 34/38] buster: grub, arm64: extend
>        chainloading workaround

We should also be able to use EFI in the guest directly as well :).

> 
>>> Where should I do that ?  I guess I mean, in which bugtracker ?
>>
>>   From the comment in the code, I would assume this is a bug/enhancement
>> against the Debian installer. But I may have misundertood it.
> 
> Oh I see.  I think amybe the problem was the lack of grub support.  Is
> that all sorted in current Debian unstable/testing ?  If so it may
> well all come out in the wash.

I haven't tried a recent Debian installer on Xen on Arm. I will have a 
try and see what it installs now.

Cheers,

-- 
Julien Grall


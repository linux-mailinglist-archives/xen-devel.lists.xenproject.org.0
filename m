Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8711C1183
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 13:32:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUTtq-0008V6-CL; Fri, 01 May 2020 11:32:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7FD=6P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jUTtp-0008V1-86
 for xen-devel@lists.xen.org; Fri, 01 May 2020 11:32:09 +0000
X-Inumbo-ID: 62b61025-8b9f-11ea-9afe-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62b61025-8b9f-11ea-9afe-12813bfff9fa;
 Fri, 01 May 2020 11:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z/kJ02TphEIrJYC8kWhtpkm1F9rG2aDTeebBXI2o5dc=; b=RGH4tONqavx0umd9qbvOEvFH8h
 d+82M5Ln9r6joFZgFYKWuE8WZVsce8oqLlVVGDP7uXUGi4bMGuDJl2n4PeMsIY3KtHhAw97AjUT14
 FUdJbFvQ/6TwRQMT4oo77/YT4PvTBSsHMZKgT8yxX4x/gBFTJm1EWizUVWNcy//K9j8U=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jUTtn-0008I0-DI; Fri, 01 May 2020 11:32:07 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jUTtn-0001bc-6R; Fri, 01 May 2020 11:32:07 +0000
Subject: Re: Question...
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Samuel P. Felton - GPT LLC" <sam.felton@glacier-peak.net>
References: <f017c46e427a45ecab00c1c59413658c@glacier-peak.net>
 <907FA58B-240E-45E6-B452-9094531F715E@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a8000286-4add-5428-ba4e-66105aaeabff@xen.org>
Date: Fri, 1 May 2020 12:32:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <907FA58B-240E-45E6-B452-9094531F715E@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 01/05/2020 10:52, Bertrand Marquis wrote:
> Hi Samuel,
> 
>> On 1 May 2020, at 06:59, Samuel P. Felton - GPT LLC <sam.felton@glacier-peak.net> wrote:
>>
>> So, I’m trying to get a Xen Dom0 and DomU, both running Ubuntu 20.04 LTS up on our brand-new Gigabyte ThunderX2 ARM64 box. I can get Ubuntu up and running, but after installing the Xen bits, it dies after the UEFI layer launches GRUB. I haven’t been able to get any logfiles because it doesn’t get that far. Nothing shows up on the serial port log either – it just hangs.

IIUC what you wrote, you don't see any prompt from GRUB. Am I correct?

>>
>> Has anyone over there been trying to get a similar setup running? Am I out to lunch for trying this, or is there something I’m missing? Any help at all would be appreciated.
> 
> I am currently porting Xen on an N1SDP arm board which is also using a EDK2/grub setup and I manage to start xen from grub and then start dom0 providing a DTB.
> 
> My grub configuration looks like this:
> menuentry 'xen' {
>      xen_hypervisor $prefix/xen.efi loglvl=all guest_loglvl=all console=dtuart dtuart=serial0 dom0_mem=1G
>      xen_module $prefix/Image console=hvc0 efi=noruntime rw root=/dev/sda1 rootwait
>      devicetree $prefix/n1sdp.dtb
> }

Depending on your GRUB configuration, this may not work. For older GRUB, 
you will want to use chainloading (see [1]).

I haven't used Thunder-X 2 yet, only the previous version. Both version 
are shipped with ACPI and is the preferred way to boot. You should be 
able to boot Xen using ACPI, but it is not yet in feature parity with DT.

So I would recommend to use DT if Thunder-X 2 provide one. If you still 
want to have a try with ACPI, then you will need to build Xen with 
CONFIG_ACPI=y.

Additionally, Thunder-X 2 is using GICv3 ITS. You will need to build Xen 
with CONFIG_GICV3_ITS=y.

Both options can only be selectable when using the expert mode. In order 
to access it you have to add XEN_CONFIG_EXPERT=y on *all* your make 
command line.

I hope this helps.

> 
> Could you share your grub configuration ?
> 
> Bertrand
> 
>>
>> If this doesn’t work, I’m going to have to go to FreeBSD and Bhyve because I know someone who has that working. I’d rather use Linux than BSD for this application, there are more drivers supporting this hardaware.
>>
>> Thanks,
>> ~Sam


[1] https://wiki.xenproject.org/wiki/Xen_EFI

-- 
Julien Grall


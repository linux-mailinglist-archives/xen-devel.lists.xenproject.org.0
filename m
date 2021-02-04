Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B81630ECA8
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 07:46:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81160.149420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7YP5-0005JI-Kl; Thu, 04 Feb 2021 06:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81160.149420; Thu, 04 Feb 2021 06:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7YP5-0005It-Ha; Thu, 04 Feb 2021 06:46:11 +0000
Received: by outflank-mailman (input) for mailman id 81160;
 Thu, 04 Feb 2021 06:46:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKvr=HG=unikie.com=jukka.kaartinen@srs-us1.protection.inumbo.net>)
 id 1l7YP3-0005Im-8x
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 06:46:09 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0e130ba-8be3-4237-b0d8-18064abee8cd;
 Thu, 04 Feb 2021 06:46:08 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id a12so2987288lfb.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Feb 2021 22:46:08 -0800 (PST)
Received: from [192.168.1.76] (91-153-193-91.elisa-laajakaista.fi.
 [91.153.193.91])
 by smtp.gmail.com with ESMTPSA id a30sm531644ljq.96.2021.02.03.22.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 22:46:06 -0800 (PST)
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
X-Inumbo-ID: b0e130ba-8be3-4237-b0d8-18064abee8cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V+d1VBMMtSg8eoCFcrTHC37S2rL+yPLwXHMCT1l+IUs=;
        b=s4NJQhLMLKe5berQPXdQY6rBH0udY5oIxq47AlLicWTh68nNa6nD+/Dgh0BEofEqz3
         2/hpjV89mxj30vt7W9dnibJ29lv0JQsc7qskQnl3BcvJj/1z3STBS5EBOMqamIh9f3Uk
         Zmk/i0q6UKKxYLnara8SDO6F1WdeBhwzYWz4jHbJW3sdfCgXHkROQZ10e+BeCspzeBV4
         SUlxEtk6uYTl0cyYCHa+6lQH99Pp3wugpwjIMUweZyfhNYTqBv65oOqmBaTHAy3VgC7b
         6Jl1YH4XwwgSfN1C7uTLB5iStD+tFaW3LluIGVNUrw26wku0ZpxstigKyIZSRn3VV6ga
         jJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V+d1VBMMtSg8eoCFcrTHC37S2rL+yPLwXHMCT1l+IUs=;
        b=jkTc1RVJV/BnSJwHT85e/MDmFt6a6TR4VHKytjVCrcrTrekqeldRNUzADyn9FdwkM1
         UmZQNgPlWrSdvQF2oUq2lmByOFv+LzZAES18taIMfIQN8OAuArX+zEAnRKElyiJStA42
         DB6JyaCpgn0iL/DYvKWS1MrQxD6wlVdgx876Jk0I3hED2910FivoNOlc6OL1hE7dsvCx
         LUYFMeubBX+IV9LVRExtMoOjyX4Pt1wyyZzn+jOdhhK3j1bnIDSO113dLVe8/aced43V
         1NOWSBdAMLsf0iJ/6EfHNe9YPOlOFcI+7Xv0gwlMLvQfS8ww8lOgcfe+J6iW7IXQMk4B
         Tdcg==
X-Gm-Message-State: AOAM531mOorzHNnie7aiPvyerKbt8w0lmXcgpMq/wfeFcz5j5Eq+43bw
	bU/3zp4lXVZ8w8vPUgO+QF/q4g==
X-Google-Smtp-Source: ABdhPJyTbHkj2YupoWcyp/TU3DNaYCAE11euVEFW6evIc9dYm2uUlxa05LG0/B2oVMwIwTmFHuFhfQ==
X-Received: by 2002:ac2:4569:: with SMTP id k9mr3637799lfm.461.1612421167261;
        Wed, 03 Feb 2021 22:46:07 -0800 (PST)
Subject: Re: Question about xen and Rasp 4B
To: Elliott Mitchell <ehem+xen@m5p.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Roman Shaposhnik <roman@zededa.com>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com>
 <alpine.DEB.2.21.2101261149210.2568@sstabellini-ThinkPad-T480s>
 <CAFnJQOpgRM-3_aZsnv36w+aQV=gMcBA18ZEw_-man7zmYb4O4Q@mail.gmail.com>
 <5a33e663-4a6d-6247-769a-8f14db4810f2@xen.org>
 <b9247831-335a-f791-1664-abed6b400a42@unikie.com>
 <CAMmSBy-54qtu_oVVT=KB8GeKP0SW0uK+4wQ_LooHE0y_MZKJQg@mail.gmail.com>
 <3ec2b0cb-3685-384e-94df-28eaf8b57c42@unikie.com>
 <alpine.DEB.2.21.2102021552380.29047@sstabellini-ThinkPad-T480s>
 <3c98d8d0-ca4e-b177-1e2b-5f3eb454722d@unikie.com>
 <alpine.DEB.2.21.2102031249090.29047@sstabellini-ThinkPad-T480s>
 <YBsfzZ6fI40bXo7/@mattapan.m5p.com>
From: Jukka Kaartinen <jukka.kaartinen@unikie.com>
Message-ID: <e4a25631-61aa-bf31-a50e-c87d69a0888d@unikie.com>
Date: Thu, 4 Feb 2021 08:46:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YBsfzZ6fI40bXo7/@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4.2.2021 0.12, Elliott Mitchell wrote:
> On Wed, Feb 03, 2021 at 12:55:40PM -0800, Stefano Stabellini wrote:
>> On Wed, 3 Feb 2021, Jukka Kaartinen wrote:
>>> On 3.2.2021 2.18, Stefano Stabellini wrote:
>>>> How are you configuring and installing the kernel?
>>>>
>>>> make bcm2711_defconfig
>>>> make Image.gz
>>>> make modules_install
>>>>
>>>> ?
>>>>
>>>> The device tree is the one from the rpi-5.9.y build? How are you loading
>>>> the kernel and device tree with uboot? Do you have any interesting
>>>> changes to config.txt?
>>>>
>>>> I am asking because I cannot get to the point of reproducing what you
>>>> are seeing: I can boot my rpi-5.9.y kernel on recent Xen but I cannot
>>>> get any graphics output on my screen. (The serial works.) I am using the
>>>> default Ubuntu Desktop rpi-install target as rootfs and uboot master.
>>>>
>>>
>>> This is what I do:
>>>
>>> make bcm2711_defconfig
>>> cat "xen_additions" >> .config
>>> make Image  modules dtbs
>>>
>>> make INSTALL_MOD_PATH=rootfs modules_install
>>> depmod -a
>>>
>>> cp arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb boot/
>>> cp arch/arm64/boot/dts/overlays/*.dtbo boot/overlays/
>>
>> Thanks for the detailed instructions. This helps a lot. I saw below in
>> boot2.source that you are using ${fdt_addr} as DTB source (instead of
>> loading one), which means you are using the DTB as provided by U-Boot at
>> runtime, instead of loading your own file.
>>
>> With these two copies, I take you meant to update the first partition on
>> the SD card, the one where config.txt lives, right? So that Xen is
>> getting the DTB and overlays from the rpi-5.9.y kernel tree but passed
>> down by the RPi loader and U-Boot?
>>
>> I think the DTB must be the issue as I wasn't applying any overlays
>> before. I ran a test to use the DTB and overlay from U-Boot but maybe I
>> haven't updated them properly because I still don't see any output.
> 
> Seeing no graphics output from U-Boot is okay.  If the device-tree files
> get sufficiently updated you can end up with no output from U-Boot, but
> will get output once the Linux kernel's driver is operational (I've seen
> this occur).
> 
> The most important part is having a HDMI display plugged in during the
> early boot stages.  Unless the bootloader sees the display the output
> won't get initialized and the Linux driver doesn't handle that.
> 
> 
>>> dtoverlay=vc4-fkms-v3d,cma-64
> 
> This is odd.  My understanding is this is appropriate for RP3, but not
> RP4.  For RP4 you can have "dtoverlay=disable-vc4" and still get graphics
> output (hmm, I'm starting to think I need to double-check this...).
Without the overlay GPU driver (v3d) was not probed. And you need to use 
the fakekms.


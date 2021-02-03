Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F70B30D41D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 08:36:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80828.148085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7CiO-0002Y3-DJ; Wed, 03 Feb 2021 07:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80828.148085; Wed, 03 Feb 2021 07:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7CiO-0002Xe-9o; Wed, 03 Feb 2021 07:36:40 +0000
Received: by outflank-mailman (input) for mailman id 80828;
 Wed, 03 Feb 2021 07:36:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q5cB=HF=unikie.com=jukka.kaartinen@srs-us1.protection.inumbo.net>)
 id 1l7CiM-0002XZ-SX
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 07:36:39 +0000
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 407e0e55-af34-4505-aa8a-0e3b56681787;
 Wed, 03 Feb 2021 07:36:37 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i187so31882010lfd.4
 for <xen-devel@lists.xenproject.org>; Tue, 02 Feb 2021 23:36:36 -0800 (PST)
Received: from [192.168.1.76] (91-153-193-91.elisa-laajakaista.fi.
 [91.153.193.91])
 by smtp.gmail.com with ESMTPSA id l11sm153547lfp.284.2021.02.02.23.36.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 23:36:35 -0800 (PST)
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
X-Inumbo-ID: 407e0e55-af34-4505-aa8a-0e3b56681787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HCN6VQ/749BQG6W/up6baxrR4i/W7HwLUnGJQCtdOZA=;
        b=Y3A1X2/LAqnsvxA6RWErdys8F9vg1oaW+aCKbgj2kikVshnLpk9Pvxk0w7zFIcTGcW
         zSJsXVW040HIELEDM4oskANa3KFmhTL/Zg7N+TGGzuGQs35hixTy0QmXAKovQVG9f2WJ
         Iq63h+p8QjWYmi0OfslCFeh2ZvAPg7nEtl9rmGRApsNlVIDnJ+yOkN4qb3BLjQB1VddN
         RPonCnxlOtvaQ5KFNqw77p91+UbdZnxyFkfCwr/y+UNwX3BqBA51mZOSfhYEsJdd013g
         aVcdrMJzVQ+Yblkqw5tYa67AYJorAsHpCGd1/zyahnjycuE5PpFkr3Co81kc4t5mH/AD
         qh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HCN6VQ/749BQG6W/up6baxrR4i/W7HwLUnGJQCtdOZA=;
        b=rAer97/eFAEnuevMfPx5wShdw3DybbGPwbD73qzVgrfxtILjdghAXJABfpv/L9UmTQ
         S5z1fkB2lOAlQpAEBDagzKU0AjRSNvob+zZZtRGZzfdJNNhjz6WzHKJkhxh06uV5OLUf
         8D29vfg39xENj6c/VZtTjz4SZ1Fp1VVuTAptFByTKxblu73G8XytnHEKNmobhfoaOm6f
         2rsbYZTsD85kmLvNOHtJQnPLE6FpJRbLGFbLRwmFxZW1yh/EXGeplmrXor5InM14HKm6
         PufyTAJOsT5batI3YC276pBCocNmPejTZ1CASF/fnP8kIVpBYh40ulkyGsW+/Sn4r+EG
         vwVQ==
X-Gm-Message-State: AOAM531TgP5lQPq2T8CZA7956k1Zz3VtQYZJYv833MDpha9SH59RcIfg
	5H26Xw78uARNlOLt1TmFf5sPwA==
X-Google-Smtp-Source: ABdhPJzNRyaezBYMmqh02vurmHfjl1ZtPCiUGPt+1W31WxMfi2Pe/+G4BAy2w3vDlYtQqFLlZDzabg==
X-Received: by 2002:ac2:5382:: with SMTP id g2mr1051870lfh.331.1612337795872;
        Tue, 02 Feb 2021 23:36:35 -0800 (PST)
Subject: Re: Question about xen and Rasp 4B
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Roman Shaposhnik <roman@zededa.com>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com>
 <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s>
 <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com>
 <alpine.DEB.2.21.2101251646470.20638@sstabellini-ThinkPad-T480s>
 <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com>
 <alpine.DEB.2.21.2101261149210.2568@sstabellini-ThinkPad-T480s>
 <CAFnJQOpgRM-3_aZsnv36w+aQV=gMcBA18ZEw_-man7zmYb4O4Q@mail.gmail.com>
 <5a33e663-4a6d-6247-769a-8f14db4810f2@xen.org>
 <b9247831-335a-f791-1664-abed6b400a42@unikie.com>
 <CAMmSBy-54qtu_oVVT=KB8GeKP0SW0uK+4wQ_LooHE0y_MZKJQg@mail.gmail.com>
 <3ec2b0cb-3685-384e-94df-28eaf8b57c42@unikie.com>
 <alpine.DEB.2.21.2102021552380.29047@sstabellini-ThinkPad-T480s>
From: Jukka Kaartinen <jukka.kaartinen@unikie.com>
Message-ID: <3c98d8d0-ca4e-b177-1e2b-5f3eb454722d@unikie.com>
Date: Wed, 3 Feb 2021 09:36:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102021552380.29047@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3.2.2021 2.18, Stefano Stabellini wrote:
> On Tue, 2 Feb 2021, Jukka Kaartinen wrote:
>> Hi Roman,
>>
>>>>>
>>>> Good catch.
>>>> GPU works now and I can start X! Thanks! I was also able to create domU
>>>> that runs Raspian OS.
>>>
>>> This is very interesting that you were able to achieve that - congrats!
>>>
>>> Now, sorry to be a bit dense -- but since this thread went into all
>>> sorts of interesting
>>> directions all at once -- I just have a very particular question: what is
>>> exact
>>> combination of versions of Xen, Linux kernel and a set of patches that went
>>> on top that allowed you to do that? I'd love to obviously see it
>>> productized in Xen
>>> upstream, but for now -- I'd love to make available to Project EVE/Xen
>>> community
>>> since there seems to be a few folks interested in EVE/Xen combo being able
>>> to
>>> do that.
>>
>> I have tried Xen Release 4.14.0, 4.14.1 and master (from week 4, 2021).
>>
>> Kernel rpi-5.9.y and rpi-5.10.y branches from
>> https://github.com/raspberrypi/linux
>>
>> and
>>
>> U-boot (master).
>>
>> For the GPU to work it was enough to disable swiotlb from the kernel(s) as
>> suggested in this thread.
> 
> How are you configuring and installing the kernel?
> 
> make bcm2711_defconfig
> make Image.gz
> make modules_install
> 
> ?
> 
> The device tree is the one from the rpi-5.9.y build? How are you loading
> the kernel and device tree with uboot? Do you have any interesting
> changes to config.txt?
> 
> I am asking because I cannot get to the point of reproducing what you
> are seeing: I can boot my rpi-5.9.y kernel on recent Xen but I cannot
> get any graphics output on my screen. (The serial works.) I am using the
> default Ubuntu Desktop rpi-install target as rootfs and uboot master.
> 

This is what I do:

make bcm2711_defconfig
cat "xen_additions" >> .config
make Image  modules dtbs

make INSTALL_MOD_PATH=rootfs modules_install
depmod -a

cp arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb boot/
cp arch/arm64/boot/dts/overlays/*.dtbo boot/overlays/

config.txt:

[pi4]
max_framebuffers=2
enable_uart=1
arm_freq=1500
force_turbo=1

[all]
arm_64bit=1
kernel=u-boot.bin

start_file=start4.elf
fixup_file=fixup4.dat

# Enable the audio output, I2C and SPI interfaces on the GPIO header
dtparam=audio=on
dtparam=i2c_arm=on
dtparam=spi=on

# Enable the FKMS ("Fake" KMS) graphics overlay, enable the camera firmware
# and allocate 128Mb to the GPU memory
dtoverlay=vc4-fkms-v3d,cma-64
gpu_mem=128

# Comment out the following line if the edges of the desktop appear outside
# the edges of your display
disable_overscan=1


boot.source:
setenv serverip 10.42.0.1
setenv ipaddr 10.42.0.231
tftpb 0xC00000 boot2.scr
source 0xC00000

boot2.source:
tftpb 0xE00000 xen
tftpb 0x1000000 Image
setenv lin_size $filesize

fdt addr ${fdt_addr}
fdt resize 1024

fdt set /chosen xen,xen-bootargs "console=dtuart dtuart=serial0 
sync_console dom0_mem=1024M dom0_max_vcpus=1 bootscrub=0 vwfi=native 
sched=credit2"

fdt mknod /chosen dom0

# These will break the default framebuffer@3e2fe000 that
# is the same chosen -node.
#fdt set /chosen/dom0 \#address-cells <0x2>
#fdt set /chosen/dom0 \#size-cells <0x2>

fdt set /chosen/dom0 compatible "xen,linux-zimage" "xen,multiboot-module"
fdt set /chosen/dom0 reg <0x1000000 0x${lin_size}>

fdt set /chosen xen,dom0-bootargs "dwc_otg.lpm_enable=0 console=hvc0 
earlycon=xen earlyprintk=xen root=/dev/sda4 elevator=deadline rootwait 
fixrtc quiet splash"

setenv fdt_high 0xffffffffffffffff

fdt print /chosen

#xen
booti 0xE00000 - ${fdt_addr}


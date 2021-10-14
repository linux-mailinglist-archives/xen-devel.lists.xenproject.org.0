Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C1542E46C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 00:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209609.366112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb9Xu-0007Bw-T5; Thu, 14 Oct 2021 22:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209609.366112; Thu, 14 Oct 2021 22:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb9Xu-000799-P9; Thu, 14 Oct 2021 22:49:54 +0000
Received: by outflank-mailman (input) for mailman id 209609;
 Thu, 14 Oct 2021 22:49:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGop=PC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mb9Xt-000793-0J
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 22:49:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a3245e0-2d41-11ec-8210-12813bfff9fa;
 Thu, 14 Oct 2021 22:49:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BEF060FC3;
 Thu, 14 Oct 2021 22:49:50 +0000 (UTC)
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
X-Inumbo-ID: 0a3245e0-2d41-11ec-8210-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634251790;
	bh=/0jjFKANFU393DZmQmirwpayih0KQPPBnBUF75m4D6s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EE4LAmSPAq9C9u2lzPZ6fsZeTMdsS6BuGmn7iLlv4U/vlYrDosK4p/qw3m09sATBp
	 AkJlC568WpUK6bSHTJYcWbB1TRcQSgGyIrqkVJo+pRn8iBwrK8Bm9yBBGThLXgKb0g
	 6GoETHMO3HNR56bAgZ6vBRpo4PCaA5t2QBW0Sg+0ozsEN+2fj35yqXIsp0P80qHw5e
	 qx4CJayNu6Kpbs0wwDwwqvWVOUEi4xhexUzj9X/1KlugNqt730Stfoywn2r7e8pjAg
	 mk21jDYORoK3XWffUo3uxl6oR/CrP/RsWMrfvrSWoGy1UpPhPBvZfCzHCmQrxcU1Lu
	 u2qs//+B7JjaQ==
Date: Thu, 14 Oct 2021 15:49:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Sai Kiran Kumar Reddy Y <ysaikiran1997@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>, 
    xen-devel@lists.xenproject.org, kannan@cimware.in
Subject: Re: Xen Booting Problem on ARM Machine
In-Reply-To: <CAEsO4uxo_A4pEwP6dHK8kvYtKcbSr-ewqX1v-KLsEkyHNLFyUA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2110141536090.9408@sstabellini-ThinkPad-T480s>
References: <33C29853-D896-4E4E-91D3-4D2FA89A9B91@hxcore.ol> <eb5fd47b-6bc9-2eec-7f46-9ab9a42c9f1f@xen.org> <CAEsO4uzsCnsTtTmYHAT4NN6=girCY2NHHdAHbH6GG33D7jwe_A@mail.gmail.com> <alpine.DEB.2.21.2109131437030.10523@sstabellini-ThinkPad-T480s>
 <CAEsO4uwpiDO2QoqLRTOxpsYM9YSPAsbX0P=gagdEy21pk1VsPQ@mail.gmail.com> <alpine.DEB.2.21.2109141825330.21985@sstabellini-ThinkPad-T480s> <CAEsO4uyjNs97Cx8n2owDk4kKTVCycji377pm7aXHcPWzeszUTw@mail.gmail.com> <alpine.DEB.2.21.2109301942370.3209@sstabellini-ThinkPad-T480s>
 <CAEsO4ux_AqXBeCtbwnPAdnBnVYHTur_2EfcZBTuN4QKCq4ko8Q@mail.gmail.com> <alpine.DEB.2.21.2110131711280.9408@sstabellini-ThinkPad-T480s> <CAEsO4uxo_A4pEwP6dHK8kvYtKcbSr-ewqX1v-KLsEkyHNLFyUA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1095502565-1634251193=:9408"
Content-ID: <alpine.DEB.2.21.2110141540560.9408@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1095502565-1634251193=:9408
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110141540561.9408@sstabellini-ThinkPad-T480s>

On Thu, 14 Oct 2021, Sai Kiran Kumar Reddy Y wrote:
> On Thu, Oct 14, 2021 at 5:45 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       On Wed, 13 Oct 2021, Sai Kiran Kumar Reddy Y wrote:
>       > On Fri, Oct 1, 2021 at 8:17 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       >       Yes there are other ways but without serial is going to be difficult
>       >       because you are not going to see anything until everything works.
>       >
>       >       How do you boot Xen and Dom0 exactly from EDK2? Are you using GRUB or
>       >       loading Xen directly from the EDK2 prompt? Please provide as many
>       >       details as possible so that I might be able to spot any errors.
>       >
>       > I am using GRUB to load Xen. In the GRUB menu, I see two options. 
>       > Option 1: Debian 11 with latest Linux Kernel
>       > Option 2: Debian 11(with Xen hypervisor) with latest Kernel
>       >  
>       >       Can you provide the Device Tree you are using? If you are not passing
>       >       any Device Tree  binary explicitely, then it might be passed
>       >       automatically from EDK2 to Linux/Xen. In that case, just boot from Linux
>       >       then do the following to retrieve the Device Tree:
>       >
>       >       dtc -I fs -O dts /proc/device-tree > host.dts
>       >
>       >       Then please attach host.dts to this email thread.
>       >
>       > Yeah, you are right. It looks like LInux is booting from ACPI. In the bootloader menu, "Automatic ACPI configuration" is
>       disabled. So, I
>       > thought that Linux may be booting from Device Tree. I have tried the "dtc" command you mentioned. But it looks like there's
>       no device-tree
>       > under "/proc". I also tried to get DT info, from "/sys/firmware/devicetree/base" . But, there's no info. under devicetree
>       folder. I am not
>       > quite sure how to get the DT info, if the Linux is booting from ACPI. I am attaching .dsl files, that contain the acpi info.
> 
>       OK, so it is pretty clear that even if "Automatic ACPI configuration" is
>       disabled, it is still booting with ACPI.
> 
> 
>       >       Also for your information it looks like Linux actually booted from ACPI,
>       >       not from Device Tree, as you can see from all the "ACPI" messages in the
>       >       kernel logs.
>       >
>       >       If you need to boot from ACPI, then you need to enable ACPI support in
>       >       Xen, which is disabled by default. You can do that using make
>       >       menuconfig.
>       >
>       > In the make menuconfig of Xen, I do not see any option to enable ACPI.  
> 
>       You definitely need to enable ACPI support in Xen, if you are booting
>       from ACPI, otherwise nothing is going to work.
> 
>       On the latest staging (https://gitlab.com/xen-project/xen) you can
>       enable ACPI as follows:
> 
> 
>       # export CROSS_COMPILE=/path/to/cross-compiler
>       # export XEN_TARGET_ARCH=arm64
>       # cd xen.git/xen
>       # make menuconfig
>       #   --> Configure UNSUPPORTED features
>       #   --> Architecture Features --> ACPI
>       # make
> 
> 
> Hi
> 
> I got the code from Gitlab and installed it, enabling ACPI support in Xen. As I reboot the system, I am able to see 2 options like before. 
> Option 1: Debian with latest kernel
> Option 2 : Debian with Xen
> 
> I have selected Option 2. I did not see any bootinfo membanks error. However, there is the following error in GRUB(just for a fraction of a
> second). 
> 
> "Using modules provided by boot loader in FDT
>   Xen 4.16-unstable (c/s Wed Oct 13 13 13:28:43 2021 -0700 git:4cfab4425d) EFI Loader
>   Couldn't obtain the File System Protocol Interface: ErrCode: 0x8000000000000002"
> 
> I have enabled earlyprintk. I do not see any messages in the Serial. There seems to be some problem with the gitlab version of Xen.

The error comes from xen/common/efi/boot.c:get_parent_handle

Xen is booted as EFI binary and it is trying to load other binaries
using the EFI File System Protocol Interface which is one of the EFI
Boot Services.

A wild guess is that somehow Grub is calling ExitBootServices, which
closes all Boot Services interfaces, before executing Xen. It should not
happen if Grub is executing Xen as EFI binary. I cannot explain how it
is possible. It looks like a bug in Grub.

Can you post the Grub config file that you are using?


Usually before Grub there is the proper EFI bootloader, tipically EDK2.
You should be able to boot Xen directly from the EFI bootloader too,
from its prompt, just by executing "xen". You need to place the xen
binary in the first FAT partition together with a xen.cfg config file as
follows:

---
options=console=com1 com1=115200 loglvl=all noreboot
kernel=vmlinuz-3.0.31-0.4-xen [domain 0 command line options]
ramdisk=initrd-3.0.31-0.4-xen
---

options is to specify the Xen command line.
kernel is to specify the Linux kernel to use and its command line.
ramdisk is to specify the Linux ramdisk.

Both kernel and ramdisk needs to be on the FAT partition too.


That way you skip Grub and you might be able to skip any related
problems with ExitBootServices.
--8323329-1095502565-1634251193=:9408--


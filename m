Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBC642CF77
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 02:16:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208941.365244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maoP7-000364-Qa; Thu, 14 Oct 2021 00:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208941.365244; Thu, 14 Oct 2021 00:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maoP7-00033r-NQ; Thu, 14 Oct 2021 00:15:25 +0000
Received: by outflank-mailman (input) for mailman id 208941;
 Thu, 14 Oct 2021 00:15:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGop=PC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1maoP5-00033l-JF
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 00:15:23 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1c37819-2c83-11ec-81a8-12813bfff9fa;
 Thu, 14 Oct 2021 00:15:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A87D960BD3;
 Thu, 14 Oct 2021 00:15:20 +0000 (UTC)
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
X-Inumbo-ID: d1c37819-2c83-11ec-81a8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634170521;
	bh=q/2rCXwVxItexwfdQYgpAXhHnpYqj8SipO3MuGQbEiA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=E6BRVkaa2u5Tfz9eSmrOSr6g/ZeKECXOhjqWsG6qjjpN/gw2aDrSMhWwmdSQV4tqI
	 QnBLN7Rux3Lvv6hPH1y2pOl3VX04Tyh1DyUlyNlTKC8RWtjcwhM+oX/qQpx99C7cn5
	 QH4HGmIgsJ4Lme5OpktFjzUttfqgyj7bH+AiDjFkTFgwN0eKZjUtyq9u9wNz30Bjwa
	 +U1YPZU7D3EW0REuza5Px7T0JhqjGaNVqEuOZXr4GDZ6UQHZRPJdhv7ly2dwB7yaXM
	 u/y2h6wIr9GSdCXEV2evOrrHx0zF7jJ/6Vu/hdJ7lqiPVEGLuHeagYX5Yw2RHUyXDG
	 5CuWHCl15AR5Q==
Date: Wed, 13 Oct 2021 17:15:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Sai Kiran Kumar Reddy Y <ysaikiran1997@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>, 
    xen-devel@lists.xenproject.org, kannan@cimware.in
Subject: Re: Xen Booting Problem on ARM Machine
In-Reply-To: <CAEsO4ux_AqXBeCtbwnPAdnBnVYHTur_2EfcZBTuN4QKCq4ko8Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2110131711280.9408@sstabellini-ThinkPad-T480s>
References: <33C29853-D896-4E4E-91D3-4D2FA89A9B91@hxcore.ol> <eb5fd47b-6bc9-2eec-7f46-9ab9a42c9f1f@xen.org> <CAEsO4uzsCnsTtTmYHAT4NN6=girCY2NHHdAHbH6GG33D7jwe_A@mail.gmail.com> <alpine.DEB.2.21.2109131437030.10523@sstabellini-ThinkPad-T480s>
 <CAEsO4uwpiDO2QoqLRTOxpsYM9YSPAsbX0P=gagdEy21pk1VsPQ@mail.gmail.com> <alpine.DEB.2.21.2109141825330.21985@sstabellini-ThinkPad-T480s> <CAEsO4uyjNs97Cx8n2owDk4kKTVCycji377pm7aXHcPWzeszUTw@mail.gmail.com> <alpine.DEB.2.21.2109301942370.3209@sstabellini-ThinkPad-T480s>
 <CAEsO4ux_AqXBeCtbwnPAdnBnVYHTur_2EfcZBTuN4QKCq4ko8Q@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1922990394-1634170520=:9408"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1922990394-1634170520=:9408
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 13 Oct 2021, Sai Kiran Kumar Reddy Y wrote:
> On Fri, Oct 1, 2021 at 8:17 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       Yes there are other ways but without serial is going to be difficult
>       because you are not going to see anything until everything works.
> 
>       How do you boot Xen and Dom0 exactly from EDK2? Are you using GRUB or
>       loading Xen directly from the EDK2 prompt? Please provide as many
>       details as possible so that I might be able to spot any errors.
> 
> I am using GRUB to load Xen. In the GRUB menu, I see two options. 
> Option 1: Debian 11 with latest Linux Kernel
> Option 2: Debian 11(with Xen hypervisor) with latest Kernel
>  
>       Can you provide the Device Tree you are using? If you are not passing
>       any Device Tree  binary explicitely, then it might be passed
>       automatically from EDK2 to Linux/Xen. In that case, just boot from Linux
>       then do the following to retrieve the Device Tree:
> 
>       dtc -I fs -O dts /proc/device-tree > host.dts
> 
>       Then please attach host.dts to this email thread.
> 
> Yeah, you are right. It looks like LInux is booting from ACPI. In the bootloader menu, "Automatic ACPI configuration" is disabled. So, I
> thought that Linux may be booting from Device Tree. I have tried the "dtc" command you mentioned. But it looks like there's no device-tree
> under "/proc". I also tried to get DT info, from "/sys/firmware/devicetree/base" . But, there's no info. under devicetree folder. I am not
> quite sure how to get the DT info, if the Linux is booting from ACPI. I am attaching .dsl files, that contain the acpi info.

OK, so it is pretty clear that even if "Automatic ACPI configuration" is
disabled, it is still booting with ACPI.


>       Also for your information it looks like Linux actually booted from ACPI,
>       not from Device Tree, as you can see from all the "ACPI" messages in the
>       kernel logs.
> 
>       If you need to boot from ACPI, then you need to enable ACPI support in
>       Xen, which is disabled by default. You can do that using make
>       menuconfig.
> 
> In the make menuconfig of Xen, I do not see any option to enable ACPI.  

You definitely need to enable ACPI support in Xen, if you are booting
from ACPI, otherwise nothing is going to work.

On the latest staging (https://gitlab.com/xen-project/xen) you can
enable ACPI as follows:


# export CROSS_COMPILE=/path/to/cross-compiler
# export XEN_TARGET_ARCH=arm64
# cd xen.git/xen
# make menuconfig
#   --> Configure UNSUPPORTED features
#   --> Architecture Features --> ACPI
# make


Cheers,

Stefano


>       On Thu, 30 Sep 2021, Sai Kiran Kumar Reddy Y wrote:
>       > Hi,
>       > Sorry about the delay. We have been trying to access the serial of the machine. Tried with couple of JTAG connectors. There's
>       still no
>       > debug messages on the serial. Is there any other way of figuring this out?
>       >
>       > On Wed, Sep 15, 2021, 7:02 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       >       Something is off. When you enabled earlyprintk in Xen, you should see
>       >       something like this at boot time:
>       >       https://marc.info/?l=xen-devel&m=158829968025334
>       >
>       >       All the Xen logs starting with "(XEN)" on the serial. Do you have access
>       >       to the serial of the machine? Without it, it is going to be hard to
>       >       debug.
>       >
>       >
>       >       On Tue, 14 Sep 2021, Sai Kiran Kumar Reddy Y wrote:
>       >       > In the folder "/var/log", there's a file called "xen", which is empty. As far as the boot logs are concerned, I don't
>       see any
>       >       debug
>       >       > messages related to xen. I am attaching the log files, "kern.txt" and "boot.txt"
>       >       >
>       >       > On Tue, Sep 14, 2021 at 3:08 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       >       >       On Mon, 13 Sep 2021, Sai Kiran Kumar Reddy Y wrote:
>       >       >       > On Fri, Sep 10, 2021 at 7:30 PM Julien Grall <julien@xen.org> wrote:
>       >       >       >
>       >       >       >
>       >       >       >       On 08/09/2021 11:43, Sai Kiran wrote:
>       >       >       >       > Hello,
>       >       >       >
>       >       >       >       Hi,
>       >       >       >
>       >       >       >       Thank you for the report. Moving the discussion back to xen-devel
>       >       >       >       because this looks like a potential issue in the UEFI stub in Xen.
>       >       >       >
>       >       >       >       > I have Xen-4.15.0 on an ARM Machine, with Debian 11 installed on it.
>       >       >       >
>       >       >       >       Would you be able to give more details on the Arm machine you are using?
>       >       >       >       Also, are you using ACPI or DT to boot?
>       >       >       >
>       >       >       >
>       >       >       >    Sai >> DT . ACPI configuration is disabled in Boot settings    
>       >       >       >
>       >       >       >       >  I
>       >       >       >       > am able to do “make world” and “make install”, after “./configure”, as
>       >       >       >       > specified in README file. When I reboot the system, I get the following
>       >       >       >       > message:
>       >       >       >       >
>       >       >       >       > Warning: All 128 bootinfo mem banks exhausted.
>       >       >       >       >
>       >       >       >       > Warning: All 128 bootinfo mem banks exhausted.
>       >       >       >
>       >       >       >       Hmmm... This means that you have more than 128 memory regions described
>       >       >       >       in the EFI memory map. That's quite a lot.
>       >       >       >
>       >       >       >       Although, this should be harmless as it means Xen will not use the extra
>       >       >       >       memory banks.
>       >       >       >
>       >       >       >       >
>       >       >       >       > Cannot exit boot services: ErrCode: 0x8000000000000002
>       >       >       >
>       >       >       >       This means EFI_INVALID_PARAMETER. We have code to retry because AFAICT
>       >       >       >       ExitBootServices() may sometime fails (I have CCed Jan may have more
>       >       >       >       idea what's happening).
>       >       >       >
>       >       >       >       Would you be able to provide more details on the UEFI firmware you are
>       >       >       >       using? Is it EDK2 or U-boot?
>       >       >       >
>       >       >       > Sai >>  EDK2 
>       >       >       >       Also, do you know if Linux is boot on the same system?
>       >       >       >
>       >       >       > Sai >> Yes 
>       >       >       >       However, AFAICT, the error message would not prevent Xen to continue
>       >       >       >       booting. So you may get stuck later in the boot process.
>       >       >       >
>       >       >       >       My suggestion would be to enable earlyprintk for your platform. You can
>       >       >       >       setup it up from the menuconfig in "Debugging Options".
>       >       >       >
>       >       >       > Sai >> Yes, I have enabled earlyprintk.
>       >       >       > I tried changing NR_MEM_BANKS(in xen/include/asm-arm/setup.h) value to 256, from 128. The error message is no
>       longer
>       >       seen,
>       >       >       but the device
>       >       >       > is stuck in the boot process.
>       >       >
>       >       >       Could you please post the boot logs now that you enabled earlyprintk?
>       >       >       Ideally not a camera picture but a textual copy/paste from the target
>       >       >       serial?
>       >       >
>       >       >       Earlyprintk is pretty verbose, we should be able to figure out where it
>       >       >       gets stuck.
>       >       >
>       >       >
>       >       >
>       >
>       >
>       >
> 
> 
> 
--8323329-1922990394-1634170520=:9408--


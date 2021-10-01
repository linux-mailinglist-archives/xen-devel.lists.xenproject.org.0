Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CC041E618
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 04:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200379.354906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW8ad-0007vt-AX; Fri, 01 Oct 2021 02:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200379.354906; Fri, 01 Oct 2021 02:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW8ad-0007tR-6H; Fri, 01 Oct 2021 02:47:59 +0000
Received: by outflank-mailman (input) for mailman id 200379;
 Fri, 01 Oct 2021 02:47:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSXX=OV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mW8ab-0007tL-Bt
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 02:47:57 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a183c22-fd24-4feb-8d41-684cea6150db;
 Fri, 01 Oct 2021 02:47:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0379F61350;
 Fri,  1 Oct 2021 02:47:54 +0000 (UTC)
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
X-Inumbo-ID: 3a183c22-fd24-4feb-8d41-684cea6150db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633056475;
	bh=T7VK3k+54wAwE84wO37+TlISG0mSpDmKNShcKJniDJw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cLJojt3tb+m07+8YjCGSw2+lfGO1OMFPccg8UlKvHCzmj3hWO3CKlZZvNM1R/h2We
	 vmoc9e3cI9YCzoeJ+455BZ5Wus2TIoeJCraetZNNWVc8j+16/lZXj/ecZ4ckOcjtbb
	 v4gIGeHGe09E6ZLinF/zOTDoAHqESNbmUs+eD19VkUu3tBVU1RqQGOdfLFv2gsURKR
	 DEWvPk0D7Xkmp7rxieVL3f5DFyHEu9gSnA7bbaRzffk4y2yElsXQN/PJXHuEH6H7vF
	 hh2Fn/sU1UQSGSEcCu5gy3j6GEG0H76D4NdCaa+aASeRyuCuB5CQKObTRyghCd/c41
	 qmJHvyxO6zlOA==
Date: Thu, 30 Sep 2021 19:47:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Sai Kiran Kumar Reddy Y <ysaikiran1997@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>, 
    xen-devel@lists.xenproject.org, kannan@cimware.in
Subject: Re: Xen Booting Problem on ARM Machine
In-Reply-To: <CAEsO4uyjNs97Cx8n2owDk4kKTVCycji377pm7aXHcPWzeszUTw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2109301942370.3209@sstabellini-ThinkPad-T480s>
References: <33C29853-D896-4E4E-91D3-4D2FA89A9B91@hxcore.ol> <eb5fd47b-6bc9-2eec-7f46-9ab9a42c9f1f@xen.org> <CAEsO4uzsCnsTtTmYHAT4NN6=girCY2NHHdAHbH6GG33D7jwe_A@mail.gmail.com> <alpine.DEB.2.21.2109131437030.10523@sstabellini-ThinkPad-T480s>
 <CAEsO4uwpiDO2QoqLRTOxpsYM9YSPAsbX0P=gagdEy21pk1VsPQ@mail.gmail.com> <alpine.DEB.2.21.2109141825330.21985@sstabellini-ThinkPad-T480s> <CAEsO4uyjNs97Cx8n2owDk4kKTVCycji377pm7aXHcPWzeszUTw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-445217707-1633056263=:3209"
Content-ID: <alpine.DEB.2.21.2109301944380.3209@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-445217707-1633056263=:3209
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109301944381.3209@sstabellini-ThinkPad-T480s>

Yes there are other ways but without serial is going to be difficult
because you are not going to see anything until everything works.

How do you boot Xen and Dom0 exactly from EDK2? Are you using GRUB or
loading Xen directly from the EDK2 prompt? Please provide as many
details as possible so that I might be able to spot any errors.

Can you provide the Device Tree you are using? If you are not passing
any Device Tree  binary explicitely, then it might be passed
automatically from EDK2 to Linux/Xen. In that case, just boot from Linux
then do the following to retrieve the Device Tree:

dtc -I fs -O dts /proc/device-tree > host.dts

Then please attach host.dts to this email thread.


Also for your information it looks like Linux actually booted from ACPI,
not from Device Tree, as you can see from all the "ACPI" messages in the
kernel logs.

If you need to boot from ACPI, then you need to enable ACPI support in
Xen, which is disabled by default. You can do that using make
menuconfig.


On Thu, 30 Sep 2021, Sai Kiran Kumar Reddy Y wrote:
> Hi,
> Sorry about the delay. We have been trying to access the serial of the machine. Tried with couple of JTAG connectors. There's still no
> debug messages on the serial. Is there any other way of figuring this out?
> 
> On Wed, Sep 15, 2021, 7:02 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       Something is off. When you enabled earlyprintk in Xen, you should see
>       something like this at boot time:
>       https://marc.info/?l=xen-devel&m=158829968025334
> 
>       All the Xen logs starting with "(XEN)" on the serial. Do you have access
>       to the serial of the machine? Without it, it is going to be hard to
>       debug.
> 
> 
>       On Tue, 14 Sep 2021, Sai Kiran Kumar Reddy Y wrote:
>       > In the folder "/var/log", there's a file called "xen", which is empty. As far as the boot logs are concerned, I don't see any
>       debug
>       > messages related to xen. I am attaching the log files, "kern.txt" and "boot.txt"
>       >
>       > On Tue, Sep 14, 2021 at 3:08 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
>       >       On Mon, 13 Sep 2021, Sai Kiran Kumar Reddy Y wrote:
>       >       > On Fri, Sep 10, 2021 at 7:30 PM Julien Grall <julien@xen.org> wrote:
>       >       >
>       >       >
>       >       >       On 08/09/2021 11:43, Sai Kiran wrote:
>       >       >       > Hello,
>       >       >
>       >       >       Hi,
>       >       >
>       >       >       Thank you for the report. Moving the discussion back to xen-devel
>       >       >       because this looks like a potential issue in the UEFI stub in Xen.
>       >       >
>       >       >       > I have Xen-4.15.0 on an ARM Machine, with Debian 11 installed on it.
>       >       >
>       >       >       Would you be able to give more details on the Arm machine you are using?
>       >       >       Also, are you using ACPI or DT to boot?
>       >       >
>       >       >
>       >       >    Sai >> DT . ACPI configuration is disabled in Boot settings    
>       >       >
>       >       >       >  I
>       >       >       > am able to do “make world” and “make install”, after “./configure”, as
>       >       >       > specified in README file. When I reboot the system, I get the following
>       >       >       > message:
>       >       >       >
>       >       >       > Warning: All 128 bootinfo mem banks exhausted.
>       >       >       >
>       >       >       > Warning: All 128 bootinfo mem banks exhausted.
>       >       >
>       >       >       Hmmm... This means that you have more than 128 memory regions described
>       >       >       in the EFI memory map. That's quite a lot.
>       >       >
>       >       >       Although, this should be harmless as it means Xen will not use the extra
>       >       >       memory banks.
>       >       >
>       >       >       >
>       >       >       > Cannot exit boot services: ErrCode: 0x8000000000000002
>       >       >
>       >       >       This means EFI_INVALID_PARAMETER. We have code to retry because AFAICT
>       >       >       ExitBootServices() may sometime fails (I have CCed Jan may have more
>       >       >       idea what's happening).
>       >       >
>       >       >       Would you be able to provide more details on the UEFI firmware you are
>       >       >       using? Is it EDK2 or U-boot?
>       >       >
>       >       > Sai >>  EDK2 
>       >       >       Also, do you know if Linux is boot on the same system?
>       >       >
>       >       > Sai >> Yes 
>       >       >       However, AFAICT, the error message would not prevent Xen to continue
>       >       >       booting. So you may get stuck later in the boot process.
>       >       >
>       >       >       My suggestion would be to enable earlyprintk for your platform. You can
>       >       >       setup it up from the menuconfig in "Debugging Options".
>       >       >
>       >       > Sai >> Yes, I have enabled earlyprintk.
>       >       > I tried changing NR_MEM_BANKS(in xen/include/asm-arm/setup.h) value to 256, from 128. The error message is no longer
>       seen,
>       >       but the device
>       >       > is stuck in the boot process.
>       >
>       >       Could you please post the boot logs now that you enabled earlyprintk?
>       >       Ideally not a camera picture but a textual copy/paste from the target
>       >       serial?
>       >
>       >       Earlyprintk is pretty verbose, we should be able to figure out where it
>       >       gets stuck.
>       >
>       >
>       >
> 
> 
> 
--8323329-445217707-1633056263=:3209--


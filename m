Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B370F28C672
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 02:41:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6046.15847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kS8Mm-0001Bi-Go; Tue, 13 Oct 2020 00:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6046.15847; Tue, 13 Oct 2020 00:40:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kS8Mm-0001BJ-DP; Tue, 13 Oct 2020 00:40:36 +0000
Received: by outflank-mailman (input) for mailman id 6046;
 Tue, 13 Oct 2020 00:40:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVX3=DU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kS8Mk-0001An-BW
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 00:40:34 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17f45ace-568a-4904-90b0-9fa9f4f31097;
 Tue, 13 Oct 2020 00:40:33 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B68521655;
 Tue, 13 Oct 2020 00:40:32 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hVX3=DU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kS8Mk-0001An-BW
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 00:40:34 +0000
X-Inumbo-ID: 17f45ace-568a-4904-90b0-9fa9f4f31097
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 17f45ace-568a-4904-90b0-9fa9f4f31097;
	Tue, 13 Oct 2020 00:40:33 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6B68521655;
	Tue, 13 Oct 2020 00:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602549632;
	bh=DcvpmSPD3amwYj0sKLgyCYgJqiHDDrWFFKw+/xE1sFM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Owf9KYTXxzN3Qtmk0YTw10GHvBeeJ46g24zG1QRaTwPouoLyYgSJcvLo9iv4lTX4B
	 gtiTR8mkFxNzcaEZT9FKoueVdYRVwaDys2b7+kgHArQwjfPf2eoMDbefdH19CyRwED
	 wylYyT9aSZ1SBDrUyND/8IIH7ctfRwQaIhjy59jw=
Date: Mon, 12 Oct 2020 17:40:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Trammell Hudson <hudson@trmm.net>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [xen-unstable-smoke test] 155612: regressions - FAIL
In-Reply-To: <01c8b669-d77e-75c4-7317-213e32eb2b73@xen.org>
Message-ID: <alpine.DEB.2.21.2010121731570.10386@sstabellini-ThinkPad-T480s>
References: <osstest-155612-mainreport@xen.org> <0d3766f0-a1a4-bc86-9372-79b1b65eae47@citrix.com> <l13ej-jSgj1tw6_awkBjUgauf1oh4k3PIQavoWsHdhhiH0qLc1hI4x0lK1Sx4S6DseYE2JQ4w1uFwuEgF325BDawQcpOe5sDX95C3MyqXlQ=@trmm.net>
 <01c8b669-d77e-75c4-7317-213e32eb2b73@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 10 Oct 2020, Julien Grall wrote:
> Hi,
> 
> On 10/10/2020 12:42, Trammell Hudson wrote:
> > On Friday, October 9, 2020 10:27 PM, Andrew Cooper
> > <andrew.cooper3@citrix.com> wrote:
> > > [...]
> > > Looks like arm64 is crashing fairly early on boot.
> > > 
> > > This is probably caused by "efi: Enable booting unified
> > > hypervisor/kernel/initrd images".
> > 
> > Darn it.  I'm working out how to build and boot qemu aarch64 so
> > that I can figure out what is going on.
> 
> FWIW, in OSSTest, we are chainloading Xen from GRUB. I have tried to
> chainloading on QEMU but couldn't get to work so far (even without your
> series).
> 
> Although, I have no trouble to boot using the GRUB way (i.e. via multiboot).

It took me a while to set it up, but now I have a test environment based
on RPi4 where I can chainload Xen from Grub EFI and boot successfully up
until the rootfs (I don't have a rootfs setup correctly yet, so it
breaks with the usual "Cannot open root device".) Which means I can get
both Xen and the Dom0 kernel to boot.

I hope it will be useful in the future, but in this case it didn't help
because I get the same behavior with and without Trammell's patches. For
me the chainload boot doesn't break.

Could it be down to the Grub version in-use? I am using UBoot EFI to
load Grub, but I doubt that could be a meaningful difference.


> > Also, I'm not sure that it is possible to build a unified arm
> > image right now; objcopy (and all of the obj* tools) say
> > "File format not recognized" on the xen.efi file.  The MZ file
> > is not what they are expecting for ARM executables.
> 
> IIUC, you are trying to add section into the EFI binary and not the ELF. Is it
> correct?
> 
> I don't know what x86 is doing but for Arm, xen.efi (and Linux Image) is
> custom built.

Specifically, see:

xen/arch/arm/arm64/head.S:efi_head


> So it may lack information to be recognized by objdump.
> 
> My knowledge of objdump is fairly limited. If you are interested to fix it,
> then I would suggest to ask the binutils community what they expect.
> 
> We could then adapt so objdump can recognize it.



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C747B5D82
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 01:04:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611837.951453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRx1-0008IM-Qg; Mon, 02 Oct 2023 23:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611837.951453; Mon, 02 Oct 2023 23:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRx1-0008FG-N2; Mon, 02 Oct 2023 23:03:43 +0000
Received: by outflank-mailman (input) for mailman id 611837;
 Mon, 02 Oct 2023 23:03:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oggk=FQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnRx0-0008Em-Iz
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 23:03:42 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eccfda4d-6177-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 01:03:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C9DABCE0E97;
 Mon,  2 Oct 2023 23:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C52C433C8;
 Mon,  2 Oct 2023 23:03:34 +0000 (UTC)
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
X-Inumbo-ID: eccfda4d-6177-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696287816;
	bh=/W1Zq9dl11xNiN53Zuc49WHlT7+g1AWnxWBM96epfQk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uAGDsE5hsOk5roaNe44UGCoFOKfoWuPQe1AfrHzR5NsvkL6XTN6VK54Mg3JXbEdeJ
	 90tfu8TpQcRb715Y6CJDj5MCKkmXXQpfLCgT9gojndribbcLKAmSktUv7v00+7QzfY
	 Ymez3gCCSlAYXeK4jm6+JS9HmX7N5nXy/xJO62Rie+sVCiu4I/dGf8HltJk1VUpDXq
	 pYLd7lzglT9h/yPTTaUFG6IBYZmSssoxcuBSUeXMot8d9i9TT7wk17O1k1WWPUEXgH
	 guMah/xWarjC8qsYran/Tp9boaE0gDEVtouQJGdb8ZnM4TU8CrmsGVQVlcc+bbQDL/
	 V+w6LLR5dtDaw==
Date: Mon, 2 Oct 2023 16:03:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "Driscoll, Dan" <dan.driscoll@siemens.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "arvind.raghuraman@siemens.com" <arvind.raghuraman@siemens.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "rahul.singh@arm.com" <rahul.singh@arm.com>, 
    Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: Xen on AWS EC2 Graviton 2 metal instances (c6g.metal)
In-Reply-To: <c3cf8e91-cf68-410d-8640-09fce6d20e9b@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310021554520.2348112@ubuntu-linux-20-04-desktop>
References: <DM6PR07MB43168B0D4DEA80BF2474B9D89AC3A@DM6PR07MB4316.namprd07.prod.outlook.com> <ed3ea203-4244-4bbe-a9e0-ac8882ecc83c@xen.org> <DM6PR07MB4316E030CEF6D6E27ACD58819AC0A@DM6PR07MB4316.namprd07.prod.outlook.com> <alpine.DEB.2.22.394.2309291321570.2348112@ubuntu-linux-20-04-desktop>
 <c3cf8e91-cf68-410d-8640-09fce6d20e9b@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Oct 2023, Julien Grall wrote:
> On 29/09/2023 21:29, Stefano Stabellini wrote:
> > I am very glad you managed to solve the issue!
> > 
> > It is always difficult to know what is the right thing to do when the
> > firmware provides wrong or noncompliant information.
> 
> I am a bit confused why you think the firmware is wrong here. From ACPI spec
> (ACPI 6.5, section 5.2.25):
> 
> "GSIV for the secure EL1 timer. This value is optional, as an operating system
> executing in the nonsecure world (EL2 or EL1), will ignore the content of
> these fields."

Thanks for looking into it -- I didn't investigate the issue, I was just
assuming that the table was incomplete due to the zero value.


> So the expectation is that Xen should not read the value. In Xen, we decided
> to read it because we want to know which PPIs exists in order to find an
> unallocated one for the event channel.
>
> > One on hand a panic
> > can help debug a potentially broken firmware configuration. On the other
> > hand the panic can cause problems to users that just want to boot Xen.
> > Unfortunately due to the complexity of ACPI, issues like this one are
> > not uncommon.
> > 
> > In this specific case, given that we don't actually use
> > TIMER_PHYS_SECURE_PPI (we do use all the others: TIMER_HYP_PPI,
> > TIMER_VIRT_PPI and TIMER_PHYS_NONSECURE_PPI) then I think we could
> > safely remove the BUG at vtimer.c:75.
> 
> IIRC, MISRA has a rule for checking return value.

Yes it does, rule 17.7, likely to be adopted


> If it doesn't, then I would
> at least query why you are suggesting to remove the BUG() but still keep the
> call. Surely, if a function returns an error, we need to investigate why the
> error is returned? And if the TIME_PHYS_SECURE_PPI is really not used, then
> why should the call be kept?
>
> As I wrote above, the goal of those calls was to ensure that all the PPI
> described in the firmware tables were recorded so we can find a free PPI for
> the event channel.
> 
> vgic_reserve_virq() fails because the PPI is already reserved. I actually
> wonder which other path reserves it? The reason in asking it is because for
> some field, 0 is used to mark the interrupt is not used exists (see below for
> the PPI timer). So maybe we forgot to add some check somewhere else. The other
> possible reason is the PPI might be shared (I couldn't find anything in the
> spec that it cannot be) and vgic_reserve_virq() doesn't deal with it right
> now.

Good point. That would be interesting to know


> Now regarding whether the PPI is used. AFAICT, the secure timer PPI is still
> present in the firmware tables (ACPI and DT) passed to dom0. So strictly
> speaking we want to ensure the PPI value is reserved.
> 
> That said, the ACPI spec suggests that the value will be ignored by the guest.
> The Device-Tree binding doesn't have such statement, but I suspect this may be
> the same. So it should be ok to skip reserving the PPI and therefore allow the
> event channel interrupt to use if it is not reserved by someone else.

You looked into this more deeply then I did. Your suggestion makes sense
to me.


> Cheers,
> 
> > On Fri, 29 Sep 2023, Driscoll, Dan wrote:
> > > All,
> > > 
> > >          Just an FYI - using the debug guidance from Julien on Graviton 2,
> > > we have successfully been able to boot Xen and 3 Linux VMs on a Graviton 2
> > > c6g.metal instance.
> > > 
> > >          The problem turned out to be that the ACPI table containing the
> > > arch timer interrupt vectors had an issue - the result was that the secure
> > > physical timer IRQ was getting set to a value of 0 which resulted in Xen
> > > panicking at vtimer.c:75 and stop booting the system.  The quick
> > > work-around for this was to just hard-code this IRQ to 29 which is the
> > > "typical" PPI assigned for this interrupt (and I suspect it isn't even
> > > used, so kind of a don't care).  This fixed the problem and we encountered
> > > no other issues.
> > > 
> > >          Out of curiosity, is this problem we found here one that has been
> > > seen before?  I guess I could argue that the ACPI tables are incorrect and
> > > should provide a valid PPI number for the secure physical timer, but I
> > > could also argue that Xen shouldn't panic if this value is 0 and should
> > > maybe replace with a "suitable" value and continue booting since it really
> > > is not used?  I can provide more details as well as the patch used to work
> > > around this issue - we are using Xen 4.16.1 BTW.
> > > 
> > >          Much appreciated for the support and help here... as we progress
> > > in our work in this domain, we might have some more questions but, for
> > > right now, it appears that things are working properly with the limited
> > > testing we conducted.
> > > 
> > > Thanks,
> > > Dan
> > > 
> > > > -----Original Message-----
> > > > From: Julien Grall <julien@xen.org>
> > > > Sent: Wednesday, September 27, 2023 7:59 AM
> > > > To: Driscoll, Dan (DI SW CAS ES TO) <dan.driscoll@siemens.com>; xen-
> > > > devel@lists.xenproject.org
> > > > Cc: Stefano Stabellini <sstabellini@kernel.org>; Raghuraman, Arvind (DI
> > > > SW CAS
> > > > ES) <arvind.raghuraman@siemens.com>; Bertrand Marquis
> > > > <Bertrand.Marquis@arm.com>; rahul.singh@arm.com; Luca Fancellu
> > > > <Luca.Fancellu@arm.com>
> > > > Subject: Re: Xen on AWS EC2 Graviton 2 metal instances (c6g.metal)
> > > > 
> > > > Hi Dan,
> > > > 
> > > > Thanks for the report.
> > > > 
> > > > On 26/09/2023 20:41, Driscoll, Dan wrote:
> > > > >      First off - sorry for the very long email, but there are a lot of
> > > > > details related
> > > > to this topic and I figured more details might be better than less but I
> > > > could be
> > > > wrong here....
> > > > > 
> > > > >      Within Siemens Embedded, we have been doing some prototyping
> > > > > using
> > > > Xen for some upcoming customer related work - this email thread attempts
> > > > to
> > > > explain what has been done here and our analysis of the problems we are
> > > > having.
> > > > > 
> > > > >      We have done some initial prototyping to get Xen running on an
> > > > > AWS
> > > > Graviton 2 instance using an EC2 Arm64 "metal" instance (c6g.metal - no
> > > > AWS
> > > > hypervisor) and ran into some problems during this prototyping.
> > > > > 
> > > > >      Since the Edge Workload Abstraction and Orchestration Layer
> > > > > (EWAOL)
> > > > that is part of SOAFEE already has some enablement of Xen in various
> > > > environments (including an Arm64 server environment), we used this as a
> > > > starting
> > > > point.
> > > > > 
> > > > >      We were able to successfully bring up Xen and a Yocto dom0 and
> > > > > multiple domu Yocto guests on an Arm AVA server (AVA Developer
> > > > > Platform - 32 core Neoverse N1 server) following documented steps with
> > > > > some minimal configuration changes (we simply extended the
> > > > > configuration to include 3 Linux guests):
> > > > > https://ewao/
> > > > > l.docs.arm.com%2Fen%2Fkirkstone-
> > > > dev%2Fmanual%2Fbuild_system.html%23bui
> > > > > ld-
> > > > system&data=05%7C01%7Cdan.driscoll%40siemens.com%7Cc7c8b262cbfc43ce
> > > > > 
> > > > 45b908dbbf598a6d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C63
> > > > 831416
> > > > > 
> > > > 3551872035%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV
> > > > 2luMzI
> > > > > 
> > > > iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=TfGY5InUn
> > > > BnfUO0z
> > > > > ato7l%2Fa5IIAek%2FOip%2FdNMxuXEgM%3D&reserved=0
> > > > > 
> > > > >      So, this specific EWAOL support has all the proper bitbake layers
> > > > > to
> > > > generate images for both bare-metal (Linux running natively) and a
> > > > virtualization
> > > > build (using Xen) for AVA and also a Neoverse N1 System Development
> > > > Platform
> > > > (N1SDP), but we only verified this on AVA.
> > > > > c6g.medium
> > > > >      AWS also has support for EWAOL on Graviton 2, but the only
> > > > > supported
> > > > > configuration is a bare-metal configuration (Linux running natively)
> > > > > and the virtualization build hasn't been implemented in the bitbake
> > > > > layers in their repo - here is the URL for information / instructions
> > > > > on this support:
> > > > > https://gith/
> > > > > ub.com%2Faws4embeddedlinux%2Fmeta-aws-
> > > > ewaol&data=05%7C01%7Cdan.driscol
> > > > > 
> > > > l%40siemens.com%7Cc7c8b262cbfc43ce45b908dbbf598a6d%7C38ae3bcd95794f
> > > > d4a
> > > > > 
> > > > ddab42e1495d55a%7C1%7C0%7C638314163551872035%7CUnknown%7CTWFp
> > > > bGZsb3d8e
> > > > > 
> > > > yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7
> > > > C30
> > > > > 
> > > > 00%7C%7C%7C&sdata=rPcqfn9w9C9cS81Ee5HpyupEBD%2BqDY18dvPm0N6tB
> > > > Mk%3D&res
> > > > > erved=0
> > > > > 
> > > > https://docs.aws.am/
> > > > azon.com%2FAWSEC2%2Flatest%2FUserGuide%2Fgrub.html&data=05%7C01%
> > > > 7Cdan.driscoll%40siemens.com%7Cc7c8b262cbfc43ce45b908dbbf598a6d%7C38a
> > > > e3bcd95794fd4addab42e1495d55a%7C1%7C0%7C638314163551872035%7CUnk
> > > > nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h
> > > > aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=ZwLDw%2B3vOtaVJwg%
> > > > 2B7kgHXJcE8yuu%2F7TNewmE2Yn4AiQ%3D&reserved=0
> > > > >      As part of our effort to bring this up, we did a VERY minimal
> > > > > patch to the
> > > > repo used for the AWS EWAOL to generate a virtualization build (attached
> > > > meta-
> > > > aws-ewaol.patch).  The resultant build of the AWS EWAOL support with
> > > > this patch
> > > > applied does result in Xen being built as well as a dom0 Yocto kernel,
> > > > but there is
> > > > definitely missing support to properly build everything for this
> > > > virtualization layer.
> > > > Following the instructions for meta-aws-ewaol,  we generated an AMI and
> > > > started
> > > > an EC2 instance with this AMI (c6g.metal type).  The resultant image
> > > > does boot,
> > > > but it boots into the dom0 Linux kernel with problems recorded in the
> > > > boot log
> > > > related to Xen (see dom0-linux-boot.txt).
> > > > > 
> > > > >          Looking more closely at the EFI partition, it was clear that
> > > > > systemd-boot
> > > > was being used and it was set-up to boot the dom0 Linux kernel and not
> > > > boot into
> > > > Xen - the Xen EFI images were not present in the EFI partition and
> > > > obviously no
> > > > launch entries existed for Xen.  To rectify this, the Xen EFI image that
> > > > were built as
> > > > part of the AWS EWAOL build mentioned above where placed in the EFI
> > > > partition,
> > > > along with a Xen config file that provided the dom0 Linux kernel image
> > > > details.  A
> > > > new entry was added into the EFI image for Xen and the launch conf file
> > > > was
> > > > updated to boot Xen instead of dom0 Linux.  This resulted in the EC2
> > > > instance
> > > > becoming "bricked" and no longer accessible.
> > > > > 
> > > > >          Details on the EFI related content and changes we made are
> > > > > captured in
> > > > the meta-aws-ewaol-efi-boot-changes.txt file attached above.
> > > > > 
> > > > >          The next step was comparing the AVA Xen output that was
> > > > > working and we
> > > > noticed a few differences - the AVA build did enable ACPI and
> > > > UNSUPPORTED
> > > > kconfig settings whereas the AWS Xen build did not.  So, we tried again
> > > > to bring up
> > > > another EC2 metal instance using the same AMI as before and utilized the
> > > > AVA
> > > > Xen EFI image instead and same Xen config file.  The result was the same
> > > > - a
> > > > "bricked" instance.
> > > > > 
> > > > >          We will likely try to use the entire AVA flow on AWS Graviton
> > > > > next as it is
> > > > using GRUB 2 instead of systemd-boot and we hope to maybe extend or
> > > > enable
> > > > some of the debug output during boot.  The AWS EC2 instances have a
> > > > "serial
> > > > console", but we have yet to see any output on this console prior to
> > > > Linux boot logs
> > > > - no success in getting EC2 serial output during EFI booting.
> > > > 
> > > > That's interesting. The documentation for AWS [1] suggests that the logs
> > > > from boot
> > > > should be seen. They even have a page for troubleshooting using GRUB
> > > > [2].
> > > > 
> > > > I just launched a c6g.metal and I could access the serial console but
> > > > then it didn't
> > > > work across reboot.
> > > > 
> > > > I have tried a c6g.medium and the serial was working across reboot (I
> > > > could see
> > > > some logs). So I wonder whether the serial console is there is a missing
> > > > configuration for baremetal?
> > > > 
> > > > > 
> > > > >          We have had a call and some email exchanges with AWS on this
> > > > > topic
> > > > (Luke Harvey, Jeremy Dahan, Robert DeOliveira, and Azim Siddique) and
> > > > they said
> > > > there have been multiple virtualization solutions successfully booted on
> > > > Graviton 2
> > > > metal instances, so they felt that Xen should be useable once we figured
> > > > out
> > > > configuration / boot details.  The provided some guidance how we might
> > > > go about
> > > > some more exploration here, but nothing really specific to supporting
> > > > Xen.
> > > > 
> > > > To be honest, without a properly working serial console, it is going to
> > > > be very
> > > > difficult to debug any issue in Xen.
> > > > 
> > > > Right now, it is unclear whether Xen has output anything. If we can
> > > > confirm the
> > > > serial console has intended and then are still no logs, then I would
> > > > suggest to
> > > > enable earlyprintk in Xen. For your Graviton2, I think the following
> > > > lines in
> > > > xen/.config should do the trick:
> > > > 
> > > > CONFIG_DEBUG=y
> > > > CONFIG_EARLY_UART_CHOICE_PL011=y
> > > > CONFIG_EARLY_UART_PL011=y
> > > > CONFIG_EARLY_PRINTK=y
> > > > CONFIG_EARLY_UART_BASE_ADDRESS=0x83e00000
> > > > CONFIG_EARLY_UART_PL011_BAUD_RATE=115200
> > > > 
> > > > > 
> > > > >          I have attached the following files for reference:
> > > > > 
> > > > >      * meta-aws-ewaol.patch - patch to AWS EWAOL repo found at
> > > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%25
> > > > 2Faws4embeddedlinux%2Fmeta-aws-
> > > > ewaol&data=05%7C01%7Cdan.driscoll%40siemens.com%7Cc7c8b262cbfc43ce45
> > > > b908dbbf598a6d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C6383
> > > > 14163551872035%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ
> > > > QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata
> > > > =rPcqfn9w9C9cS81Ee5HpyupEBD%2BqDY18dvPm0N6tBMk%3D&reserved=0
> > > > >      * meta-aws-ewaol-efi-boot-changes.txt - Description of EFI
> > > > > related
> > > > changes made to AWS EWAOL EFI partition in attempt to boot Xen
> > > > >      * ava.xen.config - config file for Xen build for AVA using EWAOL
> > > > virtualization build
> > > > >      * aws.xen.config - config file for Xen build for AWS using EWAOL
> > > > virtualization build
> > > > >      * xen-4.16.1.cfg - Xen config file placed in root of EFI boot
> > > > > partition alongside xen-4.16.1.efi image
> > > > 
> > > > May I ask why you are using 4.16.1 rather than 4.17? In general I would
> > > > recommend to use the latest stable version or even a staging (the
> > > > on-going
> > > > development branch) for bring-up because we don't always backport
> > > > everything to
> > > > stable branch. So a bug may have been fixed in newer revision.
> > > > 
> > > > That said, skimming through the logs, I couldn't spot any patches that
> > > > may help on
> > > > Graviton 2.
> > > > 
> > > > Best regards,
> > > > 
> > > > [1]
> > > > https://docs.aws.am/
> > > > azon.com%2FAWSEC2%2Flatest%2FUserGuide%2Fec2-serial-
> > > > console.html&data=05%7C01%7Cdan.driscoll%40siemens.com%7Cc7c8b262cbfc
> > > > 43ce45b908dbbf598a6d%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7
> > > > C638314163551872035%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD
> > > > AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&
> > > > sdata=%2BQF9rA7KVEGbGJZIX0lhCv0du4oKR5632Eff2EoC2PY%3D&reserved=0
> > > > [2]
> > > > https://docs.aws.am/
> > > > azon.com%2FAWSEC2%2Flatest%2FUserGuide%2Fgrub.html&data=05%7C01%
> > > > 7Cdan.driscoll%40siemens.com%7Cc7c8b262cbfc43ce45b908dbbf598a6d%7C38a
> > > > e3bcd95794fd4addab42e1495d55a%7C1%7C0%7C638314163551872035%7CUnk
> > > > nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h
> > > > aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=ZwLDw%2B3vOtaVJwg%
> > > > 2B7kgHXJcE8yuu%2F7TNewmE2Yn4AiQ%3D&reserved=0
> > > > 
> > > > > 
> > > > > Dan Driscoll
> > > > > Distinguished Engineer
> > > > > Siemens DISW - Embedded Platform Solutions
> > > > 
> > > > --
> > > > Julien Grall
> > > 
> 
> -- 
> Julien Grall
> 


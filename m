Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6732A0F3E
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 21:11:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16227.39638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYajW-0001N5-Of; Fri, 30 Oct 2020 20:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16227.39638; Fri, 30 Oct 2020 20:10:46 +0000
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
	id 1kYajW-0001Mg-Le; Fri, 30 Oct 2020 20:10:46 +0000
Received: by outflank-mailman (input) for mailman id 16227;
 Fri, 30 Oct 2020 20:10:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0MNT=EF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kYajU-0001Mb-GJ
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 20:10:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 036b5113-f08c-4b91-a6c0-822d2347b923;
 Fri, 30 Oct 2020 20:10:43 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A822206F7;
 Fri, 30 Oct 2020 20:10:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0MNT=EF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kYajU-0001Mb-GJ
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 20:10:44 +0000
X-Inumbo-ID: 036b5113-f08c-4b91-a6c0-822d2347b923
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 036b5113-f08c-4b91-a6c0-822d2347b923;
	Fri, 30 Oct 2020 20:10:43 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2A822206F7;
	Fri, 30 Oct 2020 20:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604088642;
	bh=vZmVPDf0ZmBYwG1bGkRj6FBKNv/zlfneUzVXUfgk4Us=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rywqS1PbGROA0VWKhQv80KY+8yqS4NZpb22p/QYbvRBhwneC/BiCDttR4m/vFGCgt
	 PXu9qR023fYo3nKMKEfKGHBFv0ztI8aTr4x9KQS0diXdqrSVwDQge7bqrmUKjdJE6t
	 Q8TLWgUCB26oD1zm3i7lop40M/cJerJAUrnhHXm0=
Date: Fri, 30 Oct 2020 13:10:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Elliott Mitchell <ehem+xen@m5p.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    roman@zededa.com, xen-devel@lists.xenproject.org
Subject: Re: Xen on RP4
In-Reply-To: <20201029212954.GA50793@mattapan.m5p.com>
Message-ID: <alpine.DEB.2.21.2010301240450.12247@sstabellini-ThinkPad-T480s>
References: <20201023005629.GA83870@mattapan.m5p.com> <alpine.DEB.2.21.2010221801490.12247@sstabellini-ThinkPad-T480s> <20201023211941.GA90171@mattapan.m5p.com> <alpine.DEB.2.21.2010231647290.12247@sstabellini-ThinkPad-T480s> <20201024053540.GA97417@mattapan.m5p.com>
 <4fcf4832-9266-443f-54d0-fa1fff4b6e14@xen.org> <20201026160316.GA20589@mattapan.m5p.com> <7a904044-8206-b45d-8ec2-d4e48b07ea83@xen.org> <20201028015423.GA33407@mattapan.m5p.com> <alpine.DEB.2.21.2010281704250.12247@sstabellini-ThinkPad-T480s>
 <20201029212954.GA50793@mattapan.m5p.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Oct 2020, Elliott Mitchell wrote:
> On Wed, Oct 28, 2020 at 05:37:02PM -0700, Stefano Stabellini wrote:
> > On Tue, 27 Oct 2020, Elliott Mitchell wrote:
> > > On Mon, Oct 26, 2020 at 06:44:27PM +0000, Julien Grall wrote:
> > > > On 26/10/2020 16:03, Elliott Mitchell wrote:
> > > > > On Mon, Oct 26, 2020 at 01:31:42PM +0000, Julien Grall wrote:
> > > > >> On 24/10/2020 06:35, Elliott Mitchell wrote:
> > > > >>> ACPI has a distinct
> > > > >>> means of specifying a limited DMA-width; the above fails, because it
> > > > >>> assumes a *device-tree*.
> > > > >>
> > > > >> Do you know if it would be possible to infer from the ACPI static table
> > > > >> the DMA-width?
> > > > > 
> > > > > Yes, and it is.  Due to not knowing much about ACPI tables I don't know
> > > > > what the C code would look like though (problem is which documentation
> > > > > should I be looking at first?).
> > > > 
> > > > What you provided below is an excerpt of the DSDT. AFAIK, DSDT content 
> > > > is written in AML. So far the shortest implementation I have seen for 
> > > > the AML parser is around 5000 lines (see [1]). It might be possible to 
> > > > strip some the code, although I think this will still probably too big 
> > > > for a single workaround.
> > > > 
> > > > What I meant by "static table" is a table that looks like a structure 
> > > > and can be parsed in a few lines. If we can't find on contain the DMA 
> > > > window, then the next best solution is to find a way to identity the 
> > > > platform.
> > > > 
> > > > I don't know enough ACPI to know if this solution is possible. A good 
> > > > starter would probably be the ACPI spec [2].
> > > 
> > > Okay, that is worse than I had thought (okay, ACPI is impressively
> > > complex for something nominally firmware-level).
> > >
> > > There are strings in the present Tianocore implementation for Raspberry
> > > PI 4B which could be targeted.  Notably included in the output during
> > > boot listing the tables, "RPIFDN", "RPIFDN RPI" and "RPIFDN RPI4" (I'm
> > > unsure how kosher these are as this wsn't implemented nor blessed by the
> > > Raspberry PI Foundation).
> > > 
> > > I strongly dislike this approach as you soon turn the Xen project into a
> > > database of hardware.  This is already occurring with
> > > xen/arch/arm/platforms and I would love to do something about this.  On
> > > that thought, how about utilizing Xen's command-line for this purpose?
> > 
> > I don't think that a command line option is a good idea: basically it is
> > punting to users the task of platform detection. Also, it means that
> > users will be necessarily forced to edit the uboot script or grub
> > configuration file to boot.
> 
> -EINVAL
> 
> Many Linux installations (near universal on desktop/server, but may be
> uncommon on ARM servers) Xen's command-line comes from grub.cfg.
> grub.cfg is in turn created by a series of scripts with several places
> for users to modify configuration without breaking things.
> 
> The scripts which create grub.cfg could add a "dma_mem=" option to Xen's
> command-line based upon what the running kernel reports.  If the kernel
> is running on top of Xen, it will still be able to retrieve this
> information out of ACPI.
> 
> This does mean distributions would need to modify scripts, but that is
> doable.  This also means a dumb user could potentially jump in, modify
> the value and thus cause unrecoverable breakage.  Yet on the flip side
> this also allows for the short-term stop-gap of smart users modifying
> the option as appropriate for new hardware.
> 
> Certainly it may not be the greatest approach, but it isn't as bad as
> you're claiming.

From what I have seen in previous years getting all the distros to
update their scripts is actually a lot of work. It would take a long
time to see it through. A few years. I think it is likely we would solve
the problem more quickly with a different solution.

 
> > Note that even if we introduced a new command line, we wouldn't take
> > away the need for xen/arch/arm/platforms anyway.
> 
> Perhaps, but it could allow for this setting at least to be moved to
> somewhere outside of Xen.

I was trying to say that it is not just about dma_mem=. There are other
things under xen/arch/arm/platforms that are sometimes required.  In the
specific case of the RPi4, if we added a general dma_mem= parameter, we
would still need to detect the platform to be able to do a platform
reboot, unless it is guaranteed that when ACPI is present ATF is also
present?

More on this below.


> I'm inclined to agree with Juergen Gro??, this reads kind of like having
> an extra domain run during Xen's initialization which can talk ACPI.
> 
> > > Have a procedure of during installation/updates retrieve DMA limitation
> > > information from the running OS and the following boot Xen will follow
> > > the appropriate setup.  By its nature, Domain 0 will have the information
> > > needed, just becomes an issue of how hard that is to retrieve...
> > 
> > Historically that is what we used to do for many things related to ACPI,
> > but unfortunately it leads to a pretty bad architecture where Xen
> > depends on Dom0 for booting rather than the other way around. (Dom0
> > should be the one requiring Xen for booting, given that Xen is higher
> > privilege and boots first.)
> > 
> > 
> > I think the best compromise is still to use an ACPI string to detect the
> > platform. For instance, would it be possible to use the OEMID fields in
> > RSDT, XSDT, FADT?  Possibly even a combination of them?
> > 
> > Another option might be to get the platform name from UEFI somehow. 
> 
> I included appropriate strings in e-mail.  Suitable strings do appear in
> `dmesg`.

Do you mean the ones mentioned in the previous email or did you forget
an attachment here? I don't think you added the value of OEMID anywhere?


> Problem is this feels like you're hard-coding a fixed list of platforms
> Xen can run on.  Instead values like these should be provided by
> firmware.  ACPI includes a method for encoding DMA limitations,

I see where you are coming from: DMA limitations is a general problem,
so it looks like there should be a general solution.

Yes, I agree that it would be good to have a general solution to
automatically detect DMA limitations, no matter if we do ACPI or device
tree.

However, xen/arch/arm/platforms is not just for DMA limitations. There
are per-platform quirks and workarounds that sometimes are required for
booting. Even if we solved the DMA limitations problem generically
(which would be good if we find a way), we are still likely to have to
find another way to detect the platform name.


> device-tree really should have one added.  Only challenge for
> device-tree is getting everyone to agree on names and parameters.

Device tree has ways to describe dma limitations, but they are not
really taken into account when allocating dom0 memory today
unfortunately :-/


> Looking at it, there are really issues with the allocate_memory_11()
> function in xen/arch/arm/domain_build.c.  Two tasks have been merged and
> I'm unsure they were merged correctly.
> 
> I'm unaware of any Xen-capable platforms with such, but DMA can have
> distinct restrictions outside of what allocate_memory_11() provides for.
> ACPI allows for explicit address ranges and in the past many devices have
> used addresses that didn't start at zero.
> 
> Additionally a device might have several devices with restricted DMA and
> these could have differing non-overlapping ranges.  Domain 0 might need
> memory in several DMA ranges.  Luckily In the past few years I haven't
> read about any potentially Xen-capable devices where DMA-capable memory
> had differing capabilities/performance from non-DMA-capable memory.

What you described is possible, at least theoretically. Any patches to
improve allocate_memory_11() in that respect would be great to have.


> Meanwhile for a platform which does have DMA limitations, the kernel and
> boot information for domain 0 shouldn't be placed in DMA-capable memory
> if domain 0 has any memory which isn't DMA-capable.  Yet it appears
> allocate_memory_11() will cause kernel/initrd/boot information to be
> placed in DMA-capable memory.

The dom0 kernel (if zImage) needs to be loaded in the first 128Mb of
RAM. In any case, the kernel will relocate those modules in high memory
and free the original memory during boot, so it shouldn't make a lot of
difference?


> If my understanding is correct (this is a BIG IF), as a last step
> allocate_memory_11() should reverse the order of memory banks.  Another
> trick is DMA-capable banks need to be subject to ballooning AFTER
> non-DMA-capable banks (I'm unsure how often ballooning is used on ARM).

Why reverse the order?


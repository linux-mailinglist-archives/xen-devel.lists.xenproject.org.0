Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FFB425183
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 12:51:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203456.358588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYQzB-0000e3-Gq; Thu, 07 Oct 2021 10:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203456.358588; Thu, 07 Oct 2021 10:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYQzB-0000ad-Bw; Thu, 07 Oct 2021 10:50:49 +0000
Received: by outflank-mailman (input) for mailman id 203456;
 Thu, 07 Oct 2021 10:50:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mYQz9-0000aX-Se
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 10:50:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mYQz9-00010g-QC
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 10:50:47 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mYQz9-0003Qj-Oz
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 10:50:47 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mYQz4-00068u-Lc; Thu, 07 Oct 2021 11:50:42 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=tFXPgezor6tDmD5bxbcEDp//+SfGGKXicdAcPMZYa4Y=; b=OqhkEEVVImmzvC/vtReDaLZVt7
	CtnQHX/zNnL5xF39MSddpxLb+9o3ixYYHJbPnQiE6pLJ9PIlhwax4ElRn9Ii0DGYYcyIQ7xVzcbjQ
	XdjalAQ50rum+tW/I/EozQRM6WIARTDvrWKTpncT80kWe1N9ls6al4mECCjXLtpzd4zM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-16
Content-Transfer-Encoding: 8bit
Message-ID: <24926.53506.270924.8163@mariner.uk.xensource.com>
Date: Thu, 7 Oct 2021 11:50:42 +0100
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
    xen-devel <xen-devel@lists.xenproject.org>,
    Bertrand Marquis <Bertrand.Marquis@arm.com>,
    Andre Przywara <Andre.Przywara@arm.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Julien Grall <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 13/14] arm/libxl: Emulated PCI device tree node in
 libxl
In-Reply-To: <5ADA6C46-A69D-459F-868C-DA579FEC36E2@arm.com>
References: <cover.1633340795.git.rahul.singh@arm.com>
	<3ad42008f534671ae7f5b25da91253ce7cd4a3e9.1633340795.git.rahul.singh@arm.com>
	<alpine.DEB.2.21.2110041714410.3209@sstabellini-ThinkPad-T480s>
	<11F169C6-39A4-40F3-8E75-39B8C2CCF022@arm.com>
	<alpine.DEB.2.21.2110051421520.3209@sstabellini-ThinkPad-T480s>
	<8B848F95-977F-4DF4-B315-CFEA610BC1C3@arm.com>
	<24925.33634.554859.2131@mariner.uk.xensource.com>
	<BFC5AD62-3DA7-498F-8B6E-AB4C8CAA9731@arm.com>
	<24925.35194.369692.94259@mariner.uk.xensource.com>
	<5ADA6C46-A69D-459F-868C-DA579FEC36E2@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Rahul Singh writes ("Re: [PATCH v4 13/14] arm/libxl: Emulated PCI device tree node in libxl"):
> On 6 Oct 2021, at 12:33 pm, Ian Jackson <iwj@xenproject.org> wrote:
> >  We try
> > to make the libxl API "do the right thing" by default.  In this case I
> > think that means to enable VPCI (i) on platforms where it's available
> > (ii) if the guest has PCI passthrough devices.  Is that right ?
> 
> Yes you are right VPCI will be enabled for guest when guest has PCI passthrough device 
> assigned and VPCI support is available.  
> > 
> > Sorry to ask these question now, and please forgive my ignorance:
> > 
> > Is VPCI inherently an ARM-specific ABI or protocol ?
> 
> As of now VPCI for DOMU guests is only implemented  for ARM.

I'm sorry.  It appears that the thrust of my questions wasn't
sufficiently clear.  Your replies about details are fine but they
don't seem to address my underlying concerns.

"as of now ... only implemented for ARM" suggests to me that it is
VPCI *not* inherently ARM-specific.  Ie, it is a thing that x86 (or
riscv or whatever) might support in future.  Is that right ?

How does VPCI fit into the whole system architecture ?  Is it
*required* for PCI passthrough on ARM ?  If not, what happens if it is
not enabled ?

If VPCI *is* ARM-specific, how do x86 systems (say) achieve the goals
met on ARM by VPCI ?

On the other hand if VPCI is not inherently ARM-specific it should not
be in the ARM part of the libxl IDL.

> >  When might an
> > admin want to turn it on explicitly ?
> 
> It will be enabled dynamically when admin assign any PCI device to guest.

What about hotplug ?

> > How does this all relate to the (non-arch-specific) "passthrough"
> > option ?
> 
> VPCI will be enabled only when there is any PCI device assigned to
> guest therefore I used "d_config->num_pcidevsµ to enable VPCI.

The purpose of the "passthrough" option is to allow the guest admin to
specify that a guest is expected to gain hotplugged PCI devices in
future.  That way, domain features that are required for PCI
passthrough are automatically enabled.

Perhaps this isn't explained clearly enough in the documentation,
which talks about iommu mappings.

Does PCI passthrugh work on ARM without VPCI ?

I think it likely that VPCI should be controlled (or at least, its
default set) from the "passthrough" option.  But I don't understand
enough of the relationship between the pieces.

Ian.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AFF847C15
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 23:10:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675281.1050623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1ij-0002dG-Q6; Fri, 02 Feb 2024 22:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675281.1050623; Fri, 02 Feb 2024 22:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1ij-0002af-Mz; Fri, 02 Feb 2024 22:09:13 +0000
Received: by outflank-mailman (input) for mailman id 675281;
 Fri, 02 Feb 2024 22:09:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L4Ps=JL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rW1ii-0002aZ-MH
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 22:09:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b071b5b3-c217-11ee-8a45-1f161083a0e0;
 Fri, 02 Feb 2024 23:09:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 08F69628BB;
 Fri,  2 Feb 2024 22:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B62C433C7;
 Fri,  2 Feb 2024 22:09:07 +0000 (UTC)
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
X-Inumbo-ID: b071b5b3-c217-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706911748;
	bh=mMWoEjvSdbn6OkvFwGWf8jH0jd9qlvcg2vq/sKfxrps=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cK+ichH1EzOON/enkSBGgl1rMHjts9cADg3+/rPBt+ouCWbZC2u+N+q+GfTNmeAEX
	 ayg/oEtxihUMARuQaJDDymoYjveDy32QZKLISgrwjci0QgdDeieRCSVTPbdvSd770P
	 6L3dFKQqxkwB1VUnP5KlcZQ9tJFXWoIlmBFYqZxTHJbfB8cuA49Z82tu9nhWwOL4sW
	 cd6IsFjj2S1Jvll417Ebov34WHFey4taKQcxrDqs9658M1oQICCpQzjwsBjgpFgrpo
	 f9XWgU/CgJjNEl2qvfEXerp1/CwKfwgKf8f82C2oXGTV0X+rjwIoQ8xQk+fNi88Bif
	 xSRaDYj63sTsw==
Date: Fri, 2 Feb 2024 14:09:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: John Ernberg <john.ernberg@actia.se>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Peng Fan <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
In-Reply-To: <012b5f83-2f9b-4477-965e-07b8506c0052@xen.org>
Message-ID: <alpine.DEB.2.22.394.2402021401310.292110@ubuntu-linux-20-04-desktop>
References: <20240131114952.305805-1-john.ernberg@actia.se> <20240131114952.305805-2-john.ernberg@actia.se> <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org> <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se> <167f0c7a-e037-446c-82f8-2584e35a7af1@xen.org>
 <a265ea2d-9b5f-4726-9395-448b1b669839@actia.se> <012b5f83-2f9b-4477-965e-07b8506c0052@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1121442091-1706911363=:292110"
Content-ID: <alpine.DEB.2.22.394.2402021402550.292110@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1121442091-1706911363=:292110
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2402021402551.292110@ubuntu-linux-20-04-desktop>

On Fri, 2 Feb 2024, Julien Grall wrote:
> On 01/02/2024 16:17, John Ernberg wrote:
> > On 2/1/24 13:20, Julien Grall wrote:
> > > 
> > > 
> > > On 31/01/2024 15:32, John Ernberg wrote:
> > > > Hi Julien,
> > > 
> > > Hi John,
> > > 
> > > > On 1/31/24 13:22, Julien Grall wrote:
> > > > > Hi,
> > > > > 
> > > > > On 31/01/2024 11:50, John Ernberg wrote:
> > > > > > When using Linux for dom0 there are a bunch of drivers that need to
> > > > > > do
> > > > > > SMC
> > > > > > SIP calls into the PSCI provider to enable certain hardware bits
> > > > > > like the
> > > > > > watchdog.
> > > > > 
> > > > > Do you know which protocol this is under the hood. Is this SCMI?
> > > > 
> > > > I think I confused myself here when I wrote the commit log.
> > > > 
> > > > The EL3 code in our case is ATF, and it does not appear to be SCMI, nor
> > > > PSCI. The register usage of these SMC SIP calls are as follows:
> > > > a0 - service
> > > > a1 - function
> > > > a2-a7 - args
> > > > 
> > > > In ATF the handler is declared as a runtime service.
> > > > 
> > > > Would the appropriate commmit message here be something along the lines
> > > > of below?
> > > > """
> > > > When using Linux for dom0 there are a bunch of drivers that need to
> > > > do   SMC
> > > > SIP calls into the firmware to enable certain hardware bits like the
> > > > watchdog.
> > > > """
> > > 
> > > It reads better thanks.
> > > 
> > > [...]
> > > 
> > > > > But even if we restrict to dom0, have you checked that none of the
> > > > > SMCs
> > > > > use buffers?
> > > > I haven't found any such instances in the Linux kernel where a buffer is
> > > > used. Adding a call filtering like suggested below additions of such
> > > > functions can be discovered and adapted for if they would show up later.
> > > > > 
> > > > > Rather than providing a blanket forward, to me it sounds more like you
> > > > > want to provide an allowlist of the SMCs. This is more futureproof and
> > > > > avoid the risk to expose unsafe SMCs to any domain.
> > > > > 
> > > > > For an example, you can have a look at the EEMI mediator for Xilinx.
> > > > 
> > > > Ack. Do you prefer to see only on SMCCC service level or also on
> > > > function level? (a1 register, per description earlier)
> > > 
> > > I am not sure. It will depend on whether it is correct to expose *all*
> > > the functions within a service level and they have the same format.
> > > 
> > > If you can't guarantee that, then you will most likely need to allowlist
> > > at the function level.
> > > 
> > > Also, do you have a spec in hand that would help to understand which
> > > service/function is implemented via those SMCs?
> > 
> > I don't have the spec unfortunately, but I will add a filter on both
> > service and function for V2 and we'll take it from there.
> 
> @Peng, do you have any specification you could share? How stable is the
> interface?

Just to add some context to make the reason for the question clearer, if
we have a specification we could check the patch for correctness.
Without it, it is difficult to know if it is doing the right thing.

The other aspect is about expectation of forward and backward
compatibility. Can we guarantee that the next version of Xen and the one
after it will still work against this interface? If not, can we check
for the version of the interface before continuing? If not, can we at
least document that the interface is only known-to-work with specific
firmware versions?

This is basically just to provide the right expectations to users and
ideally to prevent a future version of Xen to break on boot silently
without information.

If we don't have a spec and we don't know if the interface is stable, I
think we should try to detect the version of the interface and print a
warning in Xen if it not a known version.
--8323329-1121442091-1706911363=:292110--


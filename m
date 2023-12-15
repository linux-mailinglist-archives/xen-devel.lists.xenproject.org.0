Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91515815181
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 22:02:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655363.1023108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEFJc-0002gS-6m; Fri, 15 Dec 2023 21:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655363.1023108; Fri, 15 Dec 2023 21:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEFJc-0002dT-3l; Fri, 15 Dec 2023 21:01:48 +0000
Received: by outflank-mailman (input) for mailman id 655363;
 Fri, 15 Dec 2023 21:01:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Stqq=H2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rEFJa-0002dN-Hi
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 21:01:46 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27729c28-9b8d-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 22:01:45 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7ADCFB82640;
 Fri, 15 Dec 2023 21:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EEF4C433C8;
 Fri, 15 Dec 2023 21:01:42 +0000 (UTC)
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
X-Inumbo-ID: 27729c28-9b8d-11ee-98ea-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702674103;
	bh=LPqiB4gWftxzgmuGTpgcB+VxWM/1TXhAIWQUzdXycos=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rKOSWL7IS4QP5xaZcOeJbk9eYRPkpnvG/FeLfIaCCt9UZfJ6O5wOVP+b+tq9lTJ2d
	 +3k9l2acP7wWtYFU8Zo14KGgWaTstHHdxP6sF1ErBsy+7RRYKv/pRRg54o61aJ26l7
	 a4pDIyW7XOszBSTkyOoJii5wSCzxZXtLj/XrgQM/70oxI20zNYYoYabSohGTlPZkAV
	 Siu7HnUxaIlgx1f18EL3owMljyBD/U+pbyLIK+u4VzVzSZuPFqQsyJB4KKx4nwVBN9
	 8qz9YsZlFO0kWQuQAeDtQY+pHh3YTbrX1VXOcCMdLyUVfn836oRaObOrYyJU1ZXAaL
	 hw8OQNS67Wh1w==
Date: Fri, 15 Dec 2023 13:01:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, 
    "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, 
    "Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
In-Reply-To: <ZXwQ7BF9AxZPYPXQ@macbook>
Message-ID: <alpine.DEB.2.22.394.2312151114310.3175268@ubuntu-linux-20-04-desktop>
References: <BL1PR12MB5849B1BDCBECD73353413869E78EA@BL1PR12MB5849.namprd12.prod.outlook.com> <704cc051-7362-4691-a120-4effaf8dd1fc@suse.com> <BL1PR12MB584993E317AF28E675814FC6E78DA@BL1PR12MB5849.namprd12.prod.outlook.com> <917ef38b-5aec-4c6a-803c-c0b2dcc74454@suse.com>
 <BL1PR12MB58494259A9E37CD7133090D9E78CA@BL1PR12MB5849.namprd12.prod.outlook.com> <ZXrRG8oc25Do0Dnv@macbook> <390368e2-5f13-4bbf-8c07-4a05c04e9939@suse.com> <ZXrTwfzedFQLhxiQ@macbook> <alpine.DEB.2.22.394.2312141441020.3175268@ubuntu-linux-20-04-desktop>
 <6ba1feda-275a-43f1-911e-8a8596e100ff@suse.com> <ZXwQ7BF9AxZPYPXQ@macbook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1170783508-1702667762=:3175268"
Content-ID: <alpine.DEB.2.22.394.2312151116100.3175268@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1170783508-1702667762=:3175268
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2312151116101.3175268@ubuntu-linux-20-04-desktop>

On Fri, 15 Dec 2023, Roger Pau Monné wrote:
> On Fri, Dec 15, 2023 at 09:24:22AM +0100, Jan Beulich wrote:
> > On 14.12.2023 23:49, Stefano Stabellini wrote:
> > > On Thu, 14 Dec 2023, Roger Pau Monné wrote:
> > >> On Thu, Dec 14, 2023 at 10:58:24AM +0100, Jan Beulich wrote:
> > >>> On 14.12.2023 10:55, Roger Pau Monné wrote:
> > >>>> One way to bodge this would be to detect whether the caller of
> > >>>> XEN_DOMCTL_irq_permission is a PV or an HVM domain, and in case of HVM
> > >>>> assume the pirq field is a GSI.  I'm unsure however how that will work
> > >>>> with non-x86 architectures.
> > > 
> > > PIRQ is an x86-only concept. We have event channels but no PIRQs on ARM.
> > > I expect RISC-V will be the same.
> > > 
> > > 
> > >>>> It would  be better to introduce a new XEN_DOMCTL_gsi_permission, or
> > > 
> > > "GSI" is another x86-only concept.
> > 
> > Just to mention it - going through the ACPI spec, this looks to be an
> > arch-neutral ACPI term. It is also used in places which to me look
> > pretty Arm-centric.
> 
> Oh, indeed, they have retrofitted GSI(V?) for Arm also, as a way to have a
> "flat" uniform interrupt space.

Interesting, and I am not surprised. (I don't usually work with ACPI on
ARM because none of our boards come with ACPI, they are all Device
Tree.)


> So I guess Arm would also need the
> GSI type, unless the translation from GSI to SPI or whatever platform
> interrupt type is done by the guest and Xen is completely agnostic to
> GSIs (if that's even possible).

I am guessing that GSIs on ARM must be mapped 1:1 to SPIs otherwise we
would have severe inconsistencies between ACPI and DeviceTree booting
and some boards support both.

Also to answer your question about LPIs: those are MSIs on ARM.
--8323329-1170783508-1702667762=:3175268--


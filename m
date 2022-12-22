Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA0D653A31
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 01:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468148.727212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p89qN-0000GK-7R; Thu, 22 Dec 2022 00:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468148.727212; Thu, 22 Dec 2022 00:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p89qN-0000DR-4S; Thu, 22 Dec 2022 00:53:55 +0000
Received: by outflank-mailman (input) for mailman id 468148;
 Thu, 22 Dec 2022 00:53:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpfT=4U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p89qL-0000DJ-Eg
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 00:53:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19ad2451-8193-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 01:53:51 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7560761990;
 Thu, 22 Dec 2022 00:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDB9C433EF;
 Thu, 22 Dec 2022 00:53:47 +0000 (UTC)
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
X-Inumbo-ID: 19ad2451-8193-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671670429;
	bh=SBynUhkKtyDTorKB5vc5IeaXDEOFcRhTM3sPcT+h1qA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VDb+1j6ZVUU5rk+lgSJVwYQX+qyu3rGWC9p9AOebJo++5/sHDQLg8wLDMQL5UZerA
	 ZIClKLLfsRLrVI46cB20cqTjAHog0YsIHSrqEOnxErLngd8PVIWzrWzusfG9ztBv5Y
	 VXol3gmUAdMrad7vw1CiRMFohKCmgh+dMmWwwB0e7VgzFIGCAus0dyvjD7GerQyWxp
	 H3a84KPStqMEx+NvX5Q2i4VMOBxry/7nFBqms/M0hYRv/od8t+NGwH7na5bRxkqt1C
	 OLzPWmQQQs+bUhr5080C47wiqOpu2w0bnb8VOlqsJUQDEqvSEMGo8+GhdnYgqeMFVV
	 fqvpWHa1MAXyA==
Date: Wed, 21 Dec 2022 16:53:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Demi Marie Obenour <demi@invisiblethingslab.com>
cc: "Smith, Jackson" <rsmith@riversideresearch.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    "Brookes, Scott" <sbrookes@riversideresearch.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, 
    "jbeulich@suse.com" <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen
In-Reply-To: <Y6I3oqYdTKa/57I/@itl-email>
Message-ID: <alpine.DEB.2.22.394.2212211639070.4079@ubuntu-linux-20-04-desktop>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM> <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org> <BN0P110MB1642A6DCBD15780CD8767B8CCFE19@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM> <513d0cc3-a305-5029-32f7-67993ae83c55@xen.org>
 <alpine.DEB.2.22.394.2212151725090.315094@ubuntu-linux-20-04-desktop> <7a7a7156-138d-a53c-fb65-a210e14bd8c1@xen.org> <BN0P110MB16429FF1A9FF3507A684C5B2CFEA9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM> <Y6I3oqYdTKa/57I/@itl-email>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1351684491-1671670331=:4079"
Content-ID: <alpine.DEB.2.22.394.2212211652150.4079@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1351684491-1671670331=:4079
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2212211652151.4079@ubuntu-linux-20-04-desktop>

On Tue, 20 Dec 2022, Demi Marie Obenour wrote:
> On Tue, Dec 20, 2022 at 10:17:24PM +0000, Smith, Jackson wrote:
> > > Hi Stefano,
> > >
> > > On 16/12/2022 01:46, Stefano Stabellini wrote:
> > > > On Thu, 15 Dec 2022, Julien Grall wrote:
> > > >>>> On 13/12/2022 19:48, Smith, Jackson wrote:
> > > >>> Yes, we are familiar with the "secret-free hypervisor" work. As
> > you
> > > >>> point out, both our work and the secret-free hypervisor remove the
> > > >>> directmap region to mitigate the risk of leaking sensitive guest
> > > >>> secrets. However, our work is slightly different because it
> > > >>> additionally prevents attackers from tricking Xen into remapping a
> > > guest.
> > > >>
> > > >> I understand your goal, but I don't think this is achieved (see
> > > >> above). You would need an entity to prevent write to TTBR0_EL2 in
> > > >> order to fully protect it.
> > > >
> > > > Without a way to stop Xen from reading/writing TTBR0_EL2, we
> > > cannot
> > > > claim that the guest's secrets are 100% safe.
> > > >
> > > > But the attacker would have to follow the sequence you outlines
> > > above
> > > > to change Xen's pagetables and remap guest memory before
> > > accessing it.
> > > > It is an additional obstacle for attackers that want to steal other
> > > guests'
> > > > secrets. The size of the code that the attacker would need to inject
> > > > in Xen would need to be bigger and more complex.
> > >
> > > Right, that's why I wrote with a bit more work. However, the nuance
> > > you mention doesn't seem to be present in the cover letter:
> > >
> > > "This creates what we call "Software Enclaves", ensuring that an
> > > adversary with arbitrary code execution in the hypervisor STILL cannot
> > > read/write guest memory."
> > >
> > > So if the end goal if really to protect against *all* sort of
> > arbitrary 
> > > code,
> > > then I think we should have a rough idea how this will look like in
> > Xen.
> > >
> > >  From a brief look, it doesn't look like it would be possible to
> > prevent
> > > modification to TTBR0_EL2 (even from EL3). We would need to
> > > investigate if there are other bits in the architecture to help us.
> > >
> > > >
> > > > Every little helps :-)
> > >
> > > I can see how making the life of the attacker more difficult is 
> > > appealing.
> > > Yet, the goal needs to be clarified and the risk with the approach
> > > acknowledged (see above).
> > >
> > 
> > You're right, we should have mentioned this weakness in our first email.
> > Sorry about the oversight! This is definitely still a limitation that we
> > have not yet overcome. However, we do think that the increase in
> > attacker workload that you and Stefano are discussing could still be
> > valuable to security conscious Xen users.
> > 
> > It would nice to find additional architecture features that we can use
> > to close this hole on arm, but there aren't any that stand out to me
> > either.
> > 
> > With this limitation in mind, what are the next steps we should take to
> > support this feature for the xen community? Is this increase in attacker
> > workload meaningful enough to justify the inclusion of VMF in Xen?
> 
> Personally, I don’t think so.  The kinds of workloads VMF is usable
> for (no hypercalls) are likely easily portable to other hypervisors,
> including formally verified microkernels such as seL4 that provide... 

What other hypervisors might or might not do should not be a factor in
this discussion and it would be best to leave it aside.

From an AMD/Xilinx point of view, most of our customers using Xen in
productions today don't use any hypercalls in one or more of their VMs.
Xen is great for these use-cases and it is rather common in embedded.
It is certainly a different configuration from what most are come to
expect from Xen on the server/desktop x86 side. There is no question
that guests without hypercalls are important for Xen on ARM.

As a Xen community we have a long history and strong interest in making
Xen more secure and also, more recently, safer (in the ISO 26262
safety-certification sense). The VMF work is very well aligned with both
of these efforts and any additional burder to attackers is certainly
good for Xen.

Now the question is what changes are necessary and how to make them to
the codebase. And if it turns out that some of the changes are not
applicable or too complex to accept, the decision will be made purely
from a code maintenance point of view and will have nothing to do with
VMs making no hypercalls being unimportant (i.e. if we don't accept one
or more patches is not going to have anything to do with the use-case
being unimportant or what other hypervisors might or might not do).
--8323329-1351684491-1671670331=:4079--


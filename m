Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F0C6547DE
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 22:29:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468665.727832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8T7K-0003CE-9L; Thu, 22 Dec 2022 21:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468665.727832; Thu, 22 Dec 2022 21:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8T7K-00038r-6A; Thu, 22 Dec 2022 21:28:42 +0000
Received: by outflank-mailman (input) for mailman id 468665;
 Thu, 22 Dec 2022 21:28:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpfT=4U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p8T7I-00038k-7V
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 21:28:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97e016e5-823f-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 22:28:38 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5A7161981;
 Thu, 22 Dec 2022 21:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A9CC433D2;
 Thu, 22 Dec 2022 21:28:33 +0000 (UTC)
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
X-Inumbo-ID: 97e016e5-823f-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671744515;
	bh=SRfgRPAf3D0iRMLjGcKTGXItPuCQLHvzAFbVKLmvYcI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J282aAYLKMUPpR3Nb9YBsyyi5VOJEs+OOzjZo1uMVXDXJoFP9sHNJmWL77lH1IlPo
	 YLNKdMrcTOeRpSLMy86n0IgbHunjE7X0DXo4lrJV20JnfGFMYkHPyjgm3UAov3j7kr
	 NdZSsVVvMJ40etlONDzglU6KdolrO5cTOwqTTse4wnM5s+LB0h1DcM6LJ3IR5wsMwr
	 S+ji0oVnN2A4t76glnPfIPd8oRc6uzO/2E+ef+/2zDfNn145utBqOWtbJe+agsZkCl
	 ThU6HrNU5ZF/ByuhcYlv9nobw1XBY8GNekWafR0/Mvg/DaxXto6MDvIKJuU8e240n0
	 T20zj7b0L4foA==
Date: Thu, 22 Dec 2022 13:28:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Demi Marie Obenour <demi@invisiblethingslab.com>, 
    "Smith, Jackson" <rsmith@riversideresearch.org>, 
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
In-Reply-To: <af62bf3c-1046-3ed2-8662-e79375fe4794@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212221109220.4079@ubuntu-linux-20-04-desktop>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM> <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org> <BN0P110MB1642A6DCBD15780CD8767B8CCFE19@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM> <513d0cc3-a305-5029-32f7-67993ae83c55@xen.org>
 <alpine.DEB.2.22.394.2212151725090.315094@ubuntu-linux-20-04-desktop> <7a7a7156-138d-a53c-fb65-a210e14bd8c1@xen.org> <BN0P110MB16429FF1A9FF3507A684C5B2CFEA9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM> <Y6I3oqYdTKa/57I/@itl-email>
 <alpine.DEB.2.22.394.2212211639070.4079@ubuntu-linux-20-04-desktop> <af62bf3c-1046-3ed2-8662-e79375fe4794@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Dec 2022, Julien Grall wrote:
> > What other hypervisors might or might not do should not be a factor in
> > this discussion and it would be best to leave it aside.
> 
> To be honest, Demi has a point. At the moment, VMF is a very niche use-case
> (see more below). So you would end up to use less than 10% of the normal Xen
> on Arm code. A lot of people will likely wonder why using Xen in this case?

[...]

> >  From an AMD/Xilinx point of view, most of our customers using Xen in
> > productions today don't use any hypercalls in one or more of their VMs.
> This suggests a mix of guests are running (some using hypercalls and other
> not). It would not be possible if you were using VMF.

It is true that the current limitations are very restrictive.

In embedded, we have a few pure static partitioning deployments where no
hypercalls are required (Linux is using hypercalls today but it could do
without), so maybe VMF could be enabled, but admittedly in those cases
the main focus today is safety and fault tolerance, rather than
confidential computing.


> > Xen is great for these use-cases and it is rather common in embedded.
> > It is certainly a different configuration from what most are come to
> > expect from Xen on the server/desktop x86 side. There is no question
> > that guests without hypercalls are important for Xen on ARM. >
> > As a Xen community we have a long history and strong interest in making
> > Xen more secure and also, more recently, safer (in the ISO 26262
> > safety-certification sense). The VMF work is very well aligned with both
> > of these efforts and any additional burder to attackers is certainly
> > good for Xen.
> 
> I agree that we have a strong focus on making Xen more secure. However, we
> also need to look at the use cases for it. As it stands, there will no:
>   - IOREQ use (don't think about emulating TPM)
>   - GICv3 ITS
>   - stage-1 SMMUv3
>   - decoding of instructions when there is no syndrome
>   - hypercalls (including event channels)
>   - dom0
> 
> That's a lot of Xen features that can't be used. Effectively you will make Xen
> more "secure" for a very few users.

Among these, the main problems affecting AMD/Xilinx users today would be:
- decoding of instructions
- hypercalls, especially event channels

Decoding of instructions would affect all our deployments. For
hypercalls, even in static partitioning deployments, sometimes event
channels are used for VM-to-VM notifications.


> > Now the question is what changes are necessary and how to make them to
> > the codebase. And if it turns out that some of the changes are not
> > applicable or too complex to accept, the decision will be made purely
> > from a code maintenance point of view and will have nothing to do with
> > VMs making no hypercalls being unimportant (i.e. if we don't accept one
> > or more patches is not going to have anything to do with the use-case
> > being unimportant or what other hypervisors might or might not do).
> I disagree, I think this is also about use cases. On the paper VMF look very
> great, but so far it still has a big flaw (the TTBR can be changed) and it
> would restrict a lot what you can do.

We would need to be very clear in the commit messages and documentation
that with the current version of VMF we do *not* achieve confidential
computing and we do *not* offer protections comparable to AMD SEV. It is
still possible for Xen to access guest data, it is just a bit harder.

From an implementation perspective, if we can find a way to implement it
that would be easy to maintain, then it might still be worth it. It
would probably take only a small amount of changes on top of the "Remove
the directmap" series to make it so "map_domain_page" doesn't work
anymore after boot.

That might be worth exploring if you and Jackson agree?


One thing that would make it much more widely applicable is your idea of
hypercalls bounce buffers. VMF might work with hypercalls if the guest
always uses the same buffer to pass hypercalls parameters to Xen. That
one buffer could remain mapped in Xen for the lifetime of the VM and the
VM would know to use it only to pass parameters to Xen.


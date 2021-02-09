Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B543145EA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 02:58:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83112.153922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9IH4-0002fS-6N; Tue, 09 Feb 2021 01:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83112.153922; Tue, 09 Feb 2021 01:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9IH3-0002fA-VD; Tue, 09 Feb 2021 01:57:05 +0000
Received: by outflank-mailman (input) for mailman id 83112;
 Tue, 09 Feb 2021 01:57:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l9IH2-0002f5-St
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 01:57:04 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0067784a-622d-4f5d-9d0e-7b17c00bbf6a;
 Tue, 09 Feb 2021 01:57:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0EA364E42;
 Tue,  9 Feb 2021 01:57:02 +0000 (UTC)
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
X-Inumbo-ID: 0067784a-622d-4f5d-9d0e-7b17c00bbf6a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612835823;
	bh=02b2E+kJvjn8yZRseo4go7BFG3EU9dBxTtARIjhIxr4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qFF++4z4UUmZDHvJBylzM43zRL+EcOG2ygmr7so6gpFXmfEyre/4Lk+rpU63JhYtn
	 m4d5xp8u3tx9vlzD5IKb5VgyB9Ip1DF6G1sQmchRJr4nhbMJVoU3I78mQ1i1y4iFnq
	 +kkxRj3cDPAEQfxgSBXct3vyJRsSrtMbA6PoaLfog0kYCEFMZcfwKTfvL1xKjcD4/j
	 7doXfn4rUG/Skx9j3eK+XVmk242+a195KAle41z2HnHGO/uILwn1wKVz9sa6tno9i7
	 2uIpgoBbrY6O0DgrwZcfoxADY8+cuzDF4HZkKeE87AanzsHhiroqIF6IkP7NT4/1IN
	 9+UTVBZzgklnw==
Date: Mon, 8 Feb 2021 17:57:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall.oss@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, lucmiccio@gmail.com, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Rahul Singh <Rahul.Singh@arm.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
In-Reply-To: <CAJ=z9a3uhiFKE6gepaPvWZxqRErCyLiv2CTDSx3Sihef7CaMtQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2102081556480.8948@sstabellini-ThinkPad-T480s>
References: <20210208184932.23468-1-sstabellini@kernel.org> <173ed75a-94cf-26a5-9271-a687bf201578@xen.org> <alpine.DEB.2.21.2102081214010.8948@sstabellini-ThinkPad-T480s> <CAJ=z9a3uhiFKE6gepaPvWZxqRErCyLiv2CTDSx3Sihef7CaMtQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Feb 2021, Julien Grall wrote:
> On Mon, 8 Feb 2021 at 20:24, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > > @Ian, I think this wants to go in 4.15. Without it, Xen may receive an IOMMU
> > > fault for DMA transaction using granted page.
> > >
> > > > Backport: 4.12+
> > > >
> > > > ---
> > > >
> > > > Given the severity of the bug, I would like to request this patch to be
> > > > backported to 4.12 too, even if 4.12 is security-fixes only since Oct
> > > > 2020.
> > >
> > > I would agree that the bug is bad, but it is not clear to me why this would be
> > > warrant for an exception for backporting. Can you outline what's the worse
> > > that can happen?
> > >
> > > Correct me if I am wrong, if one can hit this error, then it should be pretty
> > > reliable. Therefore, anyone wanted to use 4.12 in production should have seen
> > > if the error on there setup by now (4.12 has been out for nearly two years).
> > > If not, then they are most likely not affected.
> > >
> > > Any new users of Xen should use the latest stable rather than starting with an
> > > old version.
> >
> > Yes, the bug reproduces reliably but it takes more than a smoke test to
> > find it. That's why it wasn't found by OSSTest and also our internal
> > CI-loop at Xilinx.
> 
> Ok. So a user should be able to catch it during testing, is that correct?

Yes, probably. The failure is that PV drivers do not work (they trigger
the IOMMU fault), specifically PV network and block, maybe others too.

I think it is unlikely but possible that an hardware update would also
trigger the bug. For instance, a change of the network card might
trigger the bug, if the previous network card driver was always bouncing
requests on bounce buffers, while the new drivers uses the provided
memory pages directly. I don't know how realistic this scenario is.


> > Users can be very slow at upgrading, so I am worried that 4.12 might still
> > be picked by somebody, especially given that it is still security
> > supported for a while.
> 
> Don't tell me about upgrading Xen... ;) But I am a bit confused, are
> you worried about existing users or new users?

I am mostly worried about people that start using 4.12.

If a user was already on 4.12 and not seeing any errors, they are
unlikely to see this error. It would only happen if:
- they didn't use PV drivers before, and they want to start using PV
  drivers now
- they are upgrading hardware (not sure how likely to happen, see above)


> > > Other than the seriousness of the bug, I think there is also a fairness
> > > concern.
> > >
> > > So far our rules says there is only security support backport allowed. If we
> > > start granting exception, then we need a way to prevent abuse of it. To take
> > > an extreme example, why one couldn't ask backport for 4.2?
> > >
> > > That said, I vaguely remember this topic was brought up a few time on
> > > security@. So maybe it is time to have a new discussion about stable tree.
> >
> > I wouldn't consider a backport for a tree that is closed even for
> > security backports. So in your example, I'd say no to a backport to 4.2
> > or 4.10.
> >
> > I think there is a valid question for trees that are still open to
> > security fixes but not general backports.
> >
> > For these cases, I would just follow a simple rule of thumb:
> 
> Aren't those rules already used for stable trees?

No, I don't think so. Backports are done by Jan and me, not by the
submitter (in this case I am the submitter but it is a coincidence :-)
If a commit is fixing a genuine bug and the backport doesn't cause
issues, then it is typically done. Here the bar should be certainly
higher, both in terms of low-risk, and importance of the bug to fix.



> > - is the submitter willing to provide the backport?
> > - is the backport low-risk?
> > - is the underlying bug important?
> 
> You wrote multiple times that this is serious but it is still not
> clear what's the worse that can happen...

PV drivers don't work: each data transfer involving granted pages causes
an IOMMU fault.


> > If the answer to all is "yes" then I'd go with it.
> >
> >
> > In this case, given that the fix is a one-liner, and obviously correct,
> 
> I have seen one-liners that introduced XSA in the past ;).
 
Sure but this is a revert to the pre-4.12 implementation.


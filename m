Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000EF5A0585
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 03:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392998.631690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR1OW-0001o6-Fo; Thu, 25 Aug 2022 01:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392998.631690; Thu, 25 Aug 2022 01:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR1OW-0001lF-Bu; Thu, 25 Aug 2022 01:10:52 +0000
Received: by outflank-mailman (input) for mailman id 392998;
 Thu, 25 Aug 2022 01:10:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SRxw=Y5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oR1OU-0001kK-Ry
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 01:10:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0dd07c2-2412-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 03:10:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7F0A61AC0;
 Thu, 25 Aug 2022 01:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB99C433C1;
 Thu, 25 Aug 2022 01:10:46 +0000 (UTC)
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
X-Inumbo-ID: c0dd07c2-2412-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661389847;
	bh=IW58bnoT+ISjkhWRCgoI4VIxvwyqKqmLdyO9QUhxxIM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G+5iByfzlQzre+9kdeIbk/+YG/yjc6F7fhVo6DdRA1ihXJRQtDmoHWzxJdyRrA6pw
	 ZW6wTUmfI0z+UHvezClPi08uSKfW1t2GuiljcLrMzyyAGtSsuXxzL/ae0+23dVBYC6
	 /PwdfaSUEtnZsBaBVUzQNQ+ZTAtKVN7gLjmHox77ec9HLnXrYTtImxoHCaotQahtcH
	 JhMQHdcnLkXku3Gg+2WPVwuN6hQt4So0Bg0VZe7y5Phtf3H483USuz8SbZusxmlurc
	 8Fjp2uJhGRbKwT9GgSD0n6eT9n5Rt3mFnMAKdxlEqu2Gm80quib5tedwVBzncxU8Hy
	 9cxesPxn7zRoQ==
Date: Wed, 24 Aug 2022 18:10:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Rahul Singh <Rahul.Singh@arm.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property
 value
In-Reply-To: <da07bb5d-98c3-9c94-a1f0-6021e398f898@xen.org>
Message-ID: <alpine.DEB.2.22.394.2208241810390.15247@ubuntu-linux-20-04-desktop>
References: <cover.1660902588.git.rahul.singh@arm.com> <2fb69ff7cf9a36dd1294da4f9f4b968ff7076d42.1660902588.git.rahul.singh@arm.com> <d5ed6097-8a08-eb4d-35a0-ab28f82b881f@xen.org> <1E823DBF-8576-4E26-B12D-B69CE581F36F@arm.com> <c9330b72-193c-5478-9bad-9593ac7398a9@xen.org>
 <3D33311C-5FBA-4C46-A18F-105DE814C306@arm.com> <685e53cc-1b83-8d66-7086-dad4135c0587@xen.org> <474E0887-7EFC-4A0C-9815-DFBDAE9A93A9@arm.com> <alpine.DEB.2.22.394.2208241439220.15247@ubuntu-linux-20-04-desktop>
 <da07bb5d-98c3-9c94-a1f0-6021e398f898@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-140747958-1661389024=:15247"
Content-ID: <alpine.DEB.2.22.394.2208241758310.15247@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-140747958-1661389024=:15247
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2208241758311.15247@ubuntu-linux-20-04-desktop>

On Wed, 24 Aug 2022, Julien Grall wrote:
> On 24/08/2022 22:59, Stefano Stabellini wrote:
> > On Wed, 24 Aug 2022, Rahul Singh wrote:
> > > > On 24 Aug 2022, at 4:36 pm, Julien Grall <julien@xen.org> wrote:
> > > > On 24/08/2022 15:42, Rahul Singh wrote:
> > > > > > On 24 Aug 2022, at 1:59 pm, Julien Grall <julien@xen.org> wrote:
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > On 24/08/2022 13:15, Rahul Singh wrote:
> > > > > > > Hi Julien,
> > > > > > 
> > > > > > Hi Rahul,
> > > > > > 
> > > > > > > Please let me know your view on this.
> > > > > > > diff --git a/xen/arch/arm/domain_build.c
> > > > > > > b/xen/arch/arm/domain_build.c
> > > > > > > index bfe7bc6b36..a1e23eee59 100644
> > > > > > > --- a/xen/arch/arm/domain_build.c
> > > > > > > +++ b/xen/arch/arm/domain_build.c
> > > > > > > @@ -3562,12 +3562,7 @@ static int __init construct_domU(struct
> > > > > > > domain *d,
> > > > > > >     if ( rc == -EILSEQ ||
> > > > > > >       rc == -ENODATA ||
> > > > > > >       (rc == 0 && !strcmp(dom0less_enhanced, “enabled”)) )
> > > > > > > -  {
> > > > > > > -    if ( hardware_domain )
> > > > > > >         kinfo.dom0less_enhanced = true;
> > > > > > > -    else
> > > > > > > -      panic(“Tried to use xen,enhanced without dom0\n”);
> > > > > > > -  }
> > > > > > 
> > > > > > You can't use "xen,enhanced" without dom0. In fact, you will end up
> > > > > > to dereference NULL in alloc_xenstore_evtchn(). That's because
> > > > > > "xen,enhanced" means the domain will be able to use Xenstored.
> > > > > > 
> > > > > > Now if you want to support your feature without a dom0. Then I think
> > > > > > we want to introduce an option which would be the same as
> > > > > > "xen,enhanced" but doesn't expose Xenstored.
> > > > > If we modify the patch as below we can use the "xen,enhanced" for
> > > > > domUs without dom0.
> > > > > I tested the patch and its works fine. Do you see any issue with this
> > > > > approach?
> > > > 
> > > > Yes. For two reasons:
> > > > 1) It is muddying the meaning of "xen,enhanced". In particular a user
> > > > may not realize that Xenstore is not available if dom0 is not present.
> > > > 2) It would be more complicated to handle the case where Xenstored lives
> > > > in a non-dom0 domain. I am not aware of anyone wanting this on Arm yet,
> > > > but I don't want to close the door.
> > > > 
> > > > So if you want to support create "xen,xen" without all the rest. Then I
> > > > think we need a different property value. I don't have a good suggestion
> > > > for the name.
> > > 
> > > Is that okay if we use the earlier approach, when user set  "xen,enhanced
> > > = evtchn” we will not call alloc_xenstore_evtchn()
> > > but we create hypervisor node with all fields.
> > 
> > Thinking more about this, today xen,enhanced has the implication that:
> > 
> > - the guest will get a regular and complete "xen,xen" node in device tree
> > - xenstore and PV drivers will be available (full Xen interfaces support)
> > 
> > We don't necessarely imply that dom0 is required (from a domU point of
> > view) but we do imply that xenstore+evtchn+gnttab will be available to
> > the domU.
> > 
> > Now, static event channels are different. They don't require xenstore
> > and they don't require gnttab.
> > 
> > It is as if the current xen,enhanced node actually meant:
> > 
> >    xen,enhanced = "xenstore,gnttab,evtchn";
> 
> Correct.
> 
> > 
> > and now we are only enabling a subset:
> > 
> >    xen,enhanced = "evtchn";
> > 
> > Is that a correct understanding?
> 
> Yes with some cavears (see below).
> 
> > 
> > 
> > If so, we can clarify that:
> > 
> >    xen,enhanced;
> > 
> > it is a convenient shortend for:
> > 
> >    xen,enhanced = "xenstore,gnttab,evtchn";
> > 
> > and that other combinations are also acceptable, e.g.:
> > 
> >    xen,enhanced = "gnttab";
> >    xen,enhanced = "evtchn";
> >    xen,enhanced = "evtchn,gnttab";
> > 
> > It is OK to panic if the user specifies an option that is currently
> > unsupported (e.g. "gnttab").
> 
> So today, if you create the node "xen,xen", the guest will expect to be able
> to use both grant-table and event channel.
> 
> Therefore, in the list above, the only configuration we can sensibly support
> without any major rework is "evtchn,gnttab".
> 
> If we want to support "evtchn" or "gnttab" only. Then we likely need to define
> a new binding (or new version) because neither "regs" nor "interrupts" are
> optional (although a guest OS is free to ignore them).

Yes I think you are right. I also broadly agree with the rest of your
reply.

Thinking about it and given the above, we only need 2 "levels" of
enhancement:

1) everything: xenstore, gnttab, evtchn
2) gnttab, evtchn, but not xenstore

Nothing else is really possible because, as Julien pointed out,
"xen,enhanced" implies the xen,xen node in the domU device tree and in
turn that node implies both evtchn and gnttab.

xenstore is separate and is detected using HVM_PARAM_STORE_EVTCHN and
HVM_PARAM_STORE_PFN anyway.

So I think we just need to add a way to express 2). We could do
something like:

  xen,enhanced = "evtchn,gnttab";

Or we could use a new separate option like Julien initially suggested,
e.g.:

  xen,enhanced-no-xenstore;

"xen,enhanced-no-xenstore" is a terrible name actually, but just to
explain what I am thinking :-)
--8323329-140747958-1661389024=:15247--


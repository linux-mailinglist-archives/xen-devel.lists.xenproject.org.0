Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E418525829
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 01:17:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328034.550926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npI31-0001Ax-9g; Thu, 12 May 2022 23:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328034.550926; Thu, 12 May 2022 23:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npI31-00018K-5h; Thu, 12 May 2022 23:16:43 +0000
Received: by outflank-mailman (input) for mailman id 328034;
 Thu, 12 May 2022 23:16:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rM9=VU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npI2z-00018E-MK
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 23:16:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9354a33c-d249-11ec-8fc4-03012f2f19d4;
 Fri, 13 May 2022 01:16:40 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 41EF9610A5;
 Thu, 12 May 2022 23:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38379C34114;
 Thu, 12 May 2022 23:16:37 +0000 (UTC)
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
X-Inumbo-ID: 9354a33c-d249-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652397397;
	bh=s/rzbW9qBEqEEnqhDUwKHh2amYGm06i9S6GEVd9VL84=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tm6wQQ4Hs6tGQ4j08oop8zlF1d0zfheVBBEuZ1n0M6ZNeRVbfFoPjTYbXKa30j5iT
	 ikPhkjzole/ZHFBjyHzZkXp/zKYIORVE7VON3vT2nK83G4+K/3OMNuo8QJvhqdkyc/
	 ptCZ1Ava6Iu1m2he+YhK/RBcwcP27PgrNwPUIoitKiqv527W3uHhBUcN4yU8Cxdo+O
	 FUbnQnzO4uyHN890gReGaoHI752dKA4x05FXVTEaZPhr1sF50YEzT2eN6pca4fi6oh
	 RcyW/RHU7HkW5hCEAm2Ub2oPtEiu7YY+i3F664zD6NS9bh8l/ZoelyUOqnRQYsUNI2
	 TaTg2Y94YpVLA==
Date: Thu, 12 May 2022 16:16:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] xen/evtchn: Add design for static event channel
 signaling
In-Reply-To: <B82F2F0B-9C83-4180-A0A7-E05A1C85A2C1@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205121615380.3842@ubuntu-linux-20-04-desktop>
References: <10d83478f116c923271a6c2f7d413f6ec117598d.1651685393.git.rahul.singh@arm.com> <cd402709-619f-7189-3d95-fea4ad6bf637@xen.org> <A06FC2FB-56CF-4DB6-BF59-7F2CECA0C9D9@arm.com> <c072bd96-eede-5c8b-49f4-302600829862@xen.org>
 <B82F2F0B-9C83-4180-A0A7-E05A1C85A2C1@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1003058993-1652397398=:3842"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1003058993-1652397398=:3842
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 12 May 2022, Rahul Singh wrote:
> > On 12 May 2022, at 9:56 am, Julien Grall <julien@xen.org> wrote:
> > 
> > Hi Rahul,
> > 
> > On 11/05/2022 15:32, Rahul Singh wrote:
> >>> On 10 May 2022, at 1:32 pm, Julien Grall <julien@xen.org> wrote:
> >>>> +domain may toggle masked bits in the masked bit field and should clear the
> >>>> +pending bit when an event has been processed
> >>>> +
> >>>> +Events are received by a domain via an interrupt from Xen to the domain,
> >>>> +indicating when an event arrives (setting the bit). Further notifications are
> >>>> +blocked until the bit is cleared again. Events are delivered asynchronously to
> >>>> +a domain and are enqueued when the domain is not running.
> >>>> +More information about FIFO based event channel can be found at:
> >>> 
> >>> I think the explanation is fine for a design proposal. If you want to use it as documentation, then I would suggest to clarify there are two different ABI for event channel: FIFO and 2L.
> >>> 
> >>> 2L is the easiest one to implement and for embedded we may want to steer the users towards it.
> >> I will rephrase the sentence as below:
> >> Xen supports two different ABI for event channel FIFO and 2L. More information about FIFO based event channel can be found at:
> > 
> > I think it is a bit strange to point to the FIFO doc but not the 2L (the explanantion above is not really for 2L). If there are no doc for the latter, then I would possibly drop the link.
> 
> Ack.
> 
> > 
> >>>> +The event channel sub-node has the following properties:
> >>>> +
> >>>> +- compatible
> >>>> +
> >>>> + "xen,evtchn"
> >>>> +
> >>>> +- xen,evtchn
> >>>> +
> >>>> + The property is tuples of two numbers
> >>>> + (local-evtchn link-to-foreign-evtchn) where:
> >>>> +
> >>>> + local-evtchn is an integer value that will be used to allocate local port
> >>>> + for a domain to send and receive event notifications to/from the remote
> >>>> + domain.
> >>> Port 0 is reserved and both FIFO/2L have limit on the port numbers.
> >>> 
> >>> I think we should let know the users about those limitations but I am not sure whether the binding is the right place for that.
> >> If you are okay I can add this limitation in this design doc.
> > 
> > Design docs are generally for developper of Xen rather than the end users. I am OK if you want to add the limitations in this design doc so long we have another easy way for the user to find out the limits.
> > 
> > This could be end users documentation and/or message in Xen. Note that 2L has a lower limit and we don't know in advance what the guest will use. So we may have to assume the lower limit (4096) which should be plenty for embedded :)
> 
> I am planning to explain the static event-channel subnode in "docs/misc/arm/device-tree/booting.txt” [1]. I will include the limitation also at the same time.
> 
> @Stefano:  I need confirmation from you also, is that okay to add new property value  "xen,enhanced = evtchn” to only 
> enable event-channel interface for dom0less domUs. make_hypervisor_node() will set the evtchn PPI interrupts  property only if "xen,enhanced = evtchn” is set.
> 
> If "xen,enhanced" with an empty string (or with the value "enabled”) is set make_hypervisor_node() will set the grant table, extended region and PPI interrupt property.
>  
> [1] http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/device-tree/booting.txt;h=7b4a29a2c293d16e9280a24789bc3b5262a367f6;hb=HEAD#l238

I think that's OK
--8323329-1003058993-1652397398=:3842--


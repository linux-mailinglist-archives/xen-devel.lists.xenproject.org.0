Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFA04421FD
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 21:52:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219409.380198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mheHG-0000Wz-Qx; Mon, 01 Nov 2021 20:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219409.380198; Mon, 01 Nov 2021 20:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mheHG-0000VD-NC; Mon, 01 Nov 2021 20:51:34 +0000
Received: by outflank-mailman (input) for mailman id 219409;
 Mon, 01 Nov 2021 20:51:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0c/y=PU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mheHF-0000V7-9t
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 20:51:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1df101f-df81-47d3-a19d-8105009942e1;
 Mon, 01 Nov 2021 20:51:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 918856052B;
 Mon,  1 Nov 2021 20:51:31 +0000 (UTC)
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
X-Inumbo-ID: b1df101f-df81-47d3-a19d-8105009942e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635799891;
	bh=xRA/du3TrrG1eT2sD/Os5sp5VKq1LP6A0qmI7SEyeN0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fBf6nwK1W0+aRYWf0817LYiglpKoRLPN49f4elHf2XdVJTSCRg4A7nUGvYsuG6vEN
	 q6PpmcnONYT2c3LpMH1R/Cltt6RimoQMRNGs6p56kA0YYEf4rOUgl7IvhhbZZQAdpS
	 fCnVRvjBNxKUOq6PyiPg8OGYjZHPpzNBxO7drTSG4kgMzD+BtDBS0c61PnttesR26K
	 EU8SrSwCoX1HmH2uCb1UZ8Qy1ce6LwHMbuaNgOu3tSPypkt0kY242fV7nYVN0dBw8Q
	 5OBqLe8ith1ZpGyfIVYg0qqVLQAbGl43ccoXFjktW1rEqfZxo2I7U52+DMSdLUFtfG
	 AJnBvWRg1yr3g==
Date: Mon, 1 Nov 2021 13:51:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <iwj@xenproject.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Julien Grall <julien.grall.oss@gmail.com>, 
    Michal Orzel <michal.orzel@arm.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a
 lock
In-Reply-To: <24959.49895.14808.77881@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2111011341480.20134@sstabellini-ThinkPad-T480s>
References: <20211026122903.15042-1-michal.orzel@arm.com> <e5632a4e-db98-41b4-1045-2b3532c098fa@xen.org> <70c30a6c-b779-805e-079a-41bb484894b9@xen.org> <cb452c0c-ccde-7798-c403-f972b48a2c46@arm.com> <01545115-e82e-2a9d-a8e4-da9676080c0f@xen.org>
 <alpine.DEB.2.21.2110271557570.20134@sstabellini-ThinkPad-T480s> <CAJ=z9a2SSgG7a87_xTGT5LeNLgubOLQf1+dbnrsTsP8_p5ErJg@mail.gmail.com> <alpine.DEB.2.21.2110271658330.20134@sstabellini-ThinkPad-T480s> <4554621d-63da-ea3e-e56a-4e01d0cef347@xen.org>
 <alpine.DEB.2.21.2110281311030.20134@sstabellini-ThinkPad-T480s> <24959.49895.14808.77881@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 1 Nov 2021, Ian Jackson wrote:
> Stefano Stabellini writes ("Re: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a lock"):
> > In regards to this specific patch and also the conversation about 4.16
> > or 4.17: I think it would be fine to take this patch in 4.16 in its
> > current form. Although it is not required because PCI passthrough is
> > not going to be complete in 4.16 anyway, I like that this patch makes
> > the code consistent in terms of protection of rbtree accesses.  With
> > this patch the arm_smmu_master rbtree is consistently protected from
> > concurrent accesses. Without this patch, it is sometimes protected and
> > sometimes not, which is not great.
> 
> It sounds like this is a possible latent bug, or at least a bad state
> of the code that might lead to the introduction of bad bugs later.
> 
> So I think I understand the upside.
> 
> > So I think that is something that could be good to have in 4.16. But
> > like you said, the patch is not strictly required so it is fine either
> > way.
> 
> Can you set out the downside for me too ?  What are the risks ?  How
> are the affected code paths used in 4.16 ?
> 
> A good way to think about this is: if taking this patch for 4.16
> causes problems, what would that look like ?

The patch affects the SMMU code paths that are currently in-use for
non-PCI devices which are currently supported. A bug in this patch could
cause a failure to setup the SMMU for one or more devices. I would
imagine that it would manifest probably as either an error or an hang
(given that it is adding spin locks) early at boot when the SMMU is
configured.

The validation of this patch would mostly happen by review: it is the
kind of patch that changes some "return -1" into "goto err".


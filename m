Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5212FDAE6
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 21:35:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71762.128779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2KCd-0006du-Md; Wed, 20 Jan 2021 20:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71762.128779; Wed, 20 Jan 2021 20:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2KCd-0006dV-J7; Wed, 20 Jan 2021 20:35:43 +0000
Received: by outflank-mailman (input) for mailman id 71762;
 Wed, 20 Jan 2021 20:35:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VeX=GX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l2KCc-0006dP-BI
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 20:35:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6374a27c-e265-47e2-affb-3b17911f6ae4;
 Wed, 20 Jan 2021 20:35:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7361233FC;
 Wed, 20 Jan 2021 20:35:39 +0000 (UTC)
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
X-Inumbo-ID: 6374a27c-e265-47e2-affb-3b17911f6ae4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611174940;
	bh=SaXBM97cW5QzJLYebR3DQBnLdnz8dM9embwkf5b6nEg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V8QrYkvlOP0LWLMht1XEvXcpUs8uxyh3SKK53GkdBY0lXtOiEtT37rxafaTlkAJ6N
	 VjtrrFKevyRwvxcKYrj/ddLLGLoGYlih2sCk52CIJaQQpVJzoHDtWdxWjEzX4F8iT0
	 QdDTG0WkdjLX3cBSXc6tgQJPtkCj2O/TMUxOSmDl58GeM/m7gX9VNaxOKlkiOqjpqm
	 eYZzH4k+mpiIPGWp8Is0WkIqW+LLBPL8Of6qT5Mow/ZYqNoVIR4nTncUCU/H4U3N8z
	 Pzx4E4/MMQFLSmTDjVyy6joi6+OgVUED5b5En6gP52I0hFKgoRSj9o5B9i9BKo29QG
	 m8vIyX3gkcqvw==
Date: Wed, 20 Jan 2021 12:35:39 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org, 
    Julien Grall <julien.grall@arm.com>, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V4 23/24] libxl: Introduce basic virtio-mmio support on
 Arm
In-Reply-To: <58c9da23-ef6a-1d33-b2ec-30e3425da2f3@xen.org>
Message-ID: <alpine.DEB.2.21.2101201234440.14528@sstabellini-ThinkPad-T480s>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-24-git-send-email-olekstysh@gmail.com> <25b62097-9ea9-31f3-0f8f-92a7f0d01d7c@xen.org> <51d44085-f178-3985-9324-da6494cd9d2e@gmail.com>
 <58c9da23-ef6a-1d33-b2ec-30e3425da2f3@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Jan 2021, Julien Grall wrote:
> > > > +#define GUEST_VIRTIO_MMIO_SIZE xen_mk_ullong(0x200)
> > > 
> > > AFAICT, the size of the virtio mmio region should be 0x100. So why is it
> > > 0x200?
> > 
> > 
> > I didn't find the total size requirement for the mmio region in virtio
> > specification v1.1 (the size of control registers is indeed 0x100 and
> > device-specific configuration registers starts at the offset 0x100, however
> > it's size depends on the device and the driver).
> > 
> > kvmtool uses 0x200 [1], in some Linux device-trees we can see 0x200 [2]
> > (however, device-tree bindings example has 0x100 [3]), so what would be the
> > proper value for Xen code?
> 
> Hmm... I missed that fact. I would say we want to use the biggest size
> possible so we can cover most of the devices.
> 
> Although, as you pointed out, this may not cover all the devices. So maybe we
> want to allow the user to configure the size via xl.cfg for the one not
> conforming with 0x200.
> 
> This could be implemented in the future. Stefano/Ian, what do you think?

I agree it could be implemented in the future. For now, I would pick
0x200.


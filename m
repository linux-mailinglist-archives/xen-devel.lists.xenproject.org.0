Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B954F51B142
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 23:41:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321018.542035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmMk3-0006gx-5C; Wed, 04 May 2022 21:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321018.542035; Wed, 04 May 2022 21:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmMk3-0006e8-0t; Wed, 04 May 2022 21:41:03 +0000
Received: by outflank-mailman (input) for mailman id 321018;
 Wed, 04 May 2022 21:41:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rf0=VM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nmMk0-0006dm-TW
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 21:41:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2c41d7f-cbf2-11ec-a406-831a346695d4;
 Wed, 04 May 2022 23:40:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5926F6198D;
 Wed,  4 May 2022 21:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A383C385A5;
 Wed,  4 May 2022 21:40:57 +0000 (UTC)
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
X-Inumbo-ID: e2c41d7f-cbf2-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651700457;
	bh=UAjJyX/lpnZbUpWnQUB7nZzIjLfz62Xr9MhId9sEZ7E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rZDsvS/NZ8oMcvzXShzVceRe8f9ecNqb1KhzqOB3XaZLavRbdY4JjzB82o4NatXdF
	 CIZArqv1VSzdVQLwgyPrqAG90bADo5MsDkiR6nUnlmSj3SzLgvXCBKaojlyxCVjdIN
	 FMnVztkuhjjCNbQgw5s+EeA7sXOKDXgjCO/Toib3ctsMZ+btEVJCPHId3Lz3RJoiJn
	 LF9et2IVUyAuGtdi0sNSFpjDRUwh1pdAHflVBmHIuuTTWaxTseXsdVKGDzIEMRwc5U
	 08Dq2LFVvEVaLFLLJNQvv6dzFyRR0eE4MVShFydHjU6dByv5fr5S0DXW/hQ4rjjbyV
	 3+WlEc9wHknyQ==
Date: Wed, 4 May 2022 14:40:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: Jens Wiklander <jens.wiklander@linaro.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] optee: immediately free RPC buffers that are released
 by OP-TEE
In-Reply-To: <8735hpm5ly.fsf@epam.com>
Message-ID: <alpine.DEB.2.22.394.2205041440470.43560@ubuntu-linux-20-04-desktop>
References: <287f81d7cec66b5ef1f8f3f61679b9593e2b81d4.1651643156.git.jens.wiklander@linaro.org> <8735hpm5ly.fsf@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 May 2022, Volodymyr Babchuk wrote:
> Hello Jens,
> 
> Jens Wiklander <jens.wiklander@linaro.org> writes:
> 
> > This commit fixes a case overlooked in [1].
> >
> > There are two kinds of shared memory buffers used by OP-TEE:
> > 1. Normal payload buffer
> > 2. Internal command structure buffers
> >
> > The internal command structure buffers are represented with a shadow
> > copy internally in Xen since this buffer can contain physical addresses
> > that may need to be translated between real physical address and guest
> > physical address without leaking information to the guest.
> >
> > [1] fixes the problem when releasing the normal payload buffers. The
> > internal command structure buffers must be released in the same way.
> > Failure to follow this order opens a window where the guest has freed
> > the shared memory but Xen is still tracking the buffer.
> >
> > During this window the guest may happen to recycle this particular
> > shared memory in some other thread and try to use it. Xen will block
> > this which will lead to spurious failures to register a new shared
> > memory block.
> >
> > Fix this by freeing the internal command structure buffers first before
> > informing the guest that the buffer can be freed.
> >
> > [1] 5b13eb1d978e ("optee: immediately free buffers that are released by OP-TEE")
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> 
> Thank you for the fix:
> 
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

committed with a small code syle fix


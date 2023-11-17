Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D0A7EEA7D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 01:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634785.990285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3nBU-0002R7-65; Fri, 17 Nov 2023 00:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634785.990285; Fri, 17 Nov 2023 00:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3nBU-0002Oo-3Q; Fri, 17 Nov 2023 00:58:12 +0000
Received: by outflank-mailman (input) for mailman id 634785;
 Fri, 17 Nov 2023 00:58:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5d38=G6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r3nBS-0002Oi-M1
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 00:58:10 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ef45a93-84e4-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 01:58:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DAD38CE1F93;
 Fri, 17 Nov 2023 00:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B51C433C7;
 Fri, 17 Nov 2023 00:58:02 +0000 (UTC)
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
X-Inumbo-ID: 5ef45a93-84e4-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700182684;
	bh=iSCe/NlY/cwE44CdQs/W5hA5o6eEHNFKZrLovXzk6F4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nl/lV/dfTZ5j1dfCXgT4WVUdQQvAOb3uwAVZMUKz0c784z6PK3bmzf4Sz2aAIm5rg
	 kMEfz9WqdQu1z+LEZbb2wWOetshNZvWXUbQjOZajexQHUPT3JljUcuIiYVKVWt0GoZ
	 EApEYp4htdqVreXGPU9x3X/aPVZXahUEj+hBV4X3swoq3g0QwybZBRM/mzbWRj8CsR
	 Mcqk6KWJyzhsb571Kw1TiKfS7XlHDDBn7dshgaiFMt7IznDteLMTkNmG2ADMFflXhh
	 sF4VCG8+SzIvNqce6O5Q1LbBn+b3cR89+LGHuF1AFumbRwKrYGhspDw3xWwNxBxAKs
	 DnE2y8pefgTWg==
Date: Thu, 16 Nov 2023 16:58:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
In-Reply-To: <87o7ft44bv.fsf@epam.com>
Message-ID: <alpine.DEB.2.22.394.2311161651090.773207@ubuntu-linux-20-04-desktop>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com> <20231012220854.2736994-14-volodymyr_babchuk@epam.com> <d6a58e73-da51-40f1-a2f7-576274945585@xen.org> <alpine.DEB.2.22.394.2311161513210.773207@ubuntu-linux-20-04-desktop>
 <87o7ft44bv.fsf@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Nov 2023, Volodymyr Babchuk wrote:
> > I still think, no matter the BDF allocation scheme, that we should try
> > to avoid as much as possible to have two different PCI Root Complex
> > emulators. Ideally we would have only one PCI Root Complex emulated by
> > Xen. Having 2 PCI Root Complexes both of them emulated by Xen would be
> > tolerable but not ideal.
> 
> But what is exactly wrong with this setup?

[...]

> > The worst case I would like to avoid is to have
> > two PCI Root Complexes, one emulated by Xen and one emulated by QEMU.
> 
> This is how our setup works right now.

If we have:
- a single PCI Root Complex emulated in Xen
- Xen is safety certified
- individual Virtio devices emulated by QEMU with grants for memory

We can go very far in terms of being able to use Virtio in safety
use-cases. We might even be able to use Virtio (frontends) in a SafeOS.

On the other hand if we put an additional Root Complex in QEMU:
- we pay a price in terms of complexity of the codebase
- we pay a price in terms of resource utilization
- we have one additional problem in terms of using this setup with a
  SafeOS (one more device emulated by a non-safe component)

Having 2 PCI Root Complexes both emulated in Xen is a middle ground
solution because:
- we still pay a price in terms of resource utilization
- the code complexity goes up a bit but hopefully not by much
- there is no impact on safety compared to the ideal scenario

This is why I wrote that it is tolerable.


> I agree that we need some way to provide static vBDF numbers. But I am
> wondering what is the best way to do this. We need some entity that
> manages and assigns those vBDFs. It should reside in Xen, because there
> is Dom0less use case. Probably we need to extend
> xen_domctl_assign_device so we can either request a free vBDF or a
> specific vBDF. And in the first case, Xen should return assigned vBDF so
> toolstack can give it to a backend, if PCI device is purely virtual.

I think that would be fine.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F14A62D384A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 02:34:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47942.84812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmoNF-0004jg-AL; Wed, 09 Dec 2020 01:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47942.84812; Wed, 09 Dec 2020 01:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmoNF-0004jH-6Z; Wed, 09 Dec 2020 01:34:33 +0000
Received: by outflank-mailman (input) for mailman id 47942;
 Wed, 09 Dec 2020 01:34:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kmoND-0004jC-HQ
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 01:34:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fc92b19-1595-4c9c-9991-d0d05a6678f9;
 Wed, 09 Dec 2020 01:34:30 +0000 (UTC)
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
X-Inumbo-ID: 6fc92b19-1595-4c9c-9991-d0d05a6678f9
Date: Tue, 8 Dec 2020 17:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607477670;
	bh=3fbALPm5UDI9wd3ouG1stjFm09oSzhHf8AvkEsWsGmk=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=qGJO0i7138SSd+SAxeE8WX7vT/Rabn0vYg79lf/SDsmX6+E4bdIWUB9HWI5cnOf9f
	 dnrxK+5eFegfLUiL3Pc/tWQgyN1Wx26G64GJmXewjhzgROByQYVC4ya7zClrjr7Klp
	 PQjwjnkvg6yp+qmXjTTarBp0jXb3uhaMP4WE3xWKMncbPKZAixp+DqcZJCV7bxKKxe
	 4D1iar9lBBm9t9ecWp3U4H+OF1UMMWdlsYqHjOhibxHVLX5AKORk34esGPGsUqmWSm
	 KKIc556PX+KCWVWEpX8vNdyhrE3XVexY+T7BCbfzQf4bX9H9HtglVhx5PxykTwz7YV
	 ThK5YhYX4DHww==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Michal Orzel <Michal.Orzel@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH] xen/arm: Add workaround for Cortex-A53 erratum #845719
In-Reply-To: <bf45e0f4-2de7-d1db-4732-342937bf61e7@xen.org>
Message-ID: <alpine.DEB.2.21.2012081730020.20986@sstabellini-ThinkPad-T480s>
References: <20201208072327.11890-1-michal.orzel@arm.com> <d286241c-fd3b-8506-37e5-0ddcdaae97be@xen.org> <5D1B5771-A6B3-4F5E-81A1-864DBC8787B4@arm.com> <bf45e0f4-2de7-d1db-4732-342937bf61e7@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Dec 2020, Julien Grall wrote:
> On 08/12/2020 14:38, Bertrand Marquis wrote:
> > Hi Julien,
> > 
> > > On 8 Dec 2020, at 09:47, Julien Grall <julien@xen.org> wrote:
> > > 
> > > Hi,
> > > 
> > > On 08/12/2020 07:23, Michal Orzel wrote:
> > > > When executing in aarch32 state at EL0, a load at EL0 from a
> > > > virtual address that matches the bottom 32 bits of the virtual address
> > > > used by a recent load at (aarch64) EL1 might return incorrect data.
> > > > The workaround is to insert a write of the contextidr_el1 register
> > > > on exception return to an aarch32 guest.
> > > 
> > > I am a bit confused with this comment. In the previous paragraph, you are
> > > suggesting that the problem is an interaction between EL1 AArch64 and EL0
> > > AArch32. But here you seem to imply the issue only happen when running a
> > > AArch32 guest.
> > > 
> > > Can you clarify it?
> > 
> > This can happen when switching from an aarch64 guest to an aarch32 guest so
> > not only when there is interaction.

Just to confirm: it cannot happen when switching from aarch64 *EL2* to
aarch32 EL0/1, right?  Because that happens all the time in Xen.


> Right, but the context switch will write to CONTEXTIDR_EL1. So this case
> should already be handled.
> 
> Xen will never switch from AArch64 EL1 to AArch32 EL0 without a context switch
> (the inverse can happen if we inject an exception to the guest).
> 
> Reading the Cortex-A53 SDEN, it sounds like this is an OS and not Hypervisor
> problem. In fact, Linux only seems to workaround it when switching in the OS
> side rather than the hypervisor.
> 
> Therefore, I am not sure to understand why we need to workaroud it in Xen.

It looks like Julien is right in regards to the "aarch64 EL1 to aarch32
EL0" issue.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1A729D205
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 21:11:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13896.34740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXrmc-00084Q-EG; Wed, 28 Oct 2020 20:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13896.34740; Wed, 28 Oct 2020 20:10:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXrmc-000841-Af; Wed, 28 Oct 2020 20:10:58 +0000
Received: by outflank-mailman (input) for mailman id 13896;
 Wed, 28 Oct 2020 20:10:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ghuf=ED=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kXrma-00083w-UK
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 20:10:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44efe205-5865-4c96-8ed8-2ebea7efccaa;
 Wed, 28 Oct 2020 20:10:56 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0786F247CC;
 Wed, 28 Oct 2020 20:10:54 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ghuf=ED=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kXrma-00083w-UK
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 20:10:56 +0000
X-Inumbo-ID: 44efe205-5865-4c96-8ed8-2ebea7efccaa
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 44efe205-5865-4c96-8ed8-2ebea7efccaa;
	Wed, 28 Oct 2020 20:10:56 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0786F247CC;
	Wed, 28 Oct 2020 20:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603915855;
	bh=gEN5nLYxypA++AlL8jcsXUvpF47jM/kkqC0G/Ib/eYE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=syDTRoXvG+SY2bzAv9PSRfmS26YRgFQ36iZmFMk3gPzR4vYR2BPiZQrNDRVaqooy1
	 gQJMGyHUP34aUTmTBUxIi7i7qpCKM4+KI3HesEw4dWTzYkGpHhC/JXvqAv460WFr0Z
	 jgf4gRkFYJWDyWjJFGVBm8A4KyU1gJqt5WAv+eQE=
Date: Wed, 28 Oct 2020 13:10:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/3] xen/arm: Warn user on cpu errata 832075
In-Reply-To: <c6790d34-2893-78c4-d49f-7ef4acfceb96@xen.org>
Message-ID: <alpine.DEB.2.21.2010281309540.12247@sstabellini-ThinkPad-T480s>
References: <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com> <4d62bc0844576b80e00ea48e318be238a4d73eae.1603728729.git.bertrand.marquis@arm.com> <c6790d34-2893-78c4-d49f-7ef4acfceb96@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 28 Oct 2020, Julien Grall wrote:
> Hi Bertrand,
> 
> On 26/10/2020 16:21, Bertrand Marquis wrote:
> > When a Cortex A57 processor is affected by CPU errata 832075, a guest
> > not implementing the workaround for it could deadlock the system.
> > Add a warning during boot informing the user that only trusted guests
> > should be executed on the system.
> > An equivalent warning is already given to the user by KVM on cores
> > affected by this errata.
> > 
> > Also taint the hypervisor as unsecure when this errata applies and
> > mention Cortex A57 r0p0 - r1p2 as not security supported in SUPPORT.md
> > 
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
> If you don't need to resend the series, then I would be happy to fix the typo
> pointed out by George on commit.

That's OK for me. Since you are at it, could you also condense the 4
lines of the warning into 2 lines on commit as well?

Thanks,

Stefano


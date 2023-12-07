Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6A28094D5
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 22:42:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650203.1015525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBM8J-0006V8-NV; Thu, 07 Dec 2023 21:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650203.1015525; Thu, 07 Dec 2023 21:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBM8J-0006SH-KX; Thu, 07 Dec 2023 21:42:11 +0000
Received: by outflank-mailman (input) for mailman id 650203;
 Thu, 07 Dec 2023 21:42:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QcaE=HS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBM8I-0006SA-41
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 21:42:10 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76dd5afb-9549-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 22:42:07 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5E475CE24C5;
 Thu,  7 Dec 2023 21:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCB1C433C9;
 Thu,  7 Dec 2023 21:42:00 +0000 (UTC)
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
X-Inumbo-ID: 76dd5afb-9549-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701985321;
	bh=RaiEs6rPjAmgyxVz9TfcPBuEk0hP5VpEsexJfG510QY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ThAcHk61pkk6DXd6Yrsi+ZxvvWmPzlbJn6D0LayftRJmuR5KFHQZEFzvpvVnIdLAA
	 bjfF9vYQz0d/2PsMsXeTBsNwF66dcb7CXSTOQ24R6fksde2yENSE36W6VBlxiAUz4q
	 OKsfB+x+TZVykQMpC69cl3xX05SoohDyAQloteAlCyiESz/1bofkSKeS5ImUYttBTe
	 P0FhU1XA6IkkoOumsPe2vxFkxlEEocp/+dwBhgUjEFB2X+fsaoH8triwOLVBbssMAH
	 lsfipFFhXE0fIdsNRAlZ+G04adgzQcfQRHLKL5Gwk6QNXzImLmu7hubQCxD+qhefOF
	 lQtgclngBD+hQ==
Date: Thu, 7 Dec 2023 13:41:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Ayan Kumar Halder <ayankuma@amd.com>, Michal Orzel <michal.orzel@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, stefano.stabellini@amd.com, 
    bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH] xen/arm: Add emulation of Debug Data Transfer
 Registers
In-Reply-To: <a4c43652-1fa6-4b42-b751-582cfd6324fe@xen.org>
Message-ID: <alpine.DEB.2.22.394.2312071341540.1265976@ubuntu-linux-20-04-desktop>
References: <20231201185009.1719183-1-ayan.kumar.halder@amd.com> <0bd65e25-aec2-4294-9a73-1cdaece52242@xen.org> <9ffe5a34-d1f4-4f4a-82eb-77c92f71040c@amd.com> <ca91f71b-9633-495f-9fb2-731bd250a561@xen.org> <8547fc3b-4e77-45d7-8063-1bee869d07db@amd.com>
 <3a9efd72-07cc-4b1d-8814-d4f6df4e6230@xen.org> <73554150-9880-447c-ac2b-e4f3ef0f76be@amd.com> <0d232ffe-1eb1-420b-af2c-70e16088a9b6@xen.org> <03a91b0f-eabe-47bd-b9fb-a9e15bdd121f@amd.com> <7420ada1-cc6c-48cf-9b2d-4c09e236dfdf@amd.com>
 <50372bd4-5e1a-4d38-abd3-19abf8e82591@xen.org> <alpine.DEB.2.22.394.2312051503060.110490@ubuntu-linux-20-04-desktop> <a4c43652-1fa6-4b42-b751-582cfd6324fe@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Dec 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 05/12/2023 23:21, Stefano Stabellini wrote:
> > On Tue, 5 Dec 2023, Julien Grall wrote:
> > > I agree that crashing a guest is bad, but is lying to the domain really
> > > better? The consequence here is not that bad and hopefully it would be
> > > fairly
> > > easy to find. But this is not always the case. So I definitely would place
> > > a
> > > half-backed emulation more severe than a guest crash.
> > 
> > 
> > I see where Julien is coming from, but I would go with option two:
> > "emulate DCC the same way as KVM". That's because I don't think we can
> > get away with crashing the guest in all cases. Although the issue came
> > up with a Linux guest, it could have been triggered by a proprietary
> > operating system that we cannot change, and I think Xen should support
> > running unmodified operating systems.
> > 
> > If we go with a "half-backed emulation" solution, as Julien wrote, then
> > it is better to be more similar to other hypervisors, that's why I chose
> > option two instead of option three.
> > 
> > But at the same time I recognize the validity of Julien's words and it
> > makes me wonder if we should have a KCONFIG option or command line
> > option to switch the Xen behavior. We could use it to gate all the
> > "half-backed emulation" we do for compatibility.  Something like:
> > 
> > config PARTIAL_EMULATION
> >      bool "Partial Emulation"
> >      ---help---
> >            Enables partial, not spec compliant, emulation of certain
> > register
> >      interfaces (e.g DCC UART) for guest compatibility. If you disable
> >      this option, Xen will crash the guest if the guest tries to access
> >      interfaces not fully emulated or virtualized.
> > 
> >      If you enable this option, the guest might misbehave due to non-spec
> >      compliant emulation done by Xen.
> 
> As I wrote to Ayan on Matrix today, I am not in favor of the emulation. Yet, I
> am not going to oppose (as in Nack it) if the other maintainers agree with it.

Thanks for being flexible


> The KConfig would be nice, the question is whether we want to (security)
> support such configuration? E.g. could this potentially introduce a security
> issue in the guest?

The important question is whether it could introduce a security issue in
Xen. If we think it wouldn't increase the attack surface significantly
then I would security support it otherwise not.


> Regarding the  emulation itself, I actually prefer 3 because at least the
> Linux drivers will be able to bail out rather than trying to use them.

I don't have a strong opinion between 2 and 3


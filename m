Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED52824BFE
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 01:03:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661916.1031714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLXfb-0004BF-J7; Fri, 05 Jan 2024 00:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661916.1031714; Fri, 05 Jan 2024 00:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLXfb-000499-GY; Fri, 05 Jan 2024 00:02:39 +0000
Received: by outflank-mailman (input) for mailman id 661916;
 Fri, 05 Jan 2024 00:02:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PmVw=IP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rLXfZ-00048n-DT
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 00:02:37 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba97adcb-ab5d-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 01:02:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 137EEB81BB5;
 Fri,  5 Jan 2024 00:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D87C433C7;
 Fri,  5 Jan 2024 00:02:32 +0000 (UTC)
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
X-Inumbo-ID: ba97adcb-ab5d-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704412953;
	bh=OdwkGuplSUt6otvozDxlJMZ11DSGQ9mDd92ltR+mT2M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WRRXNvRGmPU83K4U1T2KcY3Cwl3RfTTlXR1qI9dLdtxcOnvfdgJe6K7QOoXUrLwvU
	 l36/iBeXxQSmFCPcLkxpznWNOaY+hgqYR2V1oGOu1iPXQvC1PZYHT9xu5OS89OSMl4
	 Cif3JDU58kzNZHWUbwxFfMiTyOMAhOi5MDKXGqsQAzmNc4U5S151OuL1D9tBrk4qBK
	 IBljZ/VKFOO1oZvrt+Qq1PBjqdUk2C8uky1MXW84ODYMpMvJMWwXsK3/IWr+4A4v9v
	 4gCZFNloXSKEuU++fxIqeXSkOp0kVhPjGsFQbpCIC6WTL2ttArSHpQXg2Jcc1Vz4Wh
	 BthUScdS0Hfdw==
Date: Thu, 4 Jan 2024 16:02:30 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: Use -Wuninitialized and -Winit-self
In-Reply-To: <d1d43877-912c-4f83-aa9b-bc28be418a0c@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2401041545180.1322202@ubuntu-linux-20-04-desktop>
References: <20231228193907.3052681-1-andrew.cooper3@citrix.com> <1248487f-4852-41f5-9ffd-d4d12897a622@suse.com> <7d35a648-a69b-4dfb-bf4f-d30272df5e9b@citrix.com> <d1d43877-912c-4f83-aa9b-bc28be418a0c@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-468806282-1704412204=:1322202"
Content-ID: <alpine.DEB.2.22.394.2401041550060.1322202@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-468806282-1704412204=:1322202
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2401041550061.1322202@ubuntu-linux-20-04-desktop>

On Thu, 4 Jan 2024, Roberto Bagnara wrote:
> On 2024-01-04 15:33, Andrew Cooper wrote:
> > On 04/01/2024 1:41 pm, Jan Beulich wrote:
> > > On 28.12.2023 20:39, Andrew Cooper wrote:
> > > > The use of uninitialised data is undefined behaviour.  At -O2 with
> > > > trivial
> > > > examples, both Clang and GCC delete the variable, and in the case of a
> > > > function return, the caller gets whatever was stale in %rax prior to the
> > > > call.
> > > > 
> > > > Clang includes -Wuninitialized within -Wall, but GCC only includes it in
> > > > -Wextra, which is not used by Xen at this time.
> > > > 
> > > > Furthermore, the specific pattern of assigning a variable to itself in
> > > > its
> > > > declaration is only diagnosed by GCC with -Winit-self.  Clang does
> > > > diagnoise
> > > > simple forms of this pattern with a plain -Wuninitialized, but it fails
> > > > to
> > > > diagnose the instances in Xen that GCC manages to find.
> > > > 
> > > > GCC, with -Wuninitialized and -Winit-self notices:
> > > > 
> > > >    arch/x86/time.c: In function ‘read_pt_and_tsc’:
> > > >    arch/x86/time.c:297:14: error: ‘best’ is used uninitialized in this
> > > > function [-Werror=uninitialized]
> > > >      297 |     uint32_t best = best;
> > > >          |              ^~~~
> > > >    arch/x86/time.c: In function ‘read_pt_and_tmcct’:
> > > >    arch/x86/time.c:1022:14: error: ‘best’ is used uninitialized in this
> > > > function [-Werror=uninitialized]
> > > >     1022 |     uint64_t best = best;
> > > >          |              ^~~~
> > > > 
> > > > and both have logic paths where best can be returned while uninitalised.
> > > I disagree. In both cases the variables are reliably set during the first
> > > loop iteration.
> > 
> > I suggest you pay attention to the precision of the integers.
> > 
> > It is hard (likely prohibitively hard) to avoid entering the if(), but
> > it is not impossible.
> > 
> > The compiler really has emitted logic paths where stack rubble is returned.
> > 
> > > Furthermore this initialize-to-self is a well known pattern to suppress
> > > the
> > > -Wuninitialized induced warnings, originally used by Linux'es
> > > uninitialized_var().
> > 
> > I'm glad you cited this, because it proves my point.
> > 
> > Notice how it was purged from Linux slowly over the course of 8 years
> > because it had been shown to create real bugs, by hiding real uses of
> > uninitialised variables.
> 
> There is a worse problem for initialize-to-self: it is undefined behavior
> per se.  If this is done to suppress a warning, then what happens is
> paradoxical: in order to suppress a warning about a potential undefined
> behavior (the variable might indeed be always written before being read)
> one introduces a definite undefined behavior.

Thanks for the insight, Roberto. I think best = best is the worst option
because it tries to suppress an uninitialized warning by introducing an
undefined behavior.

I think anything else is better, including:
- best = ~0;
- best = 0;
- some sort of uninitialized_var implementation without init-to-self

I am in favor of adding -Winit-self to the build. That's a good idea. I
don't have an opinion on whether it should be done as part of this patch
or separately. I also don't have an opinion on whether the Fixes tags
are appropriate. I would be happy with or without them.

So, I would ack this patch.

I see that updating the function to return a proper error would be good
but I wouldn't scope-creep an otherwise simple improvement, so I
wouldn't ask the contributor to do it necessarily as part of this patch.
--8323329-468806282-1704412204=:1322202--


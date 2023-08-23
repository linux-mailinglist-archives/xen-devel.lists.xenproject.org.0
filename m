Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0478786195
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 22:31:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589578.921541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYuV9-0004w2-Oi; Wed, 23 Aug 2023 20:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589578.921541; Wed, 23 Aug 2023 20:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYuV9-0004uL-Kl; Wed, 23 Aug 2023 20:30:51 +0000
Received: by outflank-mailman (input) for mailman id 589578;
 Wed, 23 Aug 2023 20:30:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0q6w=EI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qYuV8-0004uF-Ny
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 20:30:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1439a16-41f3-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 22:30:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 46A1F62194;
 Wed, 23 Aug 2023 20:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCF8C433C8;
 Wed, 23 Aug 2023 20:30:45 +0000 (UTC)
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
X-Inumbo-ID: f1439a16-41f3-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692822646;
	bh=X8Cci+LH2FhyFEZkBXMrsneCOKhkqIjvkuxBMSUYfHQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ShsFKm3okSb0lpTqyy/Ll0goXzZP9SP+uu30OoDBRTOV42UI8tcBOghbrQ+M9hGiP
	 PDsX9HOfiULQr0D/5F5fWY5FJziC8Jr/mxQphOXCvcQf71+jNYbTDa1SQok7FeCGv+
	 1pDCyFfNN5lfp9hT1rPv5eqTiQpzTL/Vkmsxd2EZfwP+6Op5iBuC8y2U0HusTMs+2y
	 afT3MBscUgVghy1dXGVIXGR68Hi84SZ022515pft+JrGS9Fj7/bxtonV2FsL59sOlk
	 PJfCY+xOOma9EcYziy0ejzB+whIe/+6/G8ZGy8aL9oUxne2ycXIjWITzctgCaTzf0b
	 w0OaHc1FUdBMg==
Date: Wed, 23 Aug 2023 13:30:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH] arm64/vfp: address MISRA C:2012 Dir 4.3
In-Reply-To: <59fad669-afc2-45e2-b647-8a0878774ba8@xen.org>
Message-ID: <alpine.DEB.2.22.394.2308231327570.6458@ubuntu-linux-20-04-desktop>
References: <998ecebdda92f1704fa35e8692b1f7e37b674d16.1692800477.git.nicola.vetrini@bugseng.com> <a0a4a13a-3ada-4586-81cf-86a9e583fc60@xen.org> <3b4d895999ad4fc51f280c8f7e854cab@bugseng.com> <59fad669-afc2-45e2-b647-8a0878774ba8@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Aug 2023, Julien Grall wrote:
> Hi Nicola,
> 
> On 23/08/2023 17:09, Nicola Vetrini wrote:
> > On 23/08/2023 16:59, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 23/08/2023 15:27, Nicola Vetrini wrote:
> > > > Directive 4.3 prescribes the following:
> > > > "Assembly language shall be encapsulated and isolated",
> > > > on the grounds of improved readability and ease of maintenance.
> > > > The Directive is violated in this case by asm code in between C code.
> > > > 
> > > > A macro is the chosen encapsulation mechanism.
> > > 
> > > I would rather prefer if we use a static inline.
> > 
> > Just to prevent an possible back and forth on a similar patch:
> > is it ok to adopt the same approach with the inline asm in
> > xen/arch/arm/arm64/lib/bitops.c in the definition of the macros
> > 'bitop' and 'testop'?
> 
> So, in the VFP I agree that moving the assembly part outside of vfp_*_state()
> makes sense even without MISRA. But I don't agree with moving the assembly
> code out as the C function is tightly coupled with the assembly code.
> 
> So this would please MISRA but IHMO would make the code more difficult to
> understand. So I think we should deviate for the bitops.
> 
> Bertrand, Stefano, what do you think?

I agree. I think bitops.c is already encapsulated and introducing
additional macros or functions is likely to make the code worse. testop
and bitop are the encapsulating functions, as you can see there is very
little else other than the asm volatile and a do/while loop.


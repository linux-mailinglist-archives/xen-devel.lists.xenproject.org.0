Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B104E7CEA0B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 23:34:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618779.962872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtEB4-0002jE-6G; Wed, 18 Oct 2023 21:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618779.962872; Wed, 18 Oct 2023 21:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtEB4-0002gx-3c; Wed, 18 Oct 2023 21:34:06 +0000
Received: by outflank-mailman (input) for mailman id 618779;
 Wed, 18 Oct 2023 21:34:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UegX=GA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtEB3-0002gr-HO
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 21:34:05 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ee709f9-6dfe-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 23:34:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 025A4B824F2;
 Wed, 18 Oct 2023 21:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712B8C433C9;
 Wed, 18 Oct 2023 21:34:00 +0000 (UTC)
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
X-Inumbo-ID: 0ee709f9-6dfe-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697664841;
	bh=KKToORkeAunBLIUb9aGIEg3cdBo+lRrOpTqAmZxc/y0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t/froSH3q0lBom9fE53eG4vtTPoCzipal3BmD1h4FBx8lMyc4v+UV1NaK83FUR+Nu
	 yMCK1dtPo1RYkm24OicQ6egxluaKnIwwqCgTj89pu/h7agkjz0qm4d0chppcglMt7F
	 fbFWCMW1pZo9pNdgPffkH903jU8uS47JGuWEuYsZIWQqPvHNGXZ/NZAFqdDrJOAlcR
	 xRx7fHVGk/ZGUu/AL1ZI+GJ1wf1uAegz2Z3zAvdrEW+U8KTaFNbx+4xieZv4iHyYeH
	 UKpHGjYucNpH/LJOfGKkTi5zHm13ZvQuTA3oTPCjezWTku4PFBYriO5Ak6PCzi7mqv
	 tWcTgF9EpEw2Q==
Date: Wed, 18 Oct 2023 14:33:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, roger.pau@citrix.com, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: MISRA C:2012 D4.11 caution on staging
In-Reply-To: <1aaea648-b156-4297-b290-9c7b7a5010fd@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310181433140.965337@ubuntu-linux-20-04-desktop>
References: <7972c20f361126022fa97f6b51ca2d9c@bugseng.com> <61f04d4b-34d9-4fd1-a989-56b042b4f3d8@citrix.com> <baa73fa24385b39bc6e82c4ccb08bd13@bugseng.com> <26f09702-9340-41ae-afcc-808becb67876@citrix.com> <75a00257-c062-4d82-9b64-1707ce4566e6@xen.org>
 <594c09e1f8b2e1e8321c2cb862fcb378@bugseng.com> <5ddb6398-f2a3-4bcb-8808-bad653b6c3cd@xen.org> <c4f4f1fc-b20a-c08f-9782-9ce06f6dd868@suse.com> <3573c8c2-1a9c-444c-a542-539b16f689f2@xen.org> <8c25bfd7768d6b290362f56a8b8d44d9@bugseng.com>
 <c47528e7-e202-4b5b-85ae-3bb0d1d0b608@xen.org> <87b5936151ace813d9dc9592ee35f86e@bugseng.com> <1aaea648-b156-4297-b290-9c7b7a5010fd@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Oct 2023, Julien Grall wrote:
> On 18/10/2023 13:52, Nicola Vetrini wrote:
> > On 18/10/2023 14:38, Julien Grall wrote:
> > > Hi Nicola,
> > > 
> > > On 18/10/2023 13:30, Nicola Vetrini wrote:
> > > > On 17/10/2023 15:28, Julien Grall wrote:
> > > > I tested this, and the report is prevented by the ASSERT. It's up to the
> > > > maintainers to
> > > > decide how do you want to proceed: my suggestion is deviating it,
> > > 
> > > It is not clear to me what would you deviate. Can you clarify?
> > > 
> > > Cheers,
> > 
> > The memcpy call, as in:
> > 
> > /* SAF-x-false-positive-eclair */
> > memcpy(d->handle, config->handle, sizeof(d->handle));
> 
> I am not in favor of this deviation. It could be a false positive today, but
> it may not be in the future.
> 
> I much prefer the ASSERT() version or the rework.

Just to be clear about the next steps, Nicola are you OK with sending a
patch with the ASSERT or would you prefer Julien or someone else to do
it?


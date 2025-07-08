Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAFDAFD55C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 19:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036984.1409633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCB6-0007mh-Au; Tue, 08 Jul 2025 17:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036984.1409633; Tue, 08 Jul 2025 17:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCB6-0007jf-8H; Tue, 08 Jul 2025 17:32:24 +0000
Received: by outflank-mailman (input) for mailman id 1036984;
 Tue, 08 Jul 2025 17:32:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G3iI=ZV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uZCB5-0007jZ-HD
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 17:32:23 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e4b851e-5c21-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 19:32:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 962E0A541B0;
 Tue,  8 Jul 2025 17:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE83C4CEED;
 Tue,  8 Jul 2025 17:32:14 +0000 (UTC)
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
X-Inumbo-ID: 7e4b851e-5c21-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751995936;
	bh=mF3R8jtHMAH7rEJAzXMm8I+6wdFqKpB2lDV45F+2RPI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PqNkspzO3ggWZwYlpafxwz83932TulMnaFa0lWy+n5fZUdshrEMVq0M0bxsRSgm/F
	 wzsXTPEHA5aWoITnOU43w8XhilQwP6TejHmaytldAy9PotXVkFljewNEtwi1o9ByLG
	 ImT1UOKgbfgpjC0LYhGzAJeOERSyphNT41L1nDqRqRTE8+9D6JCl5uxFOBdOt1xVK1
	 ZWcGo4bPpV0CQHdcnzC0ENnXNWJJGaXG5f6pV8Tt80NunGss4qmR5TGOvi8CyzrJEt
	 AZCaAR0klJrnyeQsV07u/fAlARGUt7zWEGfvm2fC8rU34ZuS/WC3VAjosnfuXBJQwf
	 e1Hjo0jne0a3A==
Date: Tue, 8 Jul 2025 10:32:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, victorm.lira@amd.com, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=83=C2=A9?= <roger.pau@citrix.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen/x86: address violations of Rule 11.3
In-Reply-To: <6b23c2a3-9e2c-492b-843f-c3f830394f3e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507081031210.605088@ubuntu-linux-20-04-desktop>
References: <20250624002018.4121819-1-victorm.lira@amd.com> <20250624002018.4121819-2-victorm.lira@amd.com> <b31da849-283e-4f84-854a-50da2d0878d7@suse.com> <alpine.DEB.2.22.394.2507071453370.605088@ubuntu-linux-20-04-desktop>
 <6b23c2a3-9e2c-492b-843f-c3f830394f3e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Jul 2025, Jan Beulich wrote:
> On 08.07.2025 00:00, Stefano Stabellini wrote:
> > On Tue, 24 Jun 2025, Jan Beulich wrote:
> >> On 24.06.2025 02:20, victorm.lira@amd.com wrote:
> >>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >>>
> >>> Use {get,put}_unaligned_t to ensure that reads and writes are
> >>> safe to perform even on potentially misaligned pointers.
> >>
> >> Also applicable to the Arm patch: Please can such patches mention the
> >> main subject of the rule, not just the number?
> > 
> > +1
> > 
> > 
> >> Overall I'm unconvinced we really want or need this on x86; I'm curious
> >> what Andrew and Roger think.
> > 
> > To be honest, I had a similar reaction to you, which is why I suggested
> > on Matrix to:
> > 
> > - deviate the rule in its entirety on x86
> > - deviate the rule for all mappings except for devmem mappings on ARM
> > 
> > Leaving aside ARM for a second (this is exactly the kind of very
> > arch-specific behavior that is OK to device differently per
> > architecture), would you be OK with deviating the rule in its entirety on
> > x86?
> > 
> > Or do you prefer to continue with this patch?
> 
> Neither. Imo globally deviating rules needs to be done with care. There
> are, in principle, misaligned accesses in x86 which can be made fault
> (and I think this was mentioned before). We want to know of such risks.
> Hence for a rule like this one more fine grained deviation is on order,
> imo.

What fine grained deviation do you have in mind?


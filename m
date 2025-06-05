Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9A1ACFA27
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 01:46:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007712.1386973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNKHj-0007D5-0m; Thu, 05 Jun 2025 23:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007712.1386973; Thu, 05 Jun 2025 23:46:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNKHi-0007B0-SU; Thu, 05 Jun 2025 23:46:10 +0000
Received: by outflank-mailman (input) for mailman id 1007712;
 Thu, 05 Jun 2025 23:46:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBp0=YU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uNKHh-0007Au-F4
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 23:46:09 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fc6aa1a-4267-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 01:46:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1C5666154E;
 Thu,  5 Jun 2025 23:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37598C4CEE7;
 Thu,  5 Jun 2025 23:46:04 +0000 (UTC)
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
X-Inumbo-ID: 3fc6aa1a-4267-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749167165;
	bh=gLHEgdpM3Jus7sfz9wERNI99jnA3VG3T8lURiWMaNYU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y6ypvT25SdnQtcCofwbFlv6FoLDFtsR8IkiItrXi8cA+c2h2QUvMDc+lEwGdUGMle
	 9QkACEfwNVlDxZasUlyDNtEnajM7w3LvsnWJK3s/AHwTGfmhYbAL4DkPi393+CWZI2
	 okwtPftLFy6HREhrnH0nlSZsPQ2K2IK565PXIW9OukIop+Y6cMkM/uXNaRi3sETgCk
	 JWRILgxRksmc1/JlGOegP/WJBFr3CmXjQihxuqY9gW4Oca/sO6o+ObIinaRLS8N24U
	 48w3L0hhT2hhf/+cjlW33prBUN4b39JYrcLHtdorchzIeyyL6xX/WHFLoFCfVQyg/n
	 IDXE3lme1daEg==
Date: Thu, 5 Jun 2025 16:46:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: dmkhn@proton.me, sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, 
    roger.pau@citrix.com, teddy.astie@vates.tech, dmukhin@ford.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/2] xen/domain: introduce common hardware emulation
 flags
In-Reply-To: <8412c795-610b-416e-8d22-4149d2492517@suse.com>
Message-ID: <alpine.DEB.2.22.394.2506051642420.2495561@ubuntu-linux-20-04-desktop>
References: <20250602191717.148361-1-dmukhin@ford.com> <20250602191717.148361-2-dmukhin@ford.com> <093dc85d-ebf3-4982-8888-db4e7cfd0e45@suse.com> <aEDwMrVu+3PVSh+Y@kraken> <8412c795-610b-416e-8d22-4149d2492517@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Jun 2025, Jan Beulich wrote:
> On 05.06.2025 03:17, dmkhn@proton.me wrote:
> > On Wed, Jun 04, 2025 at 12:36:17PM +0200, Jan Beulich wrote:
> >> On 02.06.2025 21:17, dmkhn@proton.me wrote:
> >>> From: Denis Mukhin <dmukhin@ford.com>
> >>>
> >>> Add common emulation_flags for configuring domain emulation features.
> >>>
> >>> Print d->emulation_flags from 'q' keyhandler for better traceability while
> >>> debugging.
> >>>
> >>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> >>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >>
> >> It's not becoming clear why this would want doing, nor in how far some of
> >> the bits there may gain "common" meaning, too. Imo this kind of change is
> >> meaningful only in a series where later the common-ness is also used.
> > 
> > I have a set of upcoming changes here:
> >   https://gitlab.com/xen-project/people/dmukhin/xen/-/tree/vuart-framework?ref_type=heads
> > 
> > Specifically,
> >  https://gitlab.com/xen-project/people/dmukhin/xen/-/commit/17f44d23c1904374963c4ec839bc8219041b5d26
> > 
> > enables the use of emulation_flags on Arm.
> > 
> > I can move this patch to the upcoming series, if needed, but looks like it is
> > OK to have it for Arm even now.
> 
> Prior to that series making it to a ready-to-be-committed state, it'll be
> (effectively) dead code on Arm. Which strictly speaking Misra objects to.
> I wonder if you, Stefano, considered that when giving your R-b.

We have not been enforcing the "no dead code" rule (R2.2) especially on
a per patch basis. In general in my view, it is better to reduce dead
code rather than increase dead code, but it is OK to do so temporarily.


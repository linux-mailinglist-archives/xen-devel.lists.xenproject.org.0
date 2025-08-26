Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16487B351F9
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 04:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093826.1449212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqjs1-0001KP-G7; Tue, 26 Aug 2025 02:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093826.1449212; Tue, 26 Aug 2025 02:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqjs1-0001Ie-DJ; Tue, 26 Aug 2025 02:57:13 +0000
Received: by outflank-mailman (input) for mailman id 1093826;
 Tue, 26 Aug 2025 02:57:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fAYs=3G=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uqjs0-0001IX-3p
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 02:57:12 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58d2a50f-8228-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 04:57:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5A2AD601F2;
 Tue, 26 Aug 2025 02:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CB0C4CEED;
 Tue, 26 Aug 2025 02:57:02 +0000 (UTC)
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
X-Inumbo-ID: 58d2a50f-8228-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756177024;
	bh=UuMUHaOYyhmF7YdDTK2zy5nC/Igypi6vqj00Nos0iJQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=m7dXDb59b2WY9YqGzAt37j4X/mKxYh6XRFO4wSsj7FH64zLZRDHOHIATFRBumNdVB
	 8c1Zzv5zbuWhsZS1w/G10UwuleHrTC4mhq7xKIh5KsLhfy6t9YY+PDqaPkmKOvd33s
	 iMxEYt2tUkQLxO2/ghtxogHont6yPWCPDRAwBHWMLpRU6sP7A3uu66+CjHwxBbhW0Y
	 wvDhpeaxBLi1Qhp//bwgemEYL787jnBMHrp8zac/Bea+u2Ed3bGHl4MM1DoFp1NQ4b
	 /q27CjXeD0zAONml5M8HrYPFgdcAbB/PXMuydhqSQvk+OPxdfdGnZKNeehkOj8OEOT
	 0/CgujlivyGLw==
Date: Mon, 25 Aug 2025 19:57:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, ray.huang@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@amd.com>
Subject: Re: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
In-Reply-To: <49416df6-83c8-4fa3-bf81-2d1e504ef31b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2508251934200.3391208@ubuntu-linux-20-04-desktop>
References: <20250815102728.1340505-1-Penny.Zheng@amd.com> <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com> <d6046b53-9317-43d6-bfda-e30d42c09320@gmail.com> <2035b14e-3836-4e80-9dad-8a49ca90864a@suse.com> <alpine.DEB.2.22.394.2508181646220.923618@ubuntu-linux-20-04-desktop>
 <49416df6-83c8-4fa3-bf81-2d1e504ef31b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 Aug 2025, Jan Beulich wrote:
> On 19.08.2025 01:51, Stefano Stabellini wrote:
> > On Mon, 18 Aug 2025, Jan Beulich wrote:
> >> On 18.08.2025 15:28, Oleksii Kurochko wrote:
> >>> On 8/18/25 10:31 AM, Jan Beulich wrote:
> >>>> On 15.08.2025 12:27, Penny Zheng wrote:
> >>>>> In order to fix CI error of a randconfig picking both PV_SHIM_EXCLUSIVE=y and
> >>>>> HVM=y results in hvm.c being built, but domctl.c not being built, which leaves
> >>>>> a few functions, like domctl_lock_acquire/release() undefined, causing linking
> >>>>> to fail.
> >>>>> To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE Makefile
> >>>>> /hypercall-defs section, with this adjustment, we also need to release
> >>>>> redundant vnuma_destroy() stub definition from PV_SHIM_EXCLUSIVE guardian,
> >>>>> to not break compilation
> >>>>> Above change will leave dead code in the shim binary temporarily and will be
> >>>>> fixed with the introduction of domctl-op wrapping.
> >>>> Well, "temporarily" is now getting interesting. While v1 of "Introduce
> >>>> CONFIG_DOMCTL" was submitted in time to still be eligible for taking into
> >>>> 4.21, that - as indicated elsewhere - is moving us further in an unwanted
> >>>> direction.
> >>>
> >>> Do you mean that specifically this patch or the whole patch series is moving us
> >>> in unwanted direction? (1)
> >>
> >> That series. We said we don't want individual CONFIG_SYSCTL, CONFIG_DOMCTL, etc.
> >> Instead a single umbrella option wants introducing. Which means there series
> >> doesn't need re-doing from scratch, but it may end up being a significant re-
> >> work, especially considering that CONFIG_SYSCTL is already in the codebase and
> >> hence now also needs replacing.
> > 
> > I would not characterize this series as "moving us in an unwanted
> > direction". Yes, it introduces a separate CONFIG_DOMCTL, which we
> > agreed we do not want. However, simplifying it to reuse a single
> > CONFIG is a minor improvement that can be addressed in v2. The main
> > challenge in this series is adding the #ifdef in the appropriate
> > places, and using a single CONFIG for domctl and sysctl would
> > actually help.
> 
> Well, when are we going to see a v2 then which does this? Of the three
> options I mentioned in the earlier reply, Oleksii favored the revert
> path, leaving open the get-everything-in one. For the latter, however,
> we need to see relatively constant progress now, or else time will run
> out. Whether to commit the patch here really depends on what route we
> settle on for 4.21.

While I share Jan's view that now is a good time to make progress on
"Introduce CONFIG_DOMCTL", and I also believe that this is the best
course of action, I would like to share a few thoughts on the other
alternatives.

My understanding is that the PV_SHIM_EXCLUSIVE option is no longer
widely used, and a small size increase would not compromise its
functionality and should be tolerable.

In general, we are slow at getting larger series reviewed and committed,
and choosing to revert rather than accept fixes tends to make us even
slower, which is undesirable.



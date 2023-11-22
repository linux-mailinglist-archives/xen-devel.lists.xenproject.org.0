Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5F67F5282
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 22:22:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639172.996179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ugJ-00020v-1A; Wed, 22 Nov 2023 21:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639172.996179; Wed, 22 Nov 2023 21:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ugI-0001yu-U4; Wed, 22 Nov 2023 21:22:46 +0000
Received: by outflank-mailman (input) for mailman id 639172;
 Wed, 22 Nov 2023 21:22:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5ugH-0001ym-3X
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 21:22:45 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45f32b3f-897d-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 22:22:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E6A5FB8294A;
 Wed, 22 Nov 2023 21:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD40FC433C7;
 Wed, 22 Nov 2023 21:22:40 +0000 (UTC)
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
X-Inumbo-ID: 45f32b3f-897d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700688162;
	bh=bDAfhEPHzjlzjMoZSvWFqcBnRX6fVs7/i5GdDg5IL4Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G/cB3mAnUJIE1Jbb7qAZoNtYssoqPXhqUANXxvj0JIYpjCkUFcBPmMBYf8QwxBFBt
	 pxYqRyRMIZ6xfVoG1HEXRqnFLYh+UHe2vd4Du6zWzdSRB2uzusxW+r9G9cdMJTJFb4
	 Yl82hNBJ3XUOshVbqJ4+CXhJx4aw7D070DNUWFMfzXE11GwSlJpATNDOmJl/aReamZ
	 +TV/mhOd1Bl2MJe16gljXB+f1YJbIF5QxWvtomeYat1eE3sGGHDje18e0sGzIfL3Cg
	 x9uRAj35ZK4R+pGj6wIkzokPmE5YLo7b1tPIowdVsgUhAtihuwwLmnNlTni04E6g4D
	 1gnFhfcMcS4wA==
Date: Wed, 22 Nov 2023 13:22:39 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen Devel <xen-devel@lists.xenproject.org>, 
    Consulting <consulting@bugseng.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Roger Pau <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>
Subject: Re: Devise macros to encapsulate (x & -x)
In-Reply-To: <054ccbe1173f4a9ec27ca4201e6d74a2@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311221322270.2053963@ubuntu-linux-20-04-desktop>
References: <08e6cb27d65250d109df0ef8a49dc80a@bugseng.com> <ddb70b8e-e014-4389-9572-8d5272a73ec3@citrix.com> <alpine.DEB.2.22.394.2311171845440.773207@ubuntu-linux-20-04-desktop> <da1d557a-6030-4dd8-a875-af733572fc48@xen.org>
 <alpine.DEB.2.22.394.2311211742400.2053963@ubuntu-linux-20-04-desktop> <1799e5c8-ab8a-453f-96f0-c3b66ae446e1@suse.com> <054ccbe1173f4a9ec27ca4201e6d74a2@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Nov 2023, Nicola Vetrini wrote:
> > > 
> > > Jan, would you be willing to accept that other maintainers have a
> > > preference for having a single MACRO even if suboptimal?
> > 
> > I can live with that, even if I'm surprised by this perspective that others
> > take. How can we, in reviews, tell people to make sure arguments are
> > evaluated only once, when then we deliberately do otherwise in a case like
> > the one here? The criteria of "not likely to be used in cases that have
> > side effects" is an extremely fuzzy and sufficiently weak one, imo. I for
> > one am even worried about the uses in MASK_EXTR() / MASK_INSR(), and would
> > have considered introducing single-evaluation forms there as well.
> > 
> > > If so, can we go ahead and commit the original patches?
> > 
> > Well, the renaming needs to be done there anyway.
> > 
> 
> I can do the renaming if you don't feel particularly safe doing it on commit

Please resend


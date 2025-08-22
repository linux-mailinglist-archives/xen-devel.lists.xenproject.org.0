Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E68A1B30A09
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 02:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089398.1447001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upFMc-0003Rt-JD; Fri, 22 Aug 2025 00:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089398.1447001; Fri, 22 Aug 2025 00:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upFMc-0003Pg-F4; Fri, 22 Aug 2025 00:10:38 +0000
Received: by outflank-mailman (input) for mailman id 1089398;
 Fri, 22 Aug 2025 00:10:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMUB=3C=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1upFMb-000210-MQ
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 00:10:37 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d73c10e-7eec-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 02:10:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 99623A58715;
 Fri, 22 Aug 2025 00:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3958C4CEEB;
 Fri, 22 Aug 2025 00:10:33 +0000 (UTC)
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
X-Inumbo-ID: 6d73c10e-7eec-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755821435;
	bh=V6JCB3oV/8KCa8AYl3yNLWg0+7UcCAJmrI6hHA4t4/w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gjPBhnMsPFOo/HDMyKgXCxfBWgulbyZKqbNVA5z/a939kQ7QUpmF0Dwg+p3ggvYYm
	 V5zeaOM5eBPpVfpin+XiYUG779AtJOLteoad3G+PJAJr/mV6ujYB+WPKVi2nvvdSq3
	 BetXxLz+VJi9Bp9PSTHPTQV/DYabwFybHWVmSZLo6IwNSaj2L+zideX0zTi8G57x5g
	 1pS8nwUf1rsLA9ryLCV4lC6yLAIUOfDDMTa8JeFRfQ2w6phCeBnlliMGtBsQhm+6X6
	 +gfORDjnfe55wBItpHuEBzzT5/0wKzZoddg1E40/xEOqP667DNNPtOdD1sq288MMCH
	 yjBW4Y9DGN0Gg==
Date: Thu, 21 Aug 2025 17:10:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "Penny, Zheng" <penny.zheng@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
In-Reply-To: <43f0c9a6-a4f3-44e0-959f-a021ae3b0466@suse.com>
Message-ID: <alpine.DEB.2.22.394.2508211710060.2743087@ubuntu-linux-20-04-desktop>
References: <20250815102728.1340505-1-Penny.Zheng@amd.com> <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com> <DM4PR12MB84519FE74D66604440827EA9E133A@DM4PR12MB8451.namprd12.prod.outlook.com> <43f0c9a6-a4f3-44e0-959f-a021ae3b0466@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1263261650-1755821435=:2743087"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1263261650-1755821435=:2743087
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 21 Aug 2025, Jan Beulich wrote:
> On 20.08.2025 05:12, Penny, Zheng wrote:
> > [Public]
> > 
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: Monday, August 18, 2025 4:31 PM
> >> To: Penny, Zheng <penny.zheng@amd.com>; Oleksii Kurochko
> >> <oleksii.kurochko@gmail.com>
> >> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
> >> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
> >> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
> >> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
> >> <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
> >> Subject: Re: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
> >>
> >> On 15.08.2025 12:27, Penny Zheng wrote:
> >>> In order to fix CI error of a randconfig picking both
> >>> PV_SHIM_EXCLUSIVE=y and HVM=y results in hvm.c being built, but
> >>> domctl.c not being built, which leaves a few functions, like
> >>> domctl_lock_acquire/release() undefined, causing linking to fail.
> >>> To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE
> >>> Makefile /hypercall-defs section, with this adjustment, we also need
> >>> to release redundant vnuma_destroy() stub definition from
> >>> PV_SHIM_EXCLUSIVE guardian, to not break compilation Above change will
> >>> leave dead code in the shim binary temporarily and will be fixed with
> >>> the introduction of domctl-op wrapping.
> >>
> >> Well, "temporarily" is now getting interesting. While v1 of "Introduce
> >> CONFIG_DOMCTL" was submitted in time to still be eligible for taking into 4.21,
> >> that - as indicated elsewhere - is moving us further in an unwanted direction. Hence
> >> I'm not sure this can even be counted as an in-time submission. Plus it looks to be
> >> pretty extensive re-work in some areas.
> >> Hence I'm somewhat weary as to 4.21 here. IOW question, mainly to Oleksii, is
> >> whether to
> >> 1) strive to complete that work in time (and hence take the patch here),
> >> 2) take the patch here, accepting the size regression for the shim, or
> >> 3) revert what has caused the randconfig issues, and retry the effort in
> >>    4.22.
> >>
> >>> Fixes: 568f806cba4c ("xen/x86: remove "depends on
> >>> !PV_SHIM_EXCLUSIVE"")
> >>> Reported-by: Jan Beulich <jbeulich@suse.com>
> >>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> >>
> >> My earlier question (when the patch still was part of a series) sadly has remained
> >> unanswered: You've run this through a full round of testing this time?
> > 
> > Sorry, missed that, yes, it has been tested with both default defconfig and allyesconfig.
> 
> I'm sorry if my request was unclear, but with "full round of testing" I in particular
> meant a full CI pipeline, plus (given the issue that's being fixed) some extra
> randconfig testing.

https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1997431361

I ran a few tests myself changing config options on purpose trying to
break it, and so far they were all successful.
--8323329-1263261650-1755821435=:2743087--


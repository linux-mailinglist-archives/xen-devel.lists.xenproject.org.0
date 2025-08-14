Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF4CB272E9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 01:15:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082645.1442420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umh9N-0003k8-8y; Thu, 14 Aug 2025 23:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082645.1442420; Thu, 14 Aug 2025 23:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umh9N-0003ie-6E; Thu, 14 Aug 2025 23:14:25 +0000
Received: by outflank-mailman (input) for mailman id 1082645;
 Thu, 14 Aug 2025 23:14:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfDD=22=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1umh9M-0003iY-2v
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 23:14:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69177a64-7964-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 01:14:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1F2B95C6F45;
 Thu, 14 Aug 2025 23:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA6DC4CEED;
 Thu, 14 Aug 2025 23:14:19 +0000 (UTC)
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
X-Inumbo-ID: 69177a64-7964-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755213260;
	bh=QJo7sR57A90hMJBr0SQ3Pgkvw+Xm7vtfsmBF4NCJMF4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o+eV+wAIEfYZo7K8t+zbP7Q6JX+JIXZFuacGpFOFQiNqms/JS9ckSnQ2znT6wkFDZ
	 4HYV6QYKCZWWaF2EYRi6rG3AePoIshraEcANIVSlDGg561bTUuW7OdmlydtQfA4/N/
	 1k672uzBq3ysVH3FVIzlMynu9Ey1x2C8osEUrG3KKN2695UdZZWfy6TzGn9G3osBj5
	 Hb7LYvtdvO59yjWlZBsqZUnfsMdtKV4yWDuKc8HFjec+wGGZfc8U3Evs49rHrzjXo7
	 xYvyhC9Yl79V2o17MngPvZpHTm58yUMRRYL04Wha2FyHaq/oi/xA/B0pRIafCbhNIv
	 S/ACCzKZriadQ==
Date: Thu, 14 Aug 2025 16:14:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "Penny, Zheng" <penny.zheng@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 01/25] xen/x86: move domctl.o out of
 PV_SHIM_EXCLUSIVE
In-Reply-To: <3e20688c-c125-4aa4-bc06-1fe634550f70@suse.com>
Message-ID: <alpine.DEB.2.22.394.2508141604510.10166@ubuntu-linux-20-04-desktop>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com> <20250803094738.3625269-2-Penny.Zheng@amd.com> <371bc812-acdb-41ef-950b-3c9e5feea48e@suse.com> <DM4PR12MB84510F1F89641B672916C055E122A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <3e20688c-c125-4aa4-bc06-1fe634550f70@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1533615221-1755212732=:10166"
Content-ID: <alpine.DEB.2.22.394.2508141612420.10166@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1533615221-1755212732=:10166
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2508141612421.10166@ubuntu-linux-20-04-desktop>

On Tue, 5 Aug 2025, Jan Beulich wrote:
> On 05.08.2025 05:38, Penny, Zheng wrote:
> > [Public]
> > 
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: Monday, August 4, 2025 3:43 PM
> >> To: Penny, Zheng <penny.zheng@amd.com>
> >> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
> >> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
> >> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
> >> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
> >> <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
> >> Subject: Re: [PATCH v1 01/25] xen/x86: move domctl.o out of
> >> PV_SHIM_EXCLUSIVE
> >>
> >> On 03.08.2025 11:47, Penny Zheng wrote:
> >>> In order to fix CI error of a randconfig picking both
> >>> PV_SHIM_EXCLUSIVE=y and HVM=y results in hvm.c being built, but
> >>> domctl.c not being built, which leaves a few functions, like
> >>> domctl_lock_acquire/release() undefined, causing linking to fail.
> >>> To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE
> >>> Makefile /hypercall-defs section, with this adjustment, we also need
> >>> to release redundant vnuma_destroy() stub definition and paging_domctl
> >>> hypercall-defs from PV_SHIM_EXCLUSIVE guardian, to not break
> >>> compilation Above change will leave dead code in the shim binary
> >>> temporarily and will be fixed with the introduction of CONFIG_DOMCTL.
> >>>
> >>> Fixes: 568f806cba4c ("xen/x86: remove "depends on
> >>> !PV_SHIM_EXCLUSIVE"")
> >>> Reported-by: Jan Beulich <jbeulich@suse.com>
> >>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> >>> ---
> >>> v1 -> v2:
> >>> - remove paging_domctl hypercall-defs
> >>
> >> And you've run this through a full round of testing this time, in isolation?
> > 
> > This commit shall be committed together with "xen/x86: complement PG_log_dirty wrapping", (I've added in change log, idk why it didn't get delivered in the mail list in the last).
> 
> And "committed together" still means the two at least build okay independently
> (i.e. allowing the build-each-commit job to succeed)?
> 
> As to the missing indication thereof in the submission: Patch 01 has a revlog,
> so if anything was missing there you must have added it some other way. But
> the cover letter is lacking that information as well. (As indicated earlier,
> to increase the chance of such a remark actually being noticed, it's best put
> in both places.)
> 
> > As PG_log_dirty is disabled on PV mode, paging_domctl() will still have "undefined reference" on PV mode, which gets fixed in "xen/x86: complement PG_log_dirty wrapping".  I thought it better sits there.
> > If it doesn't comply with the commit policy, I'll move according fix here.
> 
> Let me post a pair of patches dealing with part of the problem, in an imo
> (longer term) more desirable way.

With this patch https://marc.info/?l=xen-devel&m=175438069103017
committed, can we go ahead with this patch, to resolve the outstanding
build problem?

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1533615221-1755212732=:10166--


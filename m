Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A107D760B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 22:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623297.971037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvktd-0000sp-Sy; Wed, 25 Oct 2023 20:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623297.971037; Wed, 25 Oct 2023 20:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvktd-0000qC-Pc; Wed, 25 Oct 2023 20:54:33 +0000
Received: by outflank-mailman (input) for mailman id 623297;
 Wed, 25 Oct 2023 20:54:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/NE+=GH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qvktc-0000m5-3T
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 20:54:32 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b18fc47b-7378-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 22:54:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7BC1DB82893;
 Wed, 25 Oct 2023 20:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDCFC433C8;
 Wed, 25 Oct 2023 20:54:28 +0000 (UTC)
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
X-Inumbo-ID: b18fc47b-7378-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698267269;
	bh=/sMdk3+Finvap0oP8OeA+Z9aRmdJ+YVcCJrX0i6NpuQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=apcmJYRHeWUMJb+moEICsH++mxoV+nmxCFLuBFsEE+UsteBe2mfg1gkA/5JB6vjEA
	 KJqRq5QONQ/rz1p+GH8QNUVMdV+DArtDlQScEKZwVTq0Y9qemrNBoxFMJuPZpulo7h
	 sR9wYCqP4qZkBcX8bfRHOe+XMBOfrt5O/+yLF545xwhYJXAHPUl9OkjkCeEg9ojijM
	 gheJSk8RArmv/JMFEoVm7qXXntBeBBPgzkhRMLu9+FCscnMMAkO9oL3qgTx65C+QSc
	 OaqtNwKcT9k2IPG9xlEulxGjDZ8oWPIrDbPsP1q2299Hh6r5cPaYjxPb/61RGSxmv0
	 TvOyVkVS/mtGg==
Date: Wed, 25 Oct 2023 13:54:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [for-4.19][PATCH] build: Allow setting KBUILD_DEFCONFIG in the
 environment
In-Reply-To: <0807134b-3ad1-900c-64ce-b60475d91d45@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310251353550.271731@ubuntu-linux-20-04-desktop>
References: <20231025082834.31680-1-michal.orzel@amd.com> <9e646df5-a9de-545a-e827-951a161c935f@suse.com> <14ab687e-2d2b-40a4-9f79-3f547bba286c@amd.com> <4cb8a480-a587-22cc-2f11-fd9d6cc8c1d3@suse.com> <5bd44ff0-041d-4fc5-ad6f-c9e1158c474b@amd.com>
 <0807134b-3ad1-900c-64ce-b60475d91d45@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Oct 2023, Jan Beulich wrote:
> On 25.10.2023 11:35, Michal Orzel wrote:
> > 
> > 
> > On 25/10/2023 11:26, Jan Beulich wrote:
> >>
> >>
> >> On 25.10.2023 11:21, Michal Orzel wrote:
> >>> On 25/10/2023 11:10, Jan Beulich wrote:
> >>>> On 25.10.2023 10:28, Michal Orzel wrote:
> >>>>> At the moment, in order to use a different defconfig target than default,
> >>>>> one needs to specify KBUILD_DEFCONFIG=<target> on the command line.
> >>>>> Switch to weak assignment, so that it can be also obtained from
> >>>>> environment similar to other KCONFIG/KBUILD variables.
> >>>>>
> >>>>> This change will activate the use of KBUILD_DEFCONFIG variable in CI
> >>>>> build jobs that so far had no effect.
> >>>>
> >>>> I'm certainly okay with the change, but the above sentence looks misleading
> >>>> to me: Yes, the envvar was ignored so far, but isn't it the case that the
> >>>> envvar as specified in CI matches what Makefile set it to (taking into
> >>>> account that for RISC-V riscv64_defconfig aliases tiny64_defconfig), and
> >>>> hence the specifications in build.yaml could be dropped (until such time
> >>>> where truly an override was intended)?
> >>> Well, today riscv64_defconfig matches tiny64_defconfig but it can change. Otherwise, why
> >>> would we need to have 2 identical files? Looking at the latest full build series from Oleksi,
> >>> only the tiny64_defconfig file gets updated which would be the clear indication that what is
> >>> specified in the CI matches the author's expectation.
> >>>
> >>> Also, I never mentioned that this change fixes something. I just wrote that it gives a meaning
> >>> to a variable that so far had no effect.
> >>
> >> Well, sure, but if you e.g. said "... that so far would have had no effect
> >> if they didn't match the default anyway", things would have been unambiguous.
> > Ok, I can see you did not provide any tag in which case I will wait for other's feedback.
> > Then, I can either respin the patch adding sentence you suggested or leave it to Stefano
> > to do when committing to his for-4.19 branch.
> 
> The reason I didn't offer A-b (yet) is that with the given description plus
> the claim on Matrix by someone that things don't work because of this
> override not working, it wasn't really clear to me whether that claim was
> wrong, or whether my view of the situation is. In the latter case I could
> hardly ack the patch, as that would then mean I'd ack something I don't
> understand. Provided there really has not been any breakage so far because
> of this, feel free to add
> Acked-by: Jan Beulich <jbeulich@suse.com>
> preferably with the slightly adjusted description.

Added to for-4.19 with the adjusted commit message


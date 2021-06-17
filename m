Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3973ABDFD
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 23:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144156.265403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltzWc-0004Ta-5c; Thu, 17 Jun 2021 21:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144156.265403; Thu, 17 Jun 2021 21:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltzWc-0004R5-1u; Thu, 17 Jun 2021 21:26:10 +0000
Received: by outflank-mailman (input) for mailman id 144156;
 Thu, 17 Jun 2021 21:26:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uYqS=LL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ltzWa-0004Qz-BD
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 21:26:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e94a7df-e5ed-47a2-b64d-528f4f4f049d;
 Thu, 17 Jun 2021 21:26:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14473613CE;
 Thu, 17 Jun 2021 21:26:05 +0000 (UTC)
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
X-Inumbo-ID: 8e94a7df-e5ed-47a2-b64d-528f4f4f049d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623965166;
	bh=QHSiuDjkImhfG7EZBqMDRV8+xFAIQX6kPnewyd+S9CY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eGz6Pv8aR0JYpMlb7DSwROkVnxGfU4WxMeu4ogi7VgsJV3WfWw4NMYBTQGNVqPCTL
	 xCRtJ/YaLHPvhhKe22KhvWgj+jSQ5T6m5jr7YQ8PkFuiTI8Dyn0asKCq1NaRjlfZCJ
	 bDtL3Pg09pc2QZ32vKKjqz18Dl91bbyEBV4lj8HwGu0PgWEBPBWGyx4GVJd+KMxSNc
	 YU2tMZ4gROoJG6C/MDXsvOjHUqK3Vk9PqKrr1xKgZ+U1pnKIS4jlykFrMsVmUf8OY0
	 ZkMgEBKyg4f2B7ojSk7hZcWu0CmJRT95819u9PeNwtfXUZnPCylmoYe9WzGJSXUod9
	 agzVQ5O6QAYew==
Date: Thu, 17 Jun 2021 14:26:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "committers@xenproject.org" <committers@xenproject.org>
Subject: Re: Regressed XSA-286, was [xen-unstable test] 161917: regressions
 - FAIL
In-Reply-To: <99833b7b-f626-fac5-d426-109afd4ffa38@suse.com>
Message-ID: <alpine.DEB.2.21.2106171409440.24906@sstabellini-ThinkPad-T480s>
References: <osstest-161917-mainreport@xen.org> <7cfa28ae-2fbe-0945-8a6c-a965ec52155f@citrix.com> <b57c2120-2f86-caa7-56ec-e215a7ad0529@suse.com> <637ff3c7-afeb-aae4-0f1d-5ae168e01e01@citrix.com> <99833b7b-f626-fac5-d426-109afd4ffa38@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Jun 2021, Jan Beulich wrote:
> GitlabCI doesn't tell me anything just yet, unless I go actively poll
> it. And as mentioned just yesterday on irc, I don't think I can easily
> navigate my way through those web pages, to find breakage I may have
> introduced and hence would better go fix. Unlike osstest, where I am
> told what failed, and I know where to find the corresponding logs.
> 
> It's also not clear to me at all in how far GitlabCI would have
> spotted the issue here, no matter whether it's caused by a hypervisor
> change or the XTF test being wrong. So far I've seen GitlabCI only
> spot build issues.

Without getting on the specifics of this problem, I just want to let you
know that Doug and I gave a little "tour" of GitlabCI at Xen Summit. I
recommend to watch the video when it becomes available. I find it very
easy to use and generally easier than other CIs. The very short version
is the following:


# find the pipeline running for the commits / patch series you care about

Pipelines for staging are here:
https://gitlab.com/xen-project/xen/-/pipelines

Pipelines for outstanding patch series on xen-devel are here:
https://gitlab.com/xen-project/patchew/xen/-/pipelines

I'll pick one of the recent runs for an outstanding series:
https://gitlab.com/xen-project/patchew/xen/-/pipelines/322112514

you can see what was committed by patchew by clicking on the link "84
jobs for patchew/20210616144324.31652-1-julien@xen.org in 87 minutes and
32 seconds (queued for 15 seconds)". The link brings you here where the
branch with the commits is:
https://gitlab.com/xen-project/patchew/xen/-/commits/patchew/20210616144324.31652-1-julien@xen.org


# find the failed jobs and logs

Look for the red "x" corresponding to individual jobs that failed in the
pipeline. In this case we have 2 red "x" on the right side which
correspond to these 2 jobs:

https://gitlab.com/xen-project/patchew/xen/-/jobs/1352370918
https://gitlab.com/xen-project/patchew/xen/-/jobs/1352370916

To get the full logs in text format simply click on the "document" icon
just above the black square with the logs. Other binary artifacts are
available if you click on "Download" on the right side of the screen.



# find details on the failed job

The jobs are divided into two groups: build jobs and test jobs. The
build jobs simply build Xen and tools with various compilers and
options. They are all in the left column in the pipeline page. They are
straightforward.

The test jobs are actually trying to run something inside QEMU (full
emulation). The scripts that runs things are:

automation/scripts/qemu-smoke-x86-64.sh
automation/scripts/qemu-smoke-arm64.sh
automation/scripts/qemu-alpine-arm64.sh

and their names correspond to the job names. In our example
qemu-smoke-x86-64.sh is the one that failed and it is running XTF inside
QEMU.


I hope this helps! I'd be happy to jump on a call to give you a short
intro on how to use gitlab-ci, just let me know.


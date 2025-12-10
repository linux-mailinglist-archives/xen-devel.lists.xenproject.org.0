Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BEACB3E7D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 20:58:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183243.1506001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTQJK-0000jc-3a; Wed, 10 Dec 2025 19:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183243.1506001; Wed, 10 Dec 2025 19:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTQJK-0000hG-0l; Wed, 10 Dec 2025 19:57:18 +0000
Received: by outflank-mailman (input) for mailman id 1183243;
 Wed, 10 Dec 2025 19:57:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TEw+=6Q=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vTQJI-0000hA-S9
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 19:57:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bf83a53-d602-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 20:57:14 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id A97A14EEBC5F;
 Wed, 10 Dec 2025 20:57:12 +0100 (CET)
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
X-Inumbo-ID: 6bf83a53-d602-11f0-9cce-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765396633;
	b=lH1ezkjPm2E5jujt6/CVXJ3FRRJdtriabdTSYLdm3XxjjJ6nl0QEUp99ag/IpeiloaI0
	 65Y2Wl8t2cemdIPYB9rPZh7K8XQJyPDzysv0X22XSNgvpz1L0QCZE8U1N5E8dnAta5Vhw
	 Ku7o5aIrjEdltnCn9CPoFLvWxWVoMCGzG7iW7Oj4Kumdu0V+U9FgbooMxhnm1Pm/5+cbL
	 wZl5JOm3LjAz+myQc1Ey6wwQZUL7SfrijjXgEN+BLlBNN84cjHGkTd759HjmbjKM67tAx
	 wvAa4d8WTkMZzyiFYWjswP00fc4bCQz8lm7FIO9D4Mov+Hknz1MIB7gc7lW07hpG/HVIY
	 GPzqCBOS8inoqLEdH8fR4uM0Nt7dJ5SvgXwFtOWPcHe9/Y3tdewA/bdPRQSF9Fc+9PFxX
	 Cy8XSge53FyduNH8JcxcbHieaqtIMWYiMcKdLDbZUtErmdSMfNyeQdMbXIr/8f9N9c6qg
	 dD6yyMWFToar04BZvRe0r5mYAWRrVTRjcKxMSy7pmp6KWbmgMtx66ou/R2rfqoGNTIjsb
	 1/gGeyRAKDiFI5Clp7DMOMqQgoRMJ3GRXhbqKu3uhg08AN5aLBl6napUMCDrTF4RwbTPR
	 QIRnzj/wtWRC8jgo3WCmF8Y0BRUBXTfhV17Vzq2BF7AJHY/O3IiGgzq0477qonQ=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765396633;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=7J6GIQn5bTLCjTeCDKUsD1gTByVSwkcqv4+C7fH0DJY=;
	b=Lvzu7sGyCXF7sTGdfkDOyE9a8obHO3WcuwXfR95WHq1I+RGxIK1Tqzb1DsDU7aHIy0qR
	 W4nIuGomzFswrYmrFGuXXxholZyib+4w3yBzWXU7E67v9Zptp+YZnNQ/bMk9H8DrMDWWE
	 UP4MIErXhMJu9mj5wnFDU1vMLmxs9ZGDP9y6eQpfIHLuWG6klvCn0gMgw03bhamYdXXaj
	 oThM/ei5dC3h5gB6E5fs6aDtURwPY2+zPJjDmLbXR9ir89RVVqLYVCvDECPaYACFfHh1G
	 i7nUi6MjjtB0pOET0ooYHDUufc0/ta6nED80a5UxB1xpVmn4dQhBLrkDALNkIk+WIaips
	 cxpiX82KhItiP9Tie0OH2IS98vn9EXrG+dB7Rpp3FS2VLkacGd89SYnQPkCtSLkaVo9kT
	 nqQ1UHrchqMCowNcTJz/RRmG3c1WHGvpa4wpDEp1zMggT1JpILLI4p5DCyIuM0j/NYeJL
	 IdjwGo+hSB/20TSaQfydOul8OxRb8efFCTfUrshdb5YOZZ7q8haCGY3tOzNz7VSEV0TN/
	 N2cgmeE/cTrevMy7DIuYziUIreDhn33fFCfm/rlxZk8t0LrLalO1nU4xx9+GdMgOeljzr
	 kFiB/I6tSBsp4ng88ttGYUQu9vwVUmKJAMStDYQ5C3h5k4qhKugmDaRr2SdEu+k=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765396633; bh=eN8zEt5MfY/mWZ3uL7CkZJ2gZpIrKLlnT5UjS3fKzvU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ThjBtr+S9I46Lm2PyFaVP34xx/L1+CceuzMxpj50uJAcqa4CRmWsRyiFjqNDRMWRT
	 /Yg+gHdbJfZbOw6j52II/LfyxxIdkyupJmoDB3hzfaT/KqgV+O0VjcSZUkg3iX5czx
	 ZfyJrdkSmOk5a3FnG//cKOwAt7knpZQHEReFFN8XPzT1enNzIwkOCzwKXJjslTo2wU
	 jSk6afPG4IyacpR9397re4/IE7EnquYggPq5igxnz+qQxGwXKMz3FLTxmtzKS4zyj8
	 wBIU/wX6AsawbCHLeb/d86PzUodQ/1VKUqTr+ysN9xKPw49bvDN+KzNRqe5eqZlvzO
	 zD7n2+stmiaeg==
MIME-Version: 1.0
Date: Wed, 10 Dec 2025 20:57:12 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?R?=
 =?UTF-8?Q?oger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Anthony
 PERARD <anthony.perard@vates.tech>
Subject: Re: Current Eclair analysis
In-Reply-To: <7744f9e7-17da-4f48-837d-8fc087899af5@citrix.com>
References: <7744f9e7-17da-4f48-837d-8fc087899af5@citrix.com>
Message-ID: <5becde412c1496f392d184763fe34442@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

thanks for the feedback, it's very appreciated.

On 2025-12-10 19:14, Andrew Cooper wrote:
> Hello,
> 
> The Eclair step is now the dominating aspect of wallclock time.  While
> the recent changes were a step in the right direction, we need some
> adjustments.
> 
> First, we have *-testing running in all cases, but my understanding was
> that that was supposed to be for deploying a new version of Eclair.  
> Can
> we make this be generally off?
> 

Definitely; it was an oversight on my part when testing the patch, 
because I used a repo/tree that was supposed to run those *-testing 
jobs. As soon as I can find some free time to work on it, I'll 
investigate and send a patch, unless someone beats me to it.

> Next, jobs are scheduled in the order they appear in the yaml file,
> which means the general ARM one goes ahead of the safety target.  Just
> something to bear in mind as changes are being made.
> 

Well, but the general one should be allocated to the larger runner that 
runs both safety and non-safety jobs, so in my opinion this is fine. 
When the *-safety jobs start, they'll be picked up by the less powerful 
eclair-safety-runner one at a time.

> While the x86 runs are non-fatal, having them fail is still gets in the
> way of trivially telling that the pipeline is green.
> 

See below for the consideration about clean rules, but the idea is that 
we can get rid of most of those fairly quickly. I did glance at most of 
those, but the time I have for preparing patches is quite scarce. I see 
that Michal has done some work already on Arm; I did share with him a 
few half-done patches that I have in a branch of mine [1], and I will 
also take a look at the series you just sent.

[1] 
https://gitlab.com/xen-project/people/bugseng/xen/-/tree/eclair_pipeline?ref_type=heads

> The names, -safety and no suffix are a little problematic, seeing as
> everything here is for safety use.
> 
> 
> Overall, what I think we want is something more like this:
> 
> Jobs named as *-all and *-amd.  After all, it's AMD's safety target
> specifically, not necessarily someone elses.
> 

Well, depends on how you look at that: the *-safety jobs have a fixed 
config, while the configuration for the general Arm and x86 jobs may 
vary as Xen changes. That being said, I don't mind changing names 
personally; I just went with what seemed more natural at the time.

> The *-all targets want everything possible enabling. Ideally we want
> something like Linux's COMPILE_TEST, but in the short term we can just
> adjust the input Kconfig.
> 

Ack

> Like we had with the common configuration and the per-arch
> configuration, I think we want to express the clean rules as common,
> with a wider (a.k.a stricter) set used for the *-amd target.
> 
> The longterm goal is to get the *-all targets as strict as the *-amd
> targets, but right now because there are no blocking clean rules, it's
> easier for regressions to slip in.
> 

Ack. I tried to start simpler and then iterate based on feedback. Should 
be rather easy to craft a configuration doing that.

> This brings us back to the debate about the excluded files from 
> external
> sources.  They still need fixing one way or another.  Do we see about
> including them for analysis in the *-all targets, or leave them 
> excluded
> knowing that whomever need to unpack that can of worms needs to do a 
> lot
> of fixing anyway?
> 

I had debated addressing this, but in the end I opted to prioritize 
fixes to the violations originating from Xen code. Who wants to qualify 
Xen in the end needs to pick features/configurations, so my take is that 
everything that is not truly kept in sync with the external source 
(e.g., recent discussions about libelf w.r.t XSA-55) should be made 
compliant eventually, and then it is on the downstreams to decide on 
what to do with respect to external source dependencies in their 
usecase. Stricly speaking, they would be subjected to MISRA compliance, 
but the point is moot if they are not actually used.

> Does this sound sensible?
> 
> Thanks,
> 
> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253


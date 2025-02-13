Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B77A34E75
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 20:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887986.1297404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tier0-0003NZ-Su; Thu, 13 Feb 2025 19:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887986.1297404; Thu, 13 Feb 2025 19:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tier0-0003LR-QA; Thu, 13 Feb 2025 19:26:30 +0000
Received: by outflank-mailman (input) for mailman id 887986;
 Thu, 13 Feb 2025 19:26:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tieqz-0003LI-Jv
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 19:26:29 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b89429d-ea40-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 20:26:28 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C52F0A42959;
 Thu, 13 Feb 2025 19:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553F3C4CED1;
 Thu, 13 Feb 2025 19:26:25 +0000 (UTC)
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
X-Inumbo-ID: 6b89429d-ea40-11ef-88c1-8ba37f82fa57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739474786;
	bh=Q+nojufZ/5hssllHxPtzuF6pzFvYFO85onUkjTV150c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sKs4sEBujLcbxvlaq2IlqO4bKL3ewsrxmbLhjHpl5WtSFxZiiuegok5CzUJ/8QIjT
	 xA/TCTls7hEeW7V8UaiibkR27AoEkSrVdmQZlMuElSY8WQaVrMy0LBu95CUCUVZPg4
	 B1opQrvsVVEISGXsilVANdksGNBpWg7DMa/YSwkMVVTcypPdr45+93jmxZSxi4D+8m
	 lzGLtPddZGGrl4a2UJXdwnUu5yzScwNjW2+EjpKBf4ymPqwncfACQxQG8NANS/HEHS
	 QmjfSX60unlDUwUIdq7M0oUfxp4sC1K2Ixa9FKl22MktlHvdQLDWAqymAADbEyh/+M
	 zb1fjmTN4GFeA==
Date: Thu, 13 Feb 2025 11:26:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] radix-tree: don't left-shift negative values
In-Reply-To: <A7FE0F28-A75E-4CE1-B649-1D92BE334852@arm.com>
Message-ID: <alpine.DEB.2.22.394.2502131120430.619090@ubuntu-linux-20-04-desktop>
References: <70ebba90-59a8-4224-b67c-b9eb373684b4@suse.com> <0de3a7e8c55af172e7260f8bb22949b4@bugseng.com> <2118904d-3a33-47f3-af68-7303bc17186c@suse.com> <e34113912d9886a876fd5f3bd094abb2@bugseng.com> <8ca92f7360385a5b4033cf22ef843775@bugseng.com>
 <A7FE0F28-A75E-4CE1-B649-1D92BE334852@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Feb 2025, Luca Fancellu wrote:
> > On 13 Feb 2025, at 15:42, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
> > On 2025-02-13 16:32, Nicola Vetrini wrote:
> >> On 2025-02-13 16:01, Jan Beulich wrote:
> >>> On 13.02.2025 15:52, Nicola Vetrini wrote:
> >>>> On 2025-02-13 15:22, Jan Beulich wrote:
> >>>>> Any (signed) integer is okay to pass into radix_tree_int_to_ptr(), yet
> >>>>> left shifting negative values is UB. Use an unsigned intermediate type,
> >>>>> reducing the impact to implementation defined behavior (for the
> >>>>> unsigned->signed conversion).
> >>>>> Also please Misra C:2012 rule 7.3 by dropping the lower case numeric
> >>>>> 'l'
> >>>>> tag.
> >>>>> No difference in generated code, at least on x86.
> >>>>> Fixes: b004883e29bb ("Simplify and build-fix (for some gcc versions)
> >>>>> radix_tree_int_to_ptr()")
> >>>>> Reported-by: Teddy Astie <teddy.astie@vates.tech>
> >>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>> ---
> >>>>> Bugseng: Why was the 7.3 violation not spotted by Eclair? According to
> >>>>>         tagging.ecl the codebase is clean for this rule, aiui.
> >>>> radix-tree.{c,h} is out of scope:
> >>>> automation/eclair_analysis/ECLAIR/out_of_scope.ecl:32:-file_tag+={out_of_scope,"^xen/include/xen/radix-tree\\.h$"}
> >>>> docs/misra/exclude-list.json:153:            "rel_path":
> >>>> "common/radix-tree.c",
> >>> Is there a record of why they are excluded? Is it further explainable
> >>> why exclude-list.json mentions only the .c file and out_of_scope.ecl
> >>> mentions only the .h one? Shouldn't different parts be in sync?
> >> exclude-list.json is used to generate a configuration file for ECLAIR just before the analysis starts, so effectively both are excluded. It's a good point however to have only one file to handle exclusions, and use that file to generate the exclusion list dynamically, but then someone might want to exclude certain files only in some analyses and not others, which is not a good fit for exclude-list.json as it is now.
> >> @Stefano, thoughts?
> > 
> > I forgot to address the first question: the (vague) reasons are listed in exclude-list.json as the "comment" field; in most cases, it's because the files have been imported from Linux, but the full rationale is something that should be asked to the original author, which is Luca Fancellu.
> 
> So IIRC the full rationale is that since some files are imported from Linux, we would like to maintain them as they are
> in order to ease backports. Misra fixes can be done, but they need to be upstreamed to Linux and backported to Xen.
> 
> Probably a re-evaluation could be done by the maintainers to see if some of these files could be removed from the exclusion
> list.

Yes, it is as Luca said. At the beginning of the project, we reviewed
the codebase to define what was in scope and what was out of scope. One
area of contention was the files imported from Linux. Many of these
files were declared out of scope because we wanted to retain the ability
to easily synchronize them with their corresponding files in Linux.  

Now, years have passed, and we have gained significant experience from
running this project. It is completely acceptable to redefine the scope,
including making changes to exclude-list.json.

However, we do not necessarily need to modify exclude-list.json to
accept a single, clearly beneficial fix like this one. So, Jan, feel
free to proceed and commit it.  

I just wanted to provide some background. If you believe that removing
common/radix-tree.c from docs/misra/exclude-list.json, and thereby
including it in ECLAIR's regular scanning, would be the best approach, I
am also fine with that.


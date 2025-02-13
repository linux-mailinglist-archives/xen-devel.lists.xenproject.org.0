Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C570FA350A5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 22:47:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888064.1297475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tih2q-0008K2-Jm; Thu, 13 Feb 2025 21:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888064.1297475; Thu, 13 Feb 2025 21:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tih2q-0008HN-Go; Thu, 13 Feb 2025 21:46:52 +0000
Received: by outflank-mailman (input) for mailman id 888064;
 Thu, 13 Feb 2025 21:46:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tih2p-0008HH-IZ
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 21:46:51 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0731541b-ea54-11ef-9aa4-95dc52dad729;
 Thu, 13 Feb 2025 22:46:49 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4494EA420ED;
 Thu, 13 Feb 2025 21:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB542C4CED1;
 Thu, 13 Feb 2025 21:46:46 +0000 (UTC)
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
X-Inumbo-ID: 0731541b-ea54-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739483208;
	bh=/LSltqv0B7XEaok+PlIH2kuuu6HbZuvIGUGJLysaHs0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZXJP945Ovb1vHhgHaHZRcTkQq0ceQCPY79IM7zunvhfMK1af7xBY4pzbEoMhTSNGD
	 BNiAzt4S8m9VGwc/irNCNfu7cpRWz/ecWzqh3SF8l+df8Y98tIaoPgw01pJownO+wQ
	 TASzZqCSLMSQOdWcJVZRY7k3kHreUNLoataLpZDVCZ6eARZYl36oPwBNQaub8FOnIF
	 LstT5IKrkgW3AzXuNgSL+B9xHZhIGH4b4+eB1+DgFPykoO3ZytY56G0gspK2GT0wdC
	 uiooAPcLr4erwbDtyjLr5ZhX5IbZKgTxCmHWSF2v3N6eeKPZp+gGAo8W7343u428I7
	 QAH1NIFcfuVBw==
Date: Thu, 13 Feb 2025 13:46:45 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Luca Fancellu <Luca.Fancellu@arm.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] radix-tree: don't left-shift negative values
In-Reply-To: <1dc1773f-891e-40d8-97a6-5adaa0613ffe@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2502131256280.619090@ubuntu-linux-20-04-desktop>
References: <70ebba90-59a8-4224-b67c-b9eb373684b4@suse.com> <0de3a7e8c55af172e7260f8bb22949b4@bugseng.com> <2118904d-3a33-47f3-af68-7303bc17186c@suse.com> <e34113912d9886a876fd5f3bd094abb2@bugseng.com> <8ca92f7360385a5b4033cf22ef843775@bugseng.com>
 <A7FE0F28-A75E-4CE1-B649-1D92BE334852@arm.com> <alpine.DEB.2.22.394.2502131120430.619090@ubuntu-linux-20-04-desktop> <1dc1773f-891e-40d8-97a6-5adaa0613ffe@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-378845352-1739480355=:619090"
Content-ID: <alpine.DEB.2.22.394.2502131259410.619090@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-378845352-1739480355=:619090
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2502131259411.619090@ubuntu-linux-20-04-desktop>

On Thu, 13 Feb 2025, Andrew Cooper wrote:
> On 13/02/2025 7:26 pm, Stefano Stabellini wrote:
> > On Thu, 13 Feb 2025, Luca Fancellu wrote:
> >>> On 13 Feb 2025, at 15:42, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
> >>> On 2025-02-13 16:32, Nicola Vetrini wrote:
> >>>> On 2025-02-13 16:01, Jan Beulich wrote:
> >>>>> On 13.02.2025 15:52, Nicola Vetrini wrote:
> >>>>>> On 2025-02-13 15:22, Jan Beulich wrote:
> >>>>>>> Any (signed) integer is okay to pass into radix_tree_int_to_ptr(), yet
> >>>>>>> left shifting negative values is UB. Use an unsigned intermediate type,
> >>>>>>> reducing the impact to implementation defined behavior (for the
> >>>>>>> unsigned->signed conversion).
> >>>>>>> Also please Misra C:2012 rule 7.3 by dropping the lower case numeric
> >>>>>>> 'l'
> >>>>>>> tag.
> >>>>>>> No difference in generated code, at least on x86.
> >>>>>>> Fixes: b004883e29bb ("Simplify and build-fix (for some gcc versions)
> >>>>>>> radix_tree_int_to_ptr()")
> >>>>>>> Reported-by: Teddy Astie <teddy.astie@vates.tech>
> >>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>>>> ---
> >>>>>>> Bugseng: Why was the 7.3 violation not spotted by Eclair? According to
> >>>>>>>         tagging.ecl the codebase is clean for this rule, aiui.
> >>>>>> radix-tree.{c,h} is out of scope:
> >>>>>> automation/eclair_analysis/ECLAIR/out_of_scope.ecl:32:-file_tag+={out_of_scope,"^xen/include/xen/radix-tree\\.h$"}
> >>>>>> docs/misra/exclude-list.json:153:            "rel_path":
> >>>>>> "common/radix-tree.c",
> >>>>> Is there a record of why they are excluded? Is it further explainable
> >>>>> why exclude-list.json mentions only the .c file and out_of_scope.ecl
> >>>>> mentions only the .h one? Shouldn't different parts be in sync?
> >>>> exclude-list.json is used to generate a configuration file for ECLAIR just before the analysis starts, so effectively both are excluded. It's a good point however to have only one file to handle exclusions, and use that file to generate the exclusion list dynamically, but then someone might want to exclude certain files only in some analyses and not others, which is not a good fit for exclude-list.json as it is now.
> >>>> @Stefano, thoughts?
> >>> I forgot to address the first question: the (vague) reasons are listed in exclude-list.json as the "comment" field; in most cases, it's because the files have been imported from Linux, but the full rationale is something that should be asked to the original author, which is Luca Fancellu.
> >> So IIRC the full rationale is that since some files are imported from Linux, we would like to maintain them as they are
> >> in order to ease backports. Misra fixes can be done, but they need to be upstreamed to Linux and backported to Xen.
> >>
> >> Probably a re-evaluation could be done by the maintainers to see if some of these files could be removed from the exclusion
> >> list.
> > Yes, it is as Luca said. At the beginning of the project, we reviewed
> > the codebase to define what was in scope and what was out of scope. One
> > area of contention was the files imported from Linux. Many of these
> > files were declared out of scope because we wanted to retain the ability
> > to easily synchronize them with their corresponding files in Linux.  
> >
> > Now, years have passed, and we have gained significant experience from
> > running this project. It is completely acceptable to redefine the scope,
> > including making changes to exclude-list.json.
> >
> > However, we do not necessarily need to modify exclude-list.json to
> > accept a single, clearly beneficial fix like this one. So, Jan, feel
> > free to proceed and commit it.  
> >
> > I just wanted to provide some background. If you believe that removing
> > common/radix-tree.c from docs/misra/exclude-list.json, and thereby
> > including it in ECLAIR's regular scanning, would be the best approach, I
> > am also fine with that.
> 
> I agree with Jan that it's important that we have a single source of truth.
> 
> Furthermore, it is critical that the justification of why things are in
> certain categories are identified.  It only needs to be a single
> sentence in a comment, but a developer needs to be able to look at the
> file and figure out *why* a decision was taken...
> 
> ... because as Stefano says, decisions change over time, opinions and
> scope change, etc.

The single source of truth is supposed to be
docs/misra/exclude-list.json, which has an entry for radix-tree with a
simple explanation:

        {
            "rel_path": "common/radix-tree.c",
            "comment": "Imported from Linux, ignore for now"
        },

However, reading the code and also Nicola's answer, I can see that
automation/eclair_analysis/ECLAIR/out_of_scope.ecl is adding extra
excludes on top of exclude-list.json. There are three groups of files:

1) Intel specific source files are out of scope
2) Build tools are out of scope
3) Out of scope headers


Nicola, I think that 2) and 3) should be in
docs/misra/exclude-list.json. Do you recall why it was not done this way
in the first place? Can we make the change now?


In regard to 1), I would leave it in out_of_scope.ecl for now. Ideally
we wouldn't need an exclude list for Intel files because we should be
able to exclude them using Kconfig options. But of course when we
started the MISRA project there was no way to do that and even now the
Kconfig infrastructure might not be able to remove all the files in
group 1).

As we are working on adding a second ECLAIR scan with a larger
configuration, it would make sense to add all the files in group 1) to
that scan.

I would prefer to keep them disabled in the smaller ECLAIR scan
configuration that we have today for a simple reason: I think our
priority for that scan should be to reach zero violations as fast as
possible to mark as many rules as possible as blocking. I am hesitant to
increase the scope until we do that because it could be
counter-productive.


> As to the specifics of radix-tree, I personally think is rather
> disingenuous to say "here's a data-structure fundamental to the
> operation of Xen, but because the code is written in Linux style we
> chose to ignore problems in it."   A certifier would be well with their
> rights to tell you where to go if you tried to argue that point.
> 
> It is code in Xen, and critical to Xen's behaviour.  It doesn't matter
> if you want to do a Linux-first or Xen-first approach to fixing issues;
> the issues need fixing.

I am happy to make the relevant changes to docs/misra/exclude-list.json
(and automation/eclair_analysis/ECLAIR/out_of_scope.ecl.)

Jan do you also agree as well? If yes, I'll work out exactly how to
proceed based on whether removing radix-tree from exclude-list.json
trigger other violations or not.
--8323329-378845352-1739480355=:619090--


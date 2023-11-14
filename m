Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 684FB7EB952
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 23:28:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633363.988092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r31tQ-00073F-S3; Tue, 14 Nov 2023 22:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633363.988092; Tue, 14 Nov 2023 22:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r31tQ-00070o-Oh; Tue, 14 Nov 2023 22:28:24 +0000
Received: by outflank-mailman (input) for mailman id 633363;
 Tue, 14 Nov 2023 22:28:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wE9C=G3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r31tP-00070i-EE
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 22:28:23 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e6754a6-833d-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 23:28:22 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DF326B8179D;
 Tue, 14 Nov 2023 22:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEC5C433C8;
 Tue, 14 Nov 2023 22:28:18 +0000 (UTC)
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
X-Inumbo-ID: 1e6754a6-833d-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700000901;
	bh=AB2crUMf6wX6IRWgiYGffA4wpqcoSbf9thMYfTdb6tc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cF22DnlALlYWIzL2lIWcVxvvf6haqczjLxbX8FXqV7/4UxqQQg2qzuimRmEh4r4oo
	 v0V51/1yS/X7x4woQnXwGBGt0UnR8u0wkteg9LnVIPzVTBdH8z1vcgUWFJqshhrGMQ
	 /5ZLSxmDAKRPEmZl9sokP/+G0W7NQgvWlQ+xbSpcjEuRN6kqJlovF/6PuCXxTzMIcl
	 gB1JUu+C+hiilxqS957bmLpO5i0GSCTSKNZup3qgnpCixqsaO90DBghwpPvW4gPifd
	 44aIz64yXagZq0zKt9eJA+qA7hMwtDITpbnyhwHU1DWaaofU96ot14l+PmJZyEEpzi
	 7ep58bW0DCZ3A==
Date: Tue, 14 Nov 2023 14:28:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v4] xen: address violations of Rule 11.9
In-Reply-To: <664811f5d165e8165501d2062e694062@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311141427270.160649@ubuntu-linux-20-04-desktop>
References: <b8a82daf5862287bda9545d7e672ce98e49004a2.1697701358.git.nicola.vetrini@bugseng.com> <b7df2987-ab46-bb09-4440-e743018561ad@suse.com> <alpine.DEB.2.22.394.2311131557210.160649@ubuntu-linux-20-04-desktop> <82637305-58ff-3204-09f4-13a1f2c969fb@suse.com>
 <664811f5d165e8165501d2062e694062@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Nov 2023, Nicola Vetrini wrote:
> On 2023-11-14 08:19, Jan Beulich wrote:
> > On 14.11.2023 00:58, Stefano Stabellini wrote:
> > > On Mon, 13 Nov 2023, Jan Beulich wrote:
> > > > On 19.10.2023 09:55, Nicola Vetrini wrote:
> > > > > The constant 0 is used instead of NULL in '__ACCESS_ONCE' as a
> > > > > compile-time check to detect non-scalar types; its usage for this
> > > > > purpose is deviated.
> > > > > 
> > > > > Furthermore, the 'typeof_field' macro is introduced as a general way
> > > > > to access the type of a struct member without declaring a variable
> > > > > of struct type. Both this macro and 'sizeof_field' are moved to
> > > > > 'xen/macros.h'.
> > > > > 
> > > > > No functional change intended.
> > > > > 
> > > > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > > > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > > > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > > > > ---
> > > > > Changes in v2:
> > > > > - added entry in deviations.rst
> > > > > Changes in v3:
> > > > > - dropped access_field
> > > > > - moved macro to macros.h
> > > > > ---
> > > > > Changes in v4:
> > > > > - Amend deviation record.
> > > > > ---
> > > > >  automation/eclair_analysis/ECLAIR/deviations.ecl |  9 +++++++++
> > > > >  docs/misra/deviations.rst                        |  6 ++++++
> > > > >  xen/include/xen/compiler.h                       |  8 --------
> > > > >  xen/include/xen/kernel.h                         |  2 +-
> > > > >  xen/include/xen/macros.h                         | 16
> > > > > ++++++++++++++++
> > > > >  5 files changed, 32 insertions(+), 9 deletions(-)
> > > > 
> > > > I tried to commit this patch, but ...
> > > > 
> > > > > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > > > b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > > > index fa56e5c00a27..28d9c37bedb2 100644
> > > > > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > > > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > > > @@ -246,6 +246,15 @@ constant expressions are required.\""
> > > > >    "any()"}
> > > > >  -doc_end
> > > > > 
> > > > > +#
> > > > > +# Series 11
> > > > > +#
> > > > > +
> > > > > +-doc_begin="This construct is used to check if the type is scalar,
> > > > > and for this purpose the use of 0 as a null pointer constant is
> > > > > deliberate."
> > > > > +-config=MC3R1.R11.9,reports+={deliberate,
> > > > > "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
> > > > > +}
> > > > > +-doc_end
> > > > > +
> > > > >  #
> > > > >  # Series 13
> > > > >  #
> > > > 
> > > > ... this change doesn't apply, and I also can't see how it would. There
> > > > were
> > > > no dependencies specified, so it's also not clear on top of which other
> > > > (ready to be committed) patch(es) this might have been meant to apply.
> > > > Please
> > > > resubmit in a shape applicable to the staging branch.
> > > 
> > > The order doesn't matter in that file, you can place # Series 11 just
> > > after # Series 10
> > 
> > That would have been one of the possible guesses. Yet then ...
> > 
> > > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > @@ -274,6 +274,15 @@ still non-negative."
> > >  -config=MC3R1.R10.1,etypes+={safe,
> > > "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))",
> > > "dst_type(ebool||boolean)"}
> > >  -doc_end
> > > 
> > > +#
> > > +# Series 11
> > > +#
> > > +
> > > +-doc_begin="This construct is used to check if the type is scalar, and
> > > for this purpose the use of 0 as a null pointer constant is deliberate."
> > > +-config=MC3R1.R11.9,reports+={deliberate,
> > > "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
> > > +}
> > > +-doc_end
> > > +
> > >  ### Set 3 ###
> > 
> > ... there is this grouping by sets as well.
> > 
> 
> +Stefano
> 
> I think the culprit here is that this commit 699899f44d09
> was never merged with 4.19. Is that correct? My own tree is rebased
> against that.

699899f44d09 is "automation/eclair: update deviations and accepted
guidelines" and should go in.

I'll wait until the release which should be imminent and then commit
both commits (if Jan doesn't beat me to it)


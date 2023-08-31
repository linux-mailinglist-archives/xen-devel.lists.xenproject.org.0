Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0EB78E49F
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 03:56:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593335.926327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbWv4-0001lw-HS; Thu, 31 Aug 2023 01:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593335.926327; Thu, 31 Aug 2023 01:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbWv4-0001jr-Ed; Thu, 31 Aug 2023 01:56:26 +0000
Received: by outflank-mailman (input) for mailman id 593335;
 Thu, 31 Aug 2023 01:56:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IFXE=EQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qbWv3-0001jl-Ek
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 01:56:25 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9648fe0d-47a1-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 03:56:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A1350B81071;
 Thu, 31 Aug 2023 01:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C68C433C8;
 Thu, 31 Aug 2023 01:56:18 +0000 (UTC)
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
X-Inumbo-ID: 9648fe0d-47a1-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693446981;
	bh=d70/e4hi0oWWqveet02lyjR6ZOLtLbYdO1yeEWjTUMc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qBHveqCkaixZdzynKXy29BIGGP9tzl0BrWfyq5fKitYIEXgkGSMf8OM4uv3EsHzQV
	 TVMfP75CQKdT0ReZtIaUqiaLzt4N7WXExGDodJmQu5Ynsuy6j+S5ZY0t30PFQhLJZW
	 YXBOqobpjTDj73HVGeEJ+GFSK3ivzLv94Q5tkNKv7Y4xUyM/Z6WO/JlxyawJavFcyq
	 PC8FF2G0NO2aN34/AQ7UU0VbCdQBlT6JwIw/A5hV2PBKln6FJDviRCU9coF/NowObn
	 NOWaWy3zyhIOcqIRtswKCX5MJK+p7xOo4HJvNeH2i7IwUgM/tithcDQ3PVxOhY15wl
	 JKvCgY0MATCZQ==
Date: Wed, 30 Aug 2023 18:56:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    nicola.vetrini@bugseng.com, Bertrand.Marquis@arm.com, 
    Luca.Fancellu@arm.com, michal.orzel@amd.com
Subject: Re: [XEN PATCH 05/13] automation/eclair: add deviation for
 usercopy.c
In-Reply-To: <04f03604-e788-0d76-1ae8-8bb74c6b4c7a@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308301855110.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <4039623dc4341758f383ec49228c1e55e5862b0f.1693228255.git.simone.ballarin@bugseng.com> <alpine.DEB.2.22.394.2308281512360.6458@ubuntu-linux-20-04-desktop>
 <04f03604-e788-0d76-1ae8-8bb74c6b4c7a@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Aug 2023, Simone Ballarin wrote:
> On 29/08/23 00:27, Stefano Stabellini wrote:
> > +Nicola, Luca
> > 
> > On Mon, 28 Aug 2023, Simone Ballarin wrote:
> > > xen/arch/x86/usercopy.c includes itself, so it is not supposed to
> > > comply with Directive 4.10:
> > > "Precautions shall be taken in order to prevent the contents of a
> > > header file being included more than once"
> > > 
> > > This patch adds a deviation for the file.
> > > 
> > > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > > 
> > > ---
> > >   automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
> > >   docs/misra/rules.rst                             | 2 ++
> > >   2 files changed, 6 insertions(+)
> > > 
> > > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > index 2681a4cff5..a7d4f29b43 100644
> > > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > @@ -96,6 +96,10 @@ conform to the directive."
> > >   -config=MC3R1.D4.10,reports+={safe, "first_area(text(^ \\* In this case,
> > > no inclusion guards apply and the caller is responsible.*\\*/$,
> > > begin-1))"}
> > >   -doc_end
> > >   +-doc_begin="xen/arch/x86/usercopy.c includes itself: it is not supposed
> > > to comply with the directive"
> > > +-config=MC3R1.D4.10,reports+={deliberate,
> > > "all_area(all_loc(file("^xen/arch/x86/usercopy\\.c$")))"}
> > > +-doc_end
> > > +
> > >   #
> > >   # Series 5.
> > >   #
> > > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > > index 4b1a7b02b6..45e13d0302 100644
> > > --- a/docs/misra/rules.rst
> > > +++ b/docs/misra/rules.rst
> > > @@ -62,6 +62,8 @@ maintainers if you want to suggest a change.
> > >        - Files that are intended to be included more than once do not need
> > > to
> > >          conform to the directive. Files that explicitly avoid inclusion
> > > guards
> > >          under specific circumstances do not need to conform the
> > > directive.
> > > +       xen/arch/x86/usercopy.c includes itself: it is not supposed to
> > > comply
> > > +       with the directive.
> > 
> > 
> > We need to find a consistent way to document this kind of deviations in
> > a non-ECLAIR specific way, without adding the complete list of
> > deviations to rules.rst.
> > 
> > Can we use safe.json and add an in-code comment at the top of
> > usercopy.c? E.g.:
> > 
> > diff --git a/xen/arch/x86/usercopy.c b/xen/arch/x86/usercopy.c
> > index b8c2d1cc0b..8bb591f472 100644
> > --- a/xen/arch/x86/usercopy.c
> > +++ b/xen/arch/x86/usercopy.c
> > @@ -1,3 +1,4 @@
> > +/* SAF-1-safe */
> >   /*
> >    * User address space access functions.
> >    *
> >  > Otherwise, maybe we should extend safe.json to also have an extra field
> > with a list of paths. For instance see "files" below >
> > {
> >      "version": "1.0",
> >      "content": [
> >          {
> >              "id": "SAF-0-safe",
> >              "analyser": {
> >                  "eclair": "MC3R1.R8.6",
> >                  "coverity": "misra_c_2012_rule_8_6_violation"
> >              },
> >              "name": "Rule 8.6: linker script defined symbols",
> >              "text": "It is safe to declare this symbol because it is
> > defined in the linker script."
> >          },
> >          {
> >              "id": "SAF-1-safe",
> >              "analyser": {
> >                  "eclair": "MC3R1.D4.10"
> >              },
> >              "name": "Dir 4.10: files that include themselves",
> >              "text": "Files purposely written to include themselves are not
> > supposed to comply with D4.10.",
> >              "files": ["xen/arch/x86/usercopy.c"]
> >          },
> >          {
> >              "id": "SAF-2-safe",
> >              "analyser": {},
> >              "name": "Sentinel",
> >              "text": "Next ID to be used"
> >          }
> >      ]
> > }
> > 
> In general, I prefer the first option for such ad hoc deviation (the comment
> at the beginning of the file): this way, anyone who touches the file will
> immediately see the comment and think as its changes will affect the deviation
> (is it still safe? is it still necessary?).
> 
> To help the developer more, I think it is better to also add the "name" in the
> comment, this is my proposal:
> 
> /* SAF-4-safe Dir 4.10: files that include themselves*/

Yes, this is fine, it was always intended to be possible to add the
name of the deviation or a short comment in the in-code comment


> /*
>  * User address space access functions.
>  *
>  * Copyright 1997 Andi Kleen <ak@muc.de>
>  * Copyright 1997 Linus Torvalds
>  * Copyright 2002 Andi Kleen <ak@suse.de>
>  */
> 
> -- 
> Simone Ballarin, M.Sc.
> 
> Field Application Engineer, BUGSENG (https://bugseng.com)
> 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B82417DA293
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 23:39:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624649.973270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwUXg-0005OE-Sz; Fri, 27 Oct 2023 21:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624649.973270; Fri, 27 Oct 2023 21:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwUXg-0005M2-QH; Fri, 27 Oct 2023 21:38:56 +0000
Received: by outflank-mailman (input) for mailman id 624649;
 Fri, 27 Oct 2023 21:38:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HzCB=GJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qwUXf-0005Lw-94
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 21:38:55 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 392d2ce4-7511-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 23:38:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 65DEFB8107D;
 Fri, 27 Oct 2023 21:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48706C433C7;
 Fri, 27 Oct 2023 21:38:48 +0000 (UTC)
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
X-Inumbo-ID: 392d2ce4-7511-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698442731;
	bh=Oe0HyI+H6c6WV8Ojf2MpQj5evvyuH4VkNJqRMzYhROY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mDpsB8EC77HeL3row/jukkNMerRjFtNrKbPpJBdoz85PyTSpL/61hfoUb5BvaD+z2
	 blwnFjRJli1Y0rBkXVOm1K//BiduZKgwoQABcDh+BRnxczpinVk/YKs5DzZ0eJjllL
	 +GydMGE6QCt3wt8owFoqgBK3emsmkRh/QCZfWoiWTE8eLX400gBkEzBI4z1+1QZvti
	 yFPORuVrObrJJidLehSWSW0Gcyh36DGy9QIJMr7jHlOTw/aq7ECLmBiDcibflzB68e
	 rrn0yLKDeiCnXt8YlSmVXy7P0l1Pd6TUJ6eDl+nAcIO/teFeLkT4wPPfA3R+5C/0gT
	 QL0d1xgyxaaFw==
Date: Fri, 27 Oct 2023 14:38:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [RFC 1/4] x86/ioemul: address MISRA C:2012 Rule 9.3
In-Reply-To: <8cb336ca-41ed-8adc-957a-28b5585c84f1@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310271419260.271731@ubuntu-linux-20-04-desktop>
References: <cover.1698155925.git.nicola.vetrini@bugseng.com> <76c9f78179a8bb5b4f99b34f163933394f79066c.1698155925.git.nicola.vetrini@bugseng.com> <60e26ad6-7366-2604-e9b2-ed401cee6e73@suse.com> <alpine.DEB.2.22.394.2310241317030.271731@ubuntu-linux-20-04-desktop>
 <41562c7a-6260-3104-b2d4-d6fd4df0cffc@suse.com> <4e88d7ab94b9fc73554eee5b78612b63@bugseng.com> <8cb336ca-41ed-8adc-957a-28b5585c84f1@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Oct 2023, Jan Beulich wrote:
> On 26.10.2023 14:32, Nicola Vetrini wrote:
> > On 25/10/2023 09:56, Jan Beulich wrote:
> >> On 24.10.2023 22:27, Stefano Stabellini wrote:
> >>> On Tue, 24 Oct 2023, Jan Beulich wrote:
> >>>> On 24.10.2023 16:31, Nicola Vetrini wrote:
> >>>>> Partially explicitly initalized .matches arrays result in violations
> >>>>> of Rule 9.3; this is resolved by using designated initializers,
> >>>>> which is permitted by the Rule.
> >>>>>
> >>>>> Mechanical changes.
> >>>>>
> >>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >>>>
> >>>> While not overly bad, I'm still not really seeing the improvement.
> >>>> Yet aiui changes induced by Misra are supposed to improve things in
> >>>> some direction?
> >>>
> >>> I think the improvement is clarity, in the sense that the designated
> >>> initializers make it clearer that the array may be sparsely 
> >>> initialized
> >>> and that the remaining elements should be initialized to zero
> >>> automatically.
> >>
> >> That's as clear from the original code, imo.

This specific instance is simple and might be clear either way, but in
general especially in more complex scenarios and potentially nested
structures and arrays, it could be harder to figure out and that leads
to errors. The MISRA checker is a powerful tool to help us make sure the
code is correct in all cases, but to take advantage of it properly we
need to get to the point where we don't have violations in the current
code.

Looking at the results, we have zero violations for Rule 9.3 on ARM
already and only 55 on x86. It should be possible to fix them all
mechanically in short order. Of course for that to happen, we need to
make some compromises. For instance, adding {0} like in the example
below, or adding [0]=init,[2]=init like in the first version of the
patch. Taking individually, they might not be all great improvements,
but all together having the Xen codebase Rule 9.3-free and easy to scan
for future violations should be.



> > There's also this functionally equivalent alternative, with or without 
> > the zeros, which
> > doesn't incur in the risk of mistakenly attempting to initialize the 
> > same element twice,
> > while also giving an explicit cue to the reader that all elements are 
> > truly zero-initialized.
> > 
> >           .matches = {
> >               DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> >               DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL5"),
> > +            {0}, {0}
> >           },
> 
> Adding a dependency on the array actually having 4 elements (while iirc
> we have seen already that we could in principle go down to 3). A change
> of this number would then require touching all these sites, which is
> what we'd like to avoid.

How often the array needs to change though? Looking at the git history
it doesn't seem the number of elements ever changed. So I think it is a
good tradeoff, and I would go with this type of fix (maybe also at the
other locations mechanically too although I haven't looked at them in
details).


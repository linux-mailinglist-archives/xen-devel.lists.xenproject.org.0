Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4AF7ED863
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 01:10:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633879.989051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Pxu-0003EM-PP; Thu, 16 Nov 2023 00:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633879.989051; Thu, 16 Nov 2023 00:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Pxu-0003Ca-Ll; Thu, 16 Nov 2023 00:10:38 +0000
Received: by outflank-mailman (input) for mailman id 633879;
 Thu, 16 Nov 2023 00:10:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePBE=G5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r3Pxt-0003CQ-00
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 00:10:37 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9016afd8-8414-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 01:10:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 70614B81A6B;
 Thu, 16 Nov 2023 00:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0F6C433C7;
 Thu, 16 Nov 2023 00:10:32 +0000 (UTC)
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
X-Inumbo-ID: 9016afd8-8414-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700093433;
	bh=SN0Z1XmrsbSJhwhmPD0MkAyXZBg2mhQtpT/3n7u8fZY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fQrZP5Lcik+tS8giag3nz+p9JbbPTf2OpQbCgL/W7xrHsRAG3T6aN/qV/3d+SR5Q8
	 SeTj1Sy7LwFdRTHpGy3r+sd4Hyled18Sqls0tLxwdEB00BGk3TJvRJzKmXGpCBL3/h
	 PFpkW3cy/+5tNM7+9E/iQNuFyR1Al51QuQo1tfZ3EuLw/lPoBAq3hDj577PINB7euQ
	 8aERCZR6g54jHMgE/2HHSo87C+pLebTJlbV26M6G25io3BvZlRtZrIqS169wktli4h
	 LGTY70H/RmnT8sXVDCJD3PNZUDemnUKUrfNiqhoyXbUItYdKzqdz6KjjgXPvzEzeKb
	 H8siduf4X9pSA==
Date: Wed, 15 Nov 2023 16:10:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [RFC 1/4] x86/ioemul: address MISRA C:2012 Rule 9.3
In-Reply-To: <b0260269-a515-8fc1-12ec-f38e45451a45@suse.com>
Message-ID: <alpine.DEB.2.22.394.2311151607080.160649@ubuntu-linux-20-04-desktop>
References: <cover.1698155925.git.nicola.vetrini@bugseng.com> <76c9f78179a8bb5b4f99b34f163933394f79066c.1698155925.git.nicola.vetrini@bugseng.com> <60e26ad6-7366-2604-e9b2-ed401cee6e73@suse.com> <alpine.DEB.2.22.394.2310241317030.271731@ubuntu-linux-20-04-desktop>
 <41562c7a-6260-3104-b2d4-d6fd4df0cffc@suse.com> <4e88d7ab94b9fc73554eee5b78612b63@bugseng.com> <8cb336ca-41ed-8adc-957a-28b5585c84f1@suse.com> <alpine.DEB.2.22.394.2310271419260.271731@ubuntu-linux-20-04-desktop> <9888aa5c298584c22cf55b13befeaaa6@bugseng.com>
 <alpine.DEB.2.22.394.2311101719120.3478774@ubuntu-linux-20-04-desktop> <b0260269-a515-8fc1-12ec-f38e45451a45@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Nov 2023, Jan Beulich wrote:
> On 11.11.2023 02:23, Stefano Stabellini wrote:
> > On Mon, 6 Nov 2023, Nicola Vetrini wrote:
> >>>>> There's also this functionally equivalent alternative, with or without
> >>>>> the zeros, which
> >>>>> doesn't incur in the risk of mistakenly attempting to initialize the
> >>>>> same element twice,
> >>>>> while also giving an explicit cue to the reader that all elements are
> >>>>> truly zero-initialized.
> >>>>>
> >>>>>           .matches = {
> >>>>>               DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> >>>>>               DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL5"),
> >>>>> +            {0}, {0}
> >>>>>           },
> >>>>
> >>>> Adding a dependency on the array actually having 4 elements (while iirc
> >>>> we have seen already that we could in principle go down to 3). A change
> >>>> of this number would then require touching all these sites, which is
> >>>> what we'd like to avoid.
> >>>
> >>> How often the array needs to change though? Looking at the git history
> >>> it doesn't seem the number of elements ever changed. So I think it is a
> >>> good tradeoff, and I would go with this type of fix (maybe also at the
> >>> other locations mechanically too although I haven't looked at them in
> >>> details).
> >>
> >> Hi, any updates on this? Considering the opinions expressed above, what would
> >> be the path preferred by the community?
> > 
> > Hi Jan, to bring this discussion to a conclusion, I think we have these
> > options:
> > 
> > 1) fix these violations by adding {}, {}
> > 2) fix these violations by adding [0]=xxx,[1]=xxx
> > 3) deviate these violations by adding /* SAF-safe-xxx */
> > 4) remove the MISRA rule 9.3 from docs/misra/rules.rst
> > 
> > Let's make a decision. My preference is 1) as we only have ~50
> > violations.
> 
> Of these, to be honest, my preference would be 4. Just that that's
> undesirable for other reasons. But have we thought of alternatives, say
> a variadic macro that would supply the "missing" initializers? Imo such
> decisions shouldn't be rushed; there are enough other issues to take
> care of in the meantime. A sound solution is, I think, generally
> preferable to a quick one. (Whether my new suggestion is "sound" I of
> course can't tell, until it was tried out and the overall result /
> effects can be inspected.)

I don't like the idea of the variadic macro as we should attempt to make
things more obviously correct, rather than more obscure.

Thinking out of the box, what if we added a single {} E.g.:

        .ident = "HP ProLiant DL3xx",
        .matches = {
            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL3"),
            {}
        },

It would accomplish the goal of highlighting that there are more members
of the array that gets initialized to zero. At the same time it wouldn't
require the introductino of [0] and [1] that as we have seen are error
prone and it wouldn't depend on the exact number of elements like adding
one {} per missing initialization. To be clear, I am suggesting adding a
single {} only.

Nicola, what do you think? Would it be OK for MISRA / ECLAIR?


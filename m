Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCFEAD0901
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 22:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008831.1388004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNdSp-0001Xb-Cu; Fri, 06 Jun 2025 20:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008831.1388004; Fri, 06 Jun 2025 20:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNdSp-0001VI-AA; Fri, 06 Jun 2025 20:14:55 +0000
Received: by outflank-mailman (input) for mailman id 1008831;
 Fri, 06 Jun 2025 20:14:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRk0=YV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uNdSo-0001VC-1w
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 20:14:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6a3902d-4312-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 22:14:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 23A8A5C5B03;
 Fri,  6 Jun 2025 20:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D8FC4CEEF;
 Fri,  6 Jun 2025 20:14:48 +0000 (UTC)
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
X-Inumbo-ID: e6a3902d-4312-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749240889;
	bh=kzLpwseiVUQYwPvBV3QbnE8pI2WTTjcdXhv/mrBBSmc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hbJvNY9FfUhTHPoUouI+yacqb8QXqxC3TLKBFcmedA4v9Vrm12i7lRpanrpAFSw7E
	 o7nnPABX5J0flrOwCSZqdOyUsUTIcFtHPpLW1PA9jgrSpXzs260KWp8A5fkk11JaDF
	 sAQquGX3q+CV6Xw0a+NAH7SL67pQqud/xHOaP33I4hR/4vywXRMNmQCWjcJ6FxPkSx
	 WtYSQUa+q5fly5DO9WN+QNxvbakUbMRqxtCXLJzTX8l7UY3i79pYwOvSlV9kOSW8Ka
	 5HeQe0IQB0eP1PvPnrSvWF62TWKbBeNvia3tcWJhxK2ArVaVUkhqE2bEQ9zxKfTuVA
	 irO4NP/fHAjWA==
Date: Fri, 6 Jun 2025 13:14:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Alejandro Vallejo <agarciav@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 10/19] x86: Replace boot_module with bootmodule
In-Reply-To: <6490abdd-ac7c-4178-a174-25d13065ae04@suse.com>
Message-ID: <alpine.DEB.2.22.394.2506061303080.2495561@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-11-agarciav@amd.com> <214c8863-5cd4-4be9-948e-e44b67f541bd@citrix.com> <DAERYXX8M48M.2X249UHMKARPF@amd.com> <DAES85NYFTFG.1VQE6GFHLL4GY@amd.com>
 <6490abdd-ac7c-4178-a174-25d13065ae04@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Jun 2025, Jan Beulich wrote:
> On 05.06.2025 19:40, Alejandro Vallejo wrote:
> > On Thu Jun 5, 2025 at 7:28 PM CEST, Alejandro Vallejo wrote:
> >> On Mon Jun 2, 2025 at 7:00 PM CEST, Andrew Cooper wrote:
> >>> On 30/05/2025 1:02 pm, Alejandro Vallejo wrote:
> >>>> These types resemble each other very closely in layout and intent, and
> >>>> with "struct bootmodule" already in common code it makes perfect sense
> >>>> to merge them. In order to do so, add an arch-specific area for
> >>>> x86-specific tidbits.
> >>>>
> >>>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> >>>
> >>> Yet this is a distinct backwards step in terms of legibility.
> >>>
> >>> How about modifying the common code to be more legible, rather than
> >>> regressing the x86 code.
> >>>
> >>> ~Andrew
> >>
> >> I meant to ifdef out the fields unused on x86, but after some massaging I
> >> think I got it lookin much nicer. It's essentially using the common parts of
> >> kernel_info and boot_domain as a header to kernel_info.
> >>
> >> That way, x86 keeps using a substantially smaller (yet common) data structure
> >> while the rest of dom0less can keep using the original as-is.
> >>
> >> Refactoring kernel_info to rationalise its contents is somewhere in my TODO
> >> list, but I have much more urgent fish to fry first.
> >>
> >> Cheers,
> >> Alejandro
> > 
> > ... I misread the comment and thought it was in the following patch rather than this one.
> > 
> > If it was indeed intended here, I'm at a loss as to what you'd rather do.
> > Common bindings need a common ground. This is such ground. The data structures
> > are virtually identical and used for identical purposes.
> > 
> > What's the legibility step you're talking about?
> 
> The loss of the underscore (separating the words) in the struct tag, aiui.

As I wrote in reply to the other patch, I would ask that we keep the
code movement and the renaming separate.

With that said, I don't mind a global s/bootmodule/boot_module/g across
the codebase, but please let's keep it as a separate patch to make it
easier to review.

However, we don't actually have a code style asking for _ in struct
tags. So while I don't mind the global s/bootmodule/boot_module/g, it
might be best we at least briefly discuss it as a group to make sure we
are all aligned.


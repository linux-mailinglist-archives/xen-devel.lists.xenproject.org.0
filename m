Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D230817F3C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 02:24:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656426.1024546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFOps-0000X9-Ve; Tue, 19 Dec 2023 01:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656426.1024546; Tue, 19 Dec 2023 01:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFOps-0000VW-Sc; Tue, 19 Dec 2023 01:23:52 +0000
Received: by outflank-mailman (input) for mailman id 656426;
 Tue, 19 Dec 2023 01:23:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ry3N=H6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFOpr-0000VO-87
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 01:23:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41b311ac-9e0d-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 02:23:47 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4E8AA611D4;
 Tue, 19 Dec 2023 01:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE451C433C7;
 Tue, 19 Dec 2023 01:23:44 +0000 (UTC)
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
X-Inumbo-ID: 41b311ac-9e0d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702949026;
	bh=5q0vwXeffhtFtWVVfWFx5CjJVYbLKLn97bmsyXhxKgE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=f6FEhJ/1QcPPZRa0lFdEFL4QTM4F9HKsBiDnY8NskcCwq7NmwuBHxw5CiCaul2F7X
	 ASXyLP8uSjo5tgLSF5AgKD8KPyNMwkyiipBc8RHAHbvPCjcc0yZkmhYbhBTlpmCxgv
	 K+RYyz1DQS1z7ip5l6MzcliTgrANyLuR0UXnYM1XSaj4YO2CyLrlXRJ2H1llIoU0nO
	 Jr9d0q4ZXrLB1NnOUAenk1PpNtMBTN+dlx9vLPeRYRe8/TDq23EhzW9F+4BLfhcp7f
	 cRFAWDHNDP7DMICbIhVswlITiMP9D9CGuOHDXWrdHjYVMTPE2kIIAyYfyIcLYTpZ2C
	 3QpqBEHSfkKig==
Date: Mon, 18 Dec 2023 17:23:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 9/9] xen: add SAF deviation for safe cast removal.
In-Reply-To: <a9db3cb0-f085-47c2-bcaa-aa4f7351d586@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312181723360.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com> <36e996b864853dba26a9c9fb9c9c674e92cc935e.1702555387.git.maria.celeste.cesario@bugseng.com> <b93417c7-1375-4bf4-ace2-d36bd63c8b0b@suse.com> <alpine.DEB.2.22.394.2312141355391.3175268@ubuntu-linux-20-04-desktop>
 <698cb944-3e91-498c-99ba-ff0849723285@suse.com> <alpine.DEB.2.22.394.2312151127450.3175268@ubuntu-linux-20-04-desktop> <a9db3cb0-f085-47c2-bcaa-aa4f7351d586@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Dec 2023, Jan Beulich wrote:
> On 15.12.2023 22:02, Stefano Stabellini wrote:
> > On Fri, 15 Dec 2023, Jan Beulich wrote:
> >> On 14.12.2023 23:04, Stefano Stabellini wrote:
> >>> On Thu, 14 Dec 2023, Jan Beulich wrote:
> >>>> On 14.12.2023 13:07, Simone Ballarin wrote:
> >>>>> --- a/docs/misra/safe.json
> >>>>> +++ b/docs/misra/safe.json
> >>>>> @@ -28,6 +28,14 @@
> >>>>>          },
> >>>>>          {
> >>>>>              "id": "SAF-3-safe",
> >>>>> +            "analyser": {
> >>>>> +                "eclair": "MC3R1.R11.8"
> >>>>> +            },
> >>>>> +            "name": "MC3R1.R11.8: removal of const qualifier to comply with function signature",
> >>>>> +            "text": "It is safe to cast away const qualifiers to comply with function signature if the function does not modify the pointee."
> >>>>
> >>>> I'm not happy with this description, as it invites for all sorts of abuse.
> >>>> Yet I'm also puzzled that ...
> >>>
> >>> We can improve the language but the concept would still be the same. For
> >>> instance:
> >>>
> >>> A single function might or might not modify the pointee depending on
> >>> other function parameters (for instance a single function that could
> >>> either read or write depending on how it is called). It is safe to cast
> >>> away const qualifiers when passing a parameter to a function of this
> >>> type when the other parameters are triggering a read-only operation.
> >>
> >> Right, but I think the next here needs to be setting as tight boundaries
> >> as possible: It should cover only this one specific pattern. Anything
> >> else would better get its own deviation, imo.
> > 
> > OK. What about:
> > 
> > A single function might or might not modify the pointee depending on
> > other function parameters, for instance a common pattern is to implement
> > one function that could either read or write depending on how it is
> > called. It is safe to cast away const qualifiers when passing a
> > parameter to a function following this pattern when the other parameters
> > are triggering a read-only operation.
> > 
> > Feel free to suggest a better wording.
> 
> Well, my point was to get rid of "for instance" and "common pattern" (and
> anything alike). E.g.:
> 
> "A single function could either read or write through a passed in pointer,
>  depending on how it is called. It is deemed safe to cast away a const
>  qualifier when passing a pointer to such a function, when the other
>  parameters guarantee read-only operation."

That's fine by me


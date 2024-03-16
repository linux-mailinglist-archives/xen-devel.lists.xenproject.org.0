Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E4887D797
	for <lists+xen-devel@lfdr.de>; Sat, 16 Mar 2024 01:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694115.1083006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlI0V-00025A-VA; Sat, 16 Mar 2024 00:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694115.1083006; Sat, 16 Mar 2024 00:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlI0V-00022N-Rv; Sat, 16 Mar 2024 00:34:39 +0000
Received: by outflank-mailman (input) for mailman id 694115;
 Sat, 16 Mar 2024 00:34:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e312=KW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rlI0T-00021z-KU
 for xen-devel@lists.xenproject.org; Sat, 16 Mar 2024 00:34:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f64bfc2e-e32c-11ee-afdd-a90da7624cb6;
 Sat, 16 Mar 2024 01:34:35 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D24CC617D4;
 Sat, 16 Mar 2024 00:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFAAC433F1;
 Sat, 16 Mar 2024 00:34:31 +0000 (UTC)
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
X-Inumbo-ID: f64bfc2e-e32c-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710549273;
	bh=2N548LDkvepe6zAL+QNEn7rCR0gImlwCNrHAwH+2Tok=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T0Ab4DRp/k5lCq62vCX1yUlK7pIaRkgBqiX54PKIxn64bwnKEzDtfRgUxEWpahUxi
	 AJRIKNHfjzHhmeed1oacMheRth6AHrdtAMIXSkFeQ4Vu7Da8Un/I7h/V5GKQltRIw5
	 YGq+Kto9nR8gHy44QNqlmMmgal+T5iaqV1rJqwpPfKPk0yNLu3ruYXvN/69O4LaoKh
	 kgVsha4iFW5PXRftyw280SHqTRyZhdXljtXAs9AKgV8MyKRRBGSNszmNrhB3LSF1sf
	 lk1QajkA2O/pXTV6f5nNN7TZcMMeeVrDEUsM3rBURmaqG7Ue0E2UdxdnBvAtqhTV3r
	 /6Gei1v2vZtfw==
Date: Fri, 15 Mar 2024 17:34:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3 01/16] misra: add deviation for headers that
 explicitly avoid guards
In-Reply-To: <2ea3d566-1b21-44e6-bdb6-7c554a7f7996@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403151730020.853156@ubuntu-linux-20-04-desktop>
References: <cover.1710145041.git.simone.ballarin@bugseng.com> <310fe4a0ccd0ad45bcf1cd9811ac56c9a560dd0b.1710145041.git.simone.ballarin@bugseng.com> <def59c84-13e6-4175-ae5d-e0ba7770f68e@suse.com> <alpine.DEB.2.22.394.2403141554040.853156@ubuntu-linux-20-04-desktop>
 <2ea3d566-1b21-44e6-bdb6-7c554a7f7996@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Mar 2024, Jan Beulich wrote:
> On 14.03.2024 23:55, Stefano Stabellini wrote:
> > On Mon, 11 Mar 2024, Jan Beulich wrote:
> >> On 11.03.2024 09:59, Simone Ballarin wrote:
> >>> Some headers, under specific circumstances (documented in a comment at
> >>> the beginning of the file), explicitly avoid inclusion guards: the caller
> >>> is responsible for including them correctly.
> >>>
> >>> These files are not supposed to comply with Directive 4.10:
> >>> "Precautions shall be taken in order to prevent the contents of a header
> >>> file being included more than once"
> >>>
> >>> This patch adds deviation cooments for headers that avoid guards.
> >>>
> >>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> >>>
> >>> ---
> >>> Changes in v3:
> >>> - fix inconsistent deviation ID
> >>> - change comment-based deviation text
> >>> Changes in v2:
> >>> - use the format introduced with doc/misra/safe.json instead of
> >>>   a generic text-based deviation
> >>> ---
> >>>  docs/misra/safe.json                        | 9 +++++++++
> >>>  xen/include/public/arch-x86/cpufeatureset.h | 1 +
> >>>  xen/include/public/errno.h                  | 1 +
> >>>  3 files changed, 11 insertions(+)
> >>
> >> I understand something wants doing, but having such comments appear in public
> >> headers feels wrong to me. I'm afraid I have no good alternative suggestion.
> > 
> > Given that in both cases there is very nice explanation on how to use
> > the headers as an in-code comment just above, could we embed the
> > SAF-3-safe marker in the existing comment?
> 
> I'm afraid that won't address my remark, and I'm further afraid this would
> then render the SAF part of the comment ineffectual.
> 
> > If not, I think we should go with this patch as is (I don't think it is
> > worth my, your, and Simone's time to look for alternatives).
> 
> Easy alternative: Simply leave public headers alone.

I don't think it is a good idea to skip MISRA on public headers as they
are used as part of the Xen build. I think adding the one line SAF
comment is better.

We still have strange tags like the following in public headers:

 * `incontents 150 evtchn Event Channels

What does `incontents 150 even mean? If I grep for "incontents" I cannot
find any explanation or definition. The SAF comment is easily greppable
and with a clear definition. I am in favor of adding them (and removing
"incontents" but that's a discussion for another day.) 


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D48917577
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 03:12:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748209.1155800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMHCM-0004tK-VV; Wed, 26 Jun 2024 01:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748209.1155800; Wed, 26 Jun 2024 01:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMHCM-0004rp-Sr; Wed, 26 Jun 2024 01:11:46 +0000
Received: by outflank-mailman (input) for mailman id 748209;
 Wed, 26 Jun 2024 01:11:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBdT=N4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMHCL-0004rj-4p
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 01:11:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c30847f-3359-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 03:11:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C484B60B6B;
 Wed, 26 Jun 2024 01:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD09C32786;
 Wed, 26 Jun 2024 01:11:40 +0000 (UTC)
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
X-Inumbo-ID: 0c30847f-3359-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719364301;
	bh=pyNbXFTDiHujn7NdZ0hPlUDnFrFl+BqHlxo9td2YtOo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nuBoZBPwgCyuPlcdD2zZjaYBItY/XcPbbUbXrGP5o+huunD77rpR/cC0rkSrBBkkP
	 yuNreona6JTXPXS1i9yV4BRR8uiyhqbJPCwhKIoAL4VwQtU7zjhBeNu634i69Q1GF2
	 P17b5ECO+A8Uuh2diKuiyAGvJRhTI1HcAHhtVrIKNOBUNQTZiQNdXxnuB68gtqpWTR
	 YF1zJFkplOIFEe5lgF0Pn7ioYXRUgOOv/X61exYf0po2QkQQQMS/LgEHQjFK02oXfg
	 +D4FXjq8EzEGHtzpFzMoIximo13iLMzIg/i1Wxpgs90KMHBO69sJY1CB+lEE3ko6jl
	 P44S6tjPmfzLw==
Date: Tue, 25 Jun 2024 18:11:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Federico Serafini <federico.serafini@bugseng.com>
Subject: Re: [XEN PATCH v2 05/13] x86/traps: address violations of MISRA C
 Rule 16.3
In-Reply-To: <a5b47b7e-9dc0-4108-bd6f-eb34f7cb8c3c@suse.com>
Message-ID: <alpine.DEB.2.22.394.2406251808040.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719218291.git.federico.serafini@bugseng.com> <4f44a7b021eb4f78ccf1ce69b500b48b75df81c5.1719218291.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2406241753260.3870429@ubuntu-linux-20-04-desktop>
 <a5b47b7e-9dc0-4108-bd6f-eb34f7cb8c3c@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Jun 2024, Jan Beulich wrote:
> On 25.06.2024 02:54, Stefano Stabellini wrote:
> > On Mon, 24 Jun 2024, Federico Serafini wrote:
> >> Add break or pseudo keyword fallthrough to address violations of
> >> MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
> >> every switch-clause".
> >>
> >> No functional change.
> >>
> >> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> >> ---
> >>  xen/arch/x86/traps.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> >> index 9906e874d5..cbcec3fafb 100644
> >> --- a/xen/arch/x86/traps.c
> >> +++ b/xen/arch/x86/traps.c
> >> @@ -1186,6 +1186,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
> >>  
> >>      default:
> >>          ASSERT_UNREACHABLE();
> >> +        break;
> > 
> > Please add ASSERT_UNREACHABLE to the list of "unconditional flow control
> > statements" that can terminate a case, in addition to break.
> 
> Why? Exactly the opposite is part of the subject of a recent patch, iirc.
> Simply because of the rules needing to cover both debug and release builds.

The reason is that ASSERT_UNREACHABLE() might disappear from the release
build but it can still be used as a marker during static analysis. In
my view, ASSERT_UNREACHABLE() is equivalent to a noreturn function call
which has an empty implementation in release builds.

The only reason I can think of to require a break; after an
ASSERT_UNREACHABLE() would be if we think the unreachability only apply
to debug build, not release build:

- debug build: it is unreachable
- release build: it is reachable

I don't think that is meant to be possible so I think we can use
ASSERT_UNREACHABLE() as a marker.


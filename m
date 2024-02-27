Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B46D8684FB
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 01:27:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685839.1067212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1relIy-0000B6-Uq; Tue, 27 Feb 2024 00:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685839.1067212; Tue, 27 Feb 2024 00:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1relIy-00008d-SC; Tue, 27 Feb 2024 00:26:44 +0000
Received: by outflank-mailman (input) for mailman id 685839;
 Tue, 27 Feb 2024 00:26:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=15Q7=KE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1relIx-00008X-Ig
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 00:26:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e02f4abc-d506-11ee-98f5-efadbce2ee36;
 Tue, 27 Feb 2024 01:26:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D715C61211;
 Tue, 27 Feb 2024 00:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A69C433F1;
 Tue, 27 Feb 2024 00:26:38 +0000 (UTC)
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
X-Inumbo-ID: e02f4abc-d506-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708993599;
	bh=s0M4+fYC1LgvU+prBk8DsjbwuoIHnSbxoJJ/ByJ02Ek=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oLonez6frDis/k6Ll9oO2ph6fzj+SYbtcl37q/OcRXMHFYOAB7wpoJdQoQqd/KmOW
	 yBe+vIGLtmU+4NDr0cNZnHC+29Pd0qzTGydFC7589QOr8i3tmWVlgjwauqGZUI+U0q
	 B7iwJRrXJnwOmyiGxwVtnaAl9vKSy2e4QpUkNLXvIGm1Q+LoZXdHwH5ta8ZukyIKnp
	 oyvtww/BL6fhgtpz80h1duS7WWZJVsspR5yZZC53ptFefuZc+bXhLmsZicjaSZg3bA
	 O4UTzW2QxVOMPkf+hMLpDafcqjXaw0vJ18UCMvEsOY2w8PuJXxn/y+9njHsEsByHC6
	 ciXyb0k75W3CA==
Date: Mon, 26 Feb 2024 16:26:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 2/2] xen/cpu: address MISRA C Rule 17.7
In-Reply-To: <33342a17-e71c-4752-a16f-da5c0ef77b51@suse.com>
Message-ID: <alpine.DEB.2.22.394.2402261619210.247676@ubuntu-linux-20-04-desktop>
References: <cover.1708680104.git.nicola.vetrini@bugseng.com> <dd4ac0e670a2ad7ecb5eb435e5e3b4b313b1e0b6.1708680104.git.nicola.vetrini@bugseng.com> <33342a17-e71c-4752-a16f-da5c0ef77b51@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Feb 2024, Jan Beulich wrote:
> On 23.02.2024 10:35, Nicola Vetrini wrote:
> > Refactor cpu_notifier_call_chain into two functions:
> > - the variant that is allowed to fail loses the nofail flag
> > - the variant that shouldn't fail is encapsulated in a call
> >   to the failing variant, with an additional check.
> > 
> > This prevents uses of the function that are not supposed to
> > fail from ignoring the return value, thus violating Rule 17.7:
> > "The value returned by a function having non-void return type shall
> > be used".
> > 
> > No functional change.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> I'm afraid I disagree with this kind of bifurcation. No matter what
> Misra thinks or says, it is normal for return values of functions to
> not always be relevant to check.

Hi Jan, I disagree.

Regardless of MISRA, I really think return values need to be checked.
Moreover, we decided as a group to honor MISRA Rule 17.7, which requires
return values to be checked. This patch is a good step forward.


> To deal with the Misra rule imo requires to first have an abstract
> plan of how to handle such globally in the code base. Imo such a plan
> can't be to introduce perhaps dozens of new wrapper functions like is
> done here.

This patch is following the right pattern, one we already follow with
the _locked suffix.


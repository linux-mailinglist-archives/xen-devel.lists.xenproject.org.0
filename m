Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7F5972878
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 06:41:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794978.1204025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snsfb-00014k-Ot; Tue, 10 Sep 2024 04:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794978.1204025; Tue, 10 Sep 2024 04:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snsfb-00010L-MI; Tue, 10 Sep 2024 04:40:03 +0000
Received: by outflank-mailman (input) for mailman id 794978;
 Tue, 10 Sep 2024 04:40:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DP99=QI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1snsfa-0000dY-Oa
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 04:40:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b90c74b4-6f2e-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 06:39:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ADFE75C036E;
 Tue, 10 Sep 2024 04:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7DBC4CEC3;
 Tue, 10 Sep 2024 04:39:50 +0000 (UTC)
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
X-Inumbo-ID: b90c74b4-6f2e-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725943192;
	bh=a8EJpGSwWSYAj7qGGXZmeqldDtUPaypxEOsc4RBgISo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mOgv4n9Nc9dZUo/71O6oqvPtR6bxcnm/8QMK1oDZPzYFg0PrmAbvsPzbUFnCraNTb
	 m4kosKdCptoV54+2ckmK8Ui+nGB+QUhgzUv8eMBrLinX//WQfnpw+SNZm4G1F237xq
	 oSU7mwnJoSE8YVjjequ1iKznM+Wj9kwTkKKzp4+s/IkD6BI2za4e0V+u16h2nVh03o
	 maMHTDO9XDHL1wHGQAjwlvjmmTKN9n6dJwuhC0W7tBgxj0/dqii1d5KpNknPRG6Dva
	 hpp//HVpfUCAnNk/P44xUQJItyhtVgAYF0H6KCNzPyPmTDFDs0TMg5JyZHiN8F7Fyn
	 h/MM0E/rzIGWw==
Date: Mon, 9 Sep 2024 21:39:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] automation/eclair_analysis: fix MISRA Rule 20.7
 regression in self-tests.h
In-Reply-To: <7aba7d0b-54d4-43da-894c-367d2271c696@suse.com>
Message-ID: <alpine.DEB.2.22.394.2409092138490.3672@ubuntu-linux-20-04-desktop>
References: <4e59a8b7d97f34a824922013ffe5e44f70e6abaf.1725801931.git.nicola.vetrini@bugseng.com> <7aba7d0b-54d4-43da-894c-367d2271c696@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


Acked-by: Stefano Stabellini <sstabellini@kernel.org>

On Mon, 9 Sep 2024, Jan Beulich wrote:
> On 08.09.2024 15:27, Nicola Vetrini wrote:
> > --- a/docs/misra/deviations.rst
> > +++ b/docs/misra/deviations.rst
> > @@ -533,6 +533,14 @@ Deviations related to MISRA C:2012 Rules:
> >         to incur in the risk of being misused or lead to developer confusion, and
> >         refactoring it to add parentheses breaks its functionality.
> >       - Tagged as `safe` for ECLAIR.
> > +
> > +   * - R20.7
> > +     - The macros `{COMPILE,RUNTIME}_CHECK` defined in
> > +       `xen/include/xen/self-tests.h` are allowed not to parenthesize their
> > +       arguments, to allow function-like macros to be tested as well as
> > +       functions. Given the specialized use of these macros and their limited
> > +       usage scope, omitting parentheses is deemed unlikely to cause issues.
> > +     - Tagged as `deliberate` for ECLAIR.
> 
> As on earlier occasions my take here again is that this is going too far:
> Beside the "fn" parameter, all other parameter uses should be properly
> parenthesized. I have no idea whether this can be expressed for Eclair,
> but at least the verbal deviation description should imo be no more lax
> than necessary.

I can add a mention to the "fn" parameter on commit


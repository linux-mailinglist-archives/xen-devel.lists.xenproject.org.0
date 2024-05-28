Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C89588D118E
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 03:57:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730966.1136244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBm46-0001Ig-UI; Tue, 28 May 2024 01:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730966.1136244; Tue, 28 May 2024 01:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBm46-0001Gn-Qg; Tue, 28 May 2024 01:55:50 +0000
Received: by outflank-mailman (input) for mailman id 730966;
 Tue, 28 May 2024 01:55:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M10Z=M7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sBm44-0001Gh-UI
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 01:55:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65f1e29c-1c95-11ef-90a1-e314d9c70b13;
 Tue, 28 May 2024 03:55:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 09A7561D45;
 Tue, 28 May 2024 01:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5AAC2BBFC;
 Tue, 28 May 2024 01:55:43 +0000 (UTC)
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
X-Inumbo-ID: 65f1e29c-1c95-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716861344;
	bh=kyys+qhbR8Blneups9GbfVsfnA+bWp+ksbo9rw9AxUI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=b0GnTcGD7lgfAbhwESprAmy8HEpNRLBcq7qYbv0q3Rih5EA1+R52qTHnK6bqoQdX0
	 3rrX4GC6RPxHya+qi8U94qZA4VGjsGe8z36Io8upvNFbQ8mY1iEEQ2hYtCSpQd5Uco
	 V/gLo0+qw/7M7DODwxz8KfI+TS+eaKaOcGehHhJ8TDpJCqfbL5uh5IkS4FAULuMCzy
	 cXjoEzNzUyhXuxvlLTvYe9Cjoy+8EpzY8J+/ReyLncJNEB/rDrd7G9mW4sslPwJiu6
	 TOY5wQzg9e7UqtqBvIb67vSk0DRBnvmqw2JnxK6YR3r3LhAjE3mbkpFqkYtoGio8a7
	 m6hipquzkLHcg==
Date: Mon, 27 May 2024 18:55:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 2/4] automation/eclair_analysis: avoid an ECLAIR
 warning about escaping
In-Reply-To: <86e1e74b-f1e3-4e16-b87e-a9c512dcc655@suse.com>
Message-ID: <alpine.DEB.2.22.394.2405271855070.2557291@ubuntu-linux-20-04-desktop>
References: <cover.1716814609.git.nicola.vetrini@bugseng.com> <f489cc3d668830eab2f2ce724164d65dc623baa7.1716814609.git.nicola.vetrini@bugseng.com> <86e1e74b-f1e3-4e16-b87e-a9c512dcc655@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 May 2024, Jan Beulich wrote:
> On 27.05.2024 16:53, Nicola Vetrini wrote:
> > The parentheses in this regular expression should be doubly
> > escaped because they are undergo escaping twice.
> 
> Do you maybe mean "undergo expansion twice"?

Ahah yes. I fixed it on commit:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > ---
> >  automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > index b9b377c56b25..cf62a874d928 100644
> > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > @@ -405,8 +405,8 @@ explicit comment indicating the fallthrough intention is present."
> >  #
> >  
> >  -doc_begin="printf()-like functions are allowed to use the variadic features provided by stdarg.h."
> > --config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printk\(.*\)$)))"}
> > --config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printf\(.*\)$)))"}
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printk\\(.*\\)$)))"}
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printf\\(.*\\)$)))"}
> >  -config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
> >  -config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
> >  -config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
> 


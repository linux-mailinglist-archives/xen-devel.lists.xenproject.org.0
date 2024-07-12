Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEEF930193
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 23:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758290.1167710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSNmL-0005Eu-TL; Fri, 12 Jul 2024 21:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758290.1167710; Fri, 12 Jul 2024 21:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSNmL-0005DQ-Qc; Fri, 12 Jul 2024 21:26:09 +0000
Received: by outflank-mailman (input) for mailman id 758290;
 Fri, 12 Jul 2024 21:26:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sSNmK-0005DK-3I
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 21:26:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58c4ccee-4095-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 23:26:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F3220619B0;
 Fri, 12 Jul 2024 21:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EEA2C32782;
 Fri, 12 Jul 2024 21:26:03 +0000 (UTC)
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
X-Inumbo-ID: 58c4ccee-4095-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720819564;
	bh=RQVAI8y49fNOQT9OYLcMnI1li4cYbWDJrVdVruw1Qn0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DSUltBVfFg/PJGXthdCp2tQncxccT/F9djRVO98wf8d5eSh1ljKC28cbHVPdBM3XL
	 SSMzaNcu/qgm40VQA1XFoxDiQYe79gmj3cNgUA+x8Urjrt9Le5dggQUKclay+omF8s
	 AovSqTMssoWtPaMYIxkqx/SwonX5Ti7s3LogSgfQN8yALbyrmAFMQCywvyCi897kcO
	 q6bR+BDCU+avTwT43TmV+iZFMl+rQ2Aahb1w19qsJ+IzINy6cCXfQ+nVXreiIty2qY
	 02H8TKeg1lWWdTZtdoIAEynCO2cNp/YBiTEnLUKahA/J0Gs4F8uOesTOCpMRsqpLz6
	 Dv5LmDGkMUFJQ==
Date: Fri, 12 Jul 2024 14:26:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH for-4.19] xen/bitmap: amend MISRA C deviation for
 Rule 20.7
In-Reply-To: <5ff40947-5672-4497-83e7-53ea370b5f58@suse.com>
Message-ID: <alpine.DEB.2.22.394.2407121423590.3635@ubuntu-linux-20-04-desktop>
References: <794724e70c4e45224916576af01070e8aebe9aab.1720517398.git.nicola.vetrini@bugseng.com> <5ff40947-5672-4497-83e7-53ea370b5f58@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Jul 2024, Jan Beulich wrote:
> On 09.07.2024 11:34, Nicola Vetrini wrote:
> > --- a/xen/include/xen/bitmap.h
> > +++ b/xen/include/xen/bitmap.h
> > @@ -103,18 +103,16 @@ extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);
> >  #define bitmap_switch(nbits, zero, small, large)			  \
> >  	unsigned int n__ = (nbits);					  \
> >  	if (__builtin_constant_p(nbits) && !n__) {			  \
> > -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
> >  		zero;							  \
> >  	} else if (__builtin_constant_p(nbits) && n__ <= BITS_PER_LONG) { \
> > -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
> >  		small;							  \
> >  	} else {							  \
> > -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
> >  		large;							  \
> >  	}
> 
> An observation I made only while discussing this on the meeting is that by
> going from this form to ...
> 
> >  static inline void bitmap_zero(unsigned long *dst, unsigned int nbits)
> >  {
> > +	/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */
> >  	bitmap_switch(nbits,,
> >  		*dst = 0UL,
> >  		memset(dst, 0, bitmap_bytes(nbits)));
> 
> ... this form, you actually widen what the deviation covers to the entire
> macro, which is too much. We don't want to deviate the rule for all of the
> arguments, after all.
> 
> However, it further occurred to me that the reason for needing the deviation
> looks to merely be that in some cases (like the one above) we pass empty
> macro arguments. That's getting in the way of parenthesizing the use sites.
> We could avoid this, though, by adding e.g.
> 
> #define nothing ((void)0)
> 
> near the definition of bitmap_switch() and then using that in place of the
> empty arguments. Provided of course this is the only obstacle to
> parenthesization. At which point no deviation ought to be needed in the
> first place.


Roberto suggested in another email thread:

 
> The problem comes from macro arguments that are expressions, in some cases,
> and statements, in other cases, as it happens for bitmap_{switch,zero}.
> 
> Possible solutions include:
> - wrap the arguments that are statements in a do-while-false;
> - add a ';' after the arguments that are statements.
> 
> But what we recommend is to add a deviation for the cases where an argument,
> after the expansion, is surrounded by the following tokens: '{' '}' ';'.
> This will address all violations related to bitmap_{switch,zero} and requires
> only a modification of the ECLAIR configuration which will look like this:
> 
> -doc_begin="The expansion of an argument between tokens '{', '}' and ';' is safe."
> -config=MC3R1.R20.7,expansion_context+={safe, "left_right(^[\\{;]$,^[;\\}]$)"}
> -doc_end
> 
> With this, all the remaining 71 violations in x86 code concerns msi.h, which we were
> requested not to touch, and the 2 violations in arm code can be easily resolved
> with a patch adding parentheses, for which a patch was already submitted by
> Nicola and rejected by Jan.


I think this is a good way forward because it is a simple deviation that
makes sense to have, and makes sense as project wide deviation (it is
not a deviation by name, e.g. deviating anything called
"bitmap_switch").

I like Roberto's suggestion. Jan, are you OK with it?


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCCCA083B8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 00:57:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869168.1280639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW2P3-0001sH-7u; Thu, 09 Jan 2025 23:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869168.1280639; Thu, 09 Jan 2025 23:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW2P3-0001ow-53; Thu, 09 Jan 2025 23:57:29 +0000
Received: by outflank-mailman (input) for mailman id 869168;
 Thu, 09 Jan 2025 23:57:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+E5=UB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tW2P2-0001oq-In
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 23:57:28 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a565540-cee5-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 00:57:27 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D4ED9A425A2;
 Thu,  9 Jan 2025 23:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D166C4CED2;
 Thu,  9 Jan 2025 23:57:25 +0000 (UTC)
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
X-Inumbo-ID: 7a565540-cee5-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736467046;
	bh=BWQ3BYZ6WFNUUMoBCv+lcp5Zz7Jk/R4qFsK2q7sIwKM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=b8rpB9bnl//RZW5bEl8QfIC2qpjQZwDTV/3YFcKE4cGqasnJuEKDyn2lWn1etv0/9
	 kmezQMjIJVhGGCsSkPja1BbloY70HhNwHdcxiV+VrxNerPHoodDsMoxA03nTpS3od0
	 Z/JU2IgCYmhRt01EaffrKVn0ym2qMuzE08WAbmUmB8wv5tfd7CVrrYdy4eJ09qsjaB
	 ezCY5PV8pMJLE0Bk8bpkUHmlau3jukvG8YFqsCDy1YPmfGCESwat7Iu1ppx2OjOtni
	 /TgDt6gEZWOuLPk5AMQF+9F+8W0e6/lKsRCW0a/ayot29wx9PSHDwkHmdI+BBkyMvN
	 Q9krHMkItdiiA==
Date: Thu, 9 Jan 2025 15:57:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    consulting@bugseng.com
Subject: Re: [PATCH v2 1/2] x86/uaccess: rework user access speculative harden
 guards
In-Reply-To: <8e31daaf77216534c252d371a3251595@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2501091556590.133435@ubuntu-linux-20-04-desktop>
References: <20241126093508.6966-1-roger.pau@citrix.com> <20241126093508.6966-2-roger.pau@citrix.com> <cf1f87d1-f616-4944-94fa-69a777249072@suse.com> <e3ec3dad28dc94436c0b330b2f995120@bugseng.com> <alpine.DEB.2.22.394.2501031617280.16425@ubuntu-linux-20-04-desktop>
 <8e31daaf77216534c252d371a3251595@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Jan 2025, Nicola Vetrini wrote:
> On 2025-01-04 01:20, Stefano Stabellini wrote:
> > Hi Nicola, one question below
> > 
> > On Wed, 27 Nov 2024, Nicola Vetrini wrote:
> > > > #define AMD_OSVW_ERRATUM(osvw_id, ...)  osvw_id, __VA_ARGS__, 0
> > > >
> > > > where we're using the C99 form rather than the GNU extension, and where
> > > > hence __VA_ARGS__ would - by extrapolation of the Misra rule - need
> > > > parenthesizing, when it isn't and can't be.
> > > >
> > > > Isn't it rather the case that variable argument macros need a more
> > > general
> > > > deviation, if not an adjustment to the Misra rule? Extending the Cc list
> > > > some ...
> > 
> > Nicola, if you look at the original patch:
> > https://marc.info/?l=xen-devel&m=173261356716876
> > 
> > "The current guards to select whether user accesses should be speculative
> > hardened violate Misra rule 20.7, as the UA_KEEP() macro doesn't (and can't)
> > parenthesize the 'args' argument."
> > 
> > And the very first change in the patch is:
> > 
> > diff --git a/xen/arch/x86/include/asm/uaccess.h
> > b/xen/arch/x86/include/asm/uaccess.h
> > index 2d01669b96..6b8150ac22 100644
> > --- a/xen/arch/x86/include/asm/uaccess.h
> > +++ b/xen/arch/x86/include/asm/uaccess.h
> > @@ -24,9 +24,6 @@ unsigned int copy_from_unsafe_ll(void *to, const void
> > *from, unsigned int n);
> >  void noreturn __get_user_bad(void);
> >  void noreturn __put_user_bad(void);
> > 
> > -#define UA_KEEP(args...) args
> > -#define UA_DROP(args...)
> > -
> >  /**
> >   * get_guest: - Get a simple variable from guest space.
> >   * @x:   Variable to store result.
> > 
> > 
> > Do you think there is any way we could configure Eclair, with or without
> > a deviation, not to detect every use of UA_KEEP as violations?
> 
> I narrowed this violation down to a different treatment of the named variadic
> argument. Since the argument 'args' cannot be parenthesized as a regular
> argument could, the invocations of the 'UA_KEEP' cannot comply with the rule.
> Therefore, as an extension to the rule, ECLAIR currently ignores the use of
> '__VA_ARGS__' in a macro definition, but treats 'args...' as a regular macro
> parameter name, hence the violation.
> 
> To be clear, these two definitions have the same semantics, but one shows a
> violation and the other doesn't
> 
> #define UA_KEEP(args...) args
> #define UA_KEEP(...) __VA_ARGS__
> 
> I will update ECLAIR to treat the two forms as the same, so this patch can be
> dropped. If you think it's helpful I can send a patch spelling out this -
> arbitrary, but reasonable in my opinion - extension to the MISRA rule (which
> does not consider the implications related to the use of GNU exensions) so
> that contributors have a clear picture of the situation.

Thank you Nicola! Yes the patch would be appreciated :-)


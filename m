Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5892AA08AC5
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 09:56:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869332.1280796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWAoP-0008SZ-Dl; Fri, 10 Jan 2025 08:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869332.1280796; Fri, 10 Jan 2025 08:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWAoP-0008R6-B4; Fri, 10 Jan 2025 08:56:13 +0000
Received: by outflank-mailman (input) for mailman id 869332;
 Fri, 10 Jan 2025 08:56:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yVcS=UC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tWAoM-0008R0-CE
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 08:56:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb38d2e8-cf30-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 09:56:08 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 299D14EE0738;
 Fri, 10 Jan 2025 09:56:07 +0100 (CET)
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
X-Inumbo-ID: bb38d2e8-cf30-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1736499367; bh=vhhd8Bm2l6X7w5OCOM7Za68j+Tx0RW2AOqgQ9FvlmnM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OdIw51C/qTAy1iNaIzT4pTcthCy496dBpY5C9Sb4reZM0lkcLZVnaVnHokOAEHbRF
	 dOwSo8ZobWgLacZsXufVXUZrVO8XE5ccneMwYsV+ehuRoKZ9Ldc2eCRTYPJ/g4jxjU
	 eJe4+9Q6P4gt7YVaT+S2LpgLeENavKhUt4Z3mRQ1tfZqi8gk74sbHnolDviQEUMTPF
	 0x/ar4TVxmdj/pzdSjhoTufCOkJJjYXBqDUwyNKqP8JcYltbE4rQnM5XlmeB0BPMHE
	 szzNPqtv0NEoQJhtIqL9nMtSIduV2CEtssR/pEOgppUFZrtgxuhmZV9K7XujrLol21
	 XBuFaQmtRNMPA==
MIME-Version: 1.0
Date: Fri, 10 Jan 2025 09:56:07 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com
Subject: Re: [PATCH v2 1/2] x86/uaccess: rework user access speculative harden
 guards
In-Reply-To: <Z4DaZlbEDEjxQ6g-@macbook.local>
References: <20241126093508.6966-1-roger.pau@citrix.com>
 <20241126093508.6966-2-roger.pau@citrix.com>
 <cf1f87d1-f616-4944-94fa-69a777249072@suse.com>
 <e3ec3dad28dc94436c0b330b2f995120@bugseng.com>
 <alpine.DEB.2.22.394.2501031617280.16425@ubuntu-linux-20-04-desktop>
 <8e31daaf77216534c252d371a3251595@bugseng.com>
 <alpine.DEB.2.22.394.2501091556590.133435@ubuntu-linux-20-04-desktop>
 <Z4DaZlbEDEjxQ6g-@macbook.local>
Message-ID: <ec0ff4e5654752c7adbe7c4f9402cbd2@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-01-10 09:29, Roger Pau Monné wrote:
> On Thu, Jan 09, 2025 at 03:57:24PM -0800, Stefano Stabellini wrote:
>> On Thu, 9 Jan 2025, Nicola Vetrini wrote:
>> > On 2025-01-04 01:20, Stefano Stabellini wrote:
>> > > Hi Nicola, one question below
>> > >
>> > > On Wed, 27 Nov 2024, Nicola Vetrini wrote:
>> > > > > #define AMD_OSVW_ERRATUM(osvw_id, ...)  osvw_id, __VA_ARGS__, 0
>> > > > >
>> > > > > where we're using the C99 form rather than the GNU extension, and where
>> > > > > hence __VA_ARGS__ would - by extrapolation of the Misra rule - need
>> > > > > parenthesizing, when it isn't and can't be.
>> > > > >
>> > > > > Isn't it rather the case that variable argument macros need a more
>> > > > general
>> > > > > deviation, if not an adjustment to the Misra rule? Extending the Cc list
>> > > > > some ...
>> > >
>> > > Nicola, if you look at the original patch:
>> > > https://marc.info/?l=xen-devel&m=173261356716876
>> > >
>> > > "The current guards to select whether user accesses should be speculative
>> > > hardened violate Misra rule 20.7, as the UA_KEEP() macro doesn't (and can't)
>> > > parenthesize the 'args' argument."
>> > >
>> > > And the very first change in the patch is:
>> > >
>> > > diff --git a/xen/arch/x86/include/asm/uaccess.h
>> > > b/xen/arch/x86/include/asm/uaccess.h
>> > > index 2d01669b96..6b8150ac22 100644
>> > > --- a/xen/arch/x86/include/asm/uaccess.h
>> > > +++ b/xen/arch/x86/include/asm/uaccess.h
>> > > @@ -24,9 +24,6 @@ unsigned int copy_from_unsafe_ll(void *to, const void
>> > > *from, unsigned int n);
>> > >  void noreturn __get_user_bad(void);
>> > >  void noreturn __put_user_bad(void);
>> > >
>> > > -#define UA_KEEP(args...) args
>> > > -#define UA_DROP(args...)
>> > > -
>> > >  /**
>> > >   * get_guest: - Get a simple variable from guest space.
>> > >   * @x:   Variable to store result.
>> > >
>> > >
>> > > Do you think there is any way we could configure Eclair, with or without
>> > > a deviation, not to detect every use of UA_KEEP as violations?
>> >
>> > I narrowed this violation down to a different treatment of the named variadic
>> > argument. Since the argument 'args' cannot be parenthesized as a regular
>> > argument could, the invocations of the 'UA_KEEP' cannot comply with the rule.
>> > Therefore, as an extension to the rule, ECLAIR currently ignores the use of
>> > '__VA_ARGS__' in a macro definition, but treats 'args...' as a regular macro
>> > parameter name, hence the violation.
>> >
>> > To be clear, these two definitions have the same semantics, but one shows a
>> > violation and the other doesn't
>> >
>> > #define UA_KEEP(args...) args
>> > #define UA_KEEP(...) __VA_ARGS__
>> >
>> > I will update ECLAIR to treat the two forms as the same, so this patch can be
>> > dropped. If you think it's helpful I can send a patch spelling out this -
>> > arbitrary, but reasonable in my opinion - extension to the MISRA rule (which
>> > does not consider the implications related to the use of GNU exensions) so
>> > that contributors have a clear picture of the situation.
>> 
>> Thank you Nicola! Yes the patch would be appreciated :-)
> 
> So unless the proposed adjustment is considered better for code
> readability patch 1 can be dropped, and patch 2 could be applied after
> the ECLAIR change is in effect?
> 

Yes, exactly

> How long will it take Nicola to get the ECLAIR change propagated into
> the Gitlab runner?
> 
> Thanks, Roger.

We're still fixing the false positive upstream, but it shouldn't take 
too long so I think next week I should be able to refresh the runner.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253


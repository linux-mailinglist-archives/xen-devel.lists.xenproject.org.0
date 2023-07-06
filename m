Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E72474A690
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 00:06:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560088.875707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHX6Z-0002PZ-Ek; Thu, 06 Jul 2023 22:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560088.875707; Thu, 06 Jul 2023 22:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHX6Z-0002N5-Bn; Thu, 06 Jul 2023 22:05:39 +0000
Received: by outflank-mailman (input) for mailman id 560088;
 Thu, 06 Jul 2023 22:05:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9JNo=CY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qHX6Y-0002Mz-Ma
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 22:05:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b517880-1c49-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 00:05:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70BAD6132C;
 Thu,  6 Jul 2023 22:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345ABC433C7;
 Thu,  6 Jul 2023 22:05:31 +0000 (UTC)
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
X-Inumbo-ID: 3b517880-1c49-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688681133;
	bh=dbV5LKGfu3VZZjOXJh0NwH/tFvvVOQnoDjeA8F5+7Kk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F8le/+YPr2gg6MeHnQvTKhnhgAmdXSdm59CIww0sYIdRTsS8ndgc1/iwc096YIlMq
	 54d9UQQD/NxfEoXJKszj11ia2Z+ej3M8wfO5dGHkf1KJRRK/K1iEHrbw9bAMFWkwMG
	 qk1CalQB5ODGdt0rVSKJhKKYxkA/X0bnaSeVhpRXUUljjZuKHrvtwNMgmffr57Cg7R
	 FCtV+VTyQ1QvjZoZh0ylkHns5yNxCqC7bYubraxCpQ5M9D3ELyA2KU6GQPWMU1EJJt
	 GnUPij1r7RVEdjIUjHqwKg9VURGspnUHYzKdSMaxGKOmQ6ekxQkV21dFp8BbswvRYm
	 ti9/hu+PTMIlA==
Date: Thu, 6 Jul 2023 15:05:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH 4/5] x86/x86_emulate: change parameter name from 's'
 to 'state'
In-Reply-To: <c2a52a88-a8bf-3e14-f3f5-616177c3d807@suse.com>
Message-ID: <alpine.DEB.2.22.394.2307061450530.761183@ubuntu-linux-20-04-desktop>
References: <cover.1688049494.git.federico.serafini@bugseng.com> <8c8bc96b96a1111a4651f970f506d304809ea40d.1688049495.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2306291230500.3936094@ubuntu-linux-20-04-desktop> <e7af3c85-92ec-7d0f-0e63-3a1e5d65877e@suse.com>
 <alpine.DEB.2.22.394.2307051544340.761183@ubuntu-linux-20-04-desktop> <c2a52a88-a8bf-3e14-f3f5-616177c3d807@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Jul 2023, Jan Beulich wrote:
> On 06.07.2023 00:49, Stefano Stabellini wrote:
> > On Tue, 4 Jul 2023, Jan Beulich wrote:
> >> On 29.06.2023 21:31, Stefano Stabellini wrote:
> >>> On Thu, 29 Jun 2023, Federico Serafini wrote:
> >>>> Change parameter name from 's' to 'state' in function definitions in
> >>>> order to:
> >>>> 1) keep consistency with the parameter names used in the corresponding
> >>>>    declarations;
> >>>> 2) keep consistency with parameter names used within x86_emulate.h;
> >>>> 3) fix violations of MISRA C:2012 Rule 8.3.
> >>>>
> >>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> >>>
> >>> You could use x86emul: as tag in the title. I'll let Jan choose the tag
> >>> he prefers.
> >>
> >> x86emul: or x86/emul: is what we commonly use. That said, I don't like
> >> this change. The files touched are pretty new, and it was deliberate
> >> that I used s, not state, for the names. This is shorthand much like
> >> (globally) we use v (instead of vcpu) and d (instead of domain).
> > 
> > Are you suggesting that the functions changed in this patch should be
> > adapted in the other direction instead?  Meaning that the declaration is
> > changed to match the definition instead of the opposite?
> > 
> > If so, are you referring to all the functions changed in this patch? Or
> > only some?
> 
> All of the files touched here are ones which were recently introduced,
> and which are deliberately the way they are. This "deliberately" really
> goes as far as declarations and definitions disagreeing in names: For
> the former, what matters are adjacent declarations in the header. For
> the latter what matters is code readability. I'm sorry, I think the
> Misra rule simply gets in the way of the original intentions here (and
> I continue to disagree with there being any confusion from name
> mismatches between declarations and definitions, the more that in the
> case here it would be easy to avoid by simply omitting names in
> declarations, but that is violating yet another rule I don't fully
> agree with either, as voiced when discussing it).
> 
> My preferred course of action here would be to simply drop the patch.
> The least bad adjustment, if one is absolutely necessary, would be to
> change the declarations, but then in a way that all adjacent ones
> remain consistent (which may in turn require some _other_ definitions
> to change). The mid- to long-term goal certainly is to use "s" more
> where "state" may be used right now.


If we drop this patch then we have the problem that Eclair and other
scanners will detect these as violations. Also this source file would
not be consistent with the rest of the codebase causing issues in the
future. Any patch updating this file would trigger new MISRA C
violations in the scanners.

So I don't think we can drop this patch but we could add deviations. I
think your suggestion of "changing the declaration in a way that all
adjacent ones remain consistent" is better, but let me also provide this
option.

Basically, we would keep these declarations/definitions as is, and add
a one-line in-code comment for each deviation. Such as:

/* SAF-2-safe R8.3 */
bool cf_check
x86_insn_is_mem_write(const struct x86_emulate_state *state,
                      const struct x86_emulate_ctxt *ctxt);

Your suggestion of changing the declaration is better in my opinion. Do
you agree?


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D71AB9D3038
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 23:02:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840842.1256368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDWIK-0003cf-Bv; Tue, 19 Nov 2024 22:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840842.1256368; Tue, 19 Nov 2024 22:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDWIK-0003bC-99; Tue, 19 Nov 2024 22:02:00 +0000
Received: by outflank-mailman (input) for mailman id 840842;
 Tue, 19 Nov 2024 22:01:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IGE8=SO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tDWII-0003an-3Y
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 22:01:58 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2e3b131-a6c1-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 23:01:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C1462A42B64;
 Tue, 19 Nov 2024 21:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27555C4CECF;
 Tue, 19 Nov 2024 22:01:52 +0000 (UTC)
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
X-Inumbo-ID: e2e3b131-a6c1-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6ImUyZTNiMTMxLWE2YzEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDUzNzE0Ljc2OTI4NSwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732053712;
	bh=lTlfeIOSAzIhyBHQGmZg0AapZZvGe063U5NjxPjY3jA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e2Y0MA6iFULsN6edcy8HNZYf/SdouaEXOahA6r9qEG8fwcyaPGYqAzCQ+yiyLFPMW
	 iFCXGHmnfVU0SUrg32rJg2UzHB76gXSWIe26hSsTCmn4PPhsDeEPZOYBe7D40Sj7cd
	 Qqu4DmttClo6HNDWEDPpa6It2XlOMpQ+noe2xdYOHpEpK2dRDl+EOp/EkhUZsLn8jx
	 66m2jFaVAYzPZXu0jwPtak6pzEGBunxMBh0Yz3h4fQ6jiYGIcr+/CTcYkMrZiTk+L+
	 SAXbhBAPPAaat4OEEi0TmZjkoZkw315lS6Ikok9Elo36DlbO83i3oHOHki6p4sTJ0L
	 crW6/ceoXey/A==
Date: Tue, 19 Nov 2024 14:01:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/mce: Compile do_mca() for CONFIG_PV only
In-Reply-To: <00fa3d65-d598-474f-b9ee-7b63db2d3b40@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2411191400340.1160299@ubuntu-linux-20-04-desktop>
References: <20241119125904.2681402-1-andrew.cooper3@citrix.com> <d92cf59a-a798-4223-9439-85ae215b7daa@suse.com> <00fa3d65-d598-474f-b9ee-7b63db2d3b40@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1880775059-1732053712=:1160299"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1880775059-1732053712=:1160299
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 19 Nov 2024, Andrew Cooper wrote:
> On 19/11/2024 2:34 pm, Jan Beulich wrote:
> > On 19.11.2024 13:59, Andrew Cooper wrote:
> >> Eclair reports a Misra Rule 8.4 violation; that do_mca() can't see it's
> >> declaration.  It turns out that this is a consequence of do_mca() being
> >> PV-only, and the declaration being compiled out in !PV builds.
> >>
> >> Therefore, arrange for do_mca() to be compiled out in !PV builds.  This in
> >> turn requires a number of static functions to become static inline.
> > Which generally we advocate against.
> 
> It's `static inline` or `static __maybe_unused`, but I refer you to to
> the Matrix conversation on June 24th on the matter.
> 
> 
> >  The #ifdef variant you pointed at on
> > Matrix wasn't all that bad.
> 
> It worked as a test, but ifdefary like that is a maintenance nightmare.
> 
> >  Plus ...
> >
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monné <roger.pau@citrix.com>
> >> CC: Stefano Stabellini <sstabellini@kernel.org>
> >> CC: consulting@bugseng.com <consulting@bugseng.com>
> >>
> >> Bloat-o-meter on a !PV build reports:
> >>
> >>   add/remove: 0/6 grow/shrink: 0/0 up/down: 0/-3717 (-3717)
> >>   Function                                     old     new   delta
> >>   x86_mc_mceinject                              31       -     -31
> >>   do_mca.cold                                  117       -    -117
> >>   x86_mc_msrinject                             147       -    -147
> >>   x86_mc_msrinject.cold                        230       -    -230
> >>   do_mc_get_cpu_info                           500       -    -500
> >>   do_mca                                      2692       -   -2692
> > ... what's the effect of the addition of "inline" on a PV=y build? By
> > using the keyword, we may end up talking the compiler into inlining of
> > code that better wouldn't be inlined.
> 
> xen.git/xen$ ../scripts/bloat-o-meter xen-syms-{before,after}
> add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
> Function                                     old     new   delta
> Total: Before=3901801, After=3901801, chg +0.00%
> xen.git/xen$ diff -u dis-{before,after}
> --- dis-before    2024-11-19 18:08:02.284091931 +0000
> +++ dis-after    2024-11-19 18:08:24.491035756 +0000
> @@ -1,5 +1,5 @@
>  
> -xen-syms-before:     file format elf64-x86-64
> +xen-syms-after:     file format elf64-x86-64
>  
>  
>  Disassembly of section .text:
> 
> xen.git/xen$
> 
> 
> Which is not surprising because at -O2, the keyword is effectively
> ignored because of the various -finline-*

Given this, and also given that this patch with the static inline looks
nice, I prefer this version:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1880775059-1732053712=:1160299--


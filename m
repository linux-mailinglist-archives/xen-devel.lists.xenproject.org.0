Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A4DAA58FA
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 02:21:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973988.1361985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAHfd-0008Gk-Ri; Thu, 01 May 2025 00:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973988.1361985; Thu, 01 May 2025 00:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAHfd-0008FH-P2; Thu, 01 May 2025 00:20:57 +0000
Received: by outflank-mailman (input) for mailman id 973988;
 Thu, 01 May 2025 00:20:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iHxF=XR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uAHfc-0008F9-3M
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 00:20:56 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24033049-2622-11f0-9eb4-5ba50f476ded;
 Thu, 01 May 2025 02:20:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 237D1A4A5A7;
 Thu,  1 May 2025 00:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC6EC4CEE7;
 Thu,  1 May 2025 00:20:50 +0000 (UTC)
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
X-Inumbo-ID: 24033049-2622-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746058851;
	bh=6Ia57A4I5wiXQw9ar830r0742ycof8w5szTvIvQ5wzE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LgJdiFXUrnvhXsShz3L7tzc8vYV+odiAefXZV0ejwLmScj4FmzOAvIs7LHLOHQe5l
	 i/ShHOYv9yV3lkiRmPC0DtEjyWBuX8XpdurlHdbOD8vgkeAiGqQyRCnTSFUpUjdOfp
	 KakDe7iuuIjsjGakj8fK+EjEZINe2q2rnYTPjVaiYyLR+mkbG50VRUToJz5peQS94m
	 g4Gfl3AhDuEQjBY0qmLcsMGW0ZsjSan5Zsn4xLOTFg1TWc1rnyZIL3qVTlU2e6JDZ4
	 NzOhgDKvt+q1wgVch6Aa07UuPiJeE60YJMFY3MpfwaCmQJn1lvwDXjKZ5UX8rtRWbc
	 DJyXTDjsKBFcg==
Date: Wed, 30 Apr 2025 17:20:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, victorm.lira@amd.com, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 1/3] x86: x86_emulate: address violations of MISRA C
 Rule 19.1
In-Reply-To: <2be0b5a8-50ee-4c3c-9299-0f065ac5aa05@suse.com>
Message-ID: <alpine.DEB.2.22.394.2504301720070.3879245@ubuntu-linux-20-04-desktop>
References: <c694069696dd428bc1719e36c378a573b03f74b9.1745624090.git.victorm.lira@amd.com> <914e3157-736a-4890-9c91-e93fcc260bb0@suse.com> <alpine.DEB.2.22.394.2504281625240.785180@ubuntu-linux-20-04-desktop> <350d447e-7316-4d54-8468-68f78675cc8d@suse.com>
 <alpine.DEB.2.22.394.2504291510120.3879245@ubuntu-linux-20-04-desktop> <2be0b5a8-50ee-4c3c-9299-0f065ac5aa05@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Apr 2025, Jan Beulich wrote:
> On 30.04.2025 00:54, Stefano Stabellini wrote:
> > On Tue, 29 Apr 2025, Jan Beulich wrote:
> >> On 29.04.2025 03:27, Stefano Stabellini wrote:
> >>> On Mon, 28 Apr 2025, Jan Beulich wrote:
> >>>> On 26.04.2025 01:42, victorm.lira@amd.com wrote:
> >>>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >>>>>
> >>>>> Rule 19.1 states: "An object shall not be assigned or copied
> >>>>> to an overlapping object". Since the "call" and "compat_call" are
> >>>>
> >>>> Was this taken from patch 2 without editing?
> >>>>
> >>>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> >>>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> >>>>> @@ -526,9 +526,19 @@ static inline void put_loop_count(
> >>>>>           */                                                             \
> >>>>>          if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
> >>>>>          {                                                               \
> >>>>> +            uint64_t tmp;                                               \
> >>>>> +                                                                        \
> >>>>>              _regs.r(cx) = 0;                                            \
> >>>>> -            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
> >>>>> -            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
> >>>>> +            if ( extend_si )                                            \
> >>>>> +            {                                                           \
> >>>>> +                tmp = _regs.esi;                                        \
> >>>>> +                _regs.r(si) = tmp;                                      \
> >>>>> +            }                                                           \
> >>>>> +            if ( extend_di )                                            \
> >>>>> +            {                                                           \
> >>>>> +                tmp = _regs.edi;                                        \
> >>>>> +                _regs.r(di) = tmp;                                      \
> >>>>> +            }                                                           \
> >>>>
> >>>> See commit 7225f13aef03 for how we chose to address similar issues elsewhere
> >>>> in the emulator. I think we want to be consistent there. This will then also
> >>>> eliminate ...
> >>>>
> >>>>> @@ -2029,7 +2039,12 @@ x86_emulate(
> >>>>>          switch ( op_bytes )
> >>>>>          {
> >>>>>          case 2: _regs.ax = (int8_t)_regs.ax; break; /* cbw */
> >>>>> -        case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.ax; break; /* cwde */
> >>>>> +        case 4:
> >>>>> +            {
> >>>>> +                uint32_t tmp = (uint32_t)(int16_t)_regs.ax;
> >>>>> +                _regs.r(ax) = tmp;
> >>>>> +                break; /* cwde */
> >>>>> +            }
> >>>>
> >>>> ... the odd brace placement here, as well as the inconsistency in the types
> >>>> you used for the temporary variables (both really could have been unsigned
> >>>> int; no need for a fixed-width type).
> >>>
> >>> Is this what you have in mind?
> >>
> >> No, and that's also not what the referenced commit did in a similar situation.
> >>
> >>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> >>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> >>> @@ -527,8 +527,8 @@ static inline void put_loop_count(
> >>>          if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
> >>>          {                                                               \
> >>>              _regs.r(cx) = 0;                                            \
> >>> -            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
> >>> -            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
> >>> +            if ( extend_si ) _regs.r(si) = (uint64_t)_regs.esi;         \
> >>> +            if ( extend_di ) _regs.r(di) = (uint64_t)_regs.edi;         \
> >>
> >>             if ( extend_si ) _regs.r(si) = (uint32_t)_regs.r(si);       \
> >>             if ( extend_di ) _regs.r(di) = (uint32_t)_regs.r(di);       \
> >>
> >> After all what the rule requires is that we use _the same_ field on both sides.
> > 
> > I see, thanks Jan. Yes I did try this version and worked as expected.
> 
> Except that ...
> 
> > --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> > +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> > @@ -527,8 +527,8 @@ static inline void put_loop_count(
> >          if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
> >          {                                                               \
> >              _regs.r(cx) = 0;                                            \
> > -            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
> > -            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
> > +            if ( extend_si ) _regs.r(si) = (uint32_t)_regs.r(si);        \
> > +            if ( extend_di ) _regs.r(di) = (uint32_t)_regs.r(di);        \
> >          }                                                               \
> >          goto complete_insn;                                             \
> >      }                                                                   \
> > @@ -2029,7 +2029,7 @@ x86_emulate(
> >          switch ( op_bytes )
> >          {
> >          case 2: _regs.ax = (int8_t)_regs.ax; break; /* cbw */
> > -        case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.ax; break; /* cwde */
> > +        case 4: _regs.r(ax) = (int16_t)_regs.r(ax); break; /* cwde */
> 
> ... the change in casts here renders this wrong now, afaict. We'd sign-
> extend from 16 to 64 bits, rather than sign-extending to 32 bits and
> then zero-extending to 64.

Thanks Jan, this should be:

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index bee0332bdf..d678855238 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2029,7 +2029,7 @@ x86_emulate(
         switch ( op_bytes )
         {
         case 2: _regs.ax = (int8_t)_regs.ax; break; /* cbw */
-        case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.ax; break; /* cwde */
+        case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.r(ax); break; /* cwde */
         case 8: _regs.r(ax) = (int32_t)_regs.r(ax); break; /* cdqe */
         }
         break;

I tested this too and passes MISRA


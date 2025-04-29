Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EFCA9FF0B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 03:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971333.1359781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Zl3-0005P1-Ds; Tue, 29 Apr 2025 01:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971333.1359781; Tue, 29 Apr 2025 01:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Zl3-0005MS-A6; Tue, 29 Apr 2025 01:27:37 +0000
Received: by outflank-mailman (input) for mailman id 971333;
 Tue, 29 Apr 2025 01:27:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZtOk=XP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u9Zl2-0005MM-7b
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 01:27:36 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2013d9b6-2499-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 03:27:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 350A4A4B8DC;
 Tue, 29 Apr 2025 01:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FDFC4CEE4;
 Tue, 29 Apr 2025 01:27:30 +0000 (UTC)
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
X-Inumbo-ID: 2013d9b6-2499-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745890052;
	bh=YTzPsRYYoFP05hjTbkygTPgGb0wiq5NwEppj5vOP3x0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Eph7AMvSWLc0q5WPBpIXCj5/VNi3EtURgh3Sk7LmG2VCBFE//iiuMz7izhXeLGKHP
	 8P6WW3VFYwVuFdArMh+n/0XwAgEpOgEViY4psS5zCCNi/nBDD4immOUJDl1nuEQoD4
	 8/cwsOy/nslS9c9b1jNYgKm2aBRJCDK1cceZ5Fr6fkslOAhDq9FtYb1sAXu0+3aTQ+
	 8IYj+IZW7iCRSIK0icbw4IFIEC2EBUUSXKdVM4Il83AGllYhzU4fpq4MrtS/5AR00Q
	 loBwRSXV/z0qHlPjgHTpHvlkgvkzqGFqVX70IBorQ/+qXDYZFFZOsxmsoKMpLbV0Ny
	 zSQIXKJRwwltQ==
Date: Mon, 28 Apr 2025 18:27:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: victorm.lira@amd.com, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 1/3] x86: x86_emulate: address violations of MISRA C
 Rule 19.1
In-Reply-To: <914e3157-736a-4890-9c91-e93fcc260bb0@suse.com>
Message-ID: <alpine.DEB.2.22.394.2504281625240.785180@ubuntu-linux-20-04-desktop>
References: <c694069696dd428bc1719e36c378a573b03f74b9.1745624090.git.victorm.lira@amd.com> <914e3157-736a-4890-9c91-e93fcc260bb0@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Apr 2025, Jan Beulich wrote:
> On 26.04.2025 01:42, victorm.lira@amd.com wrote:
> > From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > 
> > Rule 19.1 states: "An object shall not be assigned or copied
> > to an overlapping object". Since the "call" and "compat_call" are
> 
> Was this taken from patch 2 without editing?
> 
> > --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> > +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> > @@ -526,9 +526,19 @@ static inline void put_loop_count(
> >           */                                                             \
> >          if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
> >          {                                                               \
> > +            uint64_t tmp;                                               \
> > +                                                                        \
> >              _regs.r(cx) = 0;                                            \
> > -            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
> > -            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
> > +            if ( extend_si )                                            \
> > +            {                                                           \
> > +                tmp = _regs.esi;                                        \
> > +                _regs.r(si) = tmp;                                      \
> > +            }                                                           \
> > +            if ( extend_di )                                            \
> > +            {                                                           \
> > +                tmp = _regs.edi;                                        \
> > +                _regs.r(di) = tmp;                                      \
> > +            }                                                           \
> 
> See commit 7225f13aef03 for how we chose to address similar issues elsewhere
> in the emulator. I think we want to be consistent there. This will then also
> eliminate ...
> 
> > @@ -2029,7 +2039,12 @@ x86_emulate(
> >          switch ( op_bytes )
> >          {
> >          case 2: _regs.ax = (int8_t)_regs.ax; break; /* cbw */
> > -        case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.ax; break; /* cwde */
> > +        case 4:
> > +            {
> > +                uint32_t tmp = (uint32_t)(int16_t)_regs.ax;
> > +                _regs.r(ax) = tmp;
> > +                break; /* cwde */
> > +            }
> 
> ... the odd brace placement here, as well as the inconsistency in the types
> you used for the temporary variables (both really could have been unsigned
> int; no need for a fixed-width type).

Is this what you have in mind?


diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 8e14ebb35b..394c96e1f2 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -527,8 +527,8 @@ static inline void put_loop_count(
         if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
         {                                                               \
             _regs.r(cx) = 0;                                            \
-            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
-            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
+            if ( extend_si ) _regs.r(si) = (uint64_t)_regs.esi;         \
+            if ( extend_di ) _regs.r(di) = (uint64_t)_regs.edi;         \
         }                                                               \
         goto complete_insn;                                             \
     }                                                                   \
@@ -2029,7 +2029,7 @@ x86_emulate(
         switch ( op_bytes )
         {
         case 2: _regs.ax = (int8_t)_regs.ax; break; /* cbw */
-        case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.ax; break; /* cwde */
+        case 4: _regs.r(ax) = (int16_t)_regs.ax; break; /* cwde */
         case 8: _regs.r(ax) = (int32_t)_regs.r(ax); break; /* cdqe */
         }
         break;

Unfortunately it doesn't work. The first hunk (put_loop_count) seems to
be the problem. Neither uint32_t nor unsigned long work, so I am
probably heading in the wrong direction. Any idea what did I do wrong?



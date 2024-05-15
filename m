Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19A68C6ECA
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 00:48:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722642.1126787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7NPs-0000dU-8i; Wed, 15 May 2024 22:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722642.1126787; Wed, 15 May 2024 22:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7NPs-0000ag-69; Wed, 15 May 2024 22:48:08 +0000
Received: by outflank-mailman (input) for mailman id 722642;
 Wed, 15 May 2024 22:48:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kF2M=MS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7NPq-0000aa-Ow
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 22:48:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 302a992b-130d-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 00:48:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DEE536149C;
 Wed, 15 May 2024 22:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333A2C116B1;
 Wed, 15 May 2024 22:48:00 +0000 (UTC)
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
X-Inumbo-ID: 302a992b-130d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715813282;
	bh=Z3h8GZPro4Gg/YXBHF3gVOMMrtbcUlssNlWYhZennmI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MmXEba/9yr1+M4up9V6EyZPnVRZe62ibYuQwgwYqO08vY99OvVOZxylZdOfVV2Uau
	 VgpauAeuaeKgKkTL6ly8CHStwzwRvw8SOM2i1Lm6/av9OLsyviU9r0oeriCUDHPafq
	 8qMRZe600w+JoO7XmAMcd1zkoGRtkcDGBmo03sTAtAMXhddoihjKgf8o+pDljR47VE
	 MfmBOn5Vz4HnS6zXEq9Ss+CNDJxjBB5YM31EMZvCa5hm2Y/ij6HO4eAwmPtTw18rvb
	 jXHzidch/tM+abrFlPfPQXls08seWrfVPP1cLs6irt4dGju/a2/uzk4aLV/EDWE6Xa
	 atMG5MEkxKFqw==
Date: Wed, 15 May 2024 15:47:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, nicola.vetrini@bugseng.com, 
    consulting@bugseng.com
Subject: Re: [PATCH] lib/strtoul: fix MISRA R10.2 violation
In-Reply-To: <a3fa7be4-48ce-4b68-a8f7-f94df58d97de@suse.com>
Message-ID: <alpine.DEB.2.22.394.2405151547260.2544314@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405131729180.2544314@ubuntu-linux-20-04-desktop> <16990192-aceb-408f-9247-45f3b1f58e0a@suse.com> <alpine.DEB.2.22.394.2405141540140.2544314@ubuntu-linux-20-04-desktop> <a3fa7be4-48ce-4b68-a8f7-f94df58d97de@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Jan Beulich wrote:
> On 15.05.2024 00:52, Stefano Stabellini wrote:
> > On Tue, 14 May 2024, Jan Beulich wrote:
> >> On 14.05.2024 02:32, Stefano Stabellini wrote:
> >>> Fix last violation of R10.2 by casting the result of toupper to plain
> >>> char. Note that we don't want to change toupper itself as it is a legacy
> >>> interface and it would cause more issues.
> >>
> >> Can you point me at a single example where a new issue would arise? All
> >> places I've spotted (including tolower() uses) would appear to benefit
> >> from changing toupper() / tolower() themselves. Further, since they are
> >> both wrapper macros only anyway, if any concern remained, fiddling with
> >> the wrapper macros while leaving alone the underlying inline functions
> >> would allow any such use site to simply be switched to using the inline
> >> functions directly. As said, from looking at it I don't expect that
> >> would be necessary, so instead I'd rather hope that eventually we can
> >> do away with the wrapper macros, renaming the inline functions
> >> accordingly.
> > 
> > If we change __toupper to return a plain char, then there are a few
> > other things we need to change for consistency, see below. To be honest
> > I thought it would cause more problems. I am OK to go with that if you
> > all agree. (Nicola please have a look in case this introduces more
> > issues elsewhere.)
> > 
> > 
> > diff --git a/xen/include/xen/ctype.h b/xen/include/xen/ctype.h
> > index 6dec944a37..6a6854e01c 100644
> > --- a/xen/include/xen/ctype.h
> > +++ b/xen/include/xen/ctype.h
> > @@ -15,9 +15,9 @@
> >  #define _X	0x40	/* hex digit */
> >  #define _SP	0x80	/* hard space (0x20) */
> >  
> > -extern const unsigned char _ctype[];
> > +extern const char _ctype[];
> 
> Why would this be needed? I can't see a connection to toupper() / tolower().
> 
> > -#define __ismask(x) (_ctype[(int)(unsigned char)(x)])
> > +#define __ismask(x) (_ctype[(int)(char)(x)])
> 
> This almost certainly is wrong. Whether plain char is signed or unsigned is
> left to the compiler, and it being signed would result in possibly negative
> array indexes. Again I can't see a connection to the issue at hand.
> 
> > @@ -34,14 +34,14 @@ extern const unsigned char _ctype[];
> >  #define isascii(c) (((unsigned char)(c))<=0x7f)
> >  #define toascii(c) (((unsigned char)(c))&0x7f)
> >  
> > -static inline unsigned char __tolower(unsigned char c)
> > +static inline char __tolower(char c)
> >  {
> >  	if (isupper(c))
> >  		c -= 'A'-'a';
> >  	return c;
> >  }
> >  
> > -static inline unsigned char __toupper(unsigned char c)
> > +static inline char __toupper(char c)
> >  {
> >  	if (islower(c))
> >  		c -= 'a'-'A';
> 
> This isn't what I had suggested. First I said to leave alone the double-
> underscore prefixed functions, and only touch the wrapper macros (as a
> precaution in case any use site exists which relies on present behavior).
> And then I didn't suggest to alter parameter types; only the return type
> would need adjustment, I think, for what you're aiming at:
> 
> #define tolower(c) ((char)__tolower(c))
> #define toupper(c) ((char)__toupper(c))

Oh I see. This is much more similar to the original suggestion from
Bugseng. Let me send a v2.


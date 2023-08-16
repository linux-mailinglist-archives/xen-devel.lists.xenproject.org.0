Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B41877E968
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 21:10:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584882.915760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWLtt-0000Uv-FV; Wed, 16 Aug 2023 19:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584882.915760; Wed, 16 Aug 2023 19:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWLtt-0000S0-CP; Wed, 16 Aug 2023 19:09:49 +0000
Received: by outflank-mailman (input) for mailman id 584882;
 Wed, 16 Aug 2023 19:09:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8vYs=EB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qWLtr-0000Ru-Nf
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 19:09:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75df1903-3c68-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 21:09:45 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 30C6564F19;
 Wed, 16 Aug 2023 19:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7AEC433C7;
 Wed, 16 Aug 2023 19:09:41 +0000 (UTC)
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
X-Inumbo-ID: 75df1903-3c68-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692212983;
	bh=lvzlJ3S61YjSRft+oYdY4/c19F/x9uLJ7cHBVLMsmLs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mIzslA0TpG70h1Re/rHQajuAkYxP+cYYml732p1ZG+BrbbRdYEbaBuruiTyL7dHyi
	 eTSKqoFlxjgX+cGhAFucAhAPVJ5VsBTRhpQ/hVOi5rkPdG90s4lMhsGCIVLVh0DW+u
	 nUVx4i0XCVC2lPZJKHMAJwYifRIGF0mWK4EYSJTVAeJbq7AdlRmNZa1R+E5tVSp9aR
	 rVL2ddYk4zjzNNZUebTk3I9/aXtny2YYl77fr4hST1P2CwW6OgNBNHz+cdt2JDoOpv
	 W5RN9HIuoLe7s7t3IJiYGYrohiTogft1B28wV6A7wTEPAhRHF29etpu7XV4q7mu6xG
	 4stQYxrvH6HMA==
Date: Wed, 16 Aug 2023 12:09:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: George Dunlap <george.dunlap@cloud.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Jason Andryuk <jandryuk@gmail.com>, 
    George Dunlap <George.Dunlap@eu.citrix.com>, 
    Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>, 
    Julien Grall <julien@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
    Daniel Smith <dpsmith@apertussolutions.com>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v3 02/10] xen/version: Introduce non-truncating
 deterministically-signed XENVER_* subops
In-Reply-To: <CA+zSX=arMnCNmckcc1a-JoQokw4nc5g7+49xhQFoxFYA3uB4_g@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2308161208560.6458@ubuntu-linux-20-04-desktop>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com> <20230815210650.2735671-3-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2308151708070.6458@ubuntu-linux-20-04-desktop> <5f75e037-1f73-f7be-740c-715902d5d9a0@citrix.com>
 <CA+zSX=arMnCNmckcc1a-JoQokw4nc5g7+49xhQFoxFYA3uB4_g@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-371058102-1692212983=:6458"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-371058102-1692212983=:6458
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 16 Aug 2023, George Dunlap wrote:
> On Wed, Aug 16, 2023 at 3:58 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>       On 16/08/2023 1:19 am, Stefano Stabellini wrote:
>       > On Tue, 15 Aug 2023, Andrew Cooper wrote:
> 
>       >> diff --git a/xen/include/public/version.h b/xen/include/public/version.h
>       >> index cbc4ef7a46e6..0dd6bbcb43cc 100644
>       >> --- a/xen/include/public/version.h
>       >> +++ b/xen/include/public/version.h
>       >> @@ -19,12 +19,20 @@
>       >>  /* arg == NULL; returns major:minor (16:16). */
>       >>  #define XENVER_version      0
>       >> 
>       >> -/* arg == xen_extraversion_t. */
>       >> +/*
>       >> + * arg == xen_extraversion_t.
>       >> + *
>       >> + * This API/ABI is broken.  Use XENVER_extraversion2 where possible.
>       > Like Jan and Julien I also don't like the word "broken" especially
>       > without explanation of why it is broken next to it.
> 
>       The word "broken" is an accurate and appropriate word in the English
>       language to describe the situation.  I'm sorry you don't like it, but
>       unless any of you can articulate why you think it is inappropriate
>       phraseology, the complaint is unactionable.
> 
>       Specifically ...
> 
>       > Instead, I would say:
>       >
>       > "XENVER_extraversion is deprecated. Please use XENVER_extraversion2."
> 
>       ... depreciated is misleading.
> 
> 
> Deprecated means, "It is the official position of the developers of the project that for the moment, you *can* use it, but you
> *shouldn't*"; it also implies that support for it might go away at some point.  The fact that we're saying "you shouldn't use it" by itself
> implies that it is lacking somehow.  It's a factual statement that gives you useful information.
> 
> Neither "broken" nor "has problems" actually tell you anything above "deprecated", other than the opinion of the developer writing the
> documentation; and they are both (to different levels) emotionally charged.  You don't deprecate things unless there's something wrong with
> them.  In this particular case, I don't think anyone has an emotional attachment to the existing hypercall, so nobody is going to be
> insulted; but it's a good habit to avoid it.  (See [1] for more about this.)
> 
> [1] http://xenbits.xenproject.org/governance/communication-practice.html , the "Avoid inflammatory and negatively charged language" section
> 
> If I have a backlog of a million things to do, how do I prioritize switching to and testing extraversion2?  The situation as I understand
> it is: "If it works for you now with the current value you're fine, but it may break later when you change it, in a way that's obvious". 
> In that situation, you can safely put off fixing it until your build breaks.  If, on the other hand, the situation is "It may randomly work
> or not work with any given build", or "It may seem to work for you now but is actually failing in a not-very-obvious way", then you
> probably need to prioritize fixing it.
> 
> Saying "May cause truncation" gives you some the information you need to know. "Will silently truncate past N characters" gives you even
> more.  
>  
> We should at very least say it's deprecated.  If we can summarize the issues briefly, then that would be helpful.

I strongly agree with this: we should say it is deprecated and if we can
summarize the issues briefly that's even better.
--8323329-371058102-1692212983=:6458--


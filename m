Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D432E77E984
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 21:19:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584889.915769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWM2k-0002Fa-AF; Wed, 16 Aug 2023 19:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584889.915769; Wed, 16 Aug 2023 19:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWM2k-0002DP-7J; Wed, 16 Aug 2023 19:18:58 +0000
Received: by outflank-mailman (input) for mailman id 584889;
 Wed, 16 Aug 2023 19:18:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8vYs=EB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qWM2j-0002DJ-50
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 19:18:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc36c5ab-3c69-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 21:18:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 88D50621B2;
 Wed, 16 Aug 2023 19:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDA4C433C7;
 Wed, 16 Aug 2023 19:18:48 +0000 (UTC)
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
X-Inumbo-ID: bc36c5ab-3c69-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692213531;
	bh=mUIZqgW1awPX+l3vV0REZZ2dLKLmOmseTR5atATtyO8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mR3iGKvh3aM+WmtGhG/TDfKs3nl7ivvOBqsBbX0c+z4vFifLghlW+/iki4OegSyeL
	 cowYDkDiprq07sypcnSk/5sPx1ffgWx9TDvJaNEr8tAF1VPnpe4D3IOkfE8LJYwqM/
	 BGT6dmYXSmI5khZv340Co0lsl6E5XeGLLtNfgbBq1nG3TTHmwBxUSjRSbsY6t/cDkj
	 uuVeqNWNEe6VZYDorZyHyBX+H8oS7sLOiD2qSdv0B3MLuq9AM3amJ0WODUTEFNEAfm
	 8G6IDEll/qunmIrOuIXFa/+40OFu4eJvxhGPUdYEURRoh+s1QFKuscduArkaXCTiN1
	 cOJB6YSkwqzlQ==
Date: Wed, 16 Aug 2023 12:18:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Daniel Smith <dpsmith@apertussolutions.com>
cc: George Dunlap <george.dunlap@cloud.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Jason Andryuk <jandryuk@gmail.com>, 
    George Dunlap <George.Dunlap@eu.citrix.com>, 
    Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>, 
    Julien Grall <julien@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v3 02/10] xen/version: Introduce non-truncating
 deterministically-signed XENVER_* subops
In-Reply-To: <189fe1470d7.c9aa0e23891146.4230412711034328964@apertussolutions.com>
Message-ID: <alpine.DEB.2.22.394.2308161209490.6458@ubuntu-linux-20-04-desktop>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com> <20230815210650.2735671-3-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2308151708070.6458@ubuntu-linux-20-04-desktop> <5f75e037-1f73-f7be-740c-715902d5d9a0@citrix.com>
 <CA+zSX=arMnCNmckcc1a-JoQokw4nc5g7+49xhQFoxFYA3uB4_g@mail.gmail.com> <189fe1470d7.c9aa0e23891146.4230412711034328964@apertussolutions.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1297879094-1692213471=:6458"
Content-ID: <alpine.DEB.2.22.394.2308161218000.6458@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1297879094-1692213471=:6458
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2308161218001.6458@ubuntu-linux-20-04-desktop>

On Wed, 16 Aug 2023, Daniel Smith wrote:
>  > On Wed, Aug 16, 2023 at 3:58 AM Andrew Cooper andrew.cooper3@citrix.com> wrote:
>  > On 16/08/2023 1:19 am, Stefano Stabellini wrote:
>  >  > On Tue, 15 Aug 2023, Andrew Cooper wrote:
>  > 
>  >  >> diff --git a/xen/include/public/version.h b/xen/include/public/version.h
>  >  >> index cbc4ef7a46e6..0dd6bbcb43cc 100644
>  >  >> --- a/xen/include/public/version.h
>  >  >> +++ b/xen/include/public/version.h
>  >  >> @@ -19,12 +19,20 @@
>  >  >>  /* arg == NULL; returns major:minor (16:16). */
>  >  >>  #define XENVER_version      0
>  >  >>  
>  >  >> -/* arg == xen_extraversion_t. */
>  >  >> +/*
>  >  >> + * arg == xen_extraversion_t.
>  >  >> + *
>  >  >> + * This API/ABI is broken.  Use XENVER_extraversion2 where possible.
>  >  > Like Jan and Julien I also don't like the word "broken" especially
>  >  > without explanation of why it is broken next to it.
>  >  
>  >  The word "broken" is an accurate and appropriate word in the English
>  >  language to describe the situation.  I'm sorry you don't like it, but
>  >  unless any of you can articulate why you think it is inappropriate
>  >  phraseology, the complaint is unactionable.
>  >  
>  >  Specifically ...
>  >  
>  >  > Instead, I would say:
>  >  >
>  >  > "XENVER_extraversion is deprecated. Please use XENVER_extraversion2."
>  >  
>  >  ... depreciated is misleading.
>  > 
>  > Deprecated means, "It is the official position of the developers of the project that for the moment, you *can* use it, but you *shouldn't*"; it also implies that support for it might go away at some point.  The fact that we're saying "you shouldn't use it" by itself implies that it is lacking somehow.  It's a factual statement that gives you useful information.
>  > 
>  > Neither "broken" nor "has problems" actually tell you anything above "deprecated", other than the opinion of the developer writing the documentation; and they are both (to different levels) emotionally charged.  You don't deprecate things unless there's something wrong with them.  In this particular case, I don't think anyone has an emotional attachment to the existing hypercall, so nobody is going to be insulted; but it's a good habit to avoid it.  (See [1] for more about this.)
> 
> With all due respect George but deprecated and broken are fundamentally different. Deprecation means that an interface is being retired in the future for any number of reasons and that it can continue to be used until its retirement without risk of unintended consequences. Labeling an interface as broken, which has been acceptable to do so in other much larger communities, is a stronger sentiment that the interface should stop being used immediately because it can lead to unintended consequences, not because it will be retired in some distant future.

No matter what the Merriam Webster would say for the word "deprecated"
and "broken", each individual "absorbs" each word and their meanings
differently.

There are 6 people involved in this discussion including Andrew, and 4
out of 6 didn't react well to the usage of the word "broken" in this
context. For sure in Andrew's mind "broken" triggers the right
meaning and expectations straight away. But for Julien, Jan, George and
me it did not.

We cannot run a representative survey of the developers population to
know which exact word triggers the most appropriate reaction in this
case. Even if we could, it would not be worth the effort.

Instead, I suggest to just go with the majority interpretation among the
participant in this thread and drop "broken" in favor of one of the
alternatives. Such as something along these lines:

"XENVER_extraversion is deprecated and causes truncation. Please use
XENVER_extraversion2.
--8323329-1297879094-1692213471=:6458--


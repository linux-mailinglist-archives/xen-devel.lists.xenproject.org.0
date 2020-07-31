Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72950234DDD
	for <lists+xen-devel@lfdr.de>; Sat,  1 Aug 2020 01:04:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1e41-00083e-Tx; Fri, 31 Jul 2020 23:03:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F22U=BK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k1e41-00083Z-45
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 23:03:45 +0000
X-Inumbo-ID: 14f3bcd0-d382-11ea-8eb6-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14f3bcd0-d382-11ea-8eb6-bc764e2007e4;
 Fri, 31 Jul 2020 23:03:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 437282072A;
 Fri, 31 Jul 2020 23:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596236623;
 bh=MRghBlBbcTjwoN4MJ43/JXA2Ns4QiM5984Rn2Ro3UIM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=uUgqb4+eUZ4dXFmm9gz2orey5biYf0ntD7LlSJIVkK2RteFj5uP7xBGB7sCWbXcMr
 uQwbHKUx1D9zUkiKfQDKW8Gn+dEjr0N9xecE66Olrw/OZm5yOAa0mHodggFw5L3JBL
 r//1MYknjKm3gQFtW32oYwqg6qfbL31/FSitBwbI=
Date: Fri, 31 Jul 2020 16:03:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v2] xen/arm: Convert runstate address during hypcall
In-Reply-To: <E39531EE-0265-4387-813D-22A57CD3F67B@arm.com>
Message-ID: <alpine.DEB.2.21.2007310935350.1767@sstabellini-ThinkPad-T480s>
References: <4647a019c7b42d40d3c2f5b0a3685954bea7f982.1595948219.git.bertrand.marquis@arm.com>
 <8d2d7f03-450c-d50c-630b-8608c6d42bb9@suse.com>
 <FCAB700B-4617-4323-BE1E-B80DDA1806C1@arm.com>
 <1b046f2c-05c8-9276-a91e-fd55ec098bed@suse.com>
 <alpine.DEB.2.21.2007291356060.1767@sstabellini-ThinkPad-T480s>
 <1a8bbcc7-9d0c-9669-db7b-e837af279027@suse.com>
 <73c8ade5-36a3-cc13-80b6-bda89e175cbb@xen.org>
 <6066b507-f956-8e7a-89f3-b21428b66d65@suse.com>
 <E39531EE-0265-4387-813D-22A57CD3F67B@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 31 Jul 2020, Bertrand Marquis wrote:
> > On 31 Jul 2020, at 12:18, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 31.07.2020 12:12, Julien Grall wrote:
> >> On 31/07/2020 07:39, Jan Beulich wrote:
> >>> We're fixing other issues without breaking the ABI. Where's the
> >>> problem of backporting the kernel side change (which I anticipate
> >>> to not be overly involved)?
> >> This means you can't take advantage of the runstage on existing Linux 
> >> without any modification.
> >> 
> >>> If the plan remains to be to make an ABI breaking change,
> >> 
> >> For a theoritical PoV, this is a ABI breakage. However, I fail to see 
> >> how the restrictions added would affect OSes at least on Arm.
> > 
> > "OSes" covering what? Just Linux?
> > 
> >> In particular, you can't change the VA -> PA on Arm without going 
> >> through an invalid mapping. So I wouldn't expect this to happen for the 
> >> runstate.
> >> 
> >> The only part that *may* be an issue is if the guest is registering the 
> >> runstate with an initially invalid VA. Although, I have yet to see that 
> >> in practice. Maybe you know?
> > 
> > I'm unaware of any such use, but this means close to nothing.
> > 
> >>> then I
> >>> think this will need an explicit vote.
> >> 
> >> I was under the impression that the two Arm maintainers (Stefano and I) 
> >> already agreed with the approach here. Therefore, given the ABI breakage 
> >> is only affecting Arm, why would we need a vote?
> > 
> > The problem here is of conceptual nature: You're planning to
> > make the behavior of a common hypercall diverge between
> > architectures, and in a retroactive fashion. Imo that's nothing
> > we should do even for new hypercalls, if _at all_ avoidable. If
> > we allow this here, we'll have a precedent that people later
> > may (and based on my experience will, sooner or later) reference,
> > to get their own change justified.

Please let's avoid "slippery slope" arguments
(https://en.wikipedia.org/wiki/Slippery_slope)

We shouldn't consider this instance as the first in a long series of bad
decisions on hypercall compatibility. Each new case, if there will be
any, will have to be considered based on its own merits. Also, let's
keep in mind that there have been no other cases in the last 8 years. (I
would like to repeat my support for hypercall ABI compatibility.)


I would also kindly ask not to put the discussion on a "conceptual"
level: there is no way to fix all guests and also keep compatibility.
From a conceptual point of view, it is already game over :-)


> After a discussion with Jan, he is proposing to have a guest config setting to
> turn on or off the translation of the address during the hypercall and add a
> global Xen command line parameter to set the global default behaviour. 
> With this was done on arm could be done on x86 and the current behaviour
> would be kept by default but possible to modify by configuration.
> 
> @Jan: please correct me if i said something wrong
> @others: what is your view on this solution ?

Having options to turn on or off the new behavior could be good-to-have
if we find a guest that actually requires the old behavior. Today we
don't know of any such cases. We have strong reasons to believe that
there aren't any on ARM (see Julien's explanation in regards to the
temporary invalid mappings.) In fact, it is one of the factors that led
us to think this patch is the right approach.

That said, I am also OK with adding such a parameter now, but we need to
choose the default value carefully.


We need the new behavior as default on ARM because we need the fix to
work for all guests. I don't think we want to explain how you always
need to set config_foobar otherwise things don't work. It has to work
out of the box.

It would be nice if we had the same default on x86 too, although I
understand if Jan and Andrew don't want to make the same change on x86,
at least initially.



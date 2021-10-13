Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC05D42CB33
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 22:42:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208852.365104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mal3w-0003l6-ER; Wed, 13 Oct 2021 20:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208852.365104; Wed, 13 Oct 2021 20:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mal3w-0003j8-BA; Wed, 13 Oct 2021 20:41:20 +0000
Received: by outflank-mailman (input) for mailman id 208852;
 Wed, 13 Oct 2021 20:41:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJnr=PB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mal3u-0003j1-Hj
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 20:41:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9ed8f29-2c65-11ec-8197-12813bfff9fa;
 Wed, 13 Oct 2021 20:41:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2869B610EA;
 Wed, 13 Oct 2021 20:41:16 +0000 (UTC)
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
X-Inumbo-ID: e9ed8f29-2c65-11ec-8197-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634157676;
	bh=VS/ZWtlQY5x3BiVp5nUMCc80qzGBYz4TOkGlTiebOXI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Coqo9vQtDYkb7uOJ0iK9yo2/Z52CndQOBzM9lAAATNwSlUQtHEWNypTOZjGfsKGID
	 vRm+a8Wo/6DIeZ2tC+viq1qFTkh9tk9Qj13jVKFGLiirdLCyCGM8fxc1s7ab8NZ7it
	 45m1AQfXrUAwlO6YsbPawsZ4QODwfgSJh81f0gwJ7o+krQH0UCj5PMDSfhqAEx/8cQ
	 p5sAdO1jEX67ToLLTJWZA7v+xelr0QOJxeZgo2sn+rMfONfzCBnqIKQRheZLSgEPlJ
	 NyUuLW9OlQJ/DaRGzBgAwiOUimRh5flG3RJim2/d7Mzo94Htp4fockkHYtUXQWuKyu
	 qahJe/D6Iaaqg==
Date: Wed, 13 Oct 2021 13:41:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Michal Orzel <Michal.Orzel@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andre Przywara <Andre.Przywara@arm.com>, 
    Christian Lindig <christian.lindig@citrix.com>, 
    David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci
 flag
In-Reply-To: <e88892cf-e0c3-c39c-dce8-bfe2d25a5b53@suse.com>
Message-ID: <alpine.DEB.2.21.2110131113212.9408@sstabellini-ThinkPad-T480s>
References: <cover.1633540842.git.rahul.singh@arm.com> <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com> <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local> <9217a6b8-fc53-a049-7cd3-7458b574424b@arm.com> <YWaZKX44IOfIBtX6@MacBook-Air-de-Roger.local>
 <8F9D6B9C-58CB-4000-995A-95517EE72A3B@arm.com> <YWa7eGr3D8Ax8VUX@MacBook-Air-de-Roger.local> <9C5C0FE2-67EA-4CD7-893B-82C156F5F77A@arm.com> <e88892cf-e0c3-c39c-dce8-bfe2d25a5b53@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1357370391-1634148958=:9408"
Content-ID: <alpine.DEB.2.21.2110131116240.9408@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1357370391-1634148958=:9408
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110131116241.9408@sstabellini-ThinkPad-T480s>

On Wed, 13 Oct 2021, Jan Beulich wrote:
> On 13.10.2021 14:11, Bertrand Marquis wrote:
> >> On 13 Oct 2021, at 11:56, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >> If vPCI for Arm on 4.16 is not going to be functional, why so much
> >> pressure in pushing those patches so fast? I understand the need to
> >> remove stuff from the queue, but I don't think it's worth the cost of
> >> introducing a broken interface deliberately on a release.
> 
> +1
> 
> > We did not push that fast, those have been on the mailing list for a while (this is the 5th version of the serie).
> > PCI passthrough is a big change requiring lots of patches and we decided to push it piece by piece to make
> > the review easier.
> 
> 5 versions for a series like this one was to be expected. Imo it has
> been wrong in the past to rush in new features (even if experimental
> ones) very close to the freeze, and it has mislead people to think
> they can delay work until very (too?) late a point in time.


Hi Roger, Jan,

Let me take a few minutes to clarify and provide context for this work.


I don't think anyone "pushed hard" any of the ARM series close to the
release. I sent "one" email in public as a reminder of things that need
reviewing:
https://marc.info/?l=xen-devel&m=163373776611154

I did send a couple of private emails to Jan but they were to synchronize
ourselves rather than push; Jan, I hope you didn't take them the wrong
way.


At the same time it is certainly true that all the people involved here
worked very hard to get these series ready for 4.16. Oct 15 is the Xen
Project feature freeze. It is also the deadline for many of us working
with upstream Xen Project to upstream features and report back to our
management. I know it doesn't affect you guys directly, but you can
imagine that as employees of our respective companies we feel pressure
to complete our objectives in the given timeframe. Of course we need to
make sure to do that without compromising quality and without
overextending upstream review capacity.


The ARM PCI series are public since Dec 2020, pushed to a gitlab branch
for testing: https://gitlab.com/xen-project/fusa/xen-integration/-/tree/integration/pci-passthrough
I helped creating, managing and testing the branch.

So, I can see why Bertrand feels like they have been around for a while:
we have been dealing with these patches for almost a year, even if from
a xen-devel perspective we are "only" at version 5.


In the past there have been contributors dropping a large half-broken
series at the last minute before the code freeze, asking for it to be
committed, promising it will be improved later, and then disappearing
right after the release, leaving the code half-broken forever.

It is easy to draw comparisons between that kind of behavior and what is
happening in this thread. We have all been burned by it at some point.

However, that is really *not* what is happening this week.

PCI Passthrough for ARM is a difficult feature to implement. We have
been discussing it for 5+ years, close to 10 years. I know it sounds
unbelievable but it is true. For one reason or the other it never
materialized. Until now.

Even with all the outstanding series committed, PCI Passthrough for ARM
is not fully functional, but it is a lot closer to the objective.
Rahul, Oleksandr and their teams have been already "sticking around" for
almost a year making improvements and without their help going forward
it is not going to get finished anyway. We still don't have MSI support.

Given that Rahul, Oleksandr and the others are required to finish the
work anyway, and they are not at risk of disappearing, I think we can
deal with one or two TODO left by Oct 15 [1].

My suggestion is to accept the TODO for patch #8 [1] but I agree with
Roger that we shouldn't introduce bad interfaces, especially as they
impact x86 which is not "tech preview". So I think we should revert
patch #7 (this patch.) I'll reply with more details in separate shorter
email.

[1] https://marc.info/?l=xen-devel&m=163412120531248


> In fact I'm getting somewhat angry seeing how much effort is put into
> getting this work in (including myself doing reviews there), when at
> the same time far older series of mine aren't given any chance to
> make any progress. Not your fault, sure, but an observation.


Jan,

Let me start by pointing out that without your help we would never have
managed to get so many ARM patches committed for 4.16. Not just PCI
related, but also EFI too. You should really get credit for that.

I can imagine it is frustrating helping so much somebody else but not
getting help for your own series. In a way it happened to me too as the
only Xilinx series outstanding didn't make any progress:
https://marc.info/?l=xen-devel&m=163056545414965

The only way to solve this problem is by growing the review capacity of
the community. You'll be happy to know that (without naming names) I
have heard from multiple people, new members of the community, that they
are going to commit time to do reviews during the next months. We are
growing the community again and some of the new contributors will become
good reviewers and maintainers over time. I am positive that the next 12
months will be a lot better than the last 12 months from that
perspective.


Thanks Jan, Roger, the two Oleksandr, Rahul, Michal, Bertrand, Luca and
everyone else that stayed up late these last few weeks to push Xen
forward with new groundbreaking features and pushing the project forward
in new directions. I do think 4.16 is going to be a great release and
the both CI-loops are still fully working with staging very close to
master, further proof of the great work of this community.

Cheers,

Stefano
--8323329-1357370391-1634148958=:9408--


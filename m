Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AB7436390
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 15:55:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214429.372976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdYXP-0006cW-Ox; Thu, 21 Oct 2021 13:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214429.372976; Thu, 21 Oct 2021 13:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdYXP-0006ZZ-LC; Thu, 21 Oct 2021 13:55:19 +0000
Received: by outflank-mailman (input) for mailman id 214429;
 Thu, 21 Oct 2021 13:55:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JnKy=PJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mdYXO-0006Xy-04
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 13:55:18 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd9d9a9f-41d7-438f-a1d2-5977ae7dd61e;
 Thu, 21 Oct 2021 13:55:16 +0000 (UTC)
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
X-Inumbo-ID: dd9d9a9f-41d7-438f-a1d2-5977ae7dd61e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634824516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zKHXm1l5/XwOUwChoc6WGnoXB4Za8iwdKfQiFfUL2PE=;
  b=CIZQiteuhoFFHaZ/nFQZ8Dtd3aH1XEY253B9djKJgVuC8IlgpqSa8KVM
   fVXWvh+h1AuPJtLCDoCSVFHoNHpUZaKqqVTIIO/MXvV8yYYCf9yObF+AF
   1LAGdJ0uakZMVq0K4VmI1n9s2yXkdcQhNvJEPrXjabzSNmPEKx+jbKdS5
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: wSm5rzul3gcQiQU6He+bUZQsx9NbquwdC62KML4PUjZgav/Z003d8zp+sob2HWRiOxmSHojPNz
 IvkDHay8ZgJCW5FH/+9tRGmhMOQ42LEM+ryrO4ccS1kFMYy+9AqgtabAKkmARXznAHsTJyvxoU
 GNFkBBa72pf3bhOb5BwNWsFkdlu4Cha7kLU/rV1coO9ATomFmgp6YZg554wHQ0gqvV3+u5+iYg
 JUvg8/gO284UzyqRBCI9mC3WdxwrCOjr6npO4wcGF8+Kj8JRqVVkogc08Eaqma22DtyyFmS2PI
 8n4CFJwkC/QQSmzp/lid4Tea
X-SBRS: 5.1
X-MesageID: 55727308
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qIo8w6IsYEBwJsTwFE+RcJIlxSXFcZb7ZxGr2PjKsXjdYENSgjNVy
 WsXCz2GOvqJNjH8e9BxYYi3oE0OuMfUn4BnTgJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eo5wrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2ExPlb1
 I9HmqfzdlZzPv3Mt95FSjdhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gpt2ZoRRq6OD
 yYfQSNpbxDGPSxxBnQoNcIzhcyEoSj2cyIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wm
 GXC+GjoBwAAA/aWwzGF73GEi/fGmGXwX4d6PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UIGtrMu/UamSt38WRyQo3OeuBMYHd1KHIUS6guA167V6AaxHXUfQ3hKb9lOnM4pRxQ62
 1mRhdTrCDdz9rqPRhq19KqQrD60ETgYKykFfyBscOcey4C9+sdp1EuJF4s9Vv7u5jHoJd3u6
 z3RhQIi3b88to00hv+7rVDouWq1iKGcG2bZ+T7rdm6i6wp4YqusaIqp9UXX4J58EWqJcrWSl
 CNbw5bGvYjiGbnIzXbXGLxcQ9lF8t7caGWE6WODCaXN4NhEF5SLRotX/C1lbHlgNsIJaFcFi
 2eC5FsPuve/0JasBJKbgr5d6ex2ksAM9vy/D5g4i+aihLArKWdrGwk1PSatM5jFyhRErE3GE
 c7znTyQJXgbE7976zG9Wv0Q17QmrghnmziPGs2mk0z4juXFDJJwdVvjGAHTBgzexPjcyDg5D
 v4Fb5fao/mheLyWjtbrHX47cglRcClT6WHeoM1LbO+TSjeK60l6Y8I9NYgJItQ/94wMz7+g1
 ijkBidwlQqu7VWaeF7iQi0yN9vSsWNX8CtT0doEZg3zhRDOoO+Hsc8iSnfAVeN6r7Y8kaclF
 KdtlgfpKq0ndwkrMg81NfHVxLGOvjz07e5XFyb6MjU5YbB6QAnFpo3tcgf1rXFcBSurr8ou5
 ban01qDE5YEQg1jCufQae6ukAzt7SRMxroqUhuaOMRXdWXt7JNud377gMgoLpxeMh7E3Dabi
 VqbWE9KuenXroYp29DVnqTY/ZyxGu5zExMCTWnW5Lq7LwfA+W+nzdMSWeqEZ2mFBmj15L+jd
 aNeyPSlaK8Lm1NDsoxdFbd3zP1hu4uz9uEClgk9RSfFdVWmDL9kM0Kq58gXu/0f3KJdtCu3R
 lmLpotQN4KWNZ63C1UWPgckMLiOjKlGhjnI4P0pC0zm/ysrrqGfWEBfMhTQ2ixQKLx5bNEsz
 es74ZNE7gW+jlwhM8qcjzAS/GOJdyRSX6Iiv5AcIYnqlgt0lQ0SPc2CUnf7sMOVdtFBEkg2O
 TvF1qPNioNVylfGb3duR2PG2vBQhMhWtR1HpLPYy49lRjYRaicL4SBs
IronPort-HdrOrdr: A9a23:ZrDgRa4COcMbFFQ6UwPXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-IronPort-AV: E=Sophos;i="5.87,170,1631592000"; 
   d="scan'208";a="55727308"
Date: Thu, 21 Oct 2021 14:54:52 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 42/51] build: grab common EFI source files in arch
 specific dir
Message-ID: <YXFxLJ/F9uXtTuaH@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-43-anthony.perard@citrix.com>
 <43684fcc-f6ca-86f2-9fb1-d3d5d9dbc20d@suse.com>
 <YWmse5Sv2SFyRMdj@perard>
 <fd11108b-db66-3c0e-9a7e-a5e30b0b5b1f@suse.com>
 <YXFJD3LlFfbivA6Z@perard>
 <938f059d-9d08-75bd-01ee-5d442a5e9961@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <938f059d-9d08-75bd-01ee-5d442a5e9961@suse.com>

On Thu, Oct 21, 2021 at 01:24:27PM +0200, Jan Beulich wrote:
> On 21.10.2021 13:03, Anthony PERARD wrote:
> > On Mon, Oct 18, 2021 at 10:48:26AM +0200, Jan Beulich wrote:
> >> On 15.10.2021 18:29, Anthony PERARD wrote:
> >>> On Thu, Oct 14, 2021 at 10:51:44AM +0200, Jan Beulich wrote:
> >>>> On 24.08.2021 12:50, Anthony PERARD wrote:
> >>>>>  obj-y += boot.init.o pe.init.o ebmalloc.o runtime.o
> >>>>>  obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
> >>>>> +
> >>>>> +$(obj)/%.c: common/efi/%.c
> >>>>> +	$(Q)cp -f $< $@
> >>>>
> >>>> In case both trees are on the same file system, trying to hardlink first
> >>>> would seem desirable. When copying, I think you should also pass -p.
> >>>
> >>> I don't know if doing an hardlink is a good thing to do, I'm not sure of
> >>> the kind of issue this could bring. As for -p, I don't think it's a good
> >>> idea to copy the mode, ownership, and timestamps of the source file, I'd
> >>> rather have the timestamps that Make expect, e.i. "now".
> >>
> >> Why would "now" be correct (or expected) in any way? The cloned file is no
> >> different from the original. Nevertheless I agree that -p is not ideal;
> >> it's just that the more fine grained option to preserve just the timestamp
> >> is non-standard afaik. You could try that first and fall back to -p ...
> >> Otherwise, failing hard linking and using "cp -p", I'm afraid I'd prefer
> >> symlinking despite the arguments against it that you name in the
> >> description.
> > 
> > I guess I'm missing something, is there a reason to keep/copy the
> > timestamps of the original files?
> 
> Avoidance of confusion is my main aim here. I certainly would be puzzled
> to see what looks like a source file to have a time stamp much newer than
> expected.

So, there isn't really anything to do with the timestamps :-). I guess
we could keep using symbolic links, but force update the link at every
build.

I've tried that:
    $(obj)/%.c: $(abs_srctree)/common/efi/%.c FORCE
        $(Q)ln -nsf $< $@

and make seems happy. The link command run every time (due to adding
FORCE), but the `CC` command isn't, so that seems good. The recipe that
would run the `CC` command check if the prerequisite are newer than the
target using $? so it doesn't matter if the rule that update the source
file as run or not.

Thanks,

-- 
Anthony PERARD


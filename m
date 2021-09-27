Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507C041A01A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 22:27:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197159.350123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUxCN-0005B0-Fw; Mon, 27 Sep 2021 20:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197159.350123; Mon, 27 Sep 2021 20:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUxCN-00059C-BY; Mon, 27 Sep 2021 20:26:03 +0000
Received: by outflank-mailman (input) for mailman id 197159;
 Mon, 27 Sep 2021 20:26:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ytfr=OR=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1mUxCM-000596-1O
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 20:26:02 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a22acf48-6271-4cbd-9d38-62eb13b31ca8;
 Mon, 27 Sep 2021 20:26:00 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.94.2 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1mUxCI-000Olf-Vj; Mon, 27 Sep 2021 20:25:59 +0000
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
X-Inumbo-ID: a22acf48-6271-4cbd-9d38-62eb13b31ca8
Date: Mon, 27 Sep 2021 21:25:58 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: sh_unshadow_for_p2m_change() vs p2m_set_entry()
Message-ID: <YVIo1sR283L/MUeN@deinos.phlegethon.org>
References: <ae8b6cf1-d1ae-8a55-7b88-7ef24db0c554@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <ae8b6cf1-d1ae-8a55-7b88-7ef24db0c554@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

Hi,

At 13:31 +0200 on 24 Sep (1632490304), Jan Beulich wrote:
> I'm afraid you're still my best guess to hopefully get an insight
> on issues like this one.

I'm now very rusty on all this but I'll do my best!  I suspect I'll
just be following you through the code.

> While doing IOMMU superpage work I was, just in the background,
> considering in how far the superpage re-coalescing to be used there
> couldn't be re-used for P2M / EPT / NPT. Which got me to think about
> shadow mode's using of p2m-pt.c: That's purely software use of the
> tables in that case, isn't it? In which case hardware support for
> superpages shouldn't matter at all.

ISTR at the time we used the same table for p2m and NPT.
If that's gone away, then yes, we could have superpages
in the p2m without caring about hardware support.

> The only place where I could spot that P2M superpages would actually
> make a difference to shadow code was sh_unshadow_for_p2m_change().
> That one appears to have been dealing with 2M pages (more below)
> already at the time of 0ca1669871f8a ("P2M: check whether hap mode
> is enabled before using 2mb pages"), so I wonder what "potential
> errors when hap is disabled" this commit's description might be
> talking about.

Sorry, I have no idea what the "potential errors" were here. :(

> As to sh_unshadow_for_p2m_change()'s readiness for at least 2Mb
> pages: The 4k page handling there differs from the 2M one primarily
> in the p2m type checks: "p2m_is_valid(...) || p2m_is_grant(...)"
> vs "p2m_is_valid(...)" plus later "!p2m_is_ram(...)", the first
> three acting on the type taken from the old PTE, while the latter
> acts on the type in the new (split) PTEs.

So I think the type tests on the old entry are correct - as you say,
p2m_is_grant() only applies to 4k entries and otherwise they're the
same.

> Shouldn't the exact same
> checks be used in both cases (less the p2m_is_grant() check which
> can't be true for superpages)? IOW isn't !p2m_is_ram() at least
> superfluous (and perhaps further redundant with the subsequent
> !mfn_eq(l1e_get_mfn(npte[i]), omfn))? Instead I'm missing an
> entry-is-present check, without which l1e_get_mfn(npte[i]) looks
> risky at best. Or is p2m_is_ram() considered a sufficient
> replacement, making assumptions on the behavior of a lot of other
> code?

AFAICT, p2m_is_ram(p2m_flags_to_type(l1e_get_flags(npte[i]))) implies
that npte[i] has a valid MFN in it, but I agree that it would be better
to check _PAGE_PRESENT.

And I think in general it would make sense to factor out the old->new
checks and make them the same between the L1 and L2.  I don't see
anything obviously wrong with the current code but the refactored code
would be more obviously right.

> The 2M logic also first checks _PAGE_PRESENT (and _PAGE_PSE), while
> the 4k logic appears to infer that the old page was present from
> p2m_is_{valid,grant}().

I think the p2m_type check is the right one (rather than
_PAGE_PRESENT), since that's the one that the p2m lookups will obey
when causing things to get shadowed.  But the extra _PAGE_PSE check
should stay.

> And isn't this 2M page handling code (because of the commit pointed
> at above) dead right now anyway? If not, where would P2M superpages
> come from?

Yep, that sounds right - p2m_set_entry still only sets 4k entries on
shadow domains, so I think this code is dead right now.  If you had
asked me I would not have remembered that was the case.

Cheers,

Tim.


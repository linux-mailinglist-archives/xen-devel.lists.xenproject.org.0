Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC4F6CA93C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 17:39:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515326.798058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgowU-0002XY-3B; Mon, 27 Mar 2023 15:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515326.798058; Mon, 27 Mar 2023 15:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgowU-0002U9-0E; Mon, 27 Mar 2023 15:39:30 +0000
Received: by outflank-mailman (input) for mailman id 515326;
 Mon, 27 Mar 2023 15:39:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UAss=7T=xen.org=tim@srs-se1.protection.inumbo.net>)
 id 1pgowS-0002Ty-Vb
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 15:39:28 +0000
Received: from deinos.phlegethon.org (deinos.phlegethon.org
 [2001:41d0:8:b1d7::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e6b0e86-ccb5-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 17:39:27 +0200 (CEST)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.94.2 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1pgowM-000P3Y-UM; Mon, 27 Mar 2023 15:39:22 +0000
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
X-Inumbo-ID: 8e6b0e86-ccb5-11ed-85db-49a42c6b2330
Date: Mon, 27 Mar 2023 16:39:22 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 07/16] x86/shadow: call sh_update_cr3() directly from
 sh_page_fault()
Message-ID: <20230327153922.GA96023@deinos.phlegethon.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <69304929-de84-04db-04f2-8faffc12ef0f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <69304929-de84-04db-04f2-8faffc12ef0f@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

Hi,

At 10:33 +0100 on 22 Mar (1679481226), Jan Beulich wrote:
> There's no need for an indirect call here, as the mode is invariant
> throughout the entire paging-locked region. All it takes to avoid it is
> to have a forward declaration of sh_update_cr3() in place.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I find this and the respective Win7 related comment suspicious: If we
> really need to "fix up" L3 entries "on demand", wouldn't we better retry
> the shadow_get_and_create_l1e() rather than exit? The spurious page
> fault that the guest observes can, after all, not be known to be non-
> fatal inside the guest. That's purely an OS policy.

I think it has to be non-fatal because it can happen on real hardware,
even if the hardware *does* fill the TLB here (which it is not
required to).

Filling just one sl3e sounds plausible, though we don't want to go
back to the idea of having L3 shadows on PAE!

> Furthermore the sh_update_cr3() will also invalidate L3 entries which
> were loaded successfully before, but invalidated by the guest
> afterwards. I strongly suspect that the described hardware behavior is
> _only_ to load previously not-present entries from the PDPT, but not
> purge ones already marked present.

Very likely, but we *are* allowed to forget old entries whenever we
want to, so this is at worst a performance problem.

> IOW I think sh_update_cr3() would
> need calling in an "incremental" mode here.

This would be the best way of updating just the one entry - but as far
as I can tell the existing code is correct so I wouldn't add any more
complexity unless we know that this path is causing perf problems.

> In any event emitting a TRC_SHADOW_DOMF_DYING trace record in this case
> looks wrong.

Yep.

> Beyond the "on demand" L3 entry creation I also can't see what guest
> actions could lead to the ASSERT() being inapplicable in the PAE case.
> The 3-level code in shadow_get_and_create_l2e() doesn't consult guest
> PDPTEs, and all other logic is similar to that for other modes.

The assert's not true here because the guest can push us down this
path by doing exactly what Win 7 does here - loading CR3 with a
missing L3E, then filling the L3E and causing a page fault that uses
the now-filled L3E.  (Or maybe that's not true any more; my mental
model of the pagetable walker code might be out of date)

Cheers,

Tim.



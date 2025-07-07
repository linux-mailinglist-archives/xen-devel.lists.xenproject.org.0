Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82498AFBDBF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 23:43:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035833.1408205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtc1-0002Eu-DP; Mon, 07 Jul 2025 21:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035833.1408205; Mon, 07 Jul 2025 21:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtc1-0002CG-Ao; Mon, 07 Jul 2025 21:42:57 +0000
Received: by outflank-mailman (input) for mailman id 1035833;
 Mon, 07 Jul 2025 21:42:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uYtc0-0002CA-8E
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 21:42:56 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 554661c9-5b7b-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 23:42:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2B0CD450F9;
 Mon,  7 Jul 2025 21:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A2DC4CEE3;
 Mon,  7 Jul 2025 21:42:49 +0000 (UTC)
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
X-Inumbo-ID: 554661c9-5b7b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751924571;
	bh=DJIJSigzXhiVdlnSeXqN7m7FApJHSspY14Bw9ASlHm0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G4BytU0sM8TV0B5TuN2G6HFsYVlhjW3MdByH83I0l6xtSvDxia4vdLhWp+f4Gj/r0
	 pLWaTwtr1q6j57t5xrPDh++TqysUIf6j7OoWawNB9qwk67mOXDGM6ojdaArZ3UiNUl
	 QZA1wDt7v3p4QsvPJB/pf2ve4wxKkiuDUOPneIln1rbg7YmDg1AldfX1IXZAsRcuth
	 rK71L3eImb9lp9G3vL9QCHBT3mlhpXrj4DeaYp7MfbZqdUDn1lrGJ//kCIjHX3xqO+
	 Go1BAcbzOhiPKJL9RONJZJbOHN5lZCg8x+89mFodFqJQ57CySkvnC35ABSiL09mmKS
	 4ROGuZMOVBdoA==
Date: Mon, 7 Jul 2025 14:42:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Sergiy Kibrik <sergiy_kibrik@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH] xen/flask: estimate max sidtable size
In-Reply-To: <65b5f767-5ed3-4a7d-a471-4e3f07a354e7@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507071439120.605088@ubuntu-linux-20-04-desktop>
References: <20250630085559.554334-1-Sergiy_Kibrik@epam.com> <d562251a-a6ec-4e2f-b1f7-dd87a97d4005@suse.com> <71ca3126-d311-4ed2-8d6d-3ffcb90a222e@epam.com> <65b5f767-5ed3-4a7d-a471-4e3f07a354e7@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Jul 2025, Jan Beulich wrote:
> On 04.07.2025 12:10, Sergiy Kibrik wrote:
> > 01.07.25 13:42, Jan Beulich:
> >> On 30.06.2025 10:55, Sergiy Kibrik wrote:
> >>> @@ -54,4 +54,7 @@ $(obj)/policy.bin: FORCE
> >>>   	        FLASK_BUILD_DIR=$(FLASK_BUILD_DIR) POLICY_FILENAME=$(POLICY_SRC)
> >>>   	cmp -s $(POLICY_SRC) $@ || cp $(POLICY_SRC) $@
> >>>   
> >>> +$(obj)/%/se_limits.h: $(obj)/policy.bin
> >>> +	$(srcdir)/policy/mkselim.sh $^ $@
> >>
> >> Hmm, that's using the built-in policy, isn't it? What if later another
> >> policy is loaded? Wouldn't it be possible to have ...
> >>
> >>> --- a/xen/xsm/flask/ss/sidtab.c
> >>> +++ b/xen/xsm/flask/ss/sidtab.c
> >>> @@ -13,6 +13,7 @@
> >>>   #include "flask.h"
> >>>   #include "security.h"
> >>>   #include "sidtab.h"
> >>> +#include "se_limits.h"
> >>>   
> >>>   #define SIDTAB_HASH(sid) ((sid) & SIDTAB_HASH_MASK)
> >>>   
> >>> @@ -228,7 +229,7 @@ int sidtab_context_to_sid(struct sidtab *s, struct context *context,
> >>>           if ( sid )
> >>>               goto unlock_out;
> >>>           /* No SID exists for the context.  Allocate a new one. */
> >>> -        if ( s->next_sid == UINT_MAX || s->shutdown )
> >>> +        if ( s->next_sid == SEPOL_SID_LIMIT || s->shutdown )
> >>
> >> ... more than this many SIDs? What if CONFIG_XSM_FLASK_POLICY isn't even set?
> >>
> > 
> > It's using a policy from tools/flask/policy, yes. But not a built-in 
> > policy, just reusing a bit of code from that code. The idea is that we 
> > can have CONFIG_XSM_FLASK_POLICY option disabled yet still be able to 
> > calculate SEPOL_SID_LIMIT.
> > 
> > As for loading another policy at runtime -- the calculated 
> > SEPOL_SID_LIMIT=384 for current master flask policy is still pretty big 
> > limit. From what I can see -- much less No. contexts are being used on a 
> > running system, because most of calculated combinations of 
> > user/role/type are not really usable (e.g. contexts with xen_t or 
> > xenboot_t types and user_1 user are not expected etc). So there should 
> > be enough room even for more complex custom policies.
> 
> But still there could be odd ones. Imo such a static limit can then only be
> introduced via Kconfig option.

I was going to suggest the same approach as Jan. While I appreciate
Sergiy's effort to calculate the limit automatically using mkselim.sh,
I think that for our purposes, a simple Kconfig option specifying the
maximum allocation limit is sufficient.

This type of limit is typically chosen before moving into production,
after extensive experimentation, measurements, and certifications.
Therefore, it is not necessary to make it easier for users to configure
it optimally based on policy.  However, we do need a way to enforce a
limit, and a straightforward Kconfig option would be adequate for that.


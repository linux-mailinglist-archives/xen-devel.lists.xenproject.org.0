Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9FC9445A8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 09:40:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769396.1180268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZQPJ-0000HW-7p; Thu, 01 Aug 2024 07:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769396.1180268; Thu, 01 Aug 2024 07:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZQPJ-0000FI-4b; Thu, 01 Aug 2024 07:39:29 +0000
Received: by outflank-mailman (input) for mailman id 769396;
 Thu, 01 Aug 2024 07:39:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5eeJ=PA=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sZQPH-0000F7-99
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 07:39:27 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c3f7a7c-4fd9-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 09:39:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id DE61BA0374;
 Thu,  1 Aug 2024 09:39:23 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4vuD59QVvSF; Thu,  1 Aug 2024 09:39:23 +0200 (CEST)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id B59B5A0371;
 Thu,  1 Aug 2024 09:39:23 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sZQPD-00000000XVx-1JbL; Thu, 01 Aug 2024 09:39:23 +0200
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
X-Inumbo-ID: 2c3f7a7c-4fd9-11ef-bc02-fd08da9f4363
Date: Thu, 1 Aug 2024 09:39:23 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 2/3] mini-os: mm: switch need_pgt() to use walk_pt()
Message-ID: <20240801073923.32s6i4enoq6qafa5@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
References: <20240731130026.8467-1-jgross@suse.com>
 <20240731130026.8467-3-jgross@suse.com>
 <20240731212752.zd5njpd7kgoc433d@begin>
 <8fef9511-c5d0-49a9-a800-6087f03b3199@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fef9511-c5d0-49a9-a800-6087f03b3199@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Jürgen Groß, le jeu. 01 août 2024 07:56:36 +0200, a ecrit:
> On 31.07.24 23:27, Samuel Thibault wrote:
> > Hello,
> > 
> > Juergen Gross, le mer. 31 juil. 2024 15:00:25 +0200, a ecrit:
> > > -pgentry_t *need_pgt(unsigned long va)
> > > +static int need_pgt_func(unsigned long va, unsigned int lvl, bool is_leaf,
> > > +                         pgentry_t *pte, void *par)
> > >   {
> > [...]
> > > +    if ( lvl == L1_FRAME || (*pte & _PAGE_PRESENT) )
> > 
> > Did you mean (*pte & _PAGE_PSE)?
> 
> No.

I don't understand: it doesn't map what I know of need_pgt and what the
existing code is doing.

AIKI, the point of need_pgt is to make sure there is a L1 page table
entry for a VA, and return it, so the caller can put in it at pte for a
mfn or such. In the case a PSE is met, we don't go further, and it's up
to the caller to decide what it wants to do (most often it's actually
unexpected and asserted out). In both cases, the PRESENT bit of the
pte whose address is returned does not matter, most often it's the
caller which will set it.

The existing code for need_pgt thus always adds page table entries down
to level1 (except if _PAGE_PSE is met, i.e. a large page was already set
up): the termination was:

[... walk down to level 2]
-    if ( tab[offset] & _PAGE_PSE )
-        return &tab[offset];
[... walk down to level 1]
-    return &tab[offset];

i.e. we always return either a PSE L2 entry, or an L1 entry, and never
above (while keeping sure that the entries above are present).

> I want to bail out if the PTE does not require a page table to be
> added to it. This is the case if the PTE is valid

There being an entry at e.g. level 3 (without PSE) does not mean that
we have an entry at level 1 for the VA, so we have to continue adding
levels for the VA in the sparse page table tree.

> An invalid PTE with PSE set is still invalid, so the PSE bit has no
> real meaning.

Mmm, I don't think we ever create entries with PSE but not PRESENT (i.e.
we don't "plan" to have PSE entries), but even if we did, if we "plan"
to have PSE entries, we should return that entry, and it's up to the
caller to fill it (and make it PRESENT)

Samuel


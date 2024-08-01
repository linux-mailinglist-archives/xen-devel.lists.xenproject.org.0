Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0509F944922
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 12:13:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769521.1180426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZSnR-0002Ss-E5; Thu, 01 Aug 2024 10:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769521.1180426; Thu, 01 Aug 2024 10:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZSnR-0002P4-BJ; Thu, 01 Aug 2024 10:12:33 +0000
Received: by outflank-mailman (input) for mailman id 769521;
 Thu, 01 Aug 2024 10:12:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5eeJ=PA=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sZSnQ-0002Oc-H0
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 10:12:32 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f9d9f25-4fee-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 12:12:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 003CBA037E;
 Thu,  1 Aug 2024 12:12:30 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WJolNPPUTo0l; Thu,  1 Aug 2024 12:12:29 +0200 (CEST)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id C05F4A0379;
 Thu,  1 Aug 2024 12:12:29 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sZSnN-00000001izo-0gSX; Thu, 01 Aug 2024 12:12:29 +0200
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
X-Inumbo-ID: 8f9d9f25-4fee-11ef-bc02-fd08da9f4363
Date: Thu, 1 Aug 2024 12:12:29 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 2/3] mini-os: mm: switch need_pgt() to use walk_pt()
Message-ID: <20240801101229.5htyrethv55xmh3x@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
References: <20240731130026.8467-1-jgross@suse.com>
 <20240731130026.8467-3-jgross@suse.com>
 <20240731212752.zd5njpd7kgoc433d@begin>
 <8fef9511-c5d0-49a9-a800-6087f03b3199@suse.com>
 <20240801073923.32s6i4enoq6qafa5@begin>
 <7fa3bca4-1ef4-4c95-bf92-de87c7c8fc96@suse.com>
 <20240801091535.rpspqy2k73tjy6ms@begin>
 <894c9552-ef2b-4255-b429-ad3df4f5c0cc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <894c9552-ef2b-4255-b429-ad3df4f5c0cc@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Jürgen Groß, le jeu. 01 août 2024 11:25:31 +0200, a ecrit:
> On 01.08.24 11:15, Samuel Thibault wrote:
> > Jürgen Groß, le jeu. 01 août 2024 10:13:07 +0200, a ecrit:
> > > On 01.08.24 09:39, Samuel Thibault wrote:
> > > > Jürgen Groß, le jeu. 01 août 2024 07:56:36 +0200, a ecrit:
> > > > > On 31.07.24 23:27, Samuel Thibault wrote:
> > > > > > Hello,
> > > > > > 
> > > > > > Juergen Gross, le mer. 31 juil. 2024 15:00:25 +0200, a ecrit:
> > > > > > > -pgentry_t *need_pgt(unsigned long va)
> > > > > > > +static int need_pgt_func(unsigned long va, unsigned int lvl, bool is_leaf,
> > > > > > > +                         pgentry_t *pte, void *par)
> > > > > > >     {
> > > > > > [...]
> > > > > > > +    if ( lvl == L1_FRAME || (*pte & _PAGE_PRESENT) )
> > > > > > 
> > > > > > Did you mean (*pte & _PAGE_PSE)?
> > > > > 
> > > > > No.
> > > > 
> > > > I don't understand: it doesn't map what I know of need_pgt and what the
> > > > existing code is doing.
> > > > 
> > > > AIKI, the point of need_pgt is to make sure there is a L1 page table
> > > > entry for a VA, and return it, so the caller can put in it at pte for a
> > > > mfn or such. In the case a PSE is met, we don't go further, and it's up
> > > > to the caller to decide what it wants to do (most often it's actually
> > > > unexpected and asserted out). In both cases, the PRESENT bit of the
> > > > pte whose address is returned does not matter, most often it's the
> > > > caller which will set it.
> > > > 
> > > > The existing code for need_pgt thus always adds page table entries down
> > > > to level1 (except if _PAGE_PSE is met, i.e. a large page was already set
> > > > up): the termination was:
> > > > 
> > > > [... walk down to level 2]
> > > 
> > > You have omitted:
> > > 
> > >         ASSERT(tab[offset] & _PAGE_PRESENT);
> > 
> > Right, that confirms that we never set PSE without PRESENT. We probably
> > want to keep that assertion in the PSE case.
> 
> Hmm, I'm not sure.
> 
> The hardware allows to have any bit set in the PTE when PRESENT isn't set.
> It will never look at any other bit in this case. Why should the software
> require something different here?

To document&check what we expect to be producing.

> > But we still want to continue walking down to level1 (or pse) even when
> > L4/L3/L2 have PRESENT.
> 
> We do that. In this case the is_leaf flag won't be set and need_pgt_func()
> will return early with the return value 0, meaning that the walk will be
> continued.

Ah, I missed that indeed, I had not integrated that is_leaf is 1 also in
the case of missing level>1 page. It'd probably be useful to emphasize
in patch 1:

+ * is_leaf: true if PTE doesn't address another page table

it should explicitly say (L1 PTE, or PSE, or not present yet)

The *pte & _PAGE_PRESENT test alone still looks surprising to the
reader, though: we don't return because the page is present, but because
we reached the last possible level that we could fill, which is either
L1, or an existing PSE. It is true that when is_leaf is 1, if it's not
L1 but present, it's necessarily a PSE, but it's clearer to the reader
to write what we meant: L1 or PSE, so something like:

if ( lvl == L1_FRAME || (*pte & _PAGE_PRESENT) ) {
    assert ( lvl == L1_FRAME || (*pte & _PAGE_PSE) ); // we are at last possible level
    [...]
}

Samuel


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8BB3214F9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 12:23:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87978.165281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE9Ip-0007ni-6v; Mon, 22 Feb 2021 11:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87978.165281; Mon, 22 Feb 2021 11:22:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE9Ip-0007nJ-3m; Mon, 22 Feb 2021 11:22:59 +0000
Received: by outflank-mailman (input) for mailman id 87978;
 Mon, 22 Feb 2021 11:22:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE9In-0007nE-L0
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:22:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE9In-0006uF-KC
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:22:57 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE9In-0006nr-IU
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:22:57 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lE9Ih-0000nd-BY; Mon, 22 Feb 2021 11:22:51 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=h3LCZfk4f4WOJlw4VQ/w8mDw1s5Kve0vRma/C/jPGVU=; b=hwpfDDO6d9ztoNTCEWdwz6kNXy
	ayMDbw+h/ckOR9/BE1RKa+cD09EEE3DodeSPs9q7FrWeluDfRSLXmML+DW/t/MVmlHjkjU54N3ihd
	KM4bXUbzJgsOWYN//qh/QU8Pp6pnhrPD3UmUMYRfQB3LZG2fvemsHxpUWI8DRp2ijQfM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24627.37898.442930.913809@mariner.uk.xensource.com>
Date: Mon, 22 Feb 2021 11:22:50 +0000
To: Jan Beulich <jbeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Kevin Tian <kevin.tian@intel.com>,
    "Julien  Grall" <julien@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15 v2] VMX: use a single, global APIC access page [and 1 more messages]
In-Reply-To: <YDOC2ACTf0bmryG1@Air-de-Roger>,
	<b5759150-e028-ac68-b8b5-8abcea02b5d9@suse.com>
References: <a895386d-db14-2743-d8f9-09f9509a510a@suse.com>
	<dcada8be-a91d-87f0-c579-30f3c7e3607e@suse.com>
	<24623.61403.440917.434@mariner.uk.xensource.com>
	<dfdd4440-3c37-8cb5-b7d3-a86b7c697b2e@suse.com>
	<8B51B3E9-901A-491D-A54E-1F67641D03F0@citrix.com>
	<b5759150-e028-ac68-b8b5-8abcea02b5d9@suse.com>
	<YDOC2ACTf0bmryG1@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH for-4.15 v2] VMX: use a single, global APIC access page"):
> On Mon, Feb 22, 2021 at 08:51:59AM +0100, Jan Beulich wrote:
> > If anything, then the latter, but largely neither afaict - there's no
> > change in this regard here at all as far as the guest could affect
> > behavior, due to the page getting inserted as p2m_mmio_direct, and
> > guest_remove_page() having
> > 
> >     if ( p2mt == p2m_mmio_direct )
> >     {
> >         rc = clear_mmio_p2m_entry(d, gmfn, mfn, PAGE_ORDER_4K);
> >         goto out_put_gfn;
> >     }
> > 
> > before any refcounting logic is reached. The removal of interaction
> > is because now the page doesn't get associated with a domain (and
> > hence doesn't become subject to refcounting) at all.
> > 
> > The risk of the change stems from going from using a per-domain
> > page to using a single, system-wide one, which indeed was the subject
> > of v1 discussion. In any event the consideration towards splitting
> > the change would cover either concern. Perhaps I should really do so
> > and submit as v3 ...
> 
> I agree it would be less risky to keep using a per-domain page, and
> switch to a global one after the release. From the discussion in v1 I
> don't think we where able to spot any specific issues apart from
> guests possibly being able to access shared data in this page from
> passthrough devices. I would at least feel more confortable with
> that approach given the point we are in the release process.

Thanks to Roger and Jan for these comments which were very helpful to
me.

Jan Beulich writes ("Re: [PATCH for-4.15 v2] VMX: use a single, global APIC access page"):
> Hmm, yes. The change wanted making anyway, for a long time imo. Hence
> when putting together the patch I forgot to call out that as a side
> effect it addresses a memory leak, as reported by Julien. With the
> splitting of the two changes that'll be necessarily mentioned. I'm
> about to submit v3.

Great, I see it now.

Thanks,
Ian.


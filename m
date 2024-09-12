Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE65976624
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 11:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797201.1207071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogYv-0000uS-6u; Thu, 12 Sep 2024 09:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797201.1207071; Thu, 12 Sep 2024 09:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogYv-0000s4-49; Thu, 12 Sep 2024 09:56:29 +0000
Received: by outflank-mailman (input) for mailman id 797201;
 Thu, 12 Sep 2024 09:56:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JY3O=QK=bombadil.srs.infradead.org=BATV+78b913441a3cb29668e4+7690+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sogYr-0000qG-Sf
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 09:56:27 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44ee0a7a-70ed-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 11:56:24 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sogYn-0000000Cc97-3iuE;
 Thu, 12 Sep 2024 09:56:21 +0000
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
X-Inumbo-ID: 44ee0a7a-70ed-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Af3UiaSTtvVMACXrK0RDN/VWI8LBjfOwA+0RWsQXywA=; b=fHMCmL+pKkST2F0FEKk/v7OOnu
	Bm48g9MMpH1gSWUkkXNGRh5k3O+rIGF2s8OAE2hKBo0g8airQVuEy61YSkhOuZuQyvgFYNsDHMYGv
	2p0hR4owi+Z2Qif4yYLar44mrEkdEVxExkPJAd/C9f37trPokE8zd1QPQ8udfLjkUEwLLxAqvP2rl
	/Qde/eks7Q581sLcIVgyMvx2sjeLbAdoAqAsz6I5zzkyYzIk2hDd6tqE4uoHsj7Ak6Q3OZ2PYMOB0
	DL9zBeN+bv1kYjMtr7LaESfVxQSOp+nnDXOR0br8XurQdFgVuvEvbrDlJ43y7DqLwDQvhF6ccwziq
	UoMLHNPA==;
Date: Thu, 12 Sep 2024 02:56:21 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Takashi Iwai <tiwai@suse.de>, Ariadne Conill <ariadne@ariadne.space>,
	xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org,
	stable@vger.kernel.org, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
Message-ID: <ZuK6xcmAE4sngFqk@infradead.org>
References: <20240906184209.25423-1-ariadne@ariadne.space>
 <877cbnewib.wl-tiwai@suse.de>
 <9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Sat, Sep 07, 2024 at 11:38:50AM +0100, Andrew Cooper wrote:
> Individual subsystems ought not to know or care about XENPV; it's a
> layering violation.

Agreed.

> If the main APIs don't behave properly, then it probably means we've got
> a bug at a lower level (e.g. Xen SWIOTLB is a constant source of fun)
> which is probably affecting other subsystems too.
> 
> I think we need to re-analyse the original bug.  Right now, the
> behaviour resulting from 53466ebde is worse than what it was trying to fix.

53466ebde looks bogus to me, and the commit message doesn't even
try to explain what bad behavior it works around.  I'd also like to
state once again that if you think something is broken about dma
allocation or mapping helpers please Cc me and the iommu list.

Most of the time it's actually the drivers doing something invalid, but
sometimes it is a core dma layer bug or something that needs a proper
API.

Also while looking at the above commit I noticed the broken fallback
code in snd_dma_noncontig_alloc - get_dma_ops is not for driver use,
and starting with the code queued up for 6.12 will also return NULL
when using dma-iommu for example.


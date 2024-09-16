Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB15E979C1D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 09:37:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799249.1209169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6IO-0003yd-4p; Mon, 16 Sep 2024 07:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799249.1209169; Mon, 16 Sep 2024 07:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6IO-0003uh-12; Mon, 16 Sep 2024 07:37:16 +0000
Received: by outflank-mailman (input) for mailman id 799249;
 Mon, 16 Sep 2024 07:37:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ug6v=QO=bombadil.srs.infradead.org=BATV+500305f64adcbfb43b9e+7694+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sq6IL-0003ub-R8
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 07:37:13 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ad4996a-73fe-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 09:37:10 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1sq6IF-00000003Kd9-3lbI; Mon, 16 Sep 2024 07:37:07 +0000
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
X-Inumbo-ID: 7ad4996a-73fe-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gju9XBeCOro1y93nA5waVyVrbX5nWYeDFXoNrraZEsk=; b=jazc38fw1Kh+LNx9gSWOMO22Uy
	MM3h6EiwAwxcdUMkuErVz1aregLWF5DHESZ+q9zuakvOu/jVvxmkNXbgYIPq7xz4yL5JtTCeEabZ+
	hWeE0eWeI4rydIgD43gTdxHDw/fo7eJQ1p0Sr7Ffv6Xog6cr13f0lkpZAzn8gk0mVVAp4wmGeV6NW
	hsl3XsG/NwVC2d8ZTy582+ZkpBX6fr6epOnyKhKOmwNCIMgLDxlLwEsKlVJuEXtBl0ebNvLNyz1Pm
	ECbYkBWhDHZr82ysQtk5zKsUhVg3OGPYilMFKfj7g19a3Yb8MogwJI8BT5ZrYRjRxiStmsYmGGzUd
	28lNN+QQ==;
Date: Mon, 16 Sep 2024 00:37:07 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Christoph Hellwig <hch@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ariadne Conill <ariadne@ariadne.space>,
	xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org,
	stable@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
Message-ID: <ZufgI6gw1kA8v4OD@infradead.org>
References: <20240906184209.25423-1-ariadne@ariadne.space>
 <877cbnewib.wl-tiwai@suse.de>
 <9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
 <ZuK6xcmAE4sngFqk@infradead.org>
 <874j6g9ifp.wl-tiwai@suse.de>
 <ZufdOjFCdqQQX7tz@infradead.org>
 <87wmjc8398.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmjc8398.wl-tiwai@suse.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Sep 16, 2024 at 09:30:11AM +0200, Takashi Iwai wrote:
> On Mon, 16 Sep 2024 09:24:42 +0200,
> Christoph Hellwig wrote:
> > 
> > On Mon, Sep 16, 2024 at 09:16:58AM +0200, Takashi Iwai wrote:
> > > Yes, all those are really ugly hacks and have been already removed for
> > > 6.12.  Let's hope everything works as expected with it.
> > 
> > The code currently in linux-next will not work as explained in my
> > previous mail, because it tries to side step the DMA API and abuses
> > get_dma_ops in an unsupported way.
> 
> Those should have been removed since the last week.
> Could you check the today's linux-next tree?

Ok, looks like the Thursday updates fix the dma_get_ops abuse.

They introduce new bugs at least for architectures with virtuall
indexed caches by combining vmap and dma mappings without
mainintaining the cache coherency using the proper helpers.

What confuses my about this is the need to set the DMAable memory
to write combinable.  How does that improve things over the default
writeback cached memory on x86?  We could trivially add support for
WC mappings for cache coherent DMA, but someone needs to explain
how that actually makes sense first.


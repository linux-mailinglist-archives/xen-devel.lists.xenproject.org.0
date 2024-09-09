Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B85697231B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 22:03:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794852.1203863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snkb6-0005UV-MD; Mon, 09 Sep 2024 20:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794852.1203863; Mon, 09 Sep 2024 20:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snkb6-0005S1-JZ; Mon, 09 Sep 2024 20:02:52 +0000
Received: by outflank-mailman (input) for mailman id 794852;
 Mon, 09 Sep 2024 20:02:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FUn8=QH=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1snkb4-0005Rv-QH
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 20:02:50 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7aa5bc83-6ee6-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 22:02:46 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 489K2B7q017432
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 9 Sep 2024 16:02:17 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 489K28xU017431;
 Mon, 9 Sep 2024 13:02:08 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 7aa5bc83-6ee6-11ef-a0b5-8be0dac302b0
Date: Mon, 9 Sep 2024 13:02:08 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Takashi Iwai <tiwai@suse.de>, Ariadne Conill <ariadne@ariadne.space>,
        xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org,
        stable@vger.kernel.org, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
Message-ID: <Zt9UQJcYT58LtuRV@mattapan.m5p.com>
References: <20240906184209.25423-1-ariadne@ariadne.space>
 <877cbnewib.wl-tiwai@suse.de>
 <9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
X-Spam-Status: No, score=0.3 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Sat, Sep 07, 2024 at 11:38:50AM +0100, Andrew Cooper wrote:
> On 07/09/2024 8:46 am, Takashi Iwai wrote:
> > On Fri, 06 Sep 2024 20:42:09 +0200,
> > Ariadne Conill wrote:
> >> This patch attempted to work around a DMA issue involving Xen, but
> >> causes subtle kernel memory corruption.
> >>
> >> When I brought up this patch in the XenDevel matrix channel, I was
> >> told that it had been requested by the Qubes OS developers because
> >> they were trying to fix an issue where the sound stack would fail
> >> after a few hours of uptime.  They wound up disabling SG buffering
> >> entirely instead as a workaround.
> >>
> >> Accordingly, I propose that we should revert this workaround patch,
> >> since it causes kernel memory corruption and that the ALSA and Xen
> >> communities should collaborate on fixing the underlying problem in
> >> such a way that SG buffering works correctly under Xen.
> >>
> >> This reverts commit 53466ebdec614f915c691809b0861acecb941e30.
> >>
> >> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
> >> Cc: stable@vger.kernel.org
> >> Cc: xen-devel@lists.xenproject.org
> >> Cc: alsa-devel@alsa-project.org
> >> Cc: Takashi Iwai <tiwai@suse.de>
> > The relevant code has been largely rewritten for 6.12, so please check
> > the behavior with sound.git tree for-next branch.  I guess the same
> > issue should happen as the Xen workaround was kept and applied there,
> > too, but it has to be checked at first.
> >
> > If the issue is persistent with there, the fix for 6.12 code would be
> > rather much simpler like the blow.
> >
> >
> > thanks,
> >
> > Takashi
> >
> > --- a/sound/core/memalloc.c
> > +++ b/sound/core/memalloc.c
> > @@ -793,9 +793,6 @@ static void *snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
> >  	int type = dmab->dev.type;
> >  	void *p;
> >  
> > -	if (cpu_feature_enabled(X86_FEATURE_XENPV))
> > -		return snd_dma_sg_fallback_alloc(dmab, size);
> > -
> >  	/* try the standard DMA API allocation at first */
> >  	if (type == SNDRV_DMA_TYPE_DEV_WC_SG)
> >  		dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC;
> >
> >
> 
> Individual subsystems ought not to know or care about XENPV; it's a
> layering violation.
> 
> If the main APIs don't behave properly, then it probably means we've got
> a bug at a lower level (e.g. Xen SWIOTLB is a constant source of fun)
> which is probably affecting other subsystems too.

This is a big problem.  Debian bug #988477 (https://bugs.debian.org/988477)
showed up in May 2021.  While some characteristics are quite different,
the time when it was first reported is similar to the above and it is
also likely a DMA bug with Xen.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




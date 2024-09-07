Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 318489701C3
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2024 12:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792193.1202178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smt6K-0000Ru-HI; Sat, 07 Sep 2024 10:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792193.1202178; Sat, 07 Sep 2024 10:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smt6K-0000Oi-E4; Sat, 07 Sep 2024 10:55:32 +0000
Received: by outflank-mailman (input) for mailman id 792193;
 Sat, 07 Sep 2024 10:55:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=THQi=QF=suse.de=tiwai@srs-se1.protection.inumbo.net>)
 id 1smt6J-0000Oc-2C
 for xen-devel@lists.xenproject.org; Sat, 07 Sep 2024 10:55:31 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1d41a4f-6d07-11ef-a0b4-8be0dac302b0;
 Sat, 07 Sep 2024 12:55:29 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C931A1FB7A;
 Sat,  7 Sep 2024 10:55:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9346313A88;
 Sat,  7 Sep 2024 10:55:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pmgxIh8x3GYLYwAAD6G6ig
 (envelope-from <tiwai@suse.de>); Sat, 07 Sep 2024 10:55:27 +0000
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
X-Inumbo-ID: b1d41a4f-6d07-11ef-a0b4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725706528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kGYkFCW8YLUr3Yi25G/nJbGlw9LIUatgsK25HIxflZI=;
	b=RJK47sd7zkf6hUr5ShHdbL3lJdYzlVv7BPrfjhDHPJdvlb04kV8w/K7V6V4O6wSOsKlwuj
	h2C3k9zKyqyaceEGCjQP+sTDFG2qd1UNz4kqfORcyTtoHjCSVzTAwlylqmZhARg1y4aiIl
	t76uwz2pkObmoUGmn+UIV+RDIK3wVoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725706528;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kGYkFCW8YLUr3Yi25G/nJbGlw9LIUatgsK25HIxflZI=;
	b=VfHOoab+v8loTkqQUhep6MfySWIXmXxPg9LesIJZ2dxeJ/3+WLmzlutjI2AE3vAzs1AzJl
	fwwehpzQZu8QlMCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725706527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kGYkFCW8YLUr3Yi25G/nJbGlw9LIUatgsK25HIxflZI=;
	b=EOtE0KQQgjllBW/5YNvtksWFiKUhmpTE9LdgMvI8SvIaTx0N/ATtT6p5wKYJDWAWAoTn2Y
	otq7dDcnni0v+ifwcYhqOkk4CQUtpx6u95zfY2FQc0UNwI3gHjJ0Ku7xCjs+uzpg04esCf
	clCAZsSedOTX0a8HKDrZ/d6gQTPe25w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725706527;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kGYkFCW8YLUr3Yi25G/nJbGlw9LIUatgsK25HIxflZI=;
	b=8bkgO4EjX2Hv5CLNFkuuvFhJkD85rBCwzGSHEwPIlJx8soa6lAmKmlJj7y5Y1+xckmhGBH
	JuEYu8x0/fMHVGAA==
Date: Sat, 07 Sep 2024 12:56:14 +0200
Message-ID: <87seubd969.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ariadne Conill <ariadne@ariadne.space>,
	xen-devel@lists.xenproject.org,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
In-Reply-To: <9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
References: <20240906184209.25423-1-ariadne@ariadne.space>
	<877cbnewib.wl-tiwai@suse.de>
	<9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.989];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,xenproject.org:email,alsa-project.org:email,ariadne.space:email,suse.de:email,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Sat, 07 Sep 2024 12:38:50 +0200,
Andrew Cooper wrote:
> 
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
> 
> I think we need to re-analyse the original bug.  Right now, the
> behaviour resulting from 53466ebde is worse than what it was trying to fix.

I agree with its hackishness and ugliness there; it was to fix the
regression at that time.  And, it definitely needs a cleaner solution.

But the fact is that this change was applied quite some time ago (over
a year).  It implies that it's no urgent regression that has to be
addressed in the next few days for 6.11-final.

Meanwhile we have largish code changes for 6.12, hence the revert
can't be applied.  So I'm asking testing the latest code for 6.12, and
work on there.


thanks,

Takashi


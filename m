Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C292C973608
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 13:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795423.1204784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyr6-0005gx-8v; Tue, 10 Sep 2024 11:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795423.1204784; Tue, 10 Sep 2024 11:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyr6-0005fR-5v; Tue, 10 Sep 2024 11:16:20 +0000
Received: by outflank-mailman (input) for mailman id 795423;
 Tue, 10 Sep 2024 11:16:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fHVP=QI=suse.de=tiwai@srs-se1.protection.inumbo.net>)
 id 1snyr5-0005fL-9i
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 11:16:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18fef520-6f66-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 13:16:17 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CF9C921A08;
 Tue, 10 Sep 2024 11:16:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B1E4D13A3A;
 Tue, 10 Sep 2024 11:16:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 292FKn8q4GYVcAAAD6G6ig
 (envelope-from <tiwai@suse.de>); Tue, 10 Sep 2024 11:16:15 +0000
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
X-Inumbo-ID: 18fef520-6f66-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725966976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aSWXduxUIFCZw/mkRONMzdnLrFbA8fCzPQXxmT6OpsU=;
	b=TdqiNgZ86ajx2uMv0jf8pmfq/to+dJxDzOmj+DL16/W1FwcAPyPUn55EelS1YNw+WcA1VO
	5QJ9mUbW1Jab5/SDgJZbMP9Tg9HuPmeB0pN5t5uO5/UYZZ551OKMUbSfQ3IS/euDB8b/xD
	9RdyBvNwygk7h3jpKKKR/u/q0uUinxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725966976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aSWXduxUIFCZw/mkRONMzdnLrFbA8fCzPQXxmT6OpsU=;
	b=+U/3fD1tt5keolWAGCrbos4u+0brW+rPrcMLVfzsJ+b9R/4FDyNQYAaAlbqZVQmJgkgAtW
	nykhKUuf5QmGzPDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IfqFcZCL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gAnalbD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725966975; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aSWXduxUIFCZw/mkRONMzdnLrFbA8fCzPQXxmT6OpsU=;
	b=IfqFcZCLNpTBDSXEI3ZGpkC6oziaeXai4r3R4UUZwuhw6PTI4m1qzRhakGhdUSIvKjwKUz
	dItR3o5WSM/MKZ4BvAD0neKvALqP27CEafIkoCG9Tj/Q+LnMAvY6DnPhLMwpEexSTZkHMH
	k2YZuhdErGL91J80ViH967OIguBkjrM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725966975;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aSWXduxUIFCZw/mkRONMzdnLrFbA8fCzPQXxmT6OpsU=;
	b=gAnalbD1MuJX8DTO2OIeYEZjw+xb37EeiBcx7KXWPF8YHCVeCjhvXfE+JfzoQ/HP109LJD
	/RjeiIq8JnPVRCCg==
Date: Tue, 10 Sep 2024 13:17:03 +0200
Message-ID: <8734m77o7k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ariadne Conill <ariadne@ariadne.space>,
	xen-devel@lists.xenproject.org,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
In-Reply-To: <Zt9UQJcYT58LtuRV@mattapan.m5p.com>
References: <20240906184209.25423-1-ariadne@ariadne.space>
	<877cbnewib.wl-tiwai@suse.de>
	<9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
	<Zt9UQJcYT58LtuRV@mattapan.m5p.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: CF9C921A08
X-Spam-Level: 
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TAGGED_RCPT(0.00)[xen];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.01
X-Spam-Flag: NO

On Mon, 09 Sep 2024 22:02:08 +0200,
Elliott Mitchell wrote:
> 
> On Sat, Sep 07, 2024 at 11:38:50AM +0100, Andrew Cooper wrote:
> > On 07/09/2024 8:46 am, Takashi Iwai wrote:
> > > On Fri, 06 Sep 2024 20:42:09 +0200,
> > > Ariadne Conill wrote:
> > >> This patch attempted to work around a DMA issue involving Xen, but
> > >> causes subtle kernel memory corruption.
> > >>
> > >> When I brought up this patch in the XenDevel matrix channel, I was
> > >> told that it had been requested by the Qubes OS developers because
> > >> they were trying to fix an issue where the sound stack would fail
> > >> after a few hours of uptime.  They wound up disabling SG buffering
> > >> entirely instead as a workaround.
> > >>
> > >> Accordingly, I propose that we should revert this workaround patch,
> > >> since it causes kernel memory corruption and that the ALSA and Xen
> > >> communities should collaborate on fixing the underlying problem in
> > >> such a way that SG buffering works correctly under Xen.
> > >>
> > >> This reverts commit 53466ebdec614f915c691809b0861acecb941e30.
> > >>
> > >> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
> > >> Cc: stable@vger.kernel.org
> > >> Cc: xen-devel@lists.xenproject.org
> > >> Cc: alsa-devel@alsa-project.org
> > >> Cc: Takashi Iwai <tiwai@suse.de>
> > > The relevant code has been largely rewritten for 6.12, so please check
> > > the behavior with sound.git tree for-next branch.  I guess the same
> > > issue should happen as the Xen workaround was kept and applied there,
> > > too, but it has to be checked at first.
> > >
> > > If the issue is persistent with there, the fix for 6.12 code would be
> > > rather much simpler like the blow.
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> > > --- a/sound/core/memalloc.c
> > > +++ b/sound/core/memalloc.c
> > > @@ -793,9 +793,6 @@ static void *snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
> > >  	int type = dmab->dev.type;
> > >  	void *p;
> > >  
> > > -	if (cpu_feature_enabled(X86_FEATURE_XENPV))
> > > -		return snd_dma_sg_fallback_alloc(dmab, size);
> > > -
> > >  	/* try the standard DMA API allocation at first */
> > >  	if (type == SNDRV_DMA_TYPE_DEV_WC_SG)
> > >  		dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC;
> > >
> > >
> > 
> > Individual subsystems ought not to know or care about XENPV; it's a
> > layering violation.
> > 
> > If the main APIs don't behave properly, then it probably means we've got
> > a bug at a lower level (e.g. Xen SWIOTLB is a constant source of fun)
> > which is probably affecting other subsystems too.
> 
> This is a big problem.  Debian bug #988477 (https://bugs.debian.org/988477)
> showed up in May 2021.  While some characteristics are quite different,
> the time when it was first reported is similar to the above and it is
> also likely a DMA bug with Xen.

Yes, some incompatible behavior has been seen on Xen wrt DMA buffer
handling, as it seems.  But note that, in the case of above, it was
triggered by the change in the sound driver side, hence we needed a
quick workaround there.  The result was to move back to the old method
for Xen in the end.

As already mentioned in another mail, the whole code was changed for
6.12, and the revert isn't applicable in anyway.

So I'm going to submit another patch to drop this Xen PV-specific
workaround for 6.12.  The new code should work without the workaround
(famous last words).  If the problem happens there, I'd rather leave
it to Xen people ;)


thanks,

Takashi


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4108F9700A4
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2024 09:47:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792127.1202149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smq97-0007Sr-6p; Sat, 07 Sep 2024 07:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792127.1202149; Sat, 07 Sep 2024 07:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smq97-0007P7-2M; Sat, 07 Sep 2024 07:46:13 +0000
Received: by outflank-mailman (input) for mailman id 792127;
 Sat, 07 Sep 2024 07:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=THQi=QF=suse.de=tiwai@srs-se1.protection.inumbo.net>)
 id 1smq94-0007IR-Ut
 for xen-devel@lists.xenproject.org; Sat, 07 Sep 2024 07:46:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d7add85-6ced-11ef-99a1-01e77a169b0f;
 Sat, 07 Sep 2024 09:46:06 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5D4B21F76C;
 Sat,  7 Sep 2024 07:46:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 39769139DE;
 Sat,  7 Sep 2024 07:46:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id N9HLDL4E3GZCNQAAD6G6ig
 (envelope-from <tiwai@suse.de>); Sat, 07 Sep 2024 07:46:06 +0000
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
X-Inumbo-ID: 3d7add85-6ced-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725695166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5y08yYom5hgxeNrV883FMRRgZqve0Fw82wAbN3aKcfk=;
	b=knctNF8ZsmuoVn8QiUJFZcM7PKEgsN7TBE8IJEUUslhNbo03kyCr4V3lZnuddirHhxHhZK
	/niPUo28rpss6L91lJpMr8tlhR3TaFj49775lFKxi3p2ifsAIdCuIhnyHiq2GOLi49sqqv
	lEPRx+dyMjXiUiG5X3CThw/ciQfVifY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725695166;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5y08yYom5hgxeNrV883FMRRgZqve0Fw82wAbN3aKcfk=;
	b=4YsIm4iHFO9eBmREFhtHLFM2Cd4YzXq7vMa5YbDJ8Yt5hy6ypFTOui8qn4Uqs8RVKIacOy
	RQbJeRtqRjEbcXBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725695166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5y08yYom5hgxeNrV883FMRRgZqve0Fw82wAbN3aKcfk=;
	b=knctNF8ZsmuoVn8QiUJFZcM7PKEgsN7TBE8IJEUUslhNbo03kyCr4V3lZnuddirHhxHhZK
	/niPUo28rpss6L91lJpMr8tlhR3TaFj49775lFKxi3p2ifsAIdCuIhnyHiq2GOLi49sqqv
	lEPRx+dyMjXiUiG5X3CThw/ciQfVifY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725695166;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5y08yYom5hgxeNrV883FMRRgZqve0Fw82wAbN3aKcfk=;
	b=4YsIm4iHFO9eBmREFhtHLFM2Cd4YzXq7vMa5YbDJ8Yt5hy6ypFTOui8qn4Uqs8RVKIacOy
	RQbJeRtqRjEbcXBQ==
Date: Sat, 07 Sep 2024 09:46:52 +0200
Message-ID: <877cbnewib.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ariadne Conill <ariadne@ariadne.space>
Cc: xen-devel@lists.xenproject.org,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
In-Reply-To: <20240906184209.25423-1-ariadne@ariadne.space>
References: <20240906184209.25423-1-ariadne@ariadne.space>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,alsa-project.org:email]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Fri, 06 Sep 2024 20:42:09 +0200,
Ariadne Conill wrote:
> 
> This patch attempted to work around a DMA issue involving Xen, but
> causes subtle kernel memory corruption.
> 
> When I brought up this patch in the XenDevel matrix channel, I was
> told that it had been requested by the Qubes OS developers because
> they were trying to fix an issue where the sound stack would fail
> after a few hours of uptime.  They wound up disabling SG buffering
> entirely instead as a workaround.
> 
> Accordingly, I propose that we should revert this workaround patch,
> since it causes kernel memory corruption and that the ALSA and Xen
> communities should collaborate on fixing the underlying problem in
> such a way that SG buffering works correctly under Xen.
> 
> This reverts commit 53466ebdec614f915c691809b0861acecb941e30.
> 
> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
> Cc: stable@vger.kernel.org
> Cc: xen-devel@lists.xenproject.org
> Cc: alsa-devel@alsa-project.org
> Cc: Takashi Iwai <tiwai@suse.de>

The relevant code has been largely rewritten for 6.12, so please check
the behavior with sound.git tree for-next branch.  I guess the same
issue should happen as the Xen workaround was kept and applied there,
too, but it has to be checked at first.

If the issue is persistent with there, the fix for 6.12 code would be
rather much simpler like the blow.


thanks,

Takashi

--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -793,9 +793,6 @@ static void *snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
 	int type = dmab->dev.type;
 	void *p;
 
-	if (cpu_feature_enabled(X86_FEATURE_XENPV))
-		return snd_dma_sg_fallback_alloc(dmab, size);
-
 	/* try the standard DMA API allocation at first */
 	if (type == SNDRV_DMA_TYPE_DEV_WC_SG)
 		dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC;



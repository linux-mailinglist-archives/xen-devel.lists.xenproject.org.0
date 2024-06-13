Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAEB906F01
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 14:15:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739879.1146831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHjM0-0007xk-BO; Thu, 13 Jun 2024 12:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739879.1146831; Thu, 13 Jun 2024 12:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHjM0-0007vZ-7r; Thu, 13 Jun 2024 12:14:56 +0000
Received: by outflank-mailman (input) for mailman id 739879;
 Thu, 13 Jun 2024 12:14:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vNde=NP=suse.de=tiwai@srs-se1.protection.inumbo.net>)
 id 1sHjLy-0007vT-3U
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 12:14:54 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8948a2f6-297e-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 14:14:53 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 42B9C353C5;
 Thu, 13 Jun 2024 12:14:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 112BD13A7F;
 Thu, 13 Jun 2024 12:14:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0PcLA7viambcIwAAD6G6ig
 (envelope-from <tiwai@suse.de>); Thu, 13 Jun 2024 12:14:51 +0000
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
X-Inumbo-ID: 8948a2f6-297e-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718280891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XYJJaDAiE8Jnnmi5U+ASAdIZI7iCR9QVodqnRXuBBqg=;
	b=gwOmERsCN9Jisej0D2mWfR0CF+yYvljzggdkpfJj7qVd+VT2vQLVdGERnIaT5PubIfvJaA
	4+efjBLW+2xKCPfQcc/KwR7VYsq3/I9Co9iGvsvyensynFWmfISCuu79w9v7NB8u16GPzW
	Gc+c//495/7gzJkPPIP8ltmP8bvg+0E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718280891;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XYJJaDAiE8Jnnmi5U+ASAdIZI7iCR9QVodqnRXuBBqg=;
	b=LNtBgVTjWRTqpp2XQ2vE+B3wRBXOSf2UaZHbBQZLjh+X35P/f4BcmZ11zvnrlim0rN2m+C
	B9/+VIQ7Dajm98BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718280891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XYJJaDAiE8Jnnmi5U+ASAdIZI7iCR9QVodqnRXuBBqg=;
	b=gwOmERsCN9Jisej0D2mWfR0CF+yYvljzggdkpfJj7qVd+VT2vQLVdGERnIaT5PubIfvJaA
	4+efjBLW+2xKCPfQcc/KwR7VYsq3/I9Co9iGvsvyensynFWmfISCuu79w9v7NB8u16GPzW
	Gc+c//495/7gzJkPPIP8ltmP8bvg+0E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718280891;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XYJJaDAiE8Jnnmi5U+ASAdIZI7iCR9QVodqnRXuBBqg=;
	b=LNtBgVTjWRTqpp2XQ2vE+B3wRBXOSf2UaZHbBQZLjh+X35P/f4BcmZ11zvnrlim0rN2m+C
	B9/+VIQ7Dajm98BQ==
Date: Thu, 13 Jun 2024 14:15:14 +0200
Message-ID: <87bk45ninh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux@treblig.org
Cc: oleksandr_andrushchenko@epam.com,
	perex@perex.cz,
	tiwai@suse.com,
	xen-devel@lists.xenproject.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: xen-front: remove unused struct 'alsa_sndif_hw_param'
In-Reply-To: <20240601232604.198662-1-linux@treblig.org>
References: <20240601232604.198662-1-linux@treblig.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.25
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.25 / 50.00];
	BAYES_HAM(-2.95)[99.79%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Sun, 02 Jun 2024 01:26:04 +0200,
linux@treblig.org wrote:
> 
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'alsa_sndif_hw_param' has been unused since the original
> commit 1cee559351a7 ("ALSA: xen-front: Implement ALSA virtual sound
> driver").
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Thanks, applied.


Takashi


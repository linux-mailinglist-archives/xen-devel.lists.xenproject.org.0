Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8956476A145
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 21:30:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573444.898144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQYbC-0003Rn-Jg; Mon, 31 Jul 2023 19:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573444.898144; Mon, 31 Jul 2023 19:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQYbC-0003Oo-HA; Mon, 31 Jul 2023 19:30:34 +0000
Received: by outflank-mailman (input) for mailman id 573444;
 Mon, 31 Jul 2023 19:30:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L1gI=DR=suse.de=tiwai@srs-se1.protection.inumbo.net>)
 id 1qQYbB-0003Oi-EO
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 19:30:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5f88d00-2fd8-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 21:30:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 62B401F8B9;
 Mon, 31 Jul 2023 19:30:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F4174133F7;
 Mon, 31 Jul 2023 19:30:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4dSvOtULyGTxYAAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 19:30:29 +0000
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
X-Inumbo-ID: b5f88d00-2fd8-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1690831830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u7USeY0/jtJxkYj9/QN1XyAb2M3n3eeaiC5yDhmFdY8=;
	b=wfOQ7CjFJqQePEa7OdDroF7echFEOEHR/6vLvlCgaHsMGc5p3jgEArAk5dc0jkq2W2SGSy
	GfcClBPxAOQ6E6Gw1fQREbSQEwYnUAY2Evc0hsf6IqB3iyr3y0XmXAGuhNYxL7mMHBbSJS
	2BCLtuk3fcVYke+aItcBz9RgRJ2HhEM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690831830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u7USeY0/jtJxkYj9/QN1XyAb2M3n3eeaiC5yDhmFdY8=;
	b=Qd4OrjEGeQ8Yv2c20NXO+uRfjaHL2ARq+fEgYKcKp+AaD4GHakZdhSu2htPkHeqG/+cw+Y
	6ecdtJBy3k+qWYAA==
Date: Mon, 31 Jul 2023 21:30:29 +0200
Message-ID: <87h6pjj2ui.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-media@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/24] ALSA: Generic PCM copy ops using sockptr_t
In-Reply-To: <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
References: <20230731154718.31048-1-tiwai@suse.de>
	<b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII

On Mon, 31 Jul 2023 19:20:54 +0200,
Mark Brown wrote:
> 
> On Mon, Jul 31, 2023 at 05:46:54PM +0200, Takashi Iwai wrote:
> 
> > this is a patch set to clean up the PCM copy ops using sockptr_t as a
> > "universal" pointer, inspired by the recent patch from Andy
> > Shevchenko:
> >   https://lore.kernel.org/r/20230721100146.67293-1-andriy.shevchenko@linux.intel.com
> 
> > Even though it sounds a bit weird, sockptr_t is a generic type that is
> > used already in wide ranges, and it can fit our purpose, too.  With
> > sockptr_t, the former split of copy_user and copy_kernel PCM ops can
> > be unified again gracefully.
> 
> It really feels like we ought to rename, or add an alias for, the type
> if we're going to start using it more widely - it's not helping to make
> the code clearer.

That was my very first impression, too, but I changed my mind after
seeing the already used code.  An alias might work, either typedef or
define genptr_t or such as sockptr_t.  But we'll need to copy the
bunch of helper functions, too...


Takashi


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNsHJXiBFmr6mwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 07:30:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD615DF741
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 07:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320340.1587662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wS6pW-0007Bt-Pj; Wed, 27 May 2026 05:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320340.1587662; Wed, 27 May 2026 05:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wS6pW-0007BS-MU; Wed, 27 May 2026 05:29:22 +0000
Received: by outflank-mailman (input) for mailman id 1320340;
 Wed, 27 May 2026 05:29:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tiwai@suse.de>) id 1wS6pV-0007BM-7A
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 05:29:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wS6pU-00D7PG-3P
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 07:29:20 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tiwai@suse.de>)
 id 6a16811f-bab6-0a2a0a5309dd-0a2a4508e7b8-26
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 07:29:20 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <tiwai@suse.de>)
 id 6a16812f-63b5-0a2a45080019-c387df82b786-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 07:29:19 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 513BB6B16B;
 Wed, 27 May 2026 05:29:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 18F825A669;
 Wed, 27 May 2026 05:29:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bW+UBC+BFmqDJAAAD6G6ig
 (envelope-from <tiwai@suse.de>); Wed, 27 May 2026 05:29:19 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede2_rsa header.d=suse.de header.i="@suse.de" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"; dkim=permerror header.s=susede2_ed25519 header.d=suse.de header.i="@suse.de"; dkim=pass header.s=susede2_rsa header.d=suse.de header.i="@suse.de" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"; dkim=permerror header.s=susede2_ed25519 header.d=suse.de header.i="@suse.de"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779859759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svuX77SW8vnbvuY432YXCcgyEAAoT9OnatmzUJsU5Pk=;
	b=hWxMEwfmpqMqKDMjXAi52ezDrZCFmGq8YvEz6dwU7w3z6No1nM0gIJpp8cNEwRmlPlz83r
	y3SwZqzfiu74rXVgK4K7ae0pVwtLeXBwr/1bzfQ6qs1HPRMrKcqUbAO+roq8rIC/k6lIVO
	nHfFonC9cV9Z5kM2yDmYlk70Iz1noJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779859759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svuX77SW8vnbvuY432YXCcgyEAAoT9OnatmzUJsU5Pk=;
	b=/c9o9AeZx/AgzOkNrdfyls5JuD0cV+Xo7TSwUxhCRyyZrMIKWJwdWkWqNfFDbC9nnWed+Y
	Zk+hBmRZXb1sZ+Dg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hWxMEwfm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/c9o9AeZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779859759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svuX77SW8vnbvuY432YXCcgyEAAoT9OnatmzUJsU5Pk=;
	b=hWxMEwfmpqMqKDMjXAi52ezDrZCFmGq8YvEz6dwU7w3z6No1nM0gIJpp8cNEwRmlPlz83r
	y3SwZqzfiu74rXVgK4K7ae0pVwtLeXBwr/1bzfQ6qs1HPRMrKcqUbAO+roq8rIC/k6lIVO
	nHfFonC9cV9Z5kM2yDmYlk70Iz1noJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779859759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svuX77SW8vnbvuY432YXCcgyEAAoT9OnatmzUJsU5Pk=;
	b=/c9o9AeZx/AgzOkNrdfyls5JuD0cV+Xo7TSwUxhCRyyZrMIKWJwdWkWqNfFDbC9nnWed+Y
	Zk+hBmRZXb1sZ+Dg==
Date: Wed, 27 May 2026 07:29:18 +0200
Message-ID: <87y0h5whch.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Jaroslav Kysela <perex@perex.cz>,
	xen-devel@lists.xenproject.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: xen-front: Fix event channel stream lifetime bugs
In-Reply-To: <20260526-alsa-xen-event-channel-fixes-v1-0-91d3a6a50778@gmail.com>
References: <20260526-alsa-xen-event-channel-fixes-v1-0-91d3a6a50778@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-purgate-ID: tlsNG-c1860d/1779859759-B596DDB1-135ADA63/0/0
X-purgate-type: clean
X-purgate-size: 959
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cassiogabrielcontato@gmail.com,m:tiwai@suse.com,m:oleksandr_andrushchenko@epam.com,m:perex@perex.cz,m:xen-devel@lists.xenproject.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tiwai@suse.de,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: EBD615DF741
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026 14:48:25 +0200,
Cássio Gabriel wrote:
> 
> Fix two related event-channel issues in the Xen ALSA frontend.
> 
> The first patch resets the event channel's expected incoming event
> id when a stream is cleared, and drops stale queued events from
> the previous stream instance.
> 
> The second patch keeps the request channel connected from .open(),
> where it is needed for hw-rule queries and stream open requests,
> but delays the event channel until after a successful .prepare().
> This prevents current-position events from reaching the ALSA position
> handler before runtime buffer and period geometry are valid.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
> Cássio Gabriel (2):
>       ALSA: xen-front: Reset event channel state on stream clear
>       ALSA: xen-front: Connect event channel after stream prepare

Applied both patches now to for-next branch.  Thanks.


Takashi


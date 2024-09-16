Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD84979C06
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 09:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799245.1209159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6Ao-000299-CV; Mon, 16 Sep 2024 07:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799245.1209159; Mon, 16 Sep 2024 07:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6Ao-00027D-9i; Mon, 16 Sep 2024 07:29:26 +0000
Received: by outflank-mailman (input) for mailman id 799245;
 Mon, 16 Sep 2024 07:29:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oGai=QO=suse.de=tiwai@srs-se1.protection.inumbo.net>)
 id 1sq6Am-000277-Gh
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 07:29:24 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64d80606-73fd-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 09:29:23 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 444DE1F86B;
 Mon, 16 Sep 2024 07:29:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B2831397F;
 Mon, 16 Sep 2024 07:29:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id s2UjAVLe52YALQAAD6G6ig
 (envelope-from <tiwai@suse.de>); Mon, 16 Sep 2024 07:29:22 +0000
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
X-Inumbo-ID: 64d80606-73fd-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726471762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1bBgueuxUZvbQExAimI3tYuObMSYYaUPWGJbo808X5w=;
	b=Q9gS+DeNuTBVDoSXv6QxXSr1eThAyx5aEZnDZEJuuKHrSE5OEPbVIsO6kDx7ptXFlDecMP
	IDSC+9aNkK+JmDfeVKVD9g3XpCQOXmC0NMZez+QS76IDVwTUqLLUeaJytzQShxIJUVpXKE
	HQjQjeRmsIlSj0dbkyu7AAXXDQHnN68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726471762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1bBgueuxUZvbQExAimI3tYuObMSYYaUPWGJbo808X5w=;
	b=CgOAiH2btemuKf2o+pnnQ3tlOo8Pvxu42HlYSl9wmUSSEEl8wiEn/c5A8oBfG6hTNi0+en
	VKi7+rjeOZ8UJCAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Q9gS+DeN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CgOAiH2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726471762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1bBgueuxUZvbQExAimI3tYuObMSYYaUPWGJbo808X5w=;
	b=Q9gS+DeNuTBVDoSXv6QxXSr1eThAyx5aEZnDZEJuuKHrSE5OEPbVIsO6kDx7ptXFlDecMP
	IDSC+9aNkK+JmDfeVKVD9g3XpCQOXmC0NMZez+QS76IDVwTUqLLUeaJytzQShxIJUVpXKE
	HQjQjeRmsIlSj0dbkyu7AAXXDQHnN68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726471762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1bBgueuxUZvbQExAimI3tYuObMSYYaUPWGJbo808X5w=;
	b=CgOAiH2btemuKf2o+pnnQ3tlOo8Pvxu42HlYSl9wmUSSEEl8wiEn/c5A8oBfG6hTNi0+en
	VKi7+rjeOZ8UJCAw==
Date: Mon, 16 Sep 2024 09:30:11 +0200
Message-ID: <87wmjc8398.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christoph Hellwig <hch@infradead.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ariadne Conill <ariadne@ariadne.space>,
	xen-devel@lists.xenproject.org,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
In-Reply-To: <ZufdOjFCdqQQX7tz@infradead.org>
References: <20240906184209.25423-1-ariadne@ariadne.space>
	<877cbnewib.wl-tiwai@suse.de>
	<9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
	<ZuK6xcmAE4sngFqk@infradead.org>
	<874j6g9ifp.wl-tiwai@suse.de>
	<ZufdOjFCdqQQX7tz@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 444DE1F86B
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 16 Sep 2024 09:24:42 +0200,
Christoph Hellwig wrote:
> 
> On Mon, Sep 16, 2024 at 09:16:58AM +0200, Takashi Iwai wrote:
> > Yes, all those are really ugly hacks and have been already removed for
> > 6.12.  Let's hope everything works as expected with it.
> 
> The code currently in linux-next will not work as explained in my
> previous mail, because it tries to side step the DMA API and abuses
> get_dma_ops in an unsupported way.

Those should have been removed since the last week.
Could you check the today's linux-next tree?


thanks,

Takashi


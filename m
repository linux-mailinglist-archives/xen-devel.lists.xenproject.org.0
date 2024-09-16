Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B679979BE6
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 09:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799237.1209139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5y3-0006zN-3g; Mon, 16 Sep 2024 07:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799237.1209139; Mon, 16 Sep 2024 07:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5y3-0006wy-0l; Mon, 16 Sep 2024 07:16:15 +0000
Received: by outflank-mailman (input) for mailman id 799237;
 Mon, 16 Sep 2024 07:16:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oGai=QO=suse.de=tiwai@srs-se1.protection.inumbo.net>)
 id 1sq5y1-0006ws-O6
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 07:16:13 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c866b04-73fb-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 09:16:10 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C9F411F86B;
 Mon, 16 Sep 2024 07:16:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 96C631397F;
 Mon, 16 Sep 2024 07:16:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qWQ2Izjb52b0KAAAD6G6ig
 (envelope-from <tiwai@suse.de>); Mon, 16 Sep 2024 07:16:08 +0000
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
X-Inumbo-ID: 8c866b04-73fb-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726470970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sSjzr5HtMz2pqKGcdEToj0QWZJuyrJg/ZaZJWn3ez0=;
	b=tWC+tkRZSIILrMkX3PiwGWsBW6zdfHTqG3kqixGQ7cPTArpL8x/xRtnqqWgB4AecZAGn0g
	wFsDCBVexmux1UA6KQO89Rxu/04unwGKJJdyC5jIGf5BfwBXkh9a0PiF82MsAY8nnkkMGB
	MGB/SEZ9U/q01KQ4s40yDbVinqT4a78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726470970;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sSjzr5HtMz2pqKGcdEToj0QWZJuyrJg/ZaZJWn3ez0=;
	b=uqmp8RwKdGFtm4DmshUo59x2lZGJMy1LTO02FLGgrIMEFy3ZLY3iFPOV4fDwfF79Yrr2Xq
	KHFhEf3l2zp6fhAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726470968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sSjzr5HtMz2pqKGcdEToj0QWZJuyrJg/ZaZJWn3ez0=;
	b=D/PWzUljxJ8oLF8aG3BG/eE3gmGfrLC9qv1ZM+Ut4tBAkgI5nVmUqTI+Ng6w3jNOTbtaiF
	5zVuQQTL4Y8pSrjjnVpfR2XhxGG59Ia2ywk7jzhKXZhq3VqtjIsjNksMOQwZbqI+YZM5hx
	mxophtHHZFqZDZKXcomFx/Ie0VC0q/0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726470968;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sSjzr5HtMz2pqKGcdEToj0QWZJuyrJg/ZaZJWn3ez0=;
	b=PgXA8jh8vvF6cxpxPAmnG5qnK/9FOOAFAdo2uTAh+5Eg6kRMavX6GfiJPqfP9zkFPV8eye
	huOSo+Y9fOspuYAQ==
Date: Mon, 16 Sep 2024 09:16:58 +0200
Message-ID: <874j6g9ifp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christoph Hellwig <hch@infradead.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ariadne Conill <ariadne@ariadne.space>,
	xen-devel@lists.xenproject.org,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
In-Reply-To: <ZuK6xcmAE4sngFqk@infradead.org>
References: <20240906184209.25423-1-ariadne@ariadne.space>
	<877cbnewib.wl-tiwai@suse.de>
	<9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
	<ZuK6xcmAE4sngFqk@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
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
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Thu, 12 Sep 2024 11:56:21 +0200,
Christoph Hellwig wrote:
> 
> On Sat, Sep 07, 2024 at 11:38:50AM +0100, Andrew Cooper wrote:
> > Individual subsystems ought not to know or care about XENPV; it's a
> > layering violation.
> 
> Agreed.
> 
> > If the main APIs don't behave properly, then it probably means we've got
> > a bug at a lower level (e.g. Xen SWIOTLB is a constant source of fun)
> > which is probably affecting other subsystems too.
> > 
> > I think we need to re-analyse the original bug.  Right now, the
> > behaviour resulting from 53466ebde is worse than what it was trying to fix.
> 
> 53466ebde looks bogus to me, and the commit message doesn't even
> try to explain what bad behavior it works around.  I'd also like to
> state once again that if you think something is broken about dma
> allocation or mapping helpers please Cc me and the iommu list.
> 
> Most of the time it's actually the drivers doing something invalid, but
> sometimes it is a core dma layer bug or something that needs a proper
> API.
> 
> Also while looking at the above commit I noticed the broken fallback
> code in snd_dma_noncontig_alloc - get_dma_ops is not for driver use,
> and starting with the code queued up for 6.12 will also return NULL
> when using dma-iommu for example.

Yes, all those are really ugly hacks and have been already removed for
6.12.  Let's hope everything works as expected with it.


thanks,

Takashi


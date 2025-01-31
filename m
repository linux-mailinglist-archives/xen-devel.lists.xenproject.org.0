Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4C0A23DD3
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 13:38:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879939.1290139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdqGw-00039R-33; Fri, 31 Jan 2025 12:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879939.1290139; Fri, 31 Jan 2025 12:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdqGv-00037y-V3; Fri, 31 Jan 2025 12:37:21 +0000
Received: by outflank-mailman (input) for mailman id 879939;
 Fri, 31 Jan 2025 12:37:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ME7v=UX=suse.de=farosas@srs-se1.protection.inumbo.net>)
 id 1tdqGt-00037q-Lp
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 12:37:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a4b428a-dfd0-11ef-99a4-01e77a169b0f;
 Fri, 31 Jan 2025 13:37:16 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5EBB51F38F;
 Fri, 31 Jan 2025 12:37:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7D5C133A6;
 Fri, 31 Jan 2025 12:37:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pl5HHfrDnGcMVwAAD6G6ig
 (envelope-from <farosas@suse.de>); Fri, 31 Jan 2025 12:37:14 +0000
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
X-Inumbo-ID: 1a4b428a-dfd0-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738327035; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5/Y+l3I+LWiIyHZ0d4aDhx/MttQxBZszSFtZwXlxrho=;
	b=F70snUjqpyk8KV+m/V81VqXP61b0lR558gm+ZeHuC2LkGVpi5Np3j/p/RWuW2nh4ikvST6
	lvBbUqgohkaVDqR+xvWe5Z2cIvVUB7GXUTQEjUA5DSEysjR/gSSBHSym9OhMa1sD970cHk
	SOSG3TEX3oJUpD3xizABEqOi10FHgpw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738327035;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5/Y+l3I+LWiIyHZ0d4aDhx/MttQxBZszSFtZwXlxrho=;
	b=eU8nAYHd5WnDpnMtx+l07PyNTyMXXCyljKidBabmdTg3VhLf68tgPDmzFYK8hDH+dV6HK4
	QodoQAGvgYtatqBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=F70snUjq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eU8nAYHd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738327035; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5/Y+l3I+LWiIyHZ0d4aDhx/MttQxBZszSFtZwXlxrho=;
	b=F70snUjqpyk8KV+m/V81VqXP61b0lR558gm+ZeHuC2LkGVpi5Np3j/p/RWuW2nh4ikvST6
	lvBbUqgohkaVDqR+xvWe5Z2cIvVUB7GXUTQEjUA5DSEysjR/gSSBHSym9OhMa1sD970cHk
	SOSG3TEX3oJUpD3xizABEqOi10FHgpw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738327035;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5/Y+l3I+LWiIyHZ0d4aDhx/MttQxBZszSFtZwXlxrho=;
	b=eU8nAYHd5WnDpnMtx+l07PyNTyMXXCyljKidBabmdTg3VhLf68tgPDmzFYK8hDH+dV6HK4
	QodoQAGvgYtatqBg==
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Paolo
 Bonzini
 <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>, Thomas Huth
 <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>, Akihiko Odaki
 <akihiko.odaki@daynix.com>, Phil Dennis-Jordan <phil@philjordan.eu>,
 xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 0/2] tests/qtest: Make qtest_has_accel() generic
In-Reply-To: <20250130103728.536-1-philmd@linaro.org>
References: <20250130103728.536-1-philmd@linaro.org>
Date: Fri, 31 Jan 2025 09:37:11 -0300
Message-ID: <87cyg3gnwo.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5EBB51F38F
X-Spam-Level: 
X-Spamd-Result: default: False [-4.50 / 50.00];
	BAYES_HAM(-2.99)[99.96%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,gmail.com,daynix.com,philjordan.eu,lists.xenproject.org,linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.50
X-Spam-Flag: NO

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> (Series fully reviewed)
>
> Since v1:
> - Use g_strconcat (Akihiko)
>
> In preparation of running QTests using HVF on Darwin,
> make qtest_has_accel() generic.
>
> Note, this also allow running other accelerators such
> Xen, WHPX, ...
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   tests/qtest: Extract qtest_qom_has_concrete_type() helper
>   tests/qtest: Make qtest_has_accel() generic
>
>  tests/qtest/libqtest.c | 110 +++++++++++++++++++++++------------------
>  1 file changed, 61 insertions(+), 49 deletions(-)

Queued, thanks!


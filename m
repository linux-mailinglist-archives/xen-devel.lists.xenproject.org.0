Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 451B2AF6303
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 22:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031529.1405342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX3lq-00037K-Bv; Wed, 02 Jul 2025 20:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031529.1405342; Wed, 02 Jul 2025 20:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX3lq-00035o-95; Wed, 02 Jul 2025 20:09:30 +0000
Received: by outflank-mailman (input) for mailman id 1031529;
 Wed, 02 Jul 2025 20:09:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z1lb=ZP=suse.de=farosas@srs-se1.protection.inumbo.net>)
 id 1uX3lo-00035i-7A
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 20:09:28 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72f7cf4b-5780-11f0-a314-13f23c93f187;
 Wed, 02 Jul 2025 22:09:25 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 12C792119D;
 Wed,  2 Jul 2025 20:09:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72B0913A24;
 Wed,  2 Jul 2025 20:09:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YecgDPORZWhLKgAAD6G6ig
 (envelope-from <farosas@suse.de>); Wed, 02 Jul 2025 20:09:23 +0000
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
X-Inumbo-ID: 72f7cf4b-5780-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751486964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E3ld8KnXAjSJ+x0D9/TSrjACrrB5IkzFjTYXhfv83eM=;
	b=x7k+6MZqg3Lc/oXP3Hr9cwiSkZlaPAo9BoczTTVnIsXPCnvVzAPMiTYUDvYTNezBNX2sTu
	YAkWyk6yYeE0kvuSjeAVlUe3z1S34Bsowg8YI0NSkne/nsK+NRIFLJLBNM4Tu7Qr1DvfQH
	3J+WuD/YkBy5+Bp6evtxbn7H3MBx29U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751486964;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E3ld8KnXAjSJ+x0D9/TSrjACrrB5IkzFjTYXhfv83eM=;
	b=UDoaVjGetx6p7B/3eANHJlhQE/mrxiE6VPzOzkYNfU0uMns3cERqFBmSyekGLpbjvr/rq9
	0k4iDwRskK33s1CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751486964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E3ld8KnXAjSJ+x0D9/TSrjACrrB5IkzFjTYXhfv83eM=;
	b=x7k+6MZqg3Lc/oXP3Hr9cwiSkZlaPAo9BoczTTVnIsXPCnvVzAPMiTYUDvYTNezBNX2sTu
	YAkWyk6yYeE0kvuSjeAVlUe3z1S34Bsowg8YI0NSkne/nsK+NRIFLJLBNM4Tu7Qr1DvfQH
	3J+WuD/YkBy5+Bp6evtxbn7H3MBx29U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751486964;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E3ld8KnXAjSJ+x0D9/TSrjACrrB5IkzFjTYXhfv83eM=;
	b=UDoaVjGetx6p7B/3eANHJlhQE/mrxiE6VPzOzkYNfU0uMns3cERqFBmSyekGLpbjvr/rq9
	0k4iDwRskK33s1CQ==
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Philippe =?utf-8?Q?Mathie?=
 =?utf-8?Q?u-Daud=C3=A9?=
 <philmd@linaro.org>, Laurent Vivier <lvivier@redhat.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 48/65] accel/dummy: Convert to
 AccelOpsClass::cpu_thread_routine
In-Reply-To: <20250702185332.43650-49-philmd@linaro.org>
References: <20250702185332.43650-1-philmd@linaro.org>
 <20250702185332.43650-49-philmd@linaro.org>
Date: Wed, 02 Jul 2025 17:09:20 -0300
Message-ID: <87seje4aof.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.38 / 50.00];
	BAYES_HAM(-2.58)[98.15%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,redhat.com,kernel.org,xenproject.org,xen.org,gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.38

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> By converting to AccelOpsClass::cpu_thread_routine we can
> let the common accel_create_vcpu_thread() create the thread.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Fabiano Rosas <farosas@suse.de>


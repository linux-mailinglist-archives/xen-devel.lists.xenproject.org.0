Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APOqEQ/r8WkLlgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 13:27:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A73E6493885
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 13:27:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297223.1573332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI344-0007mU-4V; Wed, 29 Apr 2026 11:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297223.1573332; Wed, 29 Apr 2026 11:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI344-0007jn-1j; Wed, 29 Apr 2026 11:26:48 +0000
Received: by outflank-mailman (input) for mailman id 1297223;
 Wed, 29 Apr 2026 11:26:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <will@kernel.org>) id 1wI341-0007jh-RX
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 11:26:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI341-008Q7g-7Q
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 13:26:45 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <will@kernel.org>)
 id 69f1eaf5-e002-0a2a0a5209dd-0a2a450980a6-0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 13:26:45 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <will@kernel.org>)
 id 69f1eaf3-2497-0a2a45090019-aceafc1fb7e8-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 13:26:44 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CA92D403EB;
 Wed, 29 Apr 2026 11:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158D1C19425;
 Wed, 29 Apr 2026 11:26:33 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777462002;
	bh=HgV0q/+gZ9n2giWTxhUD6P3yQ6wEmY66ZwCWQHhgQ2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ejvHWE1zJ0tb1KwQu/gVCMj0KcNhlMqCOjLI4kQmWC01EPIO4HFDTFQg5PpNyMx2F
	 7OMWgwbyfp16yd5ZKGLwfDDMuBlWK8CK9qcSIqUHZRxyhnWE4iAN+OK+xmr5WBtr4T
	 BgqmCB7r/rsFvwFu/mT2z67QkDE/mDzOf7GDi68KHsQjYM3r7svy7TXqJDW5kWsfNa
	 xYHmkznhflijvwvOUJkH6AcM42ZHWo8kZp7k26fwbFC82N/jHC8/F/rL8GlM8z6Ksh
	 UMOZ5KVH94exo80oAIrmoHKOK/k/qke5mU8V2uOXUW3Mlxuf7JynBO/Edq8wMcfI5M
	 twwrBSWDcoLLw==
Date: Wed, 29 Apr 2026 12:26:30 +0100
From: Will Deacon <will@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org,
	catalin.marinas@arm.com
Subject: Re: [RFC PATCH v1 8/9] arm64: Add unsafe_copy_from_user()
Message-ID: <afHq5vyNUJzxVwDV@willie-the-truck>
References: <cover.1777306795.git.chleroy@kernel.org>
 <5b09e58a84c9edcfe5724db5cd57e45d96a96bfa.1777306795.git.chleroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b09e58a84c9edcfe5724db5cd57e45d96a96bfa.1777306795.git.chleroy@kernel.org>
X-purgate-ID: tlsNG-bad1c0/1777462005-416B0A53-0E96A66A/0/0
X-purgate-type: clean
X-purgate-size: 521
X-Rspamd-Queue-Id: A73E6493885
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[will@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,linux-foundation.org,gmail.com,linutronix.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.freedesktop.org,lists.linux.dev,lists.xenproject.org,googlegroups.com,kvack.org,alsa-project.org,lists.linux-m68k.org,arm.com];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:ynorov@nvidia.com,m:akpm@linux-foundation.org,m:torvalds@linux-foundation.org,m:david.laight.linux@gmail.com,m:tglx@linutronix.de,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:dmaengine@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-fsi@lists.ozlabs.org,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:linux-wpan@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-serial@vger.kernel.org,m:linux-usb@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-fsdevel@vger.ke
 rnel.org,m:ocfs2-devel@lists.linux.dev,m:bpf@vger.kernel.org,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:linux-x25@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-sound@vger.kernel.org,m:sound-open-firmware@alsa-project.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-arch@vger.kernel.org,m:catalin.marinas@arm.com,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_GT_50(0.00)[50];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.945];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

[+Catalin]

On Mon, Apr 27, 2026 at 07:13:49PM +0200, Christophe Leroy (CS GROUP) wrote:
> At the time being, x86 and arm64 are missing unsafe_copy_from_user().
> 
> Add it.
> 
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> ---
>  arch/arm64/include/asm/uaccess.h | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)

Why?

And please cc the arm64 maintainers on arm64 patches next time. You've
managed to cc most of the world apart from us.

Will


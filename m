Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPNKDjTn8WlZlAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 13:10:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795FE4935BB
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 13:10:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297182.1573311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI2oH-0005HO-KQ; Wed, 29 Apr 2026 11:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297182.1573311; Wed, 29 Apr 2026 11:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI2oH-0005EO-HD; Wed, 29 Apr 2026 11:10:29 +0000
Received: by outflank-mailman (input) for mailman id 1297182;
 Wed, 29 Apr 2026 10:25:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <usama.arif@linux.dev>) id 1wI26t-0006Yd-2S
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 10:25:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI26q-008D0W-KH
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 12:25:37 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <usama.arif@linux.dev>)
 id 69f1dc83-2eae-0a2a0a5409dd-0a2a45069404-38
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 12:25:35 +0200
Received: from [95.215.58.178] (helo=out-178.mta1.migadu.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <usama.arif@linux.dev>)
 id 69f1dc9e-7371-0a2a45060019-5fd73ab27d0c-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 12:25:34 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=key1 header.d=linux.dev header.i="@linux.dev" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777458333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ubnPqyEuUH+bb9tWP9+TOUp+n6C5onOR58LCuBDEiw=;
	b=syDuJ2ebh9z2sjffREH58o0aT6Ajjew8W5I8ReEUtvp2EQkdghmYv8iT9JcU1iX87oMIbX
	D+xmbMoFNHgWVKDoL6XEe6kPFjJgAeA5FQrv1tK/6uUbSyjmFqItMdxDS/n3eJA5ihtrWC
	pDy1LXDxeyfrSgRVjezaD0bM6Fa+Scc=
From: Usama Arif <usama.arif@linux.dev>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>,
	Yury Norov <ynorov@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-fsi@lists.ozlabs.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	ocfs2-devel@lists.linux.dev,
	bpf@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-x25@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
Date: Wed, 29 Apr 2026 03:25:19 -0700
Message-ID: <20260429102520.1617327-1-usama.arif@linux.dev>
In-Reply-To: <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-purgate-ID: tlsNG-16d1c6/1777458335-50158D75-F176F709/0/0
X-purgate-type: clean
X-purgate-size: 2700
X-Rspamd-Queue-Id: 795FE4935BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,nvidia.com,linux-foundation.org,gmail.com,linutronix.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.freedesktop.org,lists.linux.dev,lists.xenproject.org,googlegroups.com,kvack.org,alsa-project.org,lists.linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:usama.arif@linux.dev,m:ynorov@nvidia.com,m:akpm@linux-foundation.org,m:torvalds@linux-foundation.org,m:david.laight.linux@gmail.com,m:tglx@linutronix.de,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:dmaengine@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-fsi@lists.ozlabs.org,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:linux-wpan@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-serial@vger.kernel.org,m:linux-usb@vger.kernel.org,m:xen-devel@lists.xenproject.org,
 m:linux-fsdevel@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:bpf@vger.kernel.org,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:linux-x25@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-sound@vger.kernel.org,m:sound-open-firmware@alsa-project.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-arch@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[usama.arif@linux.dev,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:mid];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[usama.arif@linux.dev,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	RCPT_COUNT_GT_50(0.00)[50];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.420];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]

On Mon, 27 Apr 2026 19:13:48 +0200 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:

> At the time being, x86 and arm64 are missing unsafe_copy_from_user().
> 
> Add it.
> 
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> ---
>  arch/x86/include/asm/uaccess.h | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
> index 3a0dd3c2b233..10c458ffa399 100644
> --- a/arch/x86/include/asm/uaccess.h
> +++ b/arch/x86/include/asm/uaccess.h
> @@ -598,7 +598,7 @@ _label:									\
>   * We want the unsafe accessors to always be inlined and use
>   * the error labels - thus the macro games.
>   */
> -#define unsafe_copy_loop(dst, src, len, type, label)				\
> +#define unsafe_put_loop(dst, src, len, type, label)				\
>  	while (len >= sizeof(type)) {						\
>  		unsafe_put_user(*(type *)(src),(type __user *)(dst),label);	\
>  		dst += sizeof(type);						\
> @@ -611,10 +611,29 @@ do {									\
>  	char __user *__ucu_dst = (_dst);				\
>  	const char *__ucu_src = (_src);					\
>  	size_t __ucu_len = (_len);					\
> -	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u64, label);	\
> -	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u32, label);	\
> -	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u16, label);	\
> -	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u8, label);	\
> +	unsafe_put_loop(__ucu_dst, __ucu_src, __ucu_len, u64, label);	\
> +	unsafe_put_loop(__ucu_dst, __ucu_src, __ucu_len, u32, label);	\
> +	unsafe_put_loop(__ucu_dst, __ucu_src, __ucu_len, u16, label);	\
> +	unsafe_put_loop(__ucu_dst, __ucu_src, __ucu_len, u8, label);	\
> +} while (0)
> +
> +#define unsafe_get_loop(dst, src, len, type, label)				\
> +	while (len >= sizeof(type)) {						\
> +		unsafe_get_user(*(type __user *)(src),(type *)(dst),label);	\

Hi,

Just wanted to check if src and dst need to be swapped? Same for arm64 patch.

> +		dst += sizeof(type);						\
> +		src += sizeof(type);						\
> +		len -= sizeof(type);						\
> +	}
> +
> +#define unsafe_copy_from_user(_dst,_src,_len,label)			\
> +do {									\
> +	char *__ucu_dst = (_dst);					\
> +	const char __user *__ucu_src = (_src);				\
> +	size_t __ucu_len = (_len);					\
> +	unsafe_get_loop(__ucu_dst, __ucu_src, __ucu_len, u64, label);	\
> +	unsafe_get_loop(__ucu_dst, __ucu_src, __ucu_len, u32, label);	\
> +	unsafe_get_loop(__ucu_dst, __ucu_src, __ucu_len, u16, label);	\
> +	unsafe_get_loop(__ucu_dst, __ucu_src, __ucu_len, u8, label);	\
>  } while (0)
>  
>  #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
> -- 
> 2.49.0
> 
> 


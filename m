Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +La4FZGw72lyDwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 20:53:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4A6478E05
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 20:53:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295216.1571917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHR4V-0001tf-EF; Mon, 27 Apr 2026 18:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295216.1571917; Mon, 27 Apr 2026 18:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHR4V-0001or-9H; Mon, 27 Apr 2026 18:52:43 +0000
Received: by outflank-mailman (input) for mailman id 1295216;
 Mon, 27 Apr 2026 18:07:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <34aXvaQkKCUIepmgiv2lpksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--aliceryhl.bounces.google.com>)
 id 1wHQMl-0002nM-D0
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 18:07:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHQMk-002GxW-MF
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 20:07:30 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <34aXvaQkKCUIepmgiv2lpksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--aliceryhl.bounces.google.com>)
 id 69efa5ca-e002-0a2a0a5209dd-0a2a4509ed56-28
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 20:07:30 +0200
Received: from [209.85.221.73] (helo=mail-wr1-f73.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <34aXvaQkKCUIepmgiv2lpksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--aliceryhl.bounces.google.com>)
 id 69efa5e2-2497-0a2a45090019-d155dd49a51e-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 20:07:30 +0200
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-43d780757eeso6990924f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 11:07:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777313250; x=1777918050; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HxkgeF4LNZGOlYkWj+Rbzgew6yzkspsu2lszfChr6II=;
        b=DOJZE4ctVpYAiQRmiqUjE6WW11G1fzlbUXXMmyl0mSxviR6bNlMX92qY/L4t4C93LB
         56MZm5l2WOEyBGBY1H0yIDrzm7qydRYJrstl6O5Z5iToSD1XZhhv2ZkZ5qb2ace08MlM
         O/tNIFB+427z9yYp1y2dLUvKU71EiCiDQgv7y8HEUPc1cRcGjkGO6qN3syrjMgZe+Z+k
         JOB4yq7O/T/jNcNXzi5WFw69mO0eQTmlR1pLnCx0gz+e2nOHprXEozdIs/3JtJJI/tGx
         Sb5v/dqO8yQ3Ao8QoLKwwgHnL4BZt2gnHABMJjQbRcZ1VV+G6vJIwFrFu0W5e2+yt/QP
         sbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777313250; x=1777918050;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HxkgeF4LNZGOlYkWj+Rbzgew6yzkspsu2lszfChr6II=;
        b=oaTvjxvWxwrWzFha2mfTNzzoADmN3/RWeWTwkbp0BngjsSWxDPIvseSBQlBigwyXdQ
         gKA1+1FFnxjb6JLZ7Ttvl2EYylVG5ytvWoIpuVb9vOJ4np8PJMfgkdKjGspaUJ6feNXm
         sxMN5roZaCple7nii93/u6lccAd7Rj0Oi7eI2CeyTLok2dAop7t8hk3/yuI7oMvWVQsS
         Z64QjqbTTNGRBLZwH3pQ7Y/VedGTPoFIzq9U7EG/YEUTjcmTh4gJAIrMn4MxrpH3dU4o
         O5+4HoUadiwrqboBGyb61FJHcN4cN5zObxLH9dNBLAaFxNeOuCPgbZ5uNyBTUGeouwYK
         E3hQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SNMSGVWiiGQ5grUhDaNd5WhiMt0oLwsio/0YKH8Wp8TW2y1STwMLlR+IGvwZ+mxKSuPWSijpVWRE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywi9uZ4eR68CwNxyyO5JtYX5N39VNopBiOt2Rz8J0GYWvkgLdGT
	vSAeshMgIs2a7a1CbVzRS/3OL6bRxP3dpLjMXMmiaz88H1QqM+mNQaXnTk8rHFOawedIGOBbJbI
	w5wnD17QMkEroy77Vfg==
X-Received: from wrmd3.prod.google.com ([2002:adf:e883:0:b0:43d:7940:a11b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:41c7:b0:43d:799c:b2cb with SMTP id ffacd0b85a97d-44636a393e7mr256856f8f.24.1777313249648;
 Mon, 27 Apr 2026 11:07:29 -0700 (PDT)
Date: Mon, 27 Apr 2026 18:07:28 +0000
In-Reply-To: <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
Mime-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
Message-ID: <ae-l4FGDPLwBuDXM@google.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
From: Alice Ryhl <aliceryhl@google.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
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
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-purgate-ID: tlsNG-bad1c0/1777313250-414B1A53-90F3E03D/0/0
X-purgate-type: clean
X-purgate-size: 871
X-Rspamd-Queue-Id: 4B4A6478E05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,linux-foundation.org,gmail.com,linutronix.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.freedesktop.org,lists.linux.dev,lists.xenproject.org,googlegroups.com,kvack.org,alsa-project.org,lists.linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[aliceryhl@google.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:ynorov@nvidia.com,m:akpm@linux-foundation.org,m:torvalds@linux-foundation.org,m:david.laight.linux@gmail.com,m:tglx@linutronix.de,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:dmaengine@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-fsi@lists.ozlabs.org,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:linux-wpan@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-serial@vger.kernel.org,m:linux-usb@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-fsdevel@vger.ke
 rnel.org,m:ocfs2-devel@lists.linux.dev,m:bpf@vger.kernel.org,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:linux-x25@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-sound@vger.kernel.org,m:sound-open-firmware@alsa-project.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-arch@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]

On Mon, Apr 27, 2026 at 07:13:46PM +0200, Christophe Leroy (CS GROUP) wrote:
> diff --git a/rust/helpers/uaccess.c b/rust/helpers/uaccess.c
> index 01de4fbbcc84..710e07cd60ae 100644
> --- a/rust/helpers/uaccess.c
> +++ b/rust/helpers/uaccess.c
> @@ -5,13 +5,13 @@
>  __rust_helper unsigned long
>  rust_helper_copy_from_user(void *to, const void __user *from, unsigned long n)
>  {
> -	return copy_from_user(to, from, n);
> +	return copy_from_user_partial(to, from, n);
>  }
>  
>  __rust_helper unsigned long
>  rust_helper_copy_to_user(void __user *to, const void *from, unsigned long n)
>  {
> -	return copy_to_user(to, from, n);
> +	return copy_to_user_partial(to, from, n);
>  }

No Rust code uses the return value for anything other than comparing it
with zero, so you can keep these as copy_[from|to]_user() without
issues.

Thanks, Alice


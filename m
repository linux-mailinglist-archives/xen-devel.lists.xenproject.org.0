Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JXLiIHhfRWpn/AoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 20:42:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C056F0AA7
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 20:42:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=alien8.de header.s=alien8 header.b=dqyuEsjE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=alien8.de
Received: from list by lists.xenproject.org with outflank-mailman.1350332.1607801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wezrZ-0008S2-6Z; Wed, 01 Jul 2026 18:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350332.1607801; Wed, 01 Jul 2026 18:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wezrZ-0008R6-2N; Wed, 01 Jul 2026 18:40:45 +0000
Received: by outflank-mailman (input) for mailman id 1350332;
 Wed, 01 Jul 2026 18:40:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1wezrW-0008Qy-OY
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 18:40:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wezrW-003hhu-5a
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 20:40:42 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6a455f0e-5cb7-0a2a0a5109dd-0a2a4507c504-32
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 20:40:42 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bp@alien8.de>)
 id 6a455f29-9c8e-0a2a45070019-416d716cb4c0-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 20:40:41 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EEC0B40E00BA; 
 Wed,  1 Jul 2026 18:40:40 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 19fnkjO55P1L; Wed,  1 Jul 2026 18:40:31 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 18D6840E01B4;
 Wed,  1 Jul 2026 18:40:16 +0000 (UTC)
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
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782931229; bh=weptln60tMwwD122PJFo5tc1DKGFh3noLSr54y5FDM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqyuEsjEVT9gyPjvdK0gB5x8udKkER2yawHRi+UQEK+nSKtnQR7DqxnnysUwrhZ4y
	 GEGQkqI5XAFvG1t8U2Y0yVX0X96Dkhmh5EwnBm0uCgn64X5pR8kizQhepQrg5RJVfx
	 qUeJHxhUmgPresH3hRbZyZh0kueU1Ju5NETJbOfwZhSqElniJL1AEnSpbjasfSFiE9
	 v/o+NI29PkbYU+rfKXFOWwxZXCYPQYqqGAQWQXhtRsJ1cTf+sfy2hx0FR9pco10cly
	 DO6HZ62yBAjyi9FZFFsJKBYyglK/BjgeznIdmPdc5rFCzPqbQQcdKeQ5UGCYbMWjrG
	 oHXEh4L4uZa6zbt8QFVTJ4hJ1YeAnJdvjaVt294z3OfoLJX6/uIbjQtwAnpz9MnYtl
	 xiCxqS5jRHRFEfGjp25M4NiMFdoi9hguJiOpozhjTXhYeT+bnTVAeFzmnURNuvDo/3
	 SJT7xXGuQNk62DwNud+YNzMxR2um9INkkbFGvejhVA/Z95R+NSbczIl3Xr3lZ9NwvV
	 saYsDBqdR4cu3TmYaZniJ6Vt2dYtVgh9o7L/WEgwSWqU1Xot15YB3RErxX11EJCFYC
	 wSrHRfjccElKOiCbInvfFhymOEbedF0htWOg3udYoD9+y+m8vZWCrLx0sGwnZTKB1X
	 eXAePUQovsvmfd1bdtheCQ+Y=
Date: Wed, 1 Jul 2026 11:40:14 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH RESEND v5 1/3] x86/asm, x86/boot: expose inline memcmp
Message-ID: <20260701184014.GDakVfDhIgaIKurzTb@fat_crate.local>
References: <20260630-pvh-kasan-inline-v5-0-52afc979be81@igalia.com>
 <20260630-pvh-kasan-inline-v5-1-52afc979be81@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630-pvh-kasan-inline-v5-1-52afc979be81@igalia.com>
X-purgate-ID: tlsNG-ef75cf/1782931242-7C92A25E-D19B88E0/0/0
X-purgate-type: clean
X-purgate-size: 2418
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[alien8.de,none];
	R_DKIM_ALLOW(-0.20)[alien8.de:s=alien8];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,linux.intel.com,zytor.com,suse.com,gmail.com,oracle.com,igalia.com,vger.kernel.org,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alien8.de:dkim,alien8.de:from_mime,igalia.com:email,fat_crate.local:mid];
	FORGED_RECIPIENTS(0.00)[m:mfo@igalia.com,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[bp@alien8.de,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[alien8.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bp@alien8.de,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20C056F0AA7

On Tue, Jun 30, 2026 at 02:21:46PM -0300, Mauricio Faria de Oliveira wrote:
> Move the inline memcmp function currently only available in 'boot/string.c'
> into the shared string function header <asm/shared/string.h> to be reused.
> 
> This is not done through <asm/string.h> to avoid pulling unnecessary code
> in 'boot/string.c' that causes build errors in 'boot/compressed/string.c'
> and 'purgatory/purgatory.ro'.
> 
> Note that the inline memcmp() returns 0/1, not -1/0/1 as regular memcmp()
> (reported by David Laight <david.laight.linux@gmail.com>).

This belongs ...


> 
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> ---

... here, if anywhere.

>  arch/x86/boot/string.c               |  6 ++----
>  arch/x86/include/asm/shared/string.h | 16 ++++++++++++++++
>  arch/x86/include/asm/string.h        |  1 +
>  3 files changed, 19 insertions(+), 4 deletions(-)

Also, PeterZ has a point - we should group all __inline_ functions into
shared/string.h and say why that is the case at the top of the header.

> diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
> index ac0f900ebc47efa81c92e1bb2010ea41677899c4..be454a6864225f3a972c3e81826b77ed4e8a57fe 100644
> --- a/arch/x86/boot/string.c
> +++ b/arch/x86/boot/string.c
> @@ -15,6 +15,7 @@
>  #include <linux/errno.h>
>  #include <linux/limits.h>
>  #include <asm/asm.h>
> +#include <asm/shared/string.h>
>  #include "ctype.h"
>  #include "string.h"
>  
> @@ -31,10 +32,7 @@
>  
>  int memcmp(const void *s1, const void *s2, size_t len)
>  {
> -	bool diff;
> -	asm("repe cmpsb"
> -	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
> -	return diff;
> +	return __inline_memcmp(s1, s2, len);
>  }
>  
>  /*
> diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..422952152f533ad75b98f3873297b39c4f5e2477
> --- /dev/null
> +++ b/arch/x86/include/asm/shared/string.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_X86_SHARED_STRING_H
> +#define _ASM_X86_SHARED_STRING_H
> +
> +/* Note: this memcmp() returns 0/1, not -1/0/1 as regular memcmp(). */

Please document it properly - what does 0 mean as a return value and what 1.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOU1INo16WnrVwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 22:55:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D017644ABEE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 22:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291140.1570405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFeas-0006Uy-3H; Wed, 22 Apr 2026 20:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291140.1570405; Wed, 22 Apr 2026 20:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFear-0006SL-Vm; Wed, 22 Apr 2026 20:54:45 +0000
Received: by outflank-mailman (input) for mailman id 1291140;
 Wed, 22 Apr 2026 20:54:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <david.laight.linux@gmail.com>) id 1wFeaq-0006Rw-Cm
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 20:54:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFeap-00H3E8-Pf
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 22:54:43 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 69e93593-e002-0a2a0a5209dd-0a2a45018b5e-0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 22:54:43 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 69e93593-c1f2-0a2a45010019-d155dd33c161-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 22:54:43 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43eb05b1875so3504329f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:54:43 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e44f69sm50195066f8f.25.2026.04.22.13.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 13:54:42 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776891283; x=1777496083; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdbNxflSk7ifnlaOODr8r5GA8Z4c6VemJtceNGAv6Fw=;
        b=Vo7XX16ejjA59pvPiQIr/Ki1FhSQxdorVyASfUHVAC/JNXNXyGPSOQIo49jk/kn+Ph
         m0nbR0KVGeOL8JHQiIaTynOKaV5IMkc1v7BIqP4QSHNOzIy4EqWtk5JGL4K/ITzAFbUe
         EmOK5YB1joRFj+U7hoBBEzFkOpfIzCxYs2ZsOkiRKv2iTH8G23CbamXiyx1TEhln9aEY
         5EgKsL3HqesdLkt/8mv7me+NvzNEDuhxnreyXpHpthXIZS6aA/3QjDoUZ2iN3Q9/B2D0
         4mBsroAcn7ALhwTigOiPZDPcxZRLsPOyJVqQ+nJNXFUvk8Kc4GNsqETTjR9dBzPrSWIr
         C+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776891283; x=1777496083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BdbNxflSk7ifnlaOODr8r5GA8Z4c6VemJtceNGAv6Fw=;
        b=qRE3KIkQ6BrbHM+DXriADscgVO1N3ZeEZ5U5Ypz5xEDtqUNP9IOMNfhWTluNd/64cm
         ZCLVwmybuwCwP4eGzlQ4rW8f1l37c9QZ13r5hg7F/7J/AhgzwrMiAHSKR/qhQPUfUVgy
         /LMi+b2pfa4GiO/8LJlpvu7IkvL8yswXnowZhKPBAKrdrF3rTKC14uY32V6my+tqqayy
         YQdv6B2gFZk9qDyo/tJ0XzNRUHGuccMZUQaBQcVRbz0ktfyckfS1RjZ7jsBrnOr+7YY8
         MEbxRtopjaPJ/WSzhjHZdo0UAnolhS3roNlgskVGghg9MGyKSbR8kyD5zDOJeXgEidpX
         c3Og==
X-Forwarded-Encrypted: i=1; AFNElJ9cnMD020qsAe+ffLyiTGGRcNw3H08+djx7/NNlbtfr7QlL8+v5lqm+MQyUO/5Zyf2QNGnzbqvaWT0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yza2HPP20v23UkjpLZ52+l8AbH1HQ37pwpK+43MWCUnsF3oDzsu
	QSIQVD8cSxC+u+7jr9Pj9KFNO4ChrGWRZ8WB0N4aYpLtJJIyHlwWbR8P
X-Gm-Gg: AeBDieuSnWGzr8GjH3sLs2nqPqgq29QmZJbLJlt6LjjdHeILaERM/XHcJwx+5hoABe/
	rvkXh4TPzwZstgw7lfBRB2mGgcfN1+hcYY7CorT2LasB70hJ0Y0lk5qzzkLlioyM/8hGgbEwJ+R
	Vsu8DR3O8l7YozeqAFOuMFiXO+ihlRClavd2cSWmRUzMeJsgj2yu0dC8af9zAM2OVTf/Jb2UX2g
	V86o87cQPGGp7xmzsV9FeqvgcR1R2+oRaIKODY7VYQKsH68WAx9gcfH552V6EXPcXfmBIHNAqMY
	V8MoZqNMLu86WwTW7U/FYxckEBUWo2aw0RL3/+OsDqBgkk6iWcQLiWZouzpNxb0xclGtHBlZ3kP
	gcnQVPVUqYDG60ei2IWmVdiUmA9TP12GYb18SRAIHAfV1v9uoySzFclxPziXwGSNukaUpvxt2JY
	QjdWfqa8LWvHFK4bTgsXcspsCk5F1pY6yNNbNkbSsUAXdXvBEdyULac8x7g1DTM59rxb3KAcKYW
	LM=
X-Received: by 2002:a05:6000:4203:b0:43d:242:b9bb with SMTP id ffacd0b85a97d-43fe3dc5c80mr36772655f8f.18.1776891283082;
        Wed, 22 Apr 2026 13:54:43 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:54:41 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Juergen Gross
 <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] x86/asm, x86/boot: Expose inline memcmp
Message-ID: <20260422215441.4204c142@pumpkin>
In-Reply-To: <20260422-pvh-kasan-inline-v1-1-7e6194344c92@igalia.com>
References: <20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com>
	<20260422-pvh-kasan-inline-v1-1-7e6194344c92@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1776891283-BFC74FF4-37BD296C/0/0
X-purgate-type: clean
X-purgate-size: 2483
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mfo@igalia.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:adobriyan@gmail.com,m:boris.ostrovsky@oracle.com,m:kernel-dev@igalia.com,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,gmail.com,oracle.com,igalia.com,vger.kernel.org,lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D017644ABEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 22 Apr 2026 17:07:45 -0300
Mauricio Faria de Oliveira <mfo@igalia.com> wrote:

> Move the inline memcmp function, currently only available to boot code
> (boot/string.c), into the header with similar inline string functions
> (include/asm/string.h) so it may be reused.

This needs a comment/warning that it is incompatible with normal memcmp()
because it only returns 0/1 not -1/0/1.
Most callers don't care.

	David


> 
> Add a _SETUP guard in string.h so not to include the 32/64-bit specific
> string headers in boot/ code (16-bit, real mode) and avoid build errors.
> 
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> ---
>  arch/x86/boot/string.c        |  6 ++----
>  arch/x86/include/asm/string.h | 11 +++++++++++
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
> index b25c6a9303b7314d5caf5c9306239811705294fe..bbee78637b349e42e9281d8df50d89d48f4490b9 100644
> --- a/arch/x86/boot/string.c
> +++ b/arch/x86/boot/string.c
> @@ -15,6 +15,7 @@
>  #include <linux/errno.h>
>  #include <linux/limits.h>
>  #include <asm/asm.h>
> +#include <asm/string.h>
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
> diff --git a/arch/x86/include/asm/string.h b/arch/x86/include/asm/string.h
> index 9cb5aae7fba9ffcf0f5af8f939d30467750ccaa9..736a6f6a31f0a68281b4f17415aba0fcd95dc228 100644
> --- a/arch/x86/include/asm/string.h
> +++ b/arch/x86/include/asm/string.h
> @@ -2,11 +2,13 @@
>  #ifndef _ASM_X86_STRING_H
>  #define _ASM_X86_STRING_H
>  
> +#ifndef _SETUP
>  #ifdef CONFIG_X86_32
>  # include <asm/string_32.h>
>  #else
>  # include <asm/string_64.h>
>  #endif
> +#endif
>  
>  static __always_inline void *__inline_memcpy(void *to, const void *from, size_t len)
>  {
> @@ -29,4 +31,13 @@ static __always_inline void *__inline_memset(void *s, int v, size_t n)
>  	return ret;
>  }
>  
> +static __always_inline int __inline_memcmp(const void *s1, const void *s2, size_t len)
> +{
> +	bool diff;
> +
> +	asm("repe cmpsb"
> +	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
> +	return diff;
> +}
> +
>  #endif /* _ASM_X86_STRING_H */
> 



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A52A67DE1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 21:14:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919847.1324198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tudKV-0008Pe-C6; Tue, 18 Mar 2025 20:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919847.1324198; Tue, 18 Mar 2025 20:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tudKV-0008Nx-9V; Tue, 18 Mar 2025 20:14:27 +0000
Received: by outflank-mailman (input) for mailman id 919847;
 Tue, 18 Mar 2025 20:14:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0H9a=WF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tudKT-0008Np-NJ
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 20:14:25 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 961a7443-0435-11f0-9abc-95dc52dad729;
 Tue, 18 Mar 2025 21:14:24 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39727fe912cso1658230f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 13:14:24 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975b34sm19225648f8f.55.2025.03.18.13.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 13:14:23 -0700 (PDT)
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
X-Inumbo-ID: 961a7443-0435-11f0-9abc-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742328864; x=1742933664; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Opdw5ocR687G6F6WwBTRM6aIEe2FdqNl1nXAkKIt/eY=;
        b=QWqm0xACok9kltO84un1ZgL86J9IhStSnph1tTaA3O/jrcWmguMPKEYSnXpVPkvSHE
         Bb4qq8KWvXqHhWESvDtUf5KwgW+2DCKIH3AXeZm43/RzaYpBsdezYKGkmMdev1RIwyCf
         y6Cpa4giHrjGIJMbsYFbZNyDVSIA7z5vHqt0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742328864; x=1742933664;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Opdw5ocR687G6F6WwBTRM6aIEe2FdqNl1nXAkKIt/eY=;
        b=Oqkw4oHydKurGpPyDZWCk9Cv3nJNSrlplHZx84cvvkcCfV8jSUG/aAHwoh8jjdIPT7
         eE7fpnRM0OJKGgk59h6bg4cTjIzvqBtKsYKICNGU/04CRv7WYI8kFo5A8Tozp7tHarS4
         ZYlGDW9tI5EUncp07N3LXdRDnOVvhGBiXbF8KQb2PPp9ircx70tWJMjD6GCq9SvtBoTR
         nNbAUdHSiH9LPuDy6+L5mxUs1jintK9zAY+rC6feo1Y4nsROMYv1Md+Gr7CllD26yfQF
         FNdd4yDif1EDgCUoJlZzX9gzaLTNCKKnzmvZO1U+Qqd40ZnPPPQGpxuzR5oYQcrSFFs4
         NT9g==
X-Forwarded-Encrypted: i=1; AJvYcCXkg5zYJJ/RQkp4abAUZt67R81YcfYwz2P4KdFpOlJ5+mhVngeK06+Atv0popfP+gjv0cafzWHS+/U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQFdBnN/sVOAteZNAsnBuwKimuLuESNUTJ2iQIaVvIuZZN9pxB
	0OMzoKubTLZVmwMVHIFrUrLuokD3fOKTgodbvAmYd3YuVXd1c98D6NVIQR5GkE4=
X-Gm-Gg: ASbGncudfzl3a+8ne3tgKY22LQvJsdkwZUM3zEtURXuXKmPgO0awhlX4EFMRVZT4IYI
	JAVsSk+BwYwBe/6hRwO6vRyydrCqQylbkuYZEU/CcqzexQC3+2ub26Aa5N6hiGjVYkY0ryA18OY
	e0nkrH9KouiPVqHXTsp8yY9hXmYbrUsYgVm5er/bdoSGe5lR8ikDZhatE6urRH07GktYrtnpZQZ
	9SImza1UsHKw8kKeXi33KQknksS7cFCW+03GLggrVSZFWlglMQl/Ks16s/dXJ9D1us56PDpd1KX
	cL9lyeLccKtBHxIPpfUHppJCGqPGm7zGM9aRN2wEpxOGMtjF5v3bd1otL37F+Jmcrc1goegcsXn
	aAKr0aGrc
X-Google-Smtp-Source: AGHT+IH4Fy9Dqc5o8b3YsO6KXHJ5QGCZUs7xi1wPEysFtuB1rOBgmPYJrq0JswXXCgqQ+j1otOix2g==
X-Received: by 2002:a05:6000:156b:b0:391:412b:e23f with SMTP id ffacd0b85a97d-399739c7b8bmr159815f8f.15.1742328864251;
        Tue, 18 Mar 2025 13:14:24 -0700 (PDT)
Message-ID: <ad70b8a0-93e8-4aa8-a529-a83a5ac831d9@citrix.com>
Date: Tue, 18 Mar 2025 20:14:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] x86/boot: apply trampoline relocations at destination
 position
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-5-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250318173547.59475-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2025 5:35 pm, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/boot/reloc-trampoline.c b/xen/arch/x86/boot/reloc-trampoline.c
> index e35e7c78aa86..ac54aef14eaf 100644
> --- a/xen/arch/x86/boot/reloc-trampoline.c
> +++ b/xen/arch/x86/boot/reloc-trampoline.c
> @@ -20,19 +20,19 @@ void reloc_trampoline64(void)
>      uint32_t phys = trampoline_phys;
>      const int32_t *trampoline_ptr;
>  
> -    /*
> -     * Apply relocations to trampoline.
> -     *
> -     * This modifies the trampoline in place within Xen, so that it will
> -     * operate correctly when copied into place.
> -     */
> +    /* Apply relocations to trampoline after copy to destination. */

I think this needs expanding on a bit.

The relocations in __trampoline_*_{start,stop} relate to the trampoline
as it lives compiled into Xen, but we're applying them to the trampoline
already copied into low memory.

> +#define RELA_TARGET(ptr, bits) \
> +    *(uint ## bits ## _t *)(phys + *ptr + (long)ptr - (long)trampoline_start)
> +
>      for ( trampoline_ptr = __trampoline_rel_start;
>            trampoline_ptr < __trampoline_rel_stop;
>            ++trampoline_ptr )
> -        *(uint32_t *)(*trampoline_ptr + (long)trampoline_ptr) += phys;
> +        RELA_TARGET(trampoline_ptr, 32) += phys;
>  
>      for ( trampoline_ptr = __trampoline_seg_start;
>            trampoline_ptr < __trampoline_seg_stop;
>            ++trampoline_ptr )
> -        *(uint16_t *)(*trampoline_ptr + (long)trampoline_ptr) = phys >> 4;
> +        RELA_TARGET(trampoline_ptr, 16) = phys >> 4;
> +
> +#undef RELA_TARGET

I have a patch renaming trampoline_ptr to just ptr, on the grounds of
verbosity.  I'm not sure if it want's to go in ahead, merged with, or
after this patch.

Also, encoding bits in RELA_TARGET() isn't terribly nice.  What's wrong
with keeping the casts as-are, and having RELA_TARGET() only taking ptr?

~Andrew


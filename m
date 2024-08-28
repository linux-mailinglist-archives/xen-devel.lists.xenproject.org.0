Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79667962578
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 13:06:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784714.1194100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjGVL-0007gm-7w; Wed, 28 Aug 2024 11:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784714.1194100; Wed, 28 Aug 2024 11:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjGVL-0007eU-4w; Wed, 28 Aug 2024 11:06:23 +0000
Received: by outflank-mailman (input) for mailman id 784714;
 Wed, 28 Aug 2024 11:06:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjGVJ-0007eD-KG
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 11:06:21 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d99f3a7-652d-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 13:06:19 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a868831216cso758284266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 04:06:19 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e592d995sm229178566b.204.2024.08.28.04.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 04:06:18 -0700 (PDT)
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
X-Inumbo-ID: 8d99f3a7-652d-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724843179; x=1725447979; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pJH0Wn1rbXhb1J6k8gE0oDwQs34HWMEWleH5WCn038g=;
        b=Z3vHwX4dV97mkb9RXddhB9n0sklWrUAhytIup/lh7/Fg/dNZIFAYDLjLlumzma3Lt6
         ro/vCYor2VFFJfnniwiyALHqMTmLZGfPPcFtLfG9PmUK6KczLmJhtJJShIRRIUfFoDZy
         PYfOdSzXhWds1oCQzJFqizdUpApR09KsTB/5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724843179; x=1725447979;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJH0Wn1rbXhb1J6k8gE0oDwQs34HWMEWleH5WCn038g=;
        b=E5XTEKi98NziTn/VsBtmcBIchEpSkvP74FVL2YhoZId+IVAx/NqkDguXa4d+Fo6kU1
         /GmoTilYxsuQ9aH/HJeTMLXBGH6HDkZZ+pkMagWQkvjqH/rK/nBLwiwIwFxbPdaN1A7G
         2BMBL6Q+6WLjh9ed8mrCYrho6Q6a61dwDwKU826iqZgYPCjw0zwb+UtRQDnRW4zJzfCO
         MGJkFBbJ3GnyHC6h4yeZnN35t9aO7iZL6M5Zn3XitBjVYEXKpLCaLqr5EyqiRqoWUrag
         laLDgEpjTNsutpahX4dg8pDhMubDVvdj2+gW89vSf4BYt3NYkEBQ991/SjYnXIFefznt
         o7Ag==
X-Forwarded-Encrypted: i=1; AJvYcCW4CCN+NhdDhLP4rgPg5TP3knqaK2GyFcV7qX3UzmImFvwQzzuZNl9T86R+36lxu36iv3R4qgHDXjw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3blVSpH3ROHilpD/1XPBysfKOOHmoHcUHS++BvOhiLDxuyo1Q
	Rs2rngQ8mxYtRk1slqQEqx5PG4Yj7QQ+QJAF014+wpwRJsVJ/y7gtPh0JUbAWvY=
X-Google-Smtp-Source: AGHT+IGBWQc47npBaGeb5WNQKsJ1iBCunevJkKC3Yi5rUDFIFNVwMB1mjbmA3nUTTGROhlfYUCfP4A==
X-Received: by 2002:a17:906:6a0d:b0:a86:80ef:4fe5 with SMTP id a640c23a62f3a-a86a54b024dmr1199300566b.47.1724843178647;
        Wed, 28 Aug 2024 04:06:18 -0700 (PDT)
Message-ID: <c508fcdf-d918-40cf-94d5-c56a191e53bc@citrix.com>
Date: Wed, 28 Aug 2024 12:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: correct partial HPET_STATUS write emulation
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <da785047-0bee-4d16-a6ae-d1727bd8317a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <da785047-0bee-4d16-a6ae-d1727bd8317a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2024 10:00 am, Jan Beulich wrote:
> For partial writes the non-written parts of registers are folded into
> the full 64-bit value from what they're presently set to. That's wrong
> to do though when the behavior is write-1-to-clear: Writes not
> including to low 3 bits would unconditionally clear all ISR bits which
> are presently set. Re-calculate the value to use.
>
> Fixes: be07023be115 ("x86/vhpet: add support for level triggered interrupts")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Alternatively we could also suppress the folding in of read bits, but
> that looked to me to end up in a more intrusive change.
>
> --- a/xen/arch/x86/hvm/hpet.c
> +++ b/xen/arch/x86/hvm/hpet.c
> @@ -404,7 +404,8 @@ static int cf_check hpet_write(
>          break;
>  
>      case HPET_STATUS:
> -        /* write 1 to clear. */
> +        /* Write 1 to clear. Therefore don't use new_val directly here. */
> +        new_val = val << ((addr & 7) * 8);
>          while ( new_val )
>          {
>              bool active;

It's sad that we allow any sub-word accesses.  The spec makes it pretty
clear that only aligned 32-bit and 64-bit accesses are acceptable, and
it would simplify the merging logic substantially.

Nevertheless, this is the simplest bugfix for now.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


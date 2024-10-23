Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 270CC9ACBCA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 16:00:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824690.1238855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3bti-0001Ut-UA; Wed, 23 Oct 2024 13:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824690.1238855; Wed, 23 Oct 2024 13:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3bti-0001St-RC; Wed, 23 Oct 2024 13:59:38 +0000
Received: by outflank-mailman (input) for mailman id 824690;
 Wed, 23 Oct 2024 13:59:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VMbu=RT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t3btg-0001RT-Nk
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 13:59:36 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08c0c803-9147-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 15:59:34 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a99f3a5a44cso787975766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2024 06:59:34 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912d63b1sm482968166b.42.2024.10.23.06.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2024 06:59:33 -0700 (PDT)
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
X-Inumbo-ID: 08c0c803-9147-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729691974; x=1730296774; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUbLFdU0BWI0tmmZg2AQHkhF4BGY/m2sI7zO4tAVz9I=;
        b=TStjWuECQvjBShe4MTy40S/71pgBWG7FsQJ8TnULOAG0EL/zFtkczFtMeCRIeq/Djg
         /vSpZdKHD7ZeBtdTQg1j6DanwzeiDoIRVJ4AodcsWFvlytTbchhANLkQZ4ECrLz0x4um
         v1U4pE42nu8OxdTr+rq9N7EQF4rTwrvGAgkyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729691974; x=1730296774;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zUbLFdU0BWI0tmmZg2AQHkhF4BGY/m2sI7zO4tAVz9I=;
        b=ML+QaafsK+UKW5cO+XnMJla/2AmJXyEbX8SR+MLMwvqYnFxfYSmzHna1q8XPgzLx6V
         pz9pOY40iJ8Kx/lSSxCAvpTRdXbsdIBVt4eZfZCEIySctT13H3YEn8o4EEoYaaMz34lX
         ZmrRLT8uqSMuHNBTKUXP0jKmwhgEmMmcbnm4UaSoFr5S055tcn6i3uucjdbjVPSOh8mj
         +bJ0IzFsGbceB2NpvDs2TzRSg5FN1V8Dn8u0Udb9az4aATd5AE/BX9Q1x3d6WTTgw2Xt
         RDceb3+UF0fz2KsgGwPwqheupUu484b12+qdWX7XOTDTt4pnGt1zijRlxiemWphZYcYB
         6TKw==
X-Forwarded-Encrypted: i=1; AJvYcCVtQ6h+KJwaJzmtlus7OWoTnwpN4Gni4/obygS7nau05oRXfJegsg4jzP6r8abDox7ULZ8ZBRO2M6s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxacMMDh1MDZFslfMOQ1C7ZWQy/ez/dDAwTFfocHga6gbJ8Aj6E
	Q/NKUCOfZKT3EWCofz/9OYrzEphCHw8lTbXzkQmLS5z/wd2gleMWO7E7XdoPJ7k=
X-Google-Smtp-Source: AGHT+IHWHHX2hN+WLKXTIZg6y3Of++yhgWmj8yVV+wPX117m4ut+iRX2/CC/q1JwYgHaOnMwB0bDjA==
X-Received: by 2002:a17:907:980a:b0:a99:ed0c:1d6 with SMTP id a640c23a62f3a-a9abf920abamr232624266b.49.1729691974259;
        Wed, 23 Oct 2024 06:59:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Oct 2024 14:59:31 +0100
Message-Id: <D538MPY7U10Z.2ZIEWH1RX5K4N@cloud.com>
Cc: "Jan Beulich" <JBeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/ucode: Explain what microcode_set_module() does
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241023122803.670943-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241023122803.670943-1-andrew.cooper3@citrix.com>

On Wed Oct 23, 2024 at 1:28 PM BST, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

  Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

With a single nit that I don't care much about, but...

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
> I found this hiding in other microcode changes, and decided it was high t=
ime
> it got included.
> ---
>  xen/arch/x86/cpu/microcode/core.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microco=
de/core.c
> index 8564e4d2c94c..dc2c064cf176 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -108,6 +108,10 @@ static bool ucode_in_nmi =3D true;
>  /* Protected by microcode_mutex */
>  static const struct microcode_patch *microcode_cache;
> =20
> +/*
> + * Used by the EFI path only, when xen.cfg identifies an explicit microc=
ode
> + * file.  Overrides ucode=3D<int>|scan on the regular command line.
> + */

... this it would be better at the interface in microcode.h, imo.

>  void __init microcode_set_module(unsigned int idx)
>  {
>      ucode_mod_idx =3D idx;
>
> base-commit: be84e7fe58b51f6b6dd907a038f0ef998a1e281e
> prerequisite-patch-id: ef20898eb25a7ca1ea2d7b1d676f00b91b46d5f6
> prerequisite-patch-id: e0d0c0acbe4864a00451187ef7232dcaf10b2477
> prerequisite-patch-id: f6010b4a6e0b43ac837aea470b3b5e5f390ee3b2

Cheers,
Alejandro


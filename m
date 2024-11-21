Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E19569D4F96
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 16:20:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841553.1257042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE8y8-0002mG-Ac; Thu, 21 Nov 2024 15:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841553.1257042; Thu, 21 Nov 2024 15:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE8y8-0002jD-7Z; Thu, 21 Nov 2024 15:19:44 +0000
Received: by outflank-mailman (input) for mailman id 841553;
 Thu, 21 Nov 2024 15:19:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yn03=SQ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tE8y6-0002j7-SI
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 15:19:42 +0000
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [2607:f8b0:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06588c42-a81c-11ef-a0cc-8be0dac302b0;
 Thu, 21 Nov 2024 16:19:39 +0100 (CET)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-7180d9d0dcbso404108a34.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 07:19:39 -0800 (PST)
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
X-Inumbo-ID: 06588c42-a81c-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjozMmMiLCJoZWxvIjoibWFpbC1vdDEteDMyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA2NTg4YzQyLWE4MWMtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjAyMzc5Ljk0MjMyNCwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732202378; x=1732807178; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epc54H0L/TvUkPOir4wXfx1YWjE2SF2iefNB/ll5zI0=;
        b=A0KbLvUXhZ8mikTxdXAAaHVVvOOsRuwodztLRWYLNie40+Y4QB5akzeTYoWytWsypZ
         QSt0OojAxusww5edPwbbK7E5TVACp+DcgefepmYC/AUGnmoGTzi/OJ6cCv8NynRKH07k
         lmHql9Vt1yPeXyAJHVRqriR6SEZ+OubnV8A2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732202378; x=1732807178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epc54H0L/TvUkPOir4wXfx1YWjE2SF2iefNB/ll5zI0=;
        b=xE9curQ12dAlA0nhf0p93cj3cyV+o2+meBdL3510fB7V0qSn53fEUF0FQCfjGGoFrq
         ThMg7XvCzEWC6jSbQthwez6/QnKR5cqSwK6x1rKHhtPHyvmx75Hfr9WOrpak0UeGo/dS
         wi7Oy0pLdhcS11bUVua4pGUVxp7Br7HZ1JhCe85hiI7YhooaurNFP00n3n+VEGjd5QUB
         je4g/lqp8md4nVTZrM9qym6GfJ4p566CZ4QXU9N6unaXDvfO32Hp/CcIVXbVRPq1xF4C
         n25dnylAl9uONgWnAj8HQVcE3iRgVav55MojfILEtjBuAPIjKCNUDC8dEv9nyR99mYEr
         S4Nw==
X-Gm-Message-State: AOJu0YwI5MqpMCOBGKS3z1Wwa4sLkXa1B0mnITNqaY7BIG5tuaQSKzLD
	YKcjDHpUmdnNGwy1oixpe4ClhkmDmFOOPjoc466xIyt1Pl7JjMS5YGWoBoSa0SpNdoOA8lh+ASO
	aOOyqieVHOyyhBc1kd4xQP2rQmE4QrCWGDtceCQ==
X-Gm-Gg: ASbGnctKTYUPrxI/K0NIU+MMCtBcBC09Jsy1spqupHQClc6Xu67CWmJSKtK4234wJs5
	bKlG2XiG9ParCOwUBGexiRmRuYJ1il2c=
X-Google-Smtp-Source: AGHT+IEA37AFSzW+IDtlAWmb1g2fxQKwn1vtI1hFI2f+RbK8HTWh5EG6815+Uez9ViG7mepZMxYsxT6EyHf9DpeDZOc=
X-Received: by 2002:a9d:6a98:0:b0:717:d48c:59f with SMTP id
 46e09a7af769-71ab31ed413mr6673281a34.21.1732202378488; Thu, 21 Nov 2024
 07:19:38 -0800 (PST)
MIME-Version: 1.0
References: <20241121145000.3107723-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241121145000.3107723-1-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 21 Nov 2024 15:19:27 +0000
Message-ID: <CACHz=Zh+qvzgrXBZPbSR=5oTEk2kz9b+zfZHEk8pwmGmrVpAmw@mail.gmail.com>
Subject: Re: [PATCH] xen/bitops: Fix break with in a for_each_set_bit() loop
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 2:50=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> for_each_set_bit()'s use of a double for loop had an accidental bug with =
a
> break in the inner loop leading to an infinite outer loop.
>
> Adjust for_each_set_bit() to avoid this behaviour, and add extend
> test_for_each_set_bit() with a test case for this.
>
> Fixes: ed26376f20bf ("xen/bitops: Introduce for_each_set_bit()")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
>
> Both GCC and Clang seem happy with this, even at -O1:
>
>   https://godbolt.org/z/o6ohjrzsY
> ---
>  xen/common/bitops.c      | 16 ++++++++++++++++
>  xen/include/xen/bitops.h |  2 +-
>  2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/xen/common/bitops.c b/xen/common/bitops.c
> index 91ae961440af..0edd62d25c28 100644
> --- a/xen/common/bitops.c
> +++ b/xen/common/bitops.c
> @@ -110,6 +110,22 @@ static void __init test_for_each_set_bit(void)
>
>      if ( ull !=3D ull_res )
>          panic("for_each_set_bit(uint64) expected %#"PRIx64", got %#"PRIx=
64"\n", ull, ull_res);
> +
> +    /* Check that we break from the middle of the loop */
> +    ui =3D HIDE(0x80001008U);
> +    ui_res =3D 0;
> +    for_each_set_bit ( i, ui )
> +    {
> +        static __initdata unsigned int count;
> +
> +        if ( count++ > 1 )
> +            break;
> +
> +        ui_res |=3D 1U << i;
> +    }
> +
> +    if ( ui_res !=3D 0x1008 )
> +        panic("for_each_set_bit(break) expected 0x1008, got %#x\n", ui_r=
es);
>  }
>
>  static void __init test_multiple_bits_set(void)
> diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
> index 79615fb89d04..448b2d3e0937 100644
> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -299,7 +299,7 @@ static always_inline attr_const unsigned int fls64(ui=
nt64_t x)
>   * A copy of @val is taken internally.
>   */
>  #define for_each_set_bit(iter, val)                     \
> -    for ( typeof(val) __v =3D (val); __v; )               \
> +    for ( typeof(val) __v =3D (val); __v; __v =3D 0 )       \
>          for ( unsigned int (iter);                      \
>                __v && ((iter) =3D ffs_g(__v) - 1, true);   \
>                __v &=3D __v - 1 )
>
> base-commit: e0058760a0c7935ad0690d8b9babb9050eceedf0

Not a fun of static variables but it's just in the test,

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano


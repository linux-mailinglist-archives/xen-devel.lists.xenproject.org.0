Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDB6AAD532
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 07:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978167.1365014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCXJ5-0002sv-CG; Wed, 07 May 2025 05:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978167.1365014; Wed, 07 May 2025 05:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCXJ5-0002qh-8s; Wed, 07 May 2025 05:26:59 +0000
Received: by outflank-mailman (input) for mailman id 978167;
 Wed, 07 May 2025 05:26:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m17E=XX=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uCXJ4-0002qb-6A
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 05:26:58 +0000
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [2607:f8b0:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e43e0d48-2b03-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 07:26:57 +0200 (CEST)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-40356cb3352so393368b6e.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 22:26:57 -0700 (PDT)
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
X-Inumbo-ID: e43e0d48-2b03-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746595616; x=1747200416; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kEUPSgIGA0UabuUj/oK6f2rNgvp4HKyVzvtpIhxZqU=;
        b=h1YhIh2CXPZ7g+2ro7SmFwyOmCAAPbbw9MKqLFVkT6elpVyjsER8DYzIUrjf6M2y0w
         6ND+zm3sBYhPhBfDRr2SLf86Su/Q97cww4y2hFFkajxtc9j/k1SxRVvtmrJt3/YpiyF3
         CHhHeGUxuHBT0FsP2/WQPdZpGRd9UpL/CTZ+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746595616; x=1747200416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kEUPSgIGA0UabuUj/oK6f2rNgvp4HKyVzvtpIhxZqU=;
        b=m4ZArAK5CTS11Supq1hQM6nM96ukJI+dAVBRleAB1g3IS/JlhmXk1acg2WT5XigZSb
         pZnqqHtG/D38Y3G5UkSxHV68TngBfv+2IXX0L5a/ZBI8xAXaauONsmxxbFFjiSY97rEd
         KOmoaNHBdLh1c5MpE+WflssLC+4r+yxY25jONgI9neAEOk1mbE4e+v4uAEZrEqjvMq7w
         jRTXjhP3lEbcT6ymaPlzB2DWQWO6Pc8IOKohHkshoC7on5UMwtxQt0ERaiJapWKDuGym
         0A9n7d9s06zzzJsavLk6fRuFpEkIjw3ryMY/0tFZLL//6OD2Yj1vqAvGL1G2OYK12aIf
         HjjQ==
X-Gm-Message-State: AOJu0YxBC1P+uQxXCblZHBVNSYmgKmZwTlJKEWcf4rpB48V/EOrnFsuj
	g6TB/QO1bFypEZWF35dIgP+9nAV4FyOz8L0c1gwBNfSdmeDlsKjCJwNkvELULRvb6fzyEJ2IAU2
	rSQngYdiDfNjrJ7EDoE/WOoc8RpI0DP60h7gUXpuCdapUHWkqHCU=
X-Gm-Gg: ASbGncsqZdBfCSFmOdwwtar495XA74FYofOuTinp6CYTYx09g03U0F4Ce5QbnPkvI5G
	Grai+DFwvlMEzfH8kTcUjYCmzsemL0+a+kMGv8mJnTsooLekcvycr8wVoQpRHfCtEUDu6kEyuSn
	ATyDLwcSEQGUeXGXWzaZs=
X-Google-Smtp-Source: AGHT+IErBNTxAdyjptbj6DvUZY6tdDRej7dWByUKTPiW5umZhCobMUkWT+MSEEs4jgcAEL/oAWW0gAPRlyFGFH/UAp4=
X-Received: by 2002:a05:6808:1926:b0:3f4:11b3:206b with SMTP id
 5614622812f47-4036eabb9aamr1386237b6e.17.1746595615689; Tue, 06 May 2025
 22:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250506135655.187014-1-frediano.ziglio@cloud.com>
 <20250506135655.187014-2-frediano.ziglio@cloud.com> <de48c8bc-a7b2-4b9f-b45e-cbe3f7eb03c4@citrix.com>
 <5698b996-e23d-49f7-af37-645d4784dc67@citrix.com>
In-Reply-To: <5698b996-e23d-49f7-af37-645d4784dc67@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 7 May 2025 06:26:44 +0100
X-Gm-Features: ATxdqUFn8NwqX3UC35Il2ow7r5NWLk7fF0j763oN-8W92QyBIe5LKhRmh4RMBIQ
Message-ID: <CACHz=ZjKzNmtvCK6eQGRA5gus+KPgDAP_depoPzdYpHMDM3rJg@mail.gmail.com>
Subject: Re: [PATCH 1/4] xen/lib: Export additional sha256 functions
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ross Lagerwall <ross.lagerwall@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 11:17=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 06/05/2025 3:05 pm, Andrew Cooper wrote:
> > On 06/05/2025 2:56 pm, Frediano Ziglio wrote:
> >> diff --git a/xen/include/xen/sha2.h b/xen/include/xen/sha2.h
> >> index 47d97fbf01..ea8bad67e4 100644
> >> --- a/xen/include/xen/sha2.h
> >> +++ b/xen/include/xen/sha2.h
> >> @@ -9,6 +9,16 @@
> >>
> >>  #define SHA2_256_DIGEST_SIZE 32
> >>
> >> +struct sha2_256_state {
> >> +    uint32_t state[SHA2_256_DIGEST_SIZE / sizeof(uint32_t)];
> >> +    uint8_t buf[64];
> >> +    size_t count; /* Byte count. */
> >> +};
> >> +
> >> +void sha2_256_init(struct sha2_256_state *s);
> >> +void sha2_256_update(struct sha2_256_state *s, const void *msg,
> >> +                     size_t len);
> >> +void sha2_256_final(struct sha2_256_state *s, void *_dst);
> >>  void sha2_256_digest(uint8_t digest[SHA2_256_DIGEST_SIZE],
> >>                       const void *msg, size_t len);
> > sha2_256_digest() is unlike the others as it holds sha2_256_state
> > internally.  I'd suggest having all of the additions below this point,
> > which group them more nicely.
> >
> > Can fix on commit.  Otherwise LGTM.
>
> Not quite.  Now that sha2_256_final() is exported, it should have a
> proper type for  _dst.  I've folded:
>
> diff --git a/xen/include/xen/sha2.h b/xen/include/xen/sha2.h
> index 0d55fe640431..cb30e8f8d77c 100644
> --- a/xen/include/xen/sha2.h
> +++ b/xen/include/xen/sha2.h
> @@ -21,6 +21,7 @@ struct sha2_256_state {
>  void sha2_256_init(struct sha2_256_state *s);
>  void sha2_256_update(struct sha2_256_state *s, const void *msg,
>                       size_t len);
> -void sha2_256_final(struct sha2_256_state *s, void *_dst);
> +void sha2_256_final(struct sha2_256_state *s,
> +                    uint8_t digest[SHA2_256_DIGEST_SIZE]);
>
>  #endif /* XEN_SHA2_H */
> diff --git a/xen/lib/sha2-256.c b/xen/lib/sha2-256.c
> index 896a257ed9b7..08ef7011a1c3 100644
> --- a/xen/lib/sha2-256.c
> +++ b/xen/lib/sha2-256.c
> @@ -171,9 +171,9 @@ void sha2_256_update(struct sha2_256_state *s, const
> void *msg,
>      memcpy(s->buf + partial, msg, len);
>  }
>
> -void sha2_256_final(struct sha2_256_state *s, void *_dst)
> +void sha2_256_final(struct sha2_256_state *s, uint8_t
> digest[SHA2_256_DIGEST_SIZE])
>  {
> -    uint32_t *dst =3D _dst;
> +    uint32_t *dst =3D (uint32_t *)digest;

That is we are never going to support architectures with unaligned
memory access.

>      unsigned int i, partial =3D s->count & 63;
>
>      /* Start padding */
>
> in too, which is compatible with the rest of the series too.
>
> ~Andrew

I'll send an updated series with these and all the commits (mail server iss=
ues).

Frediano


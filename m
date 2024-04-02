Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9D7895223
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 13:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700106.1092711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrcXl-0002Vu-Ez; Tue, 02 Apr 2024 11:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700106.1092711; Tue, 02 Apr 2024 11:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrcXl-0002UN-Bu; Tue, 02 Apr 2024 11:43:09 +0000
Received: by outflank-mailman (input) for mailman id 700106;
 Tue, 02 Apr 2024 11:43:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5be=LH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rrcXj-0002UG-P1
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 11:43:07 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2abe3694-f0e6-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 13:43:04 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-513da1c1f26so6057286e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 04:43:04 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a05651210d100b00515c8ff6f52sm1665091lfg.229.2024.04.02.04.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 04:43:02 -0700 (PDT)
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
X-Inumbo-ID: 2abe3694-f0e6-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712058184; x=1712662984; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a8s0RjM0WUf9GshdCi5kY8Xc1eX6585w+7ggOrU4MWc=;
        b=cC9lcjUTGGSwg1xjpWTwkLA3GEshOWkGq6A1wdP05S/nRGpsNlDSj3hMzpL3kq7eC9
         iP2nqaAFp4ODAJlwHINPLQCg1s4eKjR570Z+mslp9CNRkIPrzHuUTGH0cYoFGAVHGKyZ
         AI0N9BqGaoExqjFrzY62quTWLqybR9vRPAQNAddbhbkkKe7vMYoL2+Zp+qGemzKH1dcJ
         ZKb51X687plTiY9N9nuTKfnDCbwSAlcufqdM0oTJyfjmxTsEk2GmR/PPcLYflEH/tkQ3
         ZnuHPH3PgQQC4pzie4ykyo/XRVOsEqOj8HkAStoIf17IHtc0x7bQlEi5PENX4Ho9Dz3A
         S30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712058184; x=1712662984;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a8s0RjM0WUf9GshdCi5kY8Xc1eX6585w+7ggOrU4MWc=;
        b=aomfo+XXPqN6BG6bEcnsQunCCHOuCmpdxCWlTZwOUjrhgHqsHD4iMx7+jrNxonkNNp
         mMfHzPgA0fVpzYS5H3DKLW1JygQObboug6NqNNy3PCNuU/Wg/1/eRI0ovvqxwB7G9tWy
         5sQzYbFS0Q1jOTGf7Yo1sg23+4oadD0RTRUQglazERJRTbGNgQYPIzEW0CxQJ9NTDDUK
         jeWKyGFegsrSmxlHpJ3DN1Qjhqucps43Zmvs28z3XWapnKvKeXrsNkNSyXFn4CzV1TCe
         Ei5IB3n6TIpPc+chjtUEjpKHyO8Cq+W6vNckgdU4rsyTlk7LEg6+3+i2r4CpwliBaIr1
         43Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWxbYCel36JqaFes6WQQdcOO6DpwrJyttVpb5BWQP4OcOTk8ShXNbkZ7KHf19xHlcFqesKLNOC8jgk0HBjU4DQUHPtavm9zj+TMGKiv3MY=
X-Gm-Message-State: AOJu0YzUtQxc2kZiKuZlGF6WwerYW3YVLRSyVupeJ9RhYAI+H+ZENfn/
	nkg+lTDMgrvpAa0zTfYpY6QM07hVPVucutluEnVxf4uqFdfNN5wY
X-Google-Smtp-Source: AGHT+IG0TIBQYQLpIPOx+0onSxfgTfXaRs6Gv7jqr9EzL+GE0KlH0xUD67UjzazwSjT8HrNuL3LiDA==
X-Received: by 2002:a05:6512:401a:b0:515:d196:7aeb with SMTP id br26-20020a056512401a00b00515d1967aebmr9775922lfb.49.1712058183780;
        Tue, 02 Apr 2024 04:43:03 -0700 (PDT)
Message-ID: <87a51cb7a2d663f292ccddbba78e41fd6a1c12db.camel@gmail.com>
Subject: Re: [PATCH v6 08/20] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 02 Apr 2024 13:43:01 +0200
In-Reply-To: <6f73368c-ea73-4d86-a6a1-8f9784c4b01f@suse.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
	 <bf65ce1ff5f683cc6b638fa7de0c54d5e0aead33.1710517542.git.oleksii.kurochko@gmail.com>
	 <6f73368c-ea73-4d86-a6a1-8f9784c4b01f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-03-21 at 13:07 +0100, Jan Beulich wrote:
> > + * If resulting 4-byte access is still misalgined, it will fault
> > just as
> > + * non-emulated 4-byte access would.
> > + */
> > +#define emulate_xchg_1_2(ptr, new, lr_sfx, sc_sfx) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 uint32_t *aligned_ptr =3D (uint32_t *)((unsigned lo=
ng)ptr &
> > ~(0x4 - sizeof(*(ptr)))); \
> > +=C2=A0=C2=A0=C2=A0 unsigned int new_val_pos =3D ((unsigned long)(ptr) =
& (0x4 -
> > sizeof(*(ptr)))) * BITS_PER_BYTE; \
>=20
> You parenthesize ptr here correctly, but not in the line above.
>=20
> Instead of "_pos" in the name, maybe better "_bit"?
>=20
> Finally, here and elsewhere, please limit line length to 80 chars.
> (Omitting
> the 0x here would help a little, but not quite enough. Question is
> whether
> these wouldn't better be sizeof(*aligned_ptr) anyway.)

I'm unsure if using sizeof(*aligned_ptr) is correct in this context.
The intention was to determine the position for the value we're
attempting to exchange.

Let's consider a scenario where we have 0xAABBCCDD at address 0x6. Even
though this would result in misaligned access, I believe new_val_pos
should still be calculated accurately. Let's say we want to exchange
two bytes (AABB) with FFFF.

With the current implementation, we would calculate:
0x6 & 2 =3D 2 * 8 =3D 16, which is the value on which the new value should
be shifted.

However, if this value is then ANDed with sizeof(*aligned_ptr):
0x6 & 4 =3D 6 * 8 =3D 48, which is not the expected value.

Am I overlooking something?

~ Oleksii



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8803A9D96D6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 12:58:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843669.1259296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFuC0-0002N3-CK; Tue, 26 Nov 2024 11:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843669.1259296; Tue, 26 Nov 2024 11:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFuC0-0002LD-9E; Tue, 26 Nov 2024 11:57:20 +0000
Received: by outflank-mailman (input) for mailman id 843669;
 Tue, 26 Nov 2024 11:57:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+J1p=SV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tFuBz-0002L7-Dx
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 11:57:19 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93a578d1-abed-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 12:57:14 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53deeb6d986so207341e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 03:57:14 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2499f27sm1982798e87.272.2024.11.26.03.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 03:57:13 -0800 (PST)
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
X-Inumbo-ID: 93a578d1-abed-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmMiLCJoZWxvIjoibWFpbC1sZjEteDEyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjkzYTU3OGQxLWFiZWQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjIyMjM0LjU2ODY4LCJzZW5kZXIiOiJvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732622234; x=1733227034; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RF5Fb5nT/w300UuK/JeTu1eB3qVWFMEKYzZKmk3KXrI=;
        b=F3Swpg8bFNPit904o4gSEJPSK2PCbAMYCbpPWF3L8d0AyISoDVMr+VqoQSrvNjkJQ6
         X1KstoyheU1JGB8doRfPYcCAckPwuH/Mo/cf1v+nXSi/5Pr549cYUUato83D5c0RmkxX
         Od81QEoxsjC7Z/5v6s4W3tRFsOvZqw7f91oXm2nSfs0wdIfKJKD3XHNAlx2lLe9iQIpu
         pR1C1rrrWKgveOzmqNLsZCfQKkZ+dMJw4MsExXJLHEk3sNzkzpR3CLnnHffnY/wm9FCZ
         iAvTAia4kFXgAhBlhSi/Wxwh4VB92ZBbb9s4jiUCxJbS9suG0TpLjCike+XtGwuvB1Yq
         SpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732622234; x=1733227034;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RF5Fb5nT/w300UuK/JeTu1eB3qVWFMEKYzZKmk3KXrI=;
        b=toKFjlO0v0/FFtu2bJ7hXOQmeRpI2UO/ksEp09OPTtxTZQdNrq6Z5T7P20MYJcK51m
         FUpdUWB1wDrJtuo2ova4iKXAE/r/vxuhlxox/is5OAdcaEv3Kxn8RlRN9mX+DrPAhoNX
         75i3UHvlG3+H2ZU+4Kcr9U3JfUbxjnjynoc6M+ATeFait0JRhLZlYZj22Wi6grkse7KC
         bq5eNJtWq/tPjTYJ939Fu360QpqmygA2zSLHimsseuPT/NA/7IaUdf36RU7gfvXtO4yE
         8aBwq+C7d/Bhpdc/jRUuqw9y4Cd6+zFaIUMwPLVlg5Zap6ECCJ+OJm2zZQFd/yFWEFRg
         hqEA==
X-Forwarded-Encrypted: i=1; AJvYcCXRtX9hDE+PFTcWPa/YpzT6G3uIvvSoXR1lxkwUAR0s9mTeJiQ+DOJioxdWRFUamYLDepajm1+et+Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxENVYeHKvJLTPr2sD8UoECNxC2fYYa+aSsARYUJH2SGF+s1KTj
	0D2VuSxZj4bryYRVnCgkcL5BdC1uxjZe+aiM+oiKHXenMk7S2knl
X-Gm-Gg: ASbGnctok+eR7uw2SDYPMFSrJqqeRKg/2ZoVHzbnDXih1twHtfQ9rtZok9/jV52E3S9
	yI7E2JhVXHW7qwGBPH/iOtkI0cX4bFKUdY8vqfN4+IYg91XlGjTP9L//9GHtiukSiWiSFRshqgx
	lpbYbUoQO29L6P+yrCbGDJsGt9YgXs3t9Du7RnGg6NbQUmifh4Y1ZqbNWKxzmHxF6L5j/Pj8Qf1
	s2V+zxSVlnJfL4AyMBDZVJR5b6x0ldVmMUbtXPbzLJXXFfhvqN4j/d+k9B8LSo=
X-Google-Smtp-Source: AGHT+IF+bmpM7o92/Av8m062751BH9J93WQZBFb7AIvc3foIpxfK44shHTtyGmWq1DXFRAKlY08b6A==
X-Received: by 2002:a05:6512:39c3:b0:53d:d957:9f92 with SMTP id 2adb3069b0e04-53dd9579fd5mr7372308e87.9.1732622233789;
        Tue, 26 Nov 2024 03:57:13 -0800 (PST)
Message-ID: <360ce2bf4c418cf8f5c4318435ca3308477a07b6.camel@gmail.com>
Subject: Re: [PATCH v6 1/3] xen/riscv: introduce setup_mm()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman	
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper	 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini	 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 26 Nov 2024 12:57:12 +0100
In-Reply-To: <fb5c12b0-5bc1-4129-a4e9-9716ffd4685c@suse.com>
References: <cover.1731672668.git.oleksii.kurochko@gmail.com>
	 <1ebb209f191e3e2323840acfe3714a597aa7be6c.1731672668.git.oleksii.kurochko@gmail.com>
	 <fb5c12b0-5bc1-4129-a4e9-9716ffd4685c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Mon, 2024-11-25 at 16:49 +0100, Jan Beulich wrote:
> On 15.11.2024 13:47, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -90,6 +90,7 @@
> > =C2=A0#define DIRECTMAP_SLOT_START=C2=A0=C2=A0=C2=A0 200
> > =C2=A0#define DIRECTMAP_VIRT_START=C2=A0=C2=A0=C2=A0 SLOTN(DIRECTMAP_SL=
OT_START)
> > =C2=A0#define DIRECTMAP_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (SLOTN(DIRECTMAP_SLOT_END) -
> > SLOTN(DIRECTMAP_SLOT_START))
> > +#define DIRECTMAP_VIRT_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (DIRECTMAP_VI=
RT_START +
> > DIRECTMAP_SIZE - 1)
>=20
> While it is of course okay to have this value be inclusive (matching
> FRAMETABLE_VIRT_END), I'd like to point out that
> - on x86 *_END are exclusive (i.e. there's some risk of confusion),
> - RISC-V's DIRECTMAP_SIZE appears to assume DIRECTMAP_SLOT_END is
> =C2=A0 exclusive, when from all I can tell (in particular the table in th=
e
> =C2=A0 earlier comment) it's inclusive.
Agree, overlooked that DIRECTMAP_SIZE is exclusive,  the value should
correspond to the table thereby DIRECTMAP_SIZE should be inclusive and
defined as:
#define DIRECTMAP_SIZE (SLOTN(DIRECTMAP_SLOT_END + 1) -
SLOTN(DIRECTMAP_SLOT_START))

and then DIRECTMAP_VIRT_END could be left as it is defined now:
   #define DIRECTMAP_VIRT_END      (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE
   - 1)

Regarding the first one point. Do you think it would be better to
follow x86 approach and have *_END to be exclusive? Then
FRAMETABLE_VIRT_END should be updated too?

>=20
> > @@ -25,8 +27,12 @@
> > =C2=A0
> > =C2=A0static inline void *maddr_to_virt(paddr_t ma)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > -=C2=A0=C2=A0=C2=A0 return NULL;
> > +=C2=A0=C2=A0=C2=A0 unsigned long va_offset =3D maddr_to_directmapoff(m=
a);
> > +
> > +=C2=A0=C2=A0=C2=A0 ASSERT(va_offset >=3D DIRECTMAP_VIRT_START -
> > directmap_virt_start);
> > +=C2=A0=C2=A0=C2=A0 ASSERT(va_offset <=3D DIRECTMAP_VIRT_END -
> > directmap_virt_start);
> > +
> > +=C2=A0=C2=A0=C2=A0 return (void *)(directmap_virt_start + va_offset);
> > =C2=A0}
>=20
> If you added in directmap_virt_start right when setting the variable,
> you'd simplify the assertions. The unsigned long arithmetic is going
> to
> be okay either way. (The variable may want renaming if doing so,
> perhaps
> simply to "va".)

Just to be sure that I understand your point correct. Do you mean the
following:
    static inline void *maddr_to_virt(paddr_t ma)
    {
   -    unsigned long va_offset =3D maddr_to_directmapoff(ma);
   +    unsigned long va =3D maddr_to_directmapoff(ma) +
   directmap_virt_start;
   =20
   -    ASSERT(va_offset >=3D DIRECTMAP_VIRT_START -
   directmap_virt_start);
   -    ASSERT(va_offset <=3D DIRECTMAP_VIRT_END - directmap_virt_start);
   +    ASSERT(va >=3D DIRECTMAP_VIRT_START);
   +    ASSERT(va <=3D DIRECTMAP_VIRT_END);
   =20
   -    return (void *)(directmap_virt_start + va_offset);
   +    return (void *)va;
    }

Thanks.

~ Oleksii

>=20
> Preferably with the latter adjustment and pending clarification on
> the
> intentions wrt the comment further up
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> Jan



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6E18B36E5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 14:10:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712740.1113550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0KOa-0005vA-7O; Fri, 26 Apr 2024 12:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712740.1113550; Fri, 26 Apr 2024 12:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0KOa-0005s8-4X; Fri, 26 Apr 2024 12:09:40 +0000
Received: by outflank-mailman (input) for mailman id 712740;
 Fri, 26 Apr 2024 12:09:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mvt6=L7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s0KOY-0005s2-HF
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 12:09:38 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d984b998-03c5-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 14:09:36 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a58c0a05a39so191601666b.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 05:09:36 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a1709065a9200b00a58a4ccf970sm2202300ejq.103.2024.04.26.05.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 05:09:35 -0700 (PDT)
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
X-Inumbo-ID: d984b998-03c5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714133376; x=1714738176; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SRZOUcT779OlqipcbFxDIF3QOgKALsWh+prU8uKwlPs=;
        b=Fv69MHxEBl62Y4eC2IuKAMtkdDRS+7u1xR3v7Ml+hH6xf4Uf43+VFbu0Vy3n+eO/fx
         F6KMN+8a5cB89BKgraeQRi7+BhD2ZJkEALfRHcise7ejDla5i+OiXaQLyiglHREGcVZX
         x7tzjJXr5ANGpml+9nygZ/05iV2MPZSS3OU6CIVRtfA16Kzlv6zBY/G2mtL0Cd1xwxDI
         cjVOuhsEQlhIYMpXurKBGiR4fxHCyyVu8V0Ha/qIURePBn7agCfEnWQ+opH0ZFsC8dU4
         XGqrtXR3n4SxFkoag/I0M62bVh7Z44M2btEZ7nN80me8oF3CPx76bVzYCvtuSufyP0e6
         HnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714133376; x=1714738176;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SRZOUcT779OlqipcbFxDIF3QOgKALsWh+prU8uKwlPs=;
        b=Gkmhwy9fzLpxalnJ3WOOENIevRhXzHCaJIWwE/mwdS250pKIMHt1H5iTeZpkuT/6LQ
         EoqnWXbIot8E2K/rBJLLIf9EDpmwo7d4oGDLFf8ZwqylRB53tQKrrCQnpAjEQyw04xCV
         5X2cApmE7I2GeeyCTrgf0najxlYHhCzJSNrs4uOUpbv9hZxfTD/moKy9Wb/Sv2TKM9A6
         H6ntCMj/7VU1MTCMld700sD9MsKIrECjoTaMUqTGIqFdNjzuMHA8QVOOz5k6PlxxeibS
         5NpkTrknBwEaIQ7waFmSp5UgtCWMYLZaBqXvpL9Vjrh+g+rt2bn7cGnyWf5lYeeNwbuQ
         Okhw==
X-Forwarded-Encrypted: i=1; AJvYcCU3H7Kjp3Jeg4ZOcIXPwcnZQrtPvppa35wS5FdqCP6K8CE3eixlN70MWblRESiXiliZpI99ifuwtHBL7396TZ56hUBeM2IaXRRMLenAtWU=
X-Gm-Message-State: AOJu0Yzzi/wCPgBINDRZznv90IDu7jwze5FiH771Fq4OZxsoYslnxxF+
	0Eg4YOeB0MgfLVbCniSmxDK9755cPsXxB6frE+pm3XE4Gy+lybpA
X-Google-Smtp-Source: AGHT+IH1GebaF9+nk+JH3V3VEMXmNLFOEZnDZa+g1geF+/5Bi9KIbmBvAPkSyzDK/OZ7TpqjE/K5kA==
X-Received: by 2002:a17:907:7f27:b0:a58:9707:11c with SMTP id qf39-20020a1709077f2700b00a589707011cmr2120189ejc.62.1714133375620;
        Fri, 26 Apr 2024 05:09:35 -0700 (PDT)
Message-ID: <17f0b05b2f2da1b13e8ca3ab4e20b210aa0f8480.camel@gmail.com>
Subject: Re: [PATCH v8 03/17] xen/bitops: implement fls{l}() in common logic
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Date: Fri, 26 Apr 2024 14:09:34 +0200
In-Reply-To: <d1f546dc-35bd-47f9-89be-582660d23ec1@suse.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
	 <60bc710b990ed1d45741888df7e97cf25d150e61.1713347222.git.oleksii.kurochko@gmail.com>
	 <a6245e9e-a156-4b17-8695-e072915fe78b@suse.com>
	 <fb1a228b1bd58d17d7836c3413d3b0a8a9602978.camel@gmail.com>
	 <d1f546dc-35bd-47f9-89be-582660d23ec1@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Fri, 2024-04-26 at 12:51 +0200, Jan Beulich wrote:
> On 26.04.2024 10:21, Oleksii wrote:
> > On Thu, 2024-04-25 at 17:44 +0200, Jan Beulich wrote:
> > > On 17.04.2024 12:04, Oleksii Kurochko wrote:
> > > > Return type was left 'int' because of the following compilation
> > > > error:
> > > >=20
> > > > ./include/xen/kernel.h:18:21: error: comparison of distinct
> > > > pointer
> > > > types lacks a cast [-Werror]
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 18 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (void) (&_x =3D=3D &_y);=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~
> > > > =C2=A0=C2=A0=C2=A0 common/page_alloc.c:1843:34: note: in expansion =
of macro
> > > > 'min'
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 1843 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned int inc_order =3D min(MAX_ORDER,
> > > > flsl(e
> > > > - s) - 1);
> > >=20
> > > Apart from this I'm okay with this patch, assuming Andrew's won't
> > > change in
> > > any conflicting way. As to the above - no, I don't see us having
> > > ffs() / ffsl()
> > > returning unsigned int, fls() / flsl() returning plain int. Even
> > > more
> > > so that,
> > > given the LHS variable's type, an unsigned quantity is really
> > > meant
> > > in the
> > > quoted code.
> > If I understand you correctly, it's acceptable for fls() / flsl()
> > to
> > return 'int'. Therefore, I can update the commit message by
> > removing
> > the part mentioning the compilation error, as it's expected for
> > fls() /
> > flsl() to return 'int'. Is my understanding correct?
>=20
> No. I firmly object to ffs() and fls() being different in their
> return
> types. I'm sorry, I realize now that my earlier wording was ambiguous
> (at least missing "but" after the comma).
Thanks for clarifying.

I can change return type of fls() / flsl() to 'unsingned int' to be the
same as return type of ffs() / ffsl(), but then it will be needed to
add a cast in two places:
   --- a/xen/common/page_alloc.c
   +++ b/xen/common/page_alloc.c
   @@ -1842,7 +1842,7 @@ static void _init_heap_pages(const struct
   page_info *pg,
             * Note that the value of ffsl() and flsl() starts from 1
   so we need
             * to decrement it by 1.
             */
   -        unsigned int inc_order =3D min(MAX_ORDER, flsl(e - s) - 1);
   +        unsigned int inc_order =3D min((unsigned int)MAX_ORDER,
   flsl(e - s) - 1);
   =20
            if ( s )
                inc_order =3D min(inc_order, ffsl(s) - 1U);
   @@ -2266,7 +2266,7 @@ void __init xenheap_max_mfn(unsigned long mfn)
        ASSERT(!first_node_initialised);
        ASSERT(!xenheap_bits);
        BUILD_BUG_ON((PADDR_BITS - PAGE_SHIFT) >=3D BITS_PER_LONG);
   -    xenheap_bits =3D min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS);
   +    xenheap_bits =3D min(flsl(mfn + 1) - 1 + PAGE_SHIFT, (unsigned
   int)PADDR_BITS);
        printk(XENLOG_INFO "Xen heap: %u bits\n", xenheap_bits);
    }
  =20
If it looks okay, then I'll do that in the next patch version.

~ Oleksii


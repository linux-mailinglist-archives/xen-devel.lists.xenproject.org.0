Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4AD899C24
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 13:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701208.1095475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsi8c-00031b-Do; Fri, 05 Apr 2024 11:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701208.1095475; Fri, 05 Apr 2024 11:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsi8c-0002yW-AY; Fri, 05 Apr 2024 11:53:42 +0000
Received: by outflank-mailman (input) for mailman id 701208;
 Fri, 05 Apr 2024 11:53:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZLbS=LK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rsi8a-0002yO-Vi
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 11:53:41 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24368570-f343-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 13:53:39 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-516d756eb74so124730e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 04:53:39 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a056512060100b00515c9a35d23sm171865lfe.232.2024.04.05.04.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 04:53:37 -0700 (PDT)
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
X-Inumbo-ID: 24368570-f343-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712318018; x=1712922818; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wj1enDSUhgAmwFQjagpdiNeovZ0SQDVJ8kfeOk2YfKA=;
        b=HO007uBUvz84TpcK1HNaYCzEnBQna/cR55jFgxhsjYeqy77ub1rsSR8qJtLwBBevvR
         E1aUWn5bjpK68dzLWogkItotYq9OEeLtrcUILn5hRW1+uJJC/R3JgMVZnKJ+X344BZg7
         F+IlnWFdjmPVchKnk8aK/5Jjx7WSNFsqLpdyWA4qD78hstPkuAC1eqqwaug8Zxz6WlED
         4OqS9/DnAAOK393ocsKG05Q/R+cAdv0qEuvNM5m6C0mCHP5CTVtkrVWf5pnIAkWYwBv0
         EGZU9HH+9kFGlBtn79hcRCtldIo1oR9NirRAH3Bz+up13xQwVxnWD5JF4BpH7w5zQMrH
         NMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712318018; x=1712922818;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wj1enDSUhgAmwFQjagpdiNeovZ0SQDVJ8kfeOk2YfKA=;
        b=ERYSKQE5aNX/FDpeTiJbDPDy/S9fUiX4d52REG0LD0Ubr70wrntEbjEhncuX/ayRmp
         grLB0wyFUCYOwscs+A0FEySuR2ldSBfvzWLKDoycVU4YuuMj3rNtd1xQwDngea49Chxb
         E12vvFyl4yDJUyC1sjdTrU354DM8b0WwflM00wmsy0agm3cATtRw60jVr/MMGiiV4Y4G
         /MA7YSlDiyIH7q1yZohhsZiUAeo7P8V2xr8tGh26CVP+CGDavGcMYQUomqdoNoHw8eTP
         6mgbqTDzvzLJkqsY//5yLsrSqwmwgUq6e+7+mUu+0bvJhTzF+dn574gcanW6bp9kbv+5
         U1Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXuju56qxY1v+0N/CbtqInEU+62t1quitv2Da6+2H2mWcqodo1JhKnLWHz51lfVYnk2FERttdA8hMtELSeCbSvzRoZlij4h+kfRHjLqyno=
X-Gm-Message-State: AOJu0Yz1yde64tyDbk4XnJy+7bmoAuXmLsq3jUMGKuz4yGvGUj+GlpAJ
	aTZSkBE0AS8EcWBJI0hfTXnlJjqRLczNG1/0bPWezhd42olh/OK5
X-Google-Smtp-Source: AGHT+IGKOR4HSSHDBT96wcK89BHEyzzhXjS4+SVVvIXZTiH4XngPK5Vs0vwB+hTK4ZUIO548zma6ZQ==
X-Received: by 2002:a19:9155:0:b0:516:ce40:14a6 with SMTP id y21-20020a199155000000b00516ce4014a6mr722908lfj.1.1712318018205;
        Fri, 05 Apr 2024 04:53:38 -0700 (PDT)
Message-ID: <03cb48d41f93b9a5255828474cdf333106aee2f9.camel@gmail.com>
Subject: Re: [PATCH v7 04/19] xen: introduce generic non-atomic test_*bit()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
 <ross.lagerwall@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>,  Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Date: Fri, 05 Apr 2024 13:53:36 +0200
In-Reply-To: <fda609e5-3ceb-432c-aaae-80b712013a6c@suse.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
	 <ff6922206ab5476df907e2a05255663865f07301.1712137031.git.oleksii.kurochko@gmail.com>
	 <aabb1d9a-3910-479e-858d-a11777873ef5@suse.com>
	 <5ee906c53e2d4a966fa6be3be50caa19c3c164a2.camel@gmail.com>
	 <4ba7c962-a635-4a7d-8e03-093361cc6353@suse.com>
	 <c92ef420468fdf45a878efda37c582c0cab2332f.camel@gmail.com>
	 <edd36d22-a2da-4e38-a586-14c742da18f7@suse.com>
	 <024957c9a5347b38639aa859d316dce7492f1eef.camel@gmail.com>
	 <fda609e5-3ceb-432c-aaae-80b712013a6c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Fri, 2024-04-05 at 10:05 +0200, Jan Beulich wrote:
> On 05.04.2024 09:56, Oleksii wrote:
> > On Fri, 2024-04-05 at 08:11 +0200, Jan Beulich wrote:
> > > On 04.04.2024 18:24, Oleksii wrote:
> > > > On Thu, 2024-04-04 at 18:12 +0200, Jan Beulich wrote:
> > > > > On 04.04.2024 17:45, Oleksii wrote:
> > > > > > On Thu, 2024-04-04 at 15:22 +0200, Jan Beulich wrote:
> > > > > > > On 03.04.2024 12:19, Oleksii Kurochko wrote:
> > > > > > > > --- a/xen/include/xen/bitops.h
> > > > > > > > +++ b/xen/include/xen/bitops.h
> > > > > > > > @@ -65,10 +65,164 @@ static inline int
> > > > > > > > generic_flsl(unsigned
> > > > > > > > long
> > > > > > > > x)
> > > > > > > > =C2=A0 * scope
> > > > > > > > =C2=A0 */
> > > > > > > > =C2=A0
> > > > > > > > +#define BITOP_BITS_PER_WORD 32
> > > > > > > > +/* typedef uint32_t bitop_uint_t; */
> > > > > > > > +#define bitop_uint_t uint32_t
> > > > > > >=20
> > > > > > > So no arch overrides permitted anymore at all?
> > > > > > Not really, I agree that it is ugly, but I expected that
> > > > > > arch
> > > > > > will
> > > > > > use
> > > > > > undef to override.
> > > > >=20
> > > > > Which would be fine in principle, just that Misra wants us to
> > > > > avoid
> > > > > #undef-s
> > > > > (iirc).
> > > > Could you please give me a recommendation how to do that
> > > > better?
> > > >=20
> > > > The reason why I put this defintions before inclusion of
> > > > asm/bitops.h
> > > > as RISC-V specific code uses these definitions inside it, so
> > > > they
> > > > should be defined before asm/bitops.h; other option is to
> > > > define
> > > > these
> > > > definitions inside asm/bitops.h for each architecture.
> > >=20
> > > Earlier on you had it that other way already (in a different
> > > header,
> > > but the principle is the same): Move the generic definitions
> > > immediately
> > > past inclusion of asm/bitops.h and frame them with #ifndef.
> > It can be done in this way:
> > xen/bitops.h:
> > =C2=A0=C2=A0 ...
> > =C2=A0=C2=A0 #include <asm/bitops.h>
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 #ifndef BITOP_TYPE
> > =C2=A0=C2=A0 #define BITOP_BITS_PER_WORD 32
> > =C2=A0=C2=A0 /* typedef uint32_t bitop_uint_t; */
> > =C2=A0=C2=A0 #define bitop_uint_t uint32_t
> > =C2=A0=C2=A0 #endif
> > =C2=A0=C2=A0 ...
> > =C2=A0=C2=A0=20
> > But then RISC-V will fail as it is using bitop_uint_t inside
> > asm/bitops.h.
> > So, at least, for RISC-V it will be needed to add asm/bitops.h:
> > =C2=A0=C2=A0 #define BITOP_BITS_PER_WORD 32
> > =C2=A0=C2=A0 /* typedef uint32_t bitop_uint_t; */
> > =C2=A0=C2=A0 #define bitop_uint_t uint32_t
> > =C2=A0=C2=A0=20
> >=20
> > It seems to me that this breaks the idea of having these macro
> > definitions generic, as RISC-V will redefine BITOP_BITS_PER_WORD
> > and
> > bitop_uint_t with the same values as the generic ones.
>=20
> I don't follow. Right now patch 7 has
>=20
> #undef BITOP_BITS_PER_WORD
> #undef bitop_uint_t
>=20
> #define BITOP_BITS_PER_WORD BITS_PER_LONG
> #define bitop_uint_t unsigned long
>=20
> You'd drop the #undef-s and keep the #define-s. You want to override
> them
> both, after all.
>=20
> A problem would arise for _another_ arch wanting to use these
> (default)
> types in its asm/bitops.h. Which then could still be solved by having
> a
> types-only header.
This problem arise now for Arm and PPC which use BITOP_BITS_PER_WORD
inside it. Then it is needed to define BITOP_BITS_PER_WORD=3D32 in
asm/bitops.h for Arm and PPC. If it is okay, then I will happy to
follow this approach.

>  Recall the discussion on the last summit of us meaning
> to switch to such a model anyway (perhaps it being xen/types/bitops.h
> and
> asm/types/bitops.h then), in a broader fashion? IOW for now you could
> use
> the simple approach as long as no other arch needs the types in its
> asm/bitops.h. Later we would introduce the types-only headers, thus
> catering for possible future uses.
Do we really need asm/types/bitops.h? Can't we just do the following in
asm/bitops.h:
  #ifndef BITOP_TYPE
  #include <xen/types/bitops.h>
  #endif

~ Oleksii


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255BD899724
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 09:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701141.1095314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rseRO-00025w-EN; Fri, 05 Apr 2024 07:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701141.1095314; Fri, 05 Apr 2024 07:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rseRO-00022p-Bh; Fri, 05 Apr 2024 07:56:50 +0000
Received: by outflank-mailman (input) for mailman id 701141;
 Fri, 05 Apr 2024 07:56:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZLbS=LK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rseRN-00022i-7D
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 07:56:49 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dc121ec-f322-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 09:56:48 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-516cdb21b34so2041161e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 00:56:48 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a05651234d800b00513cb309c8asm123566lfr.52.2024.04.05.00.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 00:56:46 -0700 (PDT)
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
X-Inumbo-ID: 0dc121ec-f322-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712303807; x=1712908607; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=86+3ksymT0WymzgVPgyvyIRV8ivqHVkzoCDvgvDOgfk=;
        b=cnwt2js4Yd/b1YPq2m+M/3TbMhpGAP6kdYnaBZ3PDkqh3zsu52u7HA2H5S9Nkuggrh
         QrKqPO+aG253dHVfBoqSeKAjBQQ76f7gB7RFQ/bOUTsVr11JVc64tWA7Nryeq3EnHyzG
         NdCVIf5XEVpyOzipws42hg11jb6ZrY1e18U5MD5CbMI7FVwxBAI1T5kquhUIZYaldD5+
         tTziQLoRhOf4CvkCij9SxmytK6zgZi1Aij80+OxLpFEp+AOjt3LYNiHXbRnv7rwI+eXl
         muYZPmw+j5JdBzzZU82VG1ulOdzlpYV5fmj9lOQ+h1Gws4vzZaFuJCKFn2+G9dhATUna
         w/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712303807; x=1712908607;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86+3ksymT0WymzgVPgyvyIRV8ivqHVkzoCDvgvDOgfk=;
        b=DDCw+d4SASihRPdVOppH/mIdSFqI83RYcxKsbay6JXdM0LpvZZHCq6Fm4OBWMVz/aq
         e7CoWY6f8xZLd2APJ0xA9cVnwveJo1iCSTPM8LMGlknYwMPacygceXiSzf3TrgzCrixg
         P44SR5uUTGAbJNEipquJDhv8tSx2e27sOOdH8kyjGSJyZxoC5dmD82vrm/mSM/XQ5Vfl
         as52I5SBLfCpjD9Ut9m+SiI1qVoBH7RDIosI4XE638j+YO369pJBBW7FWj5DTnOUlVXG
         UrWh3C2pb4lLE1EKq9y1M7upYBjaxOJ4fAfJf6tb+99Ym2JwwHTAlpZN2DaYmJOxMrwo
         KB0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6/dp2BZxlf1IjgnslFpjguYo1V7fGnIpJXz4wPpSC2WE6xMdUpru9FfrzFAgf70mP6L0WuqRvtEsT8TjroiQi2vmKYenjNNOawHMOMFY=
X-Gm-Message-State: AOJu0Ywy1xxRO0Z3Cb9B/8sE/y4cNrnJ+BogTvYG451w2xbTtkEolXNn
	Fx8EKq+GTOZfSzLPaWw+tTEiErhWAVTjt+IeX9BLeYKwMNPHPkRB
X-Google-Smtp-Source: AGHT+IFMCS9JLfQuqWSGB7LEMZw7tRBHu9LoN+z8gmeUl5YyYdwS3HV2ll+RtobfzgncFzLz5KS/Mg==
X-Received: by 2002:a19:8c0c:0:b0:516:d126:719a with SMTP id o12-20020a198c0c000000b00516d126719amr423931lfd.9.1712303807267;
        Fri, 05 Apr 2024 00:56:47 -0700 (PDT)
Message-ID: <024957c9a5347b38639aa859d316dce7492f1eef.camel@gmail.com>
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
Date: Fri, 05 Apr 2024 09:56:46 +0200
In-Reply-To: <edd36d22-a2da-4e38-a586-14c742da18f7@suse.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
	 <ff6922206ab5476df907e2a05255663865f07301.1712137031.git.oleksii.kurochko@gmail.com>
	 <aabb1d9a-3910-479e-858d-a11777873ef5@suse.com>
	 <5ee906c53e2d4a966fa6be3be50caa19c3c164a2.camel@gmail.com>
	 <4ba7c962-a635-4a7d-8e03-093361cc6353@suse.com>
	 <c92ef420468fdf45a878efda37c582c0cab2332f.camel@gmail.com>
	 <edd36d22-a2da-4e38-a586-14c742da18f7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Fri, 2024-04-05 at 08:11 +0200, Jan Beulich wrote:
> On 04.04.2024 18:24, Oleksii wrote:
> > On Thu, 2024-04-04 at 18:12 +0200, Jan Beulich wrote:
> > > On 04.04.2024 17:45, Oleksii wrote:
> > > > On Thu, 2024-04-04 at 15:22 +0200, Jan Beulich wrote:
> > > > > On 03.04.2024 12:19, Oleksii Kurochko wrote:
> > > > > > --- a/xen/include/xen/bitops.h
> > > > > > +++ b/xen/include/xen/bitops.h
> > > > > > @@ -65,10 +65,164 @@ static inline int
> > > > > > generic_flsl(unsigned
> > > > > > long
> > > > > > x)
> > > > > > =C2=A0 * scope
> > > > > > =C2=A0 */
> > > > > > =C2=A0
> > > > > > +#define BITOP_BITS_PER_WORD 32
> > > > > > +/* typedef uint32_t bitop_uint_t; */
> > > > > > +#define bitop_uint_t uint32_t
> > > > >=20
> > > > > So no arch overrides permitted anymore at all?
> > > > Not really, I agree that it is ugly, but I expected that arch
> > > > will
> > > > use
> > > > undef to override.
> > >=20
> > > Which would be fine in principle, just that Misra wants us to
> > > avoid
> > > #undef-s
> > > (iirc).
> > Could you please give me a recommendation how to do that better?
> >=20
> > The reason why I put this defintions before inclusion of
> > asm/bitops.h
> > as RISC-V specific code uses these definitions inside it, so they
> > should be defined before asm/bitops.h; other option is to define
> > these
> > definitions inside asm/bitops.h for each architecture.
>=20
> Earlier on you had it that other way already (in a different header,
> but the principle is the same): Move the generic definitions
> immediately
> past inclusion of asm/bitops.h and frame them with #ifndef.
It can be done in this way:
xen/bitops.h:
   ...
   #include <asm/bitops.h>
  =20
   #ifndef BITOP_TYPE
   #define BITOP_BITS_PER_WORD 32
   /* typedef uint32_t bitop_uint_t; */
   #define bitop_uint_t uint32_t
   #endif
   ...
  =20
But then RISC-V will fail as it is using bitop_uint_t inside
asm/bitops.h.
So, at least, for RISC-V it will be needed to add asm/bitops.h:
   #define BITOP_BITS_PER_WORD 32
   /* typedef uint32_t bitop_uint_t; */
   #define bitop_uint_t uint32_t
  =20

It seems to me that this breaks the idea of having these macro
definitions generic, as RISC-V will redefine BITOP_BITS_PER_WORD and
bitop_uint_t with the same values as the generic ones.
  =20
~ Oleksii

>=20
> Jan



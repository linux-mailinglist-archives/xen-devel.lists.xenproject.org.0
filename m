Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5960899C28
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 13:56:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701211.1095484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsiBI-0003ZT-R9; Fri, 05 Apr 2024 11:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701211.1095484; Fri, 05 Apr 2024 11:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsiBI-0003Wn-OA; Fri, 05 Apr 2024 11:56:28 +0000
Received: by outflank-mailman (input) for mailman id 701211;
 Fri, 05 Apr 2024 11:56:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZLbS=LK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rsiBH-0003Wh-Fi
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 11:56:27 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 880950d5-f343-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 13:56:26 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-516d68d7a8bso230498e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 04:56:26 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a199103000000b00516d1afe4f6sm178936lfd.290.2024.04.05.04.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 04:56:25 -0700 (PDT)
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
X-Inumbo-ID: 880950d5-f343-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712318186; x=1712922986; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rnYLzbaE7DCHWA4GAwV/tISz0yoWBEJHlaBO41PG5Og=;
        b=U+jmYfN6PY95OmYLJZhDkAOFiTxKELvitwCYdhMWi55erErj4rkVwbyvGatYHjde/O
         cQ5HuivZOPxd4lWg5NepB54iZH+6EghFwl+2zRYkzKx2gTqf3l5/1VlM68+4HS9NhUt+
         ydopRMdoJc8mSnPrnXSakVOjwPIrqivGVc7aO6bP8OiLUyZC2aUUmXVpokN52zCeLK3X
         mJMGrnRmL1/4GPkfj8joNniT8tSO/2Kj6ukLbwmRFDsstTLHoC8zfBOAT99Idu4EWln9
         tmykBJdEbrcwxr00AaUfF+s9Qm7DLTaCGBWdQoi42U6cP0jjP4aqb8y3g8+v2AcXa1Ij
         jjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712318186; x=1712922986;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rnYLzbaE7DCHWA4GAwV/tISz0yoWBEJHlaBO41PG5Og=;
        b=q5OLIyuONA8vxtiNGIO/j7k44ly9kdRzhGGG0IcPVsfWxfC9+IcDW6wKGiI5LaRL1y
         0QMaTvVyty1decnRHRdStlrgcgDi0bQzsOVtiL/X4FqwxoqRjI13gDFMbl/clc12B+Be
         DaktONum2LLu901fkpew5Og3o2PXkNMALh8Uek5hl7J6igo3YsFixo5HxWDBrJ5BHDgy
         YpbW0WwW6iKHR/0+rqoCRpS11yA8aEDP+c6wl7SyjDuLMgCmvwY4WThZLeFAsLCKP7m1
         Pgyn/Q6MiSeKN/Z5tfCBLzTYBEZ0/+rqStbLXYU1Iu78mCC/dZMY9HBWfO/7GXYF19Fo
         Z1nw==
X-Forwarded-Encrypted: i=1; AJvYcCUEXX0xrWx2uETkkzEIsQ1OB7WP7KO+vZSO9QqYMzZredGbC6Nf0Vvy7fAN4B8jdTX0pKjiwV+vcNuPh/evivzPPVxKOEr5g7UVIoJOvhg=
X-Gm-Message-State: AOJu0YxOuSgEJJez9SuWJquRvrVA4dv5B4xMlnszcRw3iIIqPmjv4p6s
	zBXQ74U0mCv9zboaCqYi2y+WD1JSUCMGuzTGjj2Cpo/xnrcuwLJR
X-Google-Smtp-Source: AGHT+IE22ZEY4DmJOJA2fmmWGXioH1UnBZCDAbxQJc45qIySCeC/zygmUs3eS7xAiMJlW+pMl1ZF8Q==
X-Received: by 2002:a19:911d:0:b0:513:ec32:aa8c with SMTP id t29-20020a19911d000000b00513ec32aa8cmr527808lfd.5.1712318185797;
        Fri, 05 Apr 2024 04:56:25 -0700 (PDT)
Message-ID: <87ad818358831680e25281a8615248b31816a309.camel@gmail.com>
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
Date: Fri, 05 Apr 2024 13:56:23 +0200
In-Reply-To: <03cb48d41f93b9a5255828474cdf333106aee2f9.camel@gmail.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
	 <ff6922206ab5476df907e2a05255663865f07301.1712137031.git.oleksii.kurochko@gmail.com>
	 <aabb1d9a-3910-479e-858d-a11777873ef5@suse.com>
	 <5ee906c53e2d4a966fa6be3be50caa19c3c164a2.camel@gmail.com>
	 <4ba7c962-a635-4a7d-8e03-093361cc6353@suse.com>
	 <c92ef420468fdf45a878efda37c582c0cab2332f.camel@gmail.com>
	 <edd36d22-a2da-4e38-a586-14c742da18f7@suse.com>
	 <024957c9a5347b38639aa859d316dce7492f1eef.camel@gmail.com>
	 <fda609e5-3ceb-432c-aaae-80b712013a6c@suse.com>
	 <03cb48d41f93b9a5255828474cdf333106aee2f9.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Fri, 2024-04-05 at 13:53 +0200, Oleksii wrote:
> On Fri, 2024-04-05 at 10:05 +0200, Jan Beulich wrote:
> > On 05.04.2024 09:56, Oleksii wrote:
> > > On Fri, 2024-04-05 at 08:11 +0200, Jan Beulich wrote:
> > > > On 04.04.2024 18:24, Oleksii wrote:
> > > > > On Thu, 2024-04-04 at 18:12 +0200, Jan Beulich wrote:
> > > > > > On 04.04.2024 17:45, Oleksii wrote:
> > > > > > > On Thu, 2024-04-04 at 15:22 +0200, Jan Beulich wrote:
> > > > > > > > On 03.04.2024 12:19, Oleksii Kurochko wrote:
> > > > > > > > > --- a/xen/include/xen/bitops.h
> > > > > > > > > +++ b/xen/include/xen/bitops.h
> > > > > > > > > @@ -65,10 +65,164 @@ static inline int
> > > > > > > > > generic_flsl(unsigned
> > > > > > > > > long
> > > > > > > > > x)
> > > > > > > > > =C2=A0 * scope
> > > > > > > > > =C2=A0 */
> > > > > > > > > =C2=A0
> > > > > > > > > +#define BITOP_BITS_PER_WORD 32
> > > > > > > > > +/* typedef uint32_t bitop_uint_t; */
> > > > > > > > > +#define bitop_uint_t uint32_t
> > > > > > > >=20
> > > > > > > > So no arch overrides permitted anymore at all?
> > > > > > > Not really, I agree that it is ugly, but I expected that
> > > > > > > arch
> > > > > > > will
> > > > > > > use
> > > > > > > undef to override.
> > > > > >=20
> > > > > > Which would be fine in principle, just that Misra wants us
> > > > > > to
> > > > > > avoid
> > > > > > #undef-s
> > > > > > (iirc).
> > > > > Could you please give me a recommendation how to do that
> > > > > better?
> > > > >=20
> > > > > The reason why I put this defintions before inclusion of
> > > > > asm/bitops.h
> > > > > as RISC-V specific code uses these definitions inside it, so
> > > > > they
> > > > > should be defined before asm/bitops.h; other option is to
> > > > > define
> > > > > these
> > > > > definitions inside asm/bitops.h for each architecture.
> > > >=20
> > > > Earlier on you had it that other way already (in a different
> > > > header,
> > > > but the principle is the same): Move the generic definitions
> > > > immediately
> > > > past inclusion of asm/bitops.h and frame them with #ifndef.
> > > It can be done in this way:
> > > xen/bitops.h:
> > > =C2=A0=C2=A0 ...
> > > =C2=A0=C2=A0 #include <asm/bitops.h>
> > > =C2=A0=C2=A0=20
> > > =C2=A0=C2=A0 #ifndef BITOP_TYPE
> > > =C2=A0=C2=A0 #define BITOP_BITS_PER_WORD 32
> > > =C2=A0=C2=A0 /* typedef uint32_t bitop_uint_t; */
> > > =C2=A0=C2=A0 #define bitop_uint_t uint32_t
> > > =C2=A0=C2=A0 #endif
> > > =C2=A0=C2=A0 ...
> > > =C2=A0=C2=A0=20
> > > But then RISC-V will fail as it is using bitop_uint_t inside
> > > asm/bitops.h.
> > > So, at least, for RISC-V it will be needed to add asm/bitops.h:
> > > =C2=A0=C2=A0 #define BITOP_BITS_PER_WORD 32
> > > =C2=A0=C2=A0 /* typedef uint32_t bitop_uint_t; */
> > > =C2=A0=C2=A0 #define bitop_uint_t uint32_t
> > > =C2=A0=C2=A0=20
> > >=20
> > > It seems to me that this breaks the idea of having these macro
> > > definitions generic, as RISC-V will redefine BITOP_BITS_PER_WORD
> > > and
> > > bitop_uint_t with the same values as the generic ones.
> >=20
> > I don't follow. Right now patch 7 has
> >=20
> > #undef BITOP_BITS_PER_WORD
> > #undef bitop_uint_t
> >=20
> > #define BITOP_BITS_PER_WORD BITS_PER_LONG
> > #define bitop_uint_t unsigned long
> >=20
> > You'd drop the #undef-s and keep the #define-s. You want to
> > override
> > them
> > both, after all.
> >=20
> > A problem would arise for _another_ arch wanting to use these
> > (default)
> > types in its asm/bitops.h. Which then could still be solved by
> > having
> > a
> > types-only header.
> This problem arise now for Arm and PPC which use BITOP_BITS_PER_WORD
> inside it. Then it is needed to define BITOP_BITS_PER_WORD=3D32 in
> asm/bitops.h for Arm and PPC. If it is okay, then I will happy to
> follow this approach.
>=20
> > =C2=A0Recall the discussion on the last summit of us meaning
> > to switch to such a model anyway (perhaps it being
> > xen/types/bitops.h
> > and
> > asm/types/bitops.h then), in a broader fashion? IOW for now you
> > could
> > use
> > the simple approach as long as no other arch needs the types in its
> > asm/bitops.h. Later we would introduce the types-only headers, thus
> > catering for possible future uses.
> Do we really need asm/types/bitops.h? Can't we just do the following
> in
> asm/bitops.h:
> =C2=A0 #ifndef BITOP_TYPE
> =C2=A0 #include <xen/types/bitops.h>
> =C2=A0 #endif
Or as an options just update <xen/types.h> with after inclusion of
<asm/types.h>:
   #ifndef BITOP_TYPE
      #define BITOP_BITS_PER_WORD 32
      /* typedef uint32_t bitop_uint_t; */
      #define bitop_uint_t uint32_t
   #endif
  =20
And then just include <xen/types.h> to <<xen/bitops.h>.

~ Oleksii
>=20
> ~ Oleksii



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B5A898C11
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 18:25:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700972.1094893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPtc-0005K6-0E; Thu, 04 Apr 2024 16:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700972.1094893; Thu, 04 Apr 2024 16:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPtb-0005HX-TU; Thu, 04 Apr 2024 16:24:59 +0000
Received: by outflank-mailman (input) for mailman id 700972;
 Thu, 04 Apr 2024 16:24:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LwOm=LJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rsPta-0005HP-Rh
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 16:24:58 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0a8c527-f29f-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 18:24:57 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-516d0161e13so776059e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 09:24:57 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 bp27-20020a056512159b00b00516a8ecaeb2sm1271649lfb.278.2024.04.04.09.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 09:24:56 -0700 (PDT)
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
X-Inumbo-ID: e0a8c527-f29f-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712247897; x=1712852697; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3VfZKIbq1vx5oa1c0+TsaQ1iY58oum9l+yO2/PDevco=;
        b=FKMuYnrSA8wN8YApcPTuTbYXHVS1E44zkwKWgeJaKy21olLShRb/HEnpUPXdCJtnN4
         jOO7NX9gMWFX7o5Y7qc0I5P42mRdw2Fi4qyCtGrdSpPdf4AWOIg/kn/Xhm7MSivGanbS
         qBdQzN6sISl/YjEkDBrhWLf0qxEJrCyKuUBbPd6Li9vDuAfHaFtSow79XwZ4HYcWbi7L
         +LEg2OLmmO8PfEGEf0tb4SlnSVoUn9sq7CEEM/VXPl9pc4k56tSJsrB/f1An56BeS9aa
         aVJ+k1es84jXQwoR0SvC8Ced9hUQkuzff0e5AndDF/FklIy0lJG1cYoMY0vhfD75kphY
         pOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712247897; x=1712852697;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3VfZKIbq1vx5oa1c0+TsaQ1iY58oum9l+yO2/PDevco=;
        b=L9jEf9RaCwQ+HQy6vyXnVBYAqvdfoBzcO6zaE6UJZtmAgRhIEp5Sjh2XJi1YXLgkf0
         FyudBe8rLm0RaH96OHBfLDTt2nH9FXlNRtU19PZOj7imo+ZDJLapgkzznM8q4QT7BFUN
         tG7bTfpub/jzXTQqtUQhNYY5dH+iifAs8OXKBvVi6jw9yEVoOEmc2QAJxo37KpOXiQ2c
         TcWlXBpppenyz1JhAAVIAR3Z+z1E3woVm1qZlev3LttDgZVsHENkSTqKgKMDH9eTiFwd
         O1oCKGFKaUgGqHUdTVmzr9rqVqunVzhx1zMEnpTn6xh/mPw6nAkmTvpSEWZkPv4t6iKK
         QSaw==
X-Forwarded-Encrypted: i=1; AJvYcCUc5sBkK1ejBgJQGltxg+vaMs7m4GAZrQ6475N2kjn5XD8ZM/HnhbrLVJr+5SIX1cShXkzlLDshw7fKYVAy7jIMeWAVzPzA0qd0RE08lmU=
X-Gm-Message-State: AOJu0YwaH1gvpPs6idMzk+ajaJmSYw65rrNSILpfURIqhkFgDIj3+oXl
	T2VCugap2n1DMBN6nNyHus1lrYjHhGF0KhtrrRwc+a8vufLgexOz
X-Google-Smtp-Source: AGHT+IHFZ8U4TDTDrMkMuffVr1Zwj7+AvvLMZPZqYU11Sk361nvCLJ44q1sdEmyOiAycDkfOog69qA==
X-Received: by 2002:ac2:4314:0:b0:515:bbf7:bddd with SMTP id l20-20020ac24314000000b00515bbf7bdddmr2223497lfh.20.1712247897132;
        Thu, 04 Apr 2024 09:24:57 -0700 (PDT)
Message-ID: <c92ef420468fdf45a878efda37c582c0cab2332f.camel@gmail.com>
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
Date: Thu, 04 Apr 2024 18:24:55 +0200
In-Reply-To: <4ba7c962-a635-4a7d-8e03-093361cc6353@suse.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
	 <ff6922206ab5476df907e2a05255663865f07301.1712137031.git.oleksii.kurochko@gmail.com>
	 <aabb1d9a-3910-479e-858d-a11777873ef5@suse.com>
	 <5ee906c53e2d4a966fa6be3be50caa19c3c164a2.camel@gmail.com>
	 <4ba7c962-a635-4a7d-8e03-093361cc6353@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-04-04 at 18:12 +0200, Jan Beulich wrote:
> On 04.04.2024 17:45, Oleksii wrote:
> > On Thu, 2024-04-04 at 15:22 +0200, Jan Beulich wrote:
> > > On 03.04.2024 12:19, Oleksii Kurochko wrote:
> > > > --- a/xen/include/xen/bitops.h
> > > > +++ b/xen/include/xen/bitops.h
> > > > @@ -65,10 +65,164 @@ static inline int generic_flsl(unsigned
> > > > long
> > > > x)
> > > > =C2=A0 * scope
> > > > =C2=A0 */
> > > > =C2=A0
> > > > +#define BITOP_BITS_PER_WORD 32
> > > > +/* typedef uint32_t bitop_uint_t; */
> > > > +#define bitop_uint_t uint32_t
> > >=20
> > > So no arch overrides permitted anymore at all?
> > Not really, I agree that it is ugly, but I expected that arch will
> > use
> > undef to override.
>=20
> Which would be fine in principle, just that Misra wants us to avoid
> #undef-s
> (iirc).
Could you please give me a recommendation how to do that better?

The reason why I put this defintions before inclusion of asm/bitops.h
as RISC-V specific code uses these definitions inside it, so they
should be defined before asm/bitops.h; other option is to define these
definitions inside asm/bitops.h for each architecture.

>=20
> > > > =C2=A0/*
> > > > =C2=A0 * Find First Set bit.=C2=A0 Bits are labelled from 1.
> > > > =C2=A0 */
> > >=20
> > > This context suggests there's a dependency on an uncommitted
> > > patch.
> > > Nothing
> > > above says so. I guess you have a remark in the cover letter, yet
> > > imo
> > > that's
> > > only partly helpful.
> > Is it really a hard dependency?
> > The current patch series really depends on ffs{l}() and that was
> > mentioned in the cover letter ( I'll reword the cover letter to
> > explain
> > why exactly this dependency is needed ), but this patch isn't
> > really
> > depends on Andrew's patch series, where ffs{l}() are introduced.
>=20
> If anyone acked this patch, and if it otherwise looked independent,
> it would
> be a candidate for committing. Just that it won't apply for a non-
> obvious
> reason.
I didn't think about the it won't apply. In this I have to definitely
mention this moment in cover letter. Thanks.

~ Oleksii


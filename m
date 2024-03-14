Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7D087C14F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 17:33:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693379.1081377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rko1H-0002Y5-PF; Thu, 14 Mar 2024 16:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693379.1081377; Thu, 14 Mar 2024 16:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rko1H-0002VA-MH; Thu, 14 Mar 2024 16:33:27 +0000
Received: by outflank-mailman (input) for mailman id 693379;
 Thu, 14 Mar 2024 16:33:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hJ7k=KU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rko1F-0002Uq-MP
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 16:33:25 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76e93c41-e220-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 17:32:35 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-513d212f818so964664e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 09:32:35 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a056512350400b00513c541dba8sm328441lfs.300.2024.03.14.09.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 09:32:34 -0700 (PDT)
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
X-Inumbo-ID: 76e93c41-e220-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710433955; x=1711038755; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MC2xlIiAZTrvR9ntYM+yVSRnEvX4TUjWNo9cEE/e3Ds=;
        b=LUs6RVlif4ba+0yhLx3t8a9u5sYCHR+si87Kp1oENqg8Zdz/2wk1BJ/g9LbKniCTnL
         hOn3F0nxYEzzVE64n4NISwJWZ8Ot/ysWeWBSRwIdZfd1wnJk7j3IM0ybON5+qyd9WMLZ
         1DwdXailvdl4J4MOM/Gz905ApfADylc92uHrjKQd5Cd3+/IKnm7QI1TElhWIY9OJ4+jl
         Bd49cSzUrnak3XiVnQMqA8pW4VvpvHwPT2utHTK5CSkUI2MK3Zp0j5AK+k35UVtUMwl6
         KpqQAExK5Ajmso81aEsiteqP0KowLrdshD2E3kTht/uVE7jXBhoLXu/lav958TIty50q
         sZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710433955; x=1711038755;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MC2xlIiAZTrvR9ntYM+yVSRnEvX4TUjWNo9cEE/e3Ds=;
        b=Q7OFxq7UbeNl1okAVrOOPPNKQmdcEu3gpYvkonOdMH1g53rgqwelWIyspkRL6LvxOG
         g8FCaLpSONwdP+cpEOtiUWOF4OVM0Hnri0Ic3S5cbH7DIOqyGiJLoRBspvoT+C+6gyTC
         ecMm1nN9l1zRNDXxoWSOejk17vTaN3rcag9c4vNMFmMMo/LWYj5PqOP9xX5RuBCOftMX
         V1IPbwZz6ZjhYqIpxF7356QvncwAdGugAf+CjdFC1+6WRBslpbwkIt4awSVnGlPSpWHj
         AeRPLQTlwyjPaGUxeW3OiNmjcXq08qXxEBjeJoo00mOMY3QldeMuxEpzycIPi2ZoY0p3
         XsKw==
X-Forwarded-Encrypted: i=1; AJvYcCU0P8Jx7qq5PDvutM2EXtB/8nbGKhR4KMMVMQzOuvAGti7ZWnMrn0a/4TijjFBBkVFx4qAljylB1RFGDmCD37kzSxo7jTT+9joljxcz6j8=
X-Gm-Message-State: AOJu0YysByihzfckkzLT/iVkzhnd1GEV17gmXrT5ek6yiJ4Hw4GJwOxm
	UhQ3FMtdILQX1zCiXRbfbcYO9aMz8qXa5UREpO05ZnaNx1dsQw2T
X-Google-Smtp-Source: AGHT+IFzHfiUXap42ebsC2x25ld3F3zf9UHSZSflWpQI33y+sVa3PW5Svq1H5tORK0+kwkhJB5cBFg==
X-Received: by 2002:a19:a408:0:b0:513:572f:88f0 with SMTP id q8-20020a19a408000000b00513572f88f0mr506862lfc.41.1710433955169;
        Thu, 14 Mar 2024 09:32:35 -0700 (PDT)
Message-ID: <308749abd97ac659b09ff42b3f80f8c57cdeb51a.camel@gmail.com>
Subject: Re: [RISCV] [PATCH 0/7] xen/bitops: Reduce the mess, starting with
 ffs()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>, "consulting @ bugseng .
 com" <consulting@bugseng.com>, Simone Ballarin
 <simone.ballarin@bugseng.com>,  Federico Serafini
 <federico.serafini@bugseng.com>, Nicola Vetrini
 <nicola.vetrini@bugseng.com>, Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 14 Mar 2024 17:32:33 +0100
In-Reply-To: <e233c298-66aa-4653-9b83-18006abe63eb@suse.com>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
	 <1805b028-e21f-448f-bf94-2156092e40a5@citrix.com>
	 <e233c298-66aa-4653-9b83-18006abe63eb@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-03-14 at 16:33 +0100, Jan Beulich wrote:
> On 14.03.2024 15:45, Andrew Cooper wrote:
> > On 13/03/2024 5:27 pm, Andrew Cooper wrote:
> > > Start cleaning it up with ffs() and friends.=C2=A0 Across the board,
> > > this adds:
> > >=20
> > > =C2=A0* Functioning bitops without arch-specific asm
> >=20
> > It turns out that RISC-V doesn't have a CLZ instruction in the base
> > ISA.=C2=A0 As a consequence, __builtin_ffs() emits a library call to
> > ffs() on
> > GCC, or a de Bruijn sequence on Clang.
> >=20
> > The optional Zbb extension adds a CLZ instruction, after which
> > __builtin_ffs() emits a very simple sequence.
> >=20
> > This leaves us with several options.
> >=20
> > 1) Put generic_ffs() back in, although if we do this then it's
> > going to
> > be out-of-line in lib/ where it can be mostly ignored.
> >=20
> > 2) Require Zbb for Xen.
> >=20
> > 3) Alternative it up with Zbb or generic_ffs().
> >=20
> >=20
> > I've got half a mind to do 1) irrespective.=C2=A0 It's mostly just
> > shuffling
> > logic out of bitops.h into lib/.
>=20
> Yes. Might also help with the bi-sectability issue you faced.
>=20
> > I also think we should do option 2 for RISCV.=C2=A0 Given the
> > instruction
> > groups that H does mandate, it's unrealistic to expect that such a
> > chip
> > wouldn't support Zbb/etc.
>=20
> I'm not so sure here.
If to look at available specs of CPUs with H, then, for example, SiFive
P600 series family doesn't support Zbb extenstion:
https://sifive.cdn.prismic.io/sifive/7be0420e-dac1-4558-85bc-50c7a10787e7_p=
600_datasheet.pdf

But I asked a team who are producing CPU with H support and they have
Zbb extenstion.

>=20
> > Also, getting full alternatives working is yet-more work that's not
> > trivial at this point in RISCV's development.=C2=A0 I think it is
> > entirely
> > reasonable to avoid this work for now, and make it a problem for
> > anyone
> > who has an H-capable Zbb-incapable system.=C2=A0 (with a strong
> > implication
> > that this is work that probably never needs to be done.)
>=20
> That's definitely for later.
Considering that we are mainly using QEMU and it provides Zbb extension
we can just update -march, and that a real h/w where I can ask to test
a code also support this extenstion I will update riscv/booting.txt and
update -march.

~ Oleksii


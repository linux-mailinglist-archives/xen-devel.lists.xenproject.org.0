Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89D594113D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 13:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767654.1178335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlTt-0003GD-4t; Tue, 30 Jul 2024 11:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767654.1178335; Tue, 30 Jul 2024 11:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlTt-0003DT-22; Tue, 30 Jul 2024 11:57:29 +0000
Received: by outflank-mailman (input) for mailman id 767654;
 Tue, 30 Jul 2024 11:57:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3FYA=O6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sYlTr-0003DN-Kt
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 11:57:27 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3ba3093-4e6a-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 13:57:26 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f0271b0ae9so57035491fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 04:57:26 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03cf0e36csm16221771fa.17.2024.07.30.04.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 04:57:25 -0700 (PDT)
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
X-Inumbo-ID: e3ba3093-4e6a-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722340646; x=1722945446; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hTV+zVkIo80oYqLoPlPSB0a9atR1wKZVsLTIyEXTZDA=;
        b=VRq8l3KyxgmcPwkyBtPKGKZTnoC1VD2O3Q40W0CJe20JUJ4WtGReo1PENVvHDXGLaZ
         lszBA9iClDVnTd4Lw64hHdHHrYoLPfFH52A4qyH5XgrrVCV1iouUeyPbsqWeUrt9j+rK
         3YMxtAxkqLj+rsqfP1kmfliZ0dnNfa3uCokdetei27jlp1NYE+ECctvMWeTVeGZJHlC6
         4x5j92NEDIRB60odgRnUfgXFUXcfcNoG/skX2TnIARdwQ0/qabBlIdWEIm6ET923KeDL
         bov0kNEAHvhYf5+9tCd3kaWC/KH4Px9VgTYCf077Wzc8dOQTa+cG0bwZdne8McVJVsaQ
         GmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722340646; x=1722945446;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hTV+zVkIo80oYqLoPlPSB0a9atR1wKZVsLTIyEXTZDA=;
        b=VgjYcjfzMfqPo+a8dEskdoJRndqgM9HaByEHBoX3swhqnQWwRfy+cel0KBOxVwy7XI
         4z+zO6OGlMxCBR517PJ0JKUJh59qomSXQ0HrOZGq52bMsJAyL1h1AlJCpWG/sKk1ltC/
         64JJXxm1Cjz9U6ggoLyrCa3VMHqyDorCiqWpQZRocLqPamgPnwEhriLLDclkW7bROmkw
         FnMnDjn46mqw178lhrd+eup2qWW75h7jHxETwOepPL7wtaTBbP2rMP7bfxLTavxB/iVe
         qj7aMXoy/a2wcupWWLQZgU9bLCBc+KXAyS/ApGer3XasbsLcNKeeDlbqd14Z7KA4zKv3
         bHBg==
X-Forwarded-Encrypted: i=1; AJvYcCXp75JRShMCNnZuwQrLZhpneDR1by89up9O5YK+lMujpvTAeg6+GRd4qcIb1JHTEwPhMHvxSUyuh3doEDRzfBrYlU50BPrV3dfTQog5vnI=
X-Gm-Message-State: AOJu0YwfDvIUGiacqEuG4hl85H43Csa6gmiRftXPFkXGmT8l7VgA+8d3
	bVIUIvBtpBGHqFU8ezQl9kw39aMNj9rXVAXnXIsOJ4cdriOtbhpZ
X-Google-Smtp-Source: AGHT+IGJ0lEIRSkGQTBAGeo8+B+N/LIurDoNsV+q8arDlGAkOZ382oS/JjT9rdNJLQ0F5HGNsqjrzQ==
X-Received: by 2002:a2e:a595:0:b0:2ec:3d74:88ca with SMTP id 38308e7fff4ca-2f12edd6041mr74798121fa.25.1722340645669;
        Tue, 30 Jul 2024 04:57:25 -0700 (PDT)
Message-ID: <23ef6ff003d4170269eedfc7d3354965f060ba3f.camel@gmail.com>
Subject: Re: [PATCH v3 7/9] xen/riscv: introduce and init SBI RFENCE
 extension
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 30 Jul 2024 13:57:24 +0200
In-Reply-To: <97554cbe-7009-4bc9-8205-7a9e0f29aad0@suse.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <fb2d24731f870378d79077be39b1bc19cc655327.1721834549.git.oleksii.kurochko@gmail.com>
	 <49d3a181-0830-4f55-83a4-c6c9fd54eb17@suse.com>
	 <b7433d25bb3ca7a0f4e54f561b450b5724fb46dc.camel@gmail.com>
	 <97554cbe-7009-4bc9-8205-7a9e0f29aad0@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-30 at 11:17 +0200, Jan Beulich wrote:
> On 30.07.2024 10:44, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Mon, 2024-07-29 at 17:52 +0200, Jan Beulich wrote:
> > > On 24.07.2024 17:31, Oleksii Kurochko wrote:
> > >=20
> > >=20
> > > > +/*
> > > > + * Send SFENCE_VMA to a set of target HARTs.
> > > > + *
> > > > + * @param hart_mask mask representing set of target HARTs
> > > > + * @param start virtual address start
> > > > + * @param size virtual address size
> > >=20
> > > Are these really virtual addresses, not somehow a bias and a
> > > number
> > > of bits (CPUs) or elements? From the rest of the patch I can't
> > > deduce
> > > what these two parameters express.
> > According to SBI doc start is an virtual address:
> > https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-rfen=
ce.adoc?plain=3D1#L44
>=20
> Oh, so these are describing the VA range to be flushed. Okay.
>=20
> > and hart_mask is:
> > =E2=80=A2 unsigned long hart_mask is a scalar bit-vector containing har=
tids
>=20
> Biased by hart_mask_base in the actual SBI call.
What word "biased" mean here?

>=20
> > > > +
> > > > +static void sbi_cpumask_to_hartmask(const struct cpumask
> > > > *cmask,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct cpumask *hmask)
> > >=20
> > > I doubt it is valud to re-use struct cpumask for hart maps.
> > Why not? Would it be better to use unsigned long *hmask?
>=20
> It's not only better, but imo a requirement. Unless there's a
> guarantee
> by the spec that hart IDs for any subset of harts are sequential and
> starting from 0, you just can't assume they fall in the [0,NR_CPUS)
> or
> really [0,nr_cpu_ids) range. Yet without that you simply can't
> (ab)use
> struct cpumask (and btw it wants to be cpumask_t everywhere).
It is guarantee that hart ID 0 will be present but not that they are
numbered contiguously:
```
Hart IDs might
not necessarily be numbered contiguously in a multiprocessor system,
but at least one hart must
have a hart ID of zero. Hart IDs must be unique within the execution
environment.
```
I have to rework then this things around sbi_cpumask_to_hartmask().

>=20
> You may want to take a look at struct physid_mask that we have on x86
> for the equivalent purpose.
Thanks I will look at.

> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 continue;
> > >=20
> > >=20
> > > Can you really sensibly continue in such a case?
> > I think yes, the worst thing we will have is that the "bad" CPU
> > won't
> > be used.
> > But it might be better to switch to BUG_ON() as if we are inised
> > the
> > "if CONFIG_NR_CPUS <=3D cpu" then it could tell us that something
> > went
> > wrong.
>=20
> Again - your problem here isn't the range of "cpu". What you instead
> want to check is ...
>=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hart =3D
> > > > cpuid_to_hartid_map(pcpu_info[cpu].processor_id);
>=20
> the hart ID that you get back. If that's INVALID_HARTID, you're in
> fact in trouble.
>=20
> > > What does "_map" in the function/macro name signify?
> > It is interconnections/correllation between Xen's CPU id and Hart's
> > id.
>=20
> Well. What the function does internally is consult the map. Yet
> that's
> not relevant to any caller? They only care about the translation from
> one ID space to the other? No matter whether a map, radix tree,
> rbtree,
> or what not is used behind the scenes?
Agree, the "_map" in cpuid_to_hartid_map() is useless. Thanks.

~ Oleksii


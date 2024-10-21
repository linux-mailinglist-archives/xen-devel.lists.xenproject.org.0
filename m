Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 848559A5DC5
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 09:57:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823222.1237185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2nHk-0003F2-JS; Mon, 21 Oct 2024 07:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823222.1237185; Mon, 21 Oct 2024 07:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2nHk-0003Bw-G8; Mon, 21 Oct 2024 07:57:04 +0000
Received: by outflank-mailman (input) for mailman id 823222;
 Mon, 21 Oct 2024 07:57:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlK+=RR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t2nHi-00032O-SE
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 07:57:02 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0df2d04f-8f82-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 09:57:01 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4316a44d1bbso14205755e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 00:57:01 -0700 (PDT)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0ba7480sm3607062f8f.113.2024.10.21.00.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 00:57:00 -0700 (PDT)
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
X-Inumbo-ID: 0df2d04f-8f82-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729497421; x=1730102221; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoSl7kvBeNHYgqJAPlrDaIhKUnzvMFR29dB37Ux8+8g=;
        b=OQSzRwPSvLc3NOmmIxtUl/ItOGC/uc5fo9AcfR5JvFfHy6Dax3QpvYRvnhO9Ejs4PU
         mnjy85EyQux38OPB/zE6AwoPvmjW9rUdldvGhPUKJXRJVciqV+1JxgoXJHrgtgArc215
         E7/wV6N8MqgKCFvw8Qseyg9PPG+cw5CiyKgdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729497421; x=1730102221;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SoSl7kvBeNHYgqJAPlrDaIhKUnzvMFR29dB37Ux8+8g=;
        b=n1c0zi00R3pcgaI/O6GHZVR4GEa5lC51M1Fkq6TTn6s7xl6mpYlP5AbuwInbK535Jt
         fZL86lYQkG+/4zODc9ayHGAOmiHFX/jKVLYFt4bNWTvG5z+i7tq+cXmiEq0a+SRWE/la
         QyRwceOAtlmORXDJRSZTJJHZfcOrOTf1TcLC3l2lMmGm2p04Ua1Tez3aQ33jF5P5RyHY
         QvqT4iaWWQCwpBA+kUvVy/fli60qsO/FLNHXQ4trM5Cn5Zf24qE0w8CD6Fbu04MRLXj1
         uIO428W9bDiYWNFCaoutJlrwGyRZakSR36JqZe54L9KzvolbUDu543V8fVgNMf/Jw8cg
         DaXw==
X-Forwarded-Encrypted: i=1; AJvYcCVZrhB9rrW92CEHC4QDBTUt5FxHQktBMxa8U+P4OQ+6iXNPgp43yRlkpYUK162S4TT2U4MiASzcbA4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywAreZ9fncWv7e648k9CTK82aPXYSc5nqGbBgWqb4YZe4+vvhQ
	AxqGwCgtThPA473nErYteXlFbIUiIepNuoxWmyfXQFIkpg2x9/x0jnPUMYouQsQ=
X-Google-Smtp-Source: AGHT+IHW1+7cVnpi8HuXJ1ynA+XGEnpIVTAH2NfUBQFh4DWHBRKGTWE1zGRDlQTvvLmdwVjTNrMTbA==
X-Received: by 2002:a05:600c:3b9b:b0:42c:b037:5f9d with SMTP id 5b1f17b1804b1-43161636f67mr80340725e9.3.1729497421008;
        Mon, 21 Oct 2024 00:57:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Oct 2024 08:56:55 +0100
Message-Id: <D51BO0DX4047.IXQS05RISYW0@cloud.com>
Subject: Re: [PATCH v1 2/5] xen/riscv: implement maddr_to_virt()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: <oleksii.kurochko@gmail.com>, "Jan Beulich" <jbeulich@suse.com>
Cc: "Alistair Francis" <alistair.francis@wdc.com>, "Bob Eshleman"
 <bobbyeshleman@gmail.com>, "Connor Davis" <connojdavis@gmail.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, "Julien Grall" <julien@xen.org>,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
 <ec04dca87144194f5b3ecb9a78d142d370c9193f.1729068334.git.oleksii.kurochko@gmail.com> <2565f369-96e3-4c28-b752-53b1b6a0d968@suse.com> <aebdb0df0ad9fb13db9929f131737bf5479cdf29.camel@gmail.com>
In-Reply-To: <aebdb0df0ad9fb13db9929f131737bf5479cdf29.camel@gmail.com>

On Fri Oct 18, 2024 at 2:17 PM BST, oleksii.kurochko wrote:
> On Thu, 2024-10-17 at 16:55 +0200, Jan Beulich wrote:
> > On 16.10.2024 11:15, Oleksii Kurochko wrote:
> > > --- a/xen/arch/riscv/include/asm/mm.h
> > > +++ b/xen/arch/riscv/include/asm/mm.h
> > > @@ -25,8 +25,12 @@
> > > =C2=A0
> > > =C2=A0static inline void *maddr_to_virt(paddr_t ma)
> > > =C2=A0{
> > > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > > -=C2=A0=C2=A0=C2=A0 return NULL;
> > > +=C2=A0=C2=A0=C2=A0 /* Offset in the direct map, accounting for pdx c=
ompression */
> > > +=C2=A0=C2=A0=C2=A0 unsigned long va_offset =3D maddr_to_directmapoff=
(ma);
> >=20
> > Why the mentioning of PDX compression?
> It was mentioned because if PDX will be enabled maddr_to_directmapoff()
> will take into account PDX stuff.
>
> >  At least right now it's unavailable
> > for RISC-V afaics. Are there plans to change that any time soon?
> At the moment, I don't have such plans, looking at available platform
> there are no a lot of benefits of having PDX compression now.
>
> Perhaps it would be good to add
> BUILD_BUG_ON(IS_ENABLED(PDX_COMPRESSION)) for the places which should
> be updated when CONFIG_PDX will be enabled.
>
> ~ Oleksii

I'd just forget about it unless you ever notice you're wasting a lot of ent=
ries
in the frame table due to empty space in the memory map. Julien measured th=
e
effect on Amazon's Live Migration as a 10% improvement in downtime with PDX
off.

PDX compression shines when you have separate RAM banks at very, very
disparately far addresses (specifics in pdx.h). Unfortunately the flip side=
 of
this compression is that you get several memory accesses for each single
pdx-(to/from)-mfn conversion. And we do a lot of those. One possible soluti=
on
would be to alt-patch the values in the code-stream and avoid the perf-hit,=
 but
that's not merged. Jan had some patches but that didn't make it to staging,
IIRC.

Cheers,
Alejandro


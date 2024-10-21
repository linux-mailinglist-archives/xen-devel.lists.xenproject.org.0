Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 664E09A6203
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 12:09:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823309.1237285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2pLU-0003rL-2d; Mon, 21 Oct 2024 10:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823309.1237285; Mon, 21 Oct 2024 10:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2pLT-0003oS-Ty; Mon, 21 Oct 2024 10:09:03 +0000
Received: by outflank-mailman (input) for mailman id 823309;
 Mon, 21 Oct 2024 10:09:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlK+=RR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t2pLT-0003oM-19
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 10:09:03 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e5f1f79-8f94-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 12:09:01 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-37d6ff1cbe1so3333078f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 03:09:01 -0700 (PDT)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f58adffsm52238085e9.22.2024.10.21.03.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 03:09:00 -0700 (PDT)
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
X-Inumbo-ID: 7e5f1f79-8f94-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729505340; x=1730110140; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68TgLZXfpKuLuM6nJglCqDvFF0rV0uue7z6s7da9kgg=;
        b=WaBMU687o8ZIBZ/ZkLrmwPqAV+3mZ8RAap7CtX3hwZZqYmKBCGmIYnxCfZWDGnGu+F
         lBGSyyJHGkXVWrSZpNKSmLQIB2FWpjnwLglo3o71iB/a/S804nmiP0DwQYmg5Ga/oVNV
         g0eJ77wlPLc4vprCJAN6DAZT5v9s+qpd6iGhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729505340; x=1730110140;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=68TgLZXfpKuLuM6nJglCqDvFF0rV0uue7z6s7da9kgg=;
        b=PIWr/uBpU9MFCUJa9yTOsFQtW1aFN4se+nl8Z1OxCzUK4v25nTayQI8R6a8KUJoNqt
         K9jcaPH70JiAFfFE3ptlm5gDlH+vkBoZh45t2GcgMjknWj40psYG1Ytcq77QtqPsSb2D
         70vviymhtVxjiN9RkOsx34YfLPGzFLBz3Yguqc87+XZYQhNbTV6KtXD6kuKTWDJ5tIVM
         fq8lnBs14C+YiWpyb55x6Cg84gNy+YhhZIlhTGKlQkv51uChSCrlEj9EAJT2lEa2OgMS
         n3oi9mFCVjG3n7ufOeuVTSuY34dkjAPy1ItPo+jnGULNAZrQMellVZ0xKdPtemG/jFiN
         aAhg==
X-Forwarded-Encrypted: i=1; AJvYcCWNdgD32uv/LZenkmyo3HKEAwYXsQdBXv6P5pf21/G+PtGcntHYVeHnMeKRGT6EI4CdLbagjE5zfx4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRBzqCr8HKOy+DLwTLg8eo5J9ubo6j49ioe+CAAezJIQJMsaFO
	Too9/cLcCo5RU/ztEYXVM6WLuNXMByN61glsgNWubfow6AIWOsTgFjmHKVS9C5M=
X-Google-Smtp-Source: AGHT+IF+vmJyJudKzvjeNTh2u/rQaS9mV+r5jI2WymHSM6WuQy0Pc8ZAsdZ7pBHf4Z4Xi0ubCFjQOw==
X-Received: by 2002:adf:f744:0:b0:37d:4d80:34ae with SMTP id ffacd0b85a97d-37eab4edf5bmr7016302f8f.4.1729505340537;
        Mon, 21 Oct 2024 03:09:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Oct 2024 11:08:55 +0100
Message-Id: <D51EH2JFJVEZ.19LP27BXM7WZD@cloud.com>
Cc: "Alistair Francis" <alistair.francis@wdc.com>, "Bob Eshleman"
 <bobbyeshleman@gmail.com>, "Connor Davis" <connojdavis@gmail.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, "Julien Grall" <julien@xen.org>,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 2/5] xen/riscv: implement maddr_to_virt()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: <oleksii.kurochko@gmail.com>, "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
 <ec04dca87144194f5b3ecb9a78d142d370c9193f.1729068334.git.oleksii.kurochko@gmail.com> <2565f369-96e3-4c28-b752-53b1b6a0d968@suse.com> <aebdb0df0ad9fb13db9929f131737bf5479cdf29.camel@gmail.com> <D51BO0DX4047.IXQS05RISYW0@cloud.com> <43e8ee94d3b7aa5b643db1d81a63e513a8feef57.camel@gmail.com>
In-Reply-To: <43e8ee94d3b7aa5b643db1d81a63e513a8feef57.camel@gmail.com>

On Mon Oct 21, 2024 at 10:17 AM BST, oleksii.kurochko wrote:
> On Mon, 2024-10-21 at 08:56 +0100, Alejandro Vallejo wrote:
> > On Fri Oct 18, 2024 at 2:17 PM BST, oleksii.kurochko wrote:
> > > On Thu, 2024-10-17 at 16:55 +0200, Jan Beulich wrote:
> > > > On 16.10.2024 11:15, Oleksii Kurochko wrote:
> > > > > --- a/xen/arch/riscv/include/asm/mm.h
> > > > > +++ b/xen/arch/riscv/include/asm/mm.h
> > > > > @@ -25,8 +25,12 @@
> > > > > =C2=A0
> > > > > =C2=A0static inline void *maddr_to_virt(paddr_t ma)
> > > > > =C2=A0{
> > > > > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > > > > -=C2=A0=C2=A0=C2=A0 return NULL;
> > > > > +=C2=A0=C2=A0=C2=A0 /* Offset in the direct map, accounting for p=
dx
> > > > > compression */
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long va_offset =3D maddr_to_directma=
poff(ma);
> > > >=20
> > > > Why the mentioning of PDX compression?
> > > It was mentioned because if PDX will be enabled
> > > maddr_to_directmapoff()
> > > will take into account PDX stuff.
> > >=20
> > > > =C2=A0At least right now it's unavailable
> > > > for RISC-V afaics. Are there plans to change that any time soon?
> > > At the moment, I don't have such plans, looking at available
> > > platform
> > > there are no a lot of benefits of having PDX compression now.
> > >=20
> > > Perhaps it would be good to add
> > > BUILD_BUG_ON(IS_ENABLED(PDX_COMPRESSION)) for the places which
> > > should
> > > be updated when CONFIG_PDX will be enabled.
> > >=20
> > > ~ Oleksii
> >=20
> > I'd just forget about it unless you ever notice you're wasting a lot
> > of entries
> > in the frame table due to empty space in the memory map. Julien
> > measured the
> > effect on Amazon's Live Migration as a 10% improvement in downtime
> > with PDX
> > off.
> >=20
> > PDX compression shines when you have separate RAM banks at very, very
> > disparately far addresses (specifics in pdx.h). Unfortunately the
> > flip side of
> > this compression is that you get several memory accesses for each
> > single
> > pdx-(to/from)-mfn conversion. And we do a lot of those. One possible
> > solution
> > would be to alt-patch the values in the code-stream and avoid the
> > perf-hit, but
> > that's not merged. Jan had some patches but that didn't make it to
> > staging,
> > IIRC.
> Could you please give me some links in the mailing list with mentioned
> patches?
>
> ~ Oleksii

Sure.

Much of this was discussed in the "Make PDX compression optional" series. T=
his
link is v1, but there were 3 in total and a pre-patch documenting pdx.h
explaining what the technique actually does to make sure we were all on the
same page (pun intended) and the pdx-off case wouldn't break the world.

  https://lore.kernel.org/xen-devel/20230717160318.2113-1-alejandro.vallejo=
@cloud.com/

This was Jan's 2018 take to turn PDX into alternatives. He mentioned it
somewhere in those threads, but I can't find that message anymore.

  https://lore.kernel.org/xen-devel/5B76740802000078001DF345@prv1-mh.provo.=
novell.com/

Cheers,
Alejandro


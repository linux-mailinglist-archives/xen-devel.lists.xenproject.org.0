Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E98406AE017
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 14:13:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507367.780762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZX7q-0003lb-On; Tue, 07 Mar 2023 13:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507367.780762; Tue, 07 Mar 2023 13:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZX7q-0003ic-LN; Tue, 07 Mar 2023 13:13:06 +0000
Received: by outflank-mailman (input) for mailman id 507367;
 Tue, 07 Mar 2023 13:13:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zeiT=67=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pZX7p-0003iW-Qg
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 13:13:05 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca65f837-bce9-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 14:13:03 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so10360268wmb.5
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 05:13:03 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.143.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.143]) by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c425400b003dc47d458cdsm12999796wmm.15.2023.03.07.05.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 05:13:02 -0800 (PST)
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
X-Inumbo-ID: ca65f837-bce9-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678194782;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qDCpDGgHNtS2NsIBbrdrVDnUk/BCKkJzDAx6MtlGpG4=;
        b=IiSoZgw5yMDmgc+bGDPcDpfFP7ncs5y/L2OeUrP3WBkxJ6lmdkTjLJzsBiIRZYi6Rv
         TIUtAKLhUfjO5kMrHX46SyLdxioMF3UIeuhOb6DaMIebwq6PDD7McdEgpZvDL3vH+/P9
         Cwy6x9l9xdwtH1XpT/pVdQk0teEYr7vfq9yeMU6y5IssiDW+FD5QMeKmc2UgT1aoM3N9
         Wbs7e+tXq/4escirl+x2PVrRYFdduDAitMrhsBJRNihz1b6OVf4KeW+JKUxaUA1862Ar
         ZVwdLglaUSZQ/nLLV/XsOkybsDwPdPa7DMX7P+PGA6o0r7IwZgBKwLAN+UhrPiUGlAmH
         AFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194782;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qDCpDGgHNtS2NsIBbrdrVDnUk/BCKkJzDAx6MtlGpG4=;
        b=qC5Ubl6D7kuy1NTj8+1vX1ChueGUaz80ZCogfceX+sf1B9UWocj7hyf4V8uABVMA9d
         XIfytrZL8+IIr9uH5ApcWp1YMfBdn9ssUgkXuk5dv4vwXF4VndLxzQSQUOiUAHsjUru2
         wMAL2BmDHFciMCWbmV7rjVGax/m+nrFfc9h2GGSNl7O1eafSm8Hm4MbzVlO45cK+W6QQ
         8C2Bmn4ZazKDuh5zroUH/HK0y7WvNEHDc8utuiscyswhrU9nLpDphKpQXkuvMqFhUmxO
         xQIoqcWN9m29Qy52ieaDWxuce3R8detv5bASo/ukBKdY8EKcPTPJaEjfe75oyswu8cAw
         5M+g==
X-Gm-Message-State: AO0yUKUJHnP5N32SIA+ZrBPdBMsJ2vbryTIO9Turvdsc3LHRtg6xi6bF
	fIIhkuspe+r0cmS78OamWtY=
X-Google-Smtp-Source: AK7set8WPR6Yp/tqqLyYNyklxSdVu4GIQkkt5j9my+mdaUgJmpBeQg3o8FhZICQtfrVogJ777Aqk3Q==
X-Received: by 2002:a05:600c:b85:b0:3eb:966e:b2a5 with SMTP id fl5-20020a05600c0b8500b003eb966eb2a5mr9363200wmb.17.1678194782334;
        Tue, 07 Mar 2023 05:13:02 -0800 (PST)
Message-ID: <46e7e298e52afcee46bb7fd52ddd181227356c98.camel@gmail.com>
Subject: Re: [PATCH v5 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 07 Mar 2023 15:13:00 +0200
In-Reply-To: <17d7dc28a767ec9012d4a7ac3d337c4b9c34d98e.camel@gmail.com>
References: <cover.1677839409.git.oleksii.kurochko@gmail.com>
	 <5cd3dd5233cf41ad54ce1cd98b706085b95bfcee.1677839409.git.oleksii.kurochko@gmail.com>
	 <91343570-3532-521f-9bfe-3a68902426d0@suse.com>
	 <17d7dc28a767ec9012d4a7ac3d337c4b9c34d98e.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

> > > > > +
> > > > > +#define BUG_FRAME(type, line, ptr, second_frame, msg) do
> > > > > {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH +
> > > > > BUG_LINE_HI_WIDTH));=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON((type) >=3D
> > > > > BUGFRAME_NR);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0 asm volatile (
> > > > > _ASM_BUGFRAME_TEXT(second_frame)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :: _ASM_BUGFRAME_INFO(type, l=
ine, ptr,
> > > > > msg)
> > > > > );=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> > > > > +} while (0)
> > >=20
> > > Isn't this tied to BUG_FRAME_STRUCT being defined (or not)? At
> > > least
> > > the 1st BUILD_BUG_ON() looks problematic if an arch wasn't to use
> > > the generic struct: With how you have things right now
> > > BUG_LINE_{LO,HI}_WIDTH may not be defined, and the check would
> > > also
> > > be at risk of causing false positives. Perhaps it's appropriate
> > > to
> > > have a separate #ifdef (incl the distinct identifier used), but
> > > that
> > > first BUILD_BUG_ON() needs abstracting out.
> Missed that. Thanks.
> I'll introduce that a separate #ifdef before BUG_FRAME:
>=20
> #ifndef BUILD_BUG_ON_LINE_WIDTH
> #define BUILD_BUG_ON_LINE_WIDTH \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON((line) >> (BUG_LI=
NE_LO_WIDTH +
> BUG_LINE_HI_WIDTH))
> #endif
I think even better will be to do in the following way:

#ifndef LINE_WIDTH
#define LINE_WIDTH (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH)
#endif

#define BUG_FRAME(type, line, ptr, second_frame, msg) do {           =20
\
    BUILD_BUG_ON((line) >> LINE_WIDTH);                              =20
\
    BUILD_BUG_ON((type) >=3D BUGFRAME_NR);                             =20
\
    asm volatile ( _ASM_BUGFRAME_TEXT(second_frame)                  =20
\
                   :: _ASM_BUGFRAME_INFO(type, line, ptr, msg) );    =20
\
} while (false)

~ Oleksii



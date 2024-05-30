Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9A98D50CF
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 19:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732882.1138927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCjOc-0003nq-1P; Thu, 30 May 2024 17:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732882.1138927; Thu, 30 May 2024 17:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCjOb-0003lb-US; Thu, 30 May 2024 17:16:57 +0000
Received: by outflank-mailman (input) for mailman id 732882;
 Thu, 30 May 2024 17:16:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LA40=NB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCjOa-0003gj-2n
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 17:16:56 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a1bac40-1ea8-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 19:16:55 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52a54d664e3so309863e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 10:16:55 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d75f4bsm18250e87.161.2024.05.30.10.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 10:16:54 -0700 (PDT)
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
X-Inumbo-ID: 6a1bac40-1ea8-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717089415; x=1717694215; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3KyvK7NuDDcsd/qpYPAYUyHPjbobIFeX5lcnSbEZTks=;
        b=HMpG5pic5tKX+nFTVvv+ZjE5YwNzvq2w21rlWFqmxPLrhSRWQnTDaYQZM5c785JVGJ
         ob34sniieUzPvbRgDFgbBhuXHgEomE+0WzQdE+i4SkEN6WgPTWYAYJI2nmnyU4UQ5I1I
         fKX9C5EOUGHwjbchVAczeKi7/N7esgNiHikK31Zqad0zo74neOiHKThJ/mgFmqsC+HLQ
         J2Rlc5t1JYRXxqKeW/FNyMURgwfAfqkkE+6Ug6EWDxf34WwXWbFqina2JbqrkDArHCx6
         H6m28lYsk7OV/Dyme23iN4SizeanKaai014YgOvQfMcNGxOljQ5kSCYmFUPc/+/addTe
         dyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717089415; x=1717694215;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3KyvK7NuDDcsd/qpYPAYUyHPjbobIFeX5lcnSbEZTks=;
        b=e6TbP4J0tn1JXlAV9ONdIfpFip5Wfz9g7qYYiFjdaOPldC7NrytnHlwarsf6GZ7p60
         uaNw4OLYA/y0rzz0lTVrF1R/CWP2hi9z+03CJeUdkVCCQuRSmaV1ZWm1Q+eKtYL2Mp/L
         JqCezyILNstcC1FeYAQYNc5s3+PZsImW2rNhBT+GuOErT+c/cWd33GbEgS6CRIE7X049
         vvo39rmwXA1YQObG23A25Lx1fWHLV+uAp5hx5JsQ289pQwGGq1HEGU71CJJK/16kDVkp
         9+IMQLeGXOwQmxsMyK182TsDXG7NL+GvlRnY+YJeVTTGi63k65t7QYrSQiGcGRbPDh/L
         mdXA==
X-Forwarded-Encrypted: i=1; AJvYcCWrsoaRl+N9fMpskHPl1eMu7OSpXlxoahM7ZaoeqWJJVXYujKqHvIyd+lOCnn6eRjYcc8f03idLivrwj1roNEg5dBHDlpYv0FW9W5+3LZ4=
X-Gm-Message-State: AOJu0YxAD3oe5UqvEJ4VsHNnxiZP0t/qh1sWvwpoWUo/HL9oU7+l1xMQ
	cql2Dj1OIDd+V2HHY62sAow8rIezdDy/mKygdyQ5NW1J1qV9okLp
X-Google-Smtp-Source: AGHT+IF+CJtFue6WSdCAjfghn2Y0V1T5+JFeYSBPaGWTWZt5ajAqE0KZhKzvk6esrBMR/9MSmPGXYA==
X-Received: by 2002:ac2:518d:0:b0:52b:8612:eddd with SMTP id 2adb3069b0e04-52b8612eebemr30778e87.17.1717089414947;
        Thu, 30 May 2024 10:16:54 -0700 (PDT)
Message-ID: <27148c63318ef78d542db7cc20373e3cb3836df3.camel@gmail.com>
Subject: Re: [PATCH v12 8/8] xen/README: add compiler and binutils versions
 for RISC-V64
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,  Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini
	 <sstabellini@kernel.org>
Date: Thu, 30 May 2024 19:16:54 +0200
In-Reply-To: <065c4b2f-93b6-428f-beca-b77e6f98cecc@citrix.com>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
	 <c6ff49af9a107965f8121862e6b32c24548956e6.1717008161.git.oleksii.kurochko@gmail.com>
	 <065c4b2f-93b6-428f-beca-b77e6f98cecc@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-30 at 17:47 +0100, Andrew Cooper wrote:
> On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
> > diff --git a/README b/README
> > index c8a108449e..30da5ff9c0 100644
> > --- a/README
> > +++ b/README
> > @@ -48,6 +48,10 @@ provided by your OS distributor:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - For ARM 64-bit:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GCC 5.1 or later
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GNU Binutils 2.24 or=
 later
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - For RISC-V 64-bit:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GCC 12.2 or later
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GNU Binutils 2.39 or late=
r
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Older GCC and G=
NU Binutils would work, but this is not a
> > guarantee.
>=20
> This sentence isn't appropriate to live here.
>=20
> The commit message saying "this is what we run in CI" is perfectly
> good
> enough.
>=20
> With this dropped, Reviewed-by: Andrew Cooper
> <andrew.cooper3@citrix.com>.=C2=A0 Can fix on commt.
I am okay with dropping this sentence, but someone ( unfortunately I
don't remember who Jan? Julien? ) requested it, and I think it would be
nice to hear their opinion before doing so.

~ Oleksii


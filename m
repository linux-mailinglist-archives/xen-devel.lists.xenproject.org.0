Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3DD91440A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 09:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746180.1153162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLea7-0004dm-Cd; Mon, 24 Jun 2024 07:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746180.1153162; Mon, 24 Jun 2024 07:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLea7-0004cG-9f; Mon, 24 Jun 2024 07:57:43 +0000
Received: by outflank-mailman (input) for mailman id 746180;
 Mon, 24 Jun 2024 07:57:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeV4=N2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sLea5-0002Wx-UQ
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 07:57:41 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e9d82c5-31ff-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 09:57:41 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2eaea28868dso52607311fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 00:57:41 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a725459233csm85895566b.96.2024.06.24.00.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 00:57:40 -0700 (PDT)
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
X-Inumbo-ID: 6e9d82c5-31ff-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719215861; x=1719820661; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MUw2iKVVN6VeYr37kWbNB40ZsEbrYHSv0Bpzc9f3ObA=;
        b=kPcb+Mrd4Lt8fZ6tbxdJgtETrKxggBzpUMkWvzfiwZtMo6DNIbv2ashTXA4lFYKYdo
         Mh6Je0I7uloiNr3CjZ9hVPRHG16zRxjVNfc1PESpExsxY8saexrtSFi8YPMWhTUv1/ZO
         2WdAXvs9mtFLjga5TIeWrjb55AyGsEfHBDWSVC7O+5ksyjJMswtgs0bO83URRt+zhcNl
         UHBRPtpgv9epIGDRvuGIs91oLHKjm5Y2iESuCRfjCCPBji6xjtwGzPJmGu+JIBrpXnQi
         N5+JB6UpiSbx7uThJ10bIzywh83dPC8rAkJa8txRPOB+grYEMHZnL7NOLDeatRRrAw8/
         brew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719215861; x=1719820661;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUw2iKVVN6VeYr37kWbNB40ZsEbrYHSv0Bpzc9f3ObA=;
        b=R8lIfdoRJ/M3eyVzRDsakvyu+B98pN1dPYYdzLPBWbpS5iP02RTtU6qwj2k7aiIexU
         yajAbbpCim32Zth6HPC3/AFvzO7KX1CEYkxQyVFBPfCqgEm9PqOrMNqNeRj+IgHurqEJ
         mf7G51pRsGwXqtaAL71dHB6BrDEzxgiz9n/yXLbgVOPAf7JEda9OvZCihgLHkCIcjNYl
         zR3lzaUnBTzTX+Tzu11ShN0YSQl+1NXPRbvmh5HNNDRxeHPLWMwEauKhOCvctEw0LRhY
         Ms3999nMTd+dZRJGscZyu11t+jOtPDnypToQ4RQ1TBehohx5F1TmoMcVwwJUK19MbLvN
         sgMQ==
X-Gm-Message-State: AOJu0Yyw6ONgLlKoJTSL0hp5I+PsdwxtWUEL/zHfjLe25BtVtkVhjM8S
	d661jFmEfXD7npi7GT1m1SlZ1hQH0W7I/M0L0J6h6Pd75wjCT13WOXh95P/E
X-Google-Smtp-Source: AGHT+IFTMbAtAhceHtzn1H6AdsiprfPuqdnbgMUeRCjae8kcxJ/ZKAM+5Y9U08BB/l7pWCOSKbNuXg==
X-Received: by 2002:a2e:8817:0:b0:2ec:5945:62e9 with SMTP id 38308e7fff4ca-2ec5b31d1d5mr27330931fa.32.1719215860669;
        Mon, 24 Jun 2024 00:57:40 -0700 (PDT)
Message-ID: <e79fa18334a0bde4dbd1e94ea4037a4bb7ac2bec.camel@gmail.com>
Subject: Re: [PATCH v2] common/unlzo: address violation of MISRA C Rule 7.3
From: Oleksii <oleksii.kurochko@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Alessandro Zucchelli
	 <alessandro.zucchelli@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Andrew Cooper
	 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Date: Mon, 24 Jun 2024 09:57:39 +0200
In-Reply-To: <alpine.DEB.2.22.394.2406211431210.2572888@ubuntu-linux-20-04-desktop>
References: 
	<847f9b715b3c8e2ba0637fdd79111f4f828389c6.1718976211.git.alessandro.zucchelli@bugseng.com>
	 <alpine.DEB.2.22.394.2406211431210.2572888@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-06-21 at 14:31 -0700, Stefano Stabellini wrote:
> On Fri, 21 Jun 2024, Alessandro Zucchelli wrote:
> > This addresses violations of MISRA C:2012 Rule 7.3 which states as
> > following: the lowercase character `l' shall not be used in a
> > literal
> > suffix.
> >=20
> > The file common/unlzo.c defines the non-compliant constant
> > LZO_BLOCK_SIZE with
> > having a lowercase 'l'.
> > It is now defined as '256*1024L'.
> >=20
> > No functional change.
> >=20
> > Signed-off-by: Alessandro Zucchelli
> > <alessandro.zucchelli@bugseng.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> Asking for a release ack for this trivial change
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

>=20
>=20
> > ---
> > Changes from v1:
> > Instead of deviating /common/unlzo.c reports fro Rule 7.3 they are
> > addressed by
> > changing the non-compliant definition of LZO_BLOCK_SIZE.
> > ---
> > =C2=A0xen/common/unlzo.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/xen/common/unlzo.c b/xen/common/unlzo.c
> > index bdcefa95b3..acb8dff600 100644
> > --- a/xen/common/unlzo.c
> > +++ b/xen/common/unlzo.c
> > @@ -52,7 +52,7 @@ static inline u32 get_unaligned_be32(const void
> > *p)
> > =C2=A0static const unsigned char lzop_magic[] =3D {
> > =C2=A0	0x89, 0x4c, 0x5a, 0x4f, 0x00, 0x0d, 0x0a, 0x1a, 0x0a };
> > =C2=A0
> > -#define LZO_BLOCK_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (256*=
1024l)
> > +#define LZO_BLOCK_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (256*=
1024L)
> > =C2=A0#define HEADER_HAS_FILTER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000080=
0L
> > =C2=A0#define HEADER_SIZE_MIN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (9 + =
7=C2=A0=C2=A0=C2=A0=C2=A0 + 4 + 8=C2=A0=C2=A0=C2=A0=C2=A0 + 1=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +
> > 4)
> > =C2=A0#define HEADER_SIZE_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (9 + =
7 + 1 + 8 + 8 + 4 + 1 + 255 +
> > 4)
> > --=20
> > 2.34.1
> >=20



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594EC759AF7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 18:37:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565968.884630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMA9h-0005Kn-7c; Wed, 19 Jul 2023 16:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565968.884630; Wed, 19 Jul 2023 16:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMA9h-0005Ic-4w; Wed, 19 Jul 2023 16:36:01 +0000
Received: by outflank-mailman (input) for mailman id 565968;
 Wed, 19 Jul 2023 16:35:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sL7T=DF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qMA9f-0005IW-DL
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 16:35:59 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5710cf07-2652-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 18:35:58 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fb77f21c63so11895136e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jul 2023 09:35:58 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 d15-20020ac25ecf000000b004facdf96283sm1014442lfq.254.2023.07.19.09.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 09:35:57 -0700 (PDT)
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
X-Inumbo-ID: 5710cf07-2652-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689784558; x=1692376558;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=34HwFqw9v9Zok3ThA1MH7NTmtjrv3Eg0tsKIwTD+vRk=;
        b=EEiHCmlHUXVHUq1dSu3+XCPp7txGtWwIgHWfQC+mUCLLNeP1EePA9zglCj3n0clIlW
         RaPTNMMQzIS6oh6+pyFJzA2rE8ika68ZXxP18wMr/hwYYf2fBZbXQkMWdfLSB5QEDZsp
         Tx6owTyy0HamXPfMAMYvXjyJ70rO7Yd5urMy/pUxVwo6xxbwd+6mSnbdUFp/wOVx+i+V
         gZGkm1jP3PTXtEOQSAhjH5ammrBGyf/vAut1RC9ytb1aXjw7Dp4B15B/OmHQGNdQ9pi0
         jEKKJYX+gjP93pA+yjYjTWW4CrJDH8trPdkpcG0zGHIluKypu/H5I+rr1Y1pfgQdESJl
         5O3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689784558; x=1692376558;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=34HwFqw9v9Zok3ThA1MH7NTmtjrv3Eg0tsKIwTD+vRk=;
        b=kDD+BRhO/NsGMjSWWAegsHfTcAVJQDdhSlHzIk2ZPVV4jTwIgjKWxWMGT5LhZDHQXi
         ovj2JUHnhTSVDX7W37Rd4FhVMMq8y6wVlhvvwH44EmPz5R5DtfBatr7XsQxLFLE1/Fxh
         9sdbul9PjR19kruiPNxiMiiuMIn6E3MlSZGyT2nTp4bF32k8ZaklFqjFypmahjTjo36P
         kp3pY5XPKYQfpk0EoDQqPSJXehekm247ocQoOFbEGd/VpAMpNqUK+wvpbUMbSZatwaGM
         VOk2O/ma1SQDB8BdlDtpNOPL3lFgL4+bdhcxoBx4xxA07/mwt756mu+RgCMaiSzrcYk0
         6Hhw==
X-Gm-Message-State: ABy/qLbMC1RAVXbUZSPtczbNJDGAwQvCf0/MsKI/eCOxbjT+qhw8waCb
	ZKUJWBDcA4NRWCyPYUtSgyA=
X-Google-Smtp-Source: APBJJlFgQ+YXFkPkGRm8YWgcykonQqnnYeGEyO1PgZPDA8aryggbN+D+HL2L80VmcokR2rW3nmq6DQ==
X-Received: by 2002:a19:e016:0:b0:4f8:596a:4bb7 with SMTP id x22-20020a19e016000000b004f8596a4bb7mr293938lfg.57.1689784557743;
        Wed, 19 Jul 2023 09:35:57 -0700 (PDT)
Message-ID: <30540953fb363fce4dfd59f8a7e709247a9872fd.camel@gmail.com>
Subject: Re: [PATCH v3 3/3] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 19 Jul 2023 19:35:56 +0300
In-Reply-To: <ad53c037-3c1b-ff1a-93df-b79ab2948174@suse.com>
References: <cover.1689604562.git.oleksii.kurochko@gmail.com>
	 <8c69050d7b1f42df5e776ca9494164a4d15f2d52.1689604562.git.oleksii.kurochko@gmail.com>
	 <ad53c037-3c1b-ff1a-93df-b79ab2948174@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-07-18 at 17:03 +0200, Jan Beulich wrote:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned long load_end =3D LINK_TO_LOAD(_end);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned long pt_level_size =3D XEN_PT_LEVEL_SIZE(i -
> > 1);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned long xen_size =3D ROUNDUP(load_end -
> > load_start, pt_level_size);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned long page_entries_num =3D xen_size /
> > pt_level_size;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 whi=
le ( page_entries_num-- )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 pgtbl[index++].pte =3D 0;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
>=20
> Unless there's a "not crossing a 2Mb boundary" guarantee somewhere
> that I've missed, this "break" is still too early afaict.
If I will add a '2 MB boundary check' for load_start and linker_start
could it be an upstreamable solution?

Something like:
    if ( !IS_ALIGNED(load_start, MB(2) )
	printk("load_start should be 2Mb algined\n");
and
    ASSERT( !IS_ALIGNED(XEN_VIRT_START, MB(2) )
in xen.lds.S.

Then we will have completely different L0 tables for identity mapping
and not identity and the code above will be correct.

~ Oleksii




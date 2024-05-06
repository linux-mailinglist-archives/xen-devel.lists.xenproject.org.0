Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4F18BC984
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 10:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717308.1119383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tfM-00015a-7B; Mon, 06 May 2024 08:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717308.1119383; Mon, 06 May 2024 08:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tfM-00013n-4M; Mon, 06 May 2024 08:25:44 +0000
Received: by outflank-mailman (input) for mailman id 717308;
 Mon, 06 May 2024 08:25:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loHM=MJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s3tfL-00013h-9E
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 08:25:43 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a5115fb-0b82-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 10:25:42 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-518931f8d23so1546444e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 01:25:42 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a056512238300b0051cd6c9e9a2sm1532357lfv.152.2024.05.06.01.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 01:25:41 -0700 (PDT)
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
X-Inumbo-ID: 3a5115fb-0b82-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714983942; x=1715588742; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=puH2uGZgKYQUwSAx1rYEmvYiiuS0k81HyWFgtxzTHHY=;
        b=lPYKOR2btVCCowD5ELq90w25j8eiztKhD/jSLPzLjYrJHGAQKLx/+9y0CHNiihfGf2
         hVVhkmCpZBl1FCYDr5rSlgwDfSqNdkx9RAT0hI/wkiC4ZBdbzMsqsDaXGArv5BK6/faM
         2ulLjC6PS6Z9Zy1C/BipOyMC3Xu2W/WtLbvn8v5i3AxP4Qn7zgz/N43pj+sXooItTEif
         XE3rN/p5Se0L9ChwfONGYnW6ZbqbmKMwNk1nCQ/fvZpp3ZosO3jpsDSdsEbixtf9BuGg
         BJwiQT4Gp7NduU5541773v3dbzs8dI/s6w5UoOwkQAkLd3ZXtD7LUFzUpeMPf8TrSp45
         IDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714983942; x=1715588742;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=puH2uGZgKYQUwSAx1rYEmvYiiuS0k81HyWFgtxzTHHY=;
        b=cheNyl+QFqvuvVoIrNwFlch9M7WrJjkIlCY1pAiXec0GiVJU3Fmte48LAZLOKwtgg5
         AxqjaX072+V6SxoqxEV/SUETI3ZzeJU8w4dE4xXzjzL4c2fIbx/pLIR/hl6MStCkj7dE
         e6lQekwOj40BpE34puZ5JhVvmQqJyRUVaVyPW1blqDdSjIwrKCUC6ig3NO8wLy6l9oit
         ESWNvFldrXOR0Fp8a5fEDawh+Af38qBcUZvZTs7nAu8VQXkaGzhefW0QRumBdZz8NTu+
         Cn75DRBb4lmSxmK7IWNPAJEO08FfcW2qbAbTLnWnK20YPx6Td/znqV8nlMhR0ULsna2f
         nvfw==
X-Forwarded-Encrypted: i=1; AJvYcCVfl0KFjcO+NGsMwu1fGjuPnktzscVya6yVe0blxQPNy/k5cJ34D3jMSkd+8I6Pncz5WEzWnJ9tV7ZgE1c5c1tO+U91paSGGiCXqJHaHN0=
X-Gm-Message-State: AOJu0YwjUaK+cXYjGxMajNLruGr7zaOwOmBkyaS/Hs9K8OoE7CKRAlg7
	l8eZCS6T6Xg0loy3YWOaAGOT59z0b59UFaIqSVxbs2HfmzffLHoz
X-Google-Smtp-Source: AGHT+IE8K8rwmBVSUmxgfm3wxQpwyx/B1T8lvnAmjmG7fbLYIU9sEDnKKptpJ0FDqsJ8pqLPhTCplQ==
X-Received: by 2002:ac2:43a7:0:b0:51c:348:3ba9 with SMTP id t7-20020ac243a7000000b0051c03483ba9mr5670038lfl.22.1714983941693;
        Mon, 06 May 2024 01:25:41 -0700 (PDT)
Message-ID: <609d3d5da1c95b14281233860f7619e6d15de195.camel@gmail.com>
Subject: Re: Xen 4.19 release status tracking list [ May ]
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Cc: committers@xenproject.org, community.manager@xenproject.org, Kelly Choi
	 <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org
Date: Mon, 06 May 2024 10:25:40 +0200
In-Reply-To: <8c0bc745-05f5-4839-b920-7830e2c55688@suse.com>
References: <32e2d9dddfaa80e8edfaa5a7207c4e7fb7862a45.camel@gmail.com>
	 <8c0bc745-05f5-4839-b920-7830e2c55688@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Mon, 2024-05-06 at 09:11 +0200, Jan Beulich wrote:
> On 03.05.2024 18:54, Oleksii wrote:
> > *** x86 ***:
> > =C2=A0 * [PATCH 0/4] iommu/x86: fixes/improvements for unity range
> > checks [
> > https://lore.kernel.org/xen-devel/20240201170159.66330-1-roger.pau@citr=
ix.com/
> > ]:
> > =C2=A0=C2=A0=C2=A0 - almost patch series have been merged already excep=
t the
> > patch:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH 4/4] iommu/x86: make =
unity range checking more
> > strict
> >=20
> > =C2=A0 * [PATCH 0/8] x86: support AVX10.1 [
> > https://lore.kernel.org/xen-devel/298db76f-d0ee-4d47-931f-1baa1a7546cf@=
suse.com/
> > ]:
> > =C2=A0=C2=A0=C2=A0 - two patches of patch series are waitng to merged/r=
eviewed:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH 1/4] amd-vi: fix IVMD memory type=
 checks
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH 4/4] iommu/x86: make unity range =
checking more strict=20
>=20
> This sub-item doesn't really fit the topic, and seems to rather
> belong
> to the earlier one?=C2=A0
Thanks for correction, it is belonged to previous topic.

> Where (correctly) 1/4 isn't listed anymore, for
> having gone in. As to 4/4 - Roger, I'm not sure I can conclude what
> the
> plan here was: Are you meaning to submit an updated version, or did
> we
> rather settle on not further pursuing this?
>=20
> > =C2=A0 * APX support?
>=20
> I think you should drop this now. I'm throttling further work on the
> insn
> emulator, as long as I have so many other patches there pending
> review.
>=20
> > =C2=A0 * [PATCH v6 0/4] x86/pvh: Support relocating dom0 kernel [
> > https://patchew.org/Xen/20240327215102.136001-1-jason.andryuk@amd.com/
> > ]
>=20
> There had been a v7, and all of that plus a follow-on adjustment have
> gone
> in.
>=20
> > *** common ***:
> > =C2=A0 * annotate entry points with type and size" series:
> > =C2=A0=C2=A0=C2=A0 The bulk of this has gone in, but there'll want to b=
e follow-
> > ups.
>=20
> I think these follow-ups now want tracking on a per-arch basis (x86
> and
> Arm, with PPC and RISC-V filly done).
>=20
> > =C2=A0 * [PATCH v2 (resend) 00/27] Remove the directmap [
> > https://lore.kernel.org/xen-devel/20240116192611.41112-1-eliasely@amazo=
n.com/
> > ]
> > =C2=A0=C2=A0=C2=A0 - 7/27 were merged.
>=20
> Hmm, no, I don't think that one was. Other were, yes.
>=20
> > =C2=A0 * [PATCH v6 0/7] MSI-X support with qemu in stubdomain, and othe=
r
> > related changes:
> > =C2=A0=C2=A0=C2=A0 - new patch version was sent
>=20
> 1/7 was committed.
>=20
> > =C2=A0 * [PATCH v3 0/4] xenwatchdogd bugfixes and enhancements [
> > https://lore.kernel.org/xen-devel/20240411182023.56309-1-leigh@solinno.=
co.uk/
> > ]:
> > =C2=A0=C2=A0=C2=A0 new patch series were sent.
>=20
> Was there anything left from that series?
I double-checked and everything has been merged. Thanks for correction.

I'm considering writing a script to automate the process of checking
whether the patches in a patch series have been merged or not.
Currently, I'm doing it manually, so there's a chance I might miss
something. It would be helpful if such a script already exists.

~ Oleksii


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95B267944A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 10:33:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483458.749646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKFev-0000Po-9v; Tue, 24 Jan 2023 09:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483458.749646; Tue, 24 Jan 2023 09:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKFev-0000N1-5t; Tue, 24 Jan 2023 09:32:05 +0000
Received: by outflank-mailman (input) for mailman id 483458;
 Tue, 24 Jan 2023 09:32:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z8X8=5V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pKFes-0000Mv-QJ
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 09:32:02 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3bec086-9bc9-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 10:32:00 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id y1so8739972wru.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jan 2023 01:32:00 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 f12-20020a5d664c000000b002bfafadb22asm999041wrw.87.2023.01.24.01.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:31:58 -0800 (PST)
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
X-Inumbo-ID: f3bec086-9bc9-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Ir6j/FLQz51gs79EMnHR8g5ulcJ/hqUQFsjnYUxf1o=;
        b=VfrE5UFaFfZY/lDNFGBm/p5RceBhWIXrZkGge+8XKW55zFLW2EWTw58O6DU0zPev9w
         HP95TRXoiRwb4jeQOFAj7DcTxPy2q/OouaFtjHB5j2G2zcyHMFymLuEPwRv3V6w02JxN
         aPUJCHRmC39RotLE1S9bwD0M9P+3qGRKkor4hze3q7hcz4kGSX2TryjSrSZ8A9t4Yzjx
         tt11adCwistSibApofvFV4yv5Y1pCmRMDWLuIghVIvYOG4m2BSkm/mkBAbDvEz+BJHQ7
         JtWqdY69GPMgyhc/Z5QU+8euCbDLv2qjlx5rjZK21CYgPlEOKjGf6ozVlmIzXRDg4/0G
         Dxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Ir6j/FLQz51gs79EMnHR8g5ulcJ/hqUQFsjnYUxf1o=;
        b=sGIpQGTain5PCtH3bqOV3XSYRZkmF4ootr18z6t9T6nGf19sZ6jrB+H2Lmh8ikeJ7C
         N1eFa6fgE7VfruUDrd8347J2KaETIGPDHd/Vw4xAOL2Fq9DbGKmVzQSAKumeLAaU7WOt
         fSqiaZZ93JzIZBh6/tDEuAnVO22awFgROztXsU276mFs3c70KjlqQGox79faweBKMYrr
         SWMmEA4TP3r75kiGtWz3VSsSdUrdC6duIMooPKzYczNjxYQCqvJTfOotbS4D8rpw4VF+
         YsrsYSs+xMfxsq/YfJmnMxeCmVPKKef79RKnDaMWqOTEAlXYL5kcqLIsfHqdO7JQHNTF
         LzEg==
X-Gm-Message-State: AFqh2kr75mlstDjNYP+N1UuOuH/sftaLf7RWRQONB9QMO2jHAnVE/5JK
	Y2485nTrK99KojgQZ0YFzDw=
X-Google-Smtp-Source: AMrXdXuxSAk4qj+sILGMdxfSBiTaHumPWp9SOvsxLsMRQ6MQc65EvYmm8LZIm5nOe2AlNG4J07hURg==
X-Received: by 2002:a5d:50d0:0:b0:2bd:c2d7:2700 with SMTP id f16-20020a5d50d0000000b002bdc2d72700mr24982572wrt.42.1674552719356;
        Tue, 24 Jan 2023 01:31:59 -0800 (PST)
Message-ID: <57b2c406fc1ac735d9b45150a7d7353d93a90a31.camel@gmail.com>
Subject: Re: [RISC-V] Switch  to H-mode
From: Oleksii <oleksii.kurochko@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: "bobbyeshleman@gmail.com" <bobbyeshleman@gmail.com>, 
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "gianluca@rivosinc.com"
 <gianluca@rivosinc.com>,  "andrew.cooper3@citrix.com"
 <andrew.cooper3@citrix.com>
Date: Tue, 24 Jan 2023 11:31:58 +0200
In-Reply-To: <0f810fd4de8b5b05ceddd53a9ce26e8be9014eb2.camel@wdc.com>
References: <18aa47afaebce70b00c3b5866a4809605240e619.camel@gmail.com>
	 <0f810fd4de8b5b05ceddd53a9ce26e8be9014eb2.camel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-01-23 at 22:32 +0000, Alistair Francis wrote:
> On Mon, 2023-01-23 at 18:56 +0200, Oleksii wrote:
> > Hi Alistair and community,
> >=20
> > I am working on RISC-V support upstream for Xen based on your and
> > Bobby
> > patches.
> >=20
> > Adding the RISC-V support I realized that Xen is ran in S-mode.
> > Output
> > of OpenSBI:
> > =C2=A0=C2=A0=C2=A0 ...
> > =C2=A0=C2=A0=C2=A0 Domain0 Next Mode=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 : S-mode
> > =C2=A0=C2=A0=C2=A0 ...
> > So the first my question is shouldn't it be in H-mode?
>=20
> There is no H-mode in RISC-V.
>=20
> When the Hypervisor extension exists the standard S-mode
> automatically
> becomes HS-mode. The two names can be used interchangeably (although
> the spec calls it HS-mode).
>=20
> In this way Linux (with or without KVM support) and Xen all boot in
> the
> same mode and can choose to use virtulisation if desired.
>=20
> >=20
> > If I am right than it looks like we have to do a patch to OpenSBI
> > to
> > add support of H-mode as it is not supported now:
> > [1]
> > https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_d=
omain.c#L380
> > [2]
> > https://github.com/riscv-software-src/opensbi/blob/master/include/sbi/r=
iscv_encoding.h#L110
> > Please correct me if I am wrong.
> >=20
> > The other option I see is to switch to H-mode in U-boot as I
> > understand
> > the classical boot flow is:
> > =C2=A0=C2=A0=C2=A0 OpenSBI -> U-boot -> Xen -> Domain{0,...}
> > If it is at all possible since U-boot will be in S mode after
> > OpenSBI.
>=20
> S-mode is where you want to be. That's what Xen should start in.
>=20
Thanks for clarification.

~ Oleksii
> Alistair
>=20
> >=20
> > Thanks in advance.
> >=20
> > ~ Oleksii
>=20



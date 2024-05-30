Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073268D5271
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 21:40:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732994.1139067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sClcU-00068Z-78; Thu, 30 May 2024 19:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732994.1139067; Thu, 30 May 2024 19:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sClcU-00065i-4L; Thu, 30 May 2024 19:39:26 +0000
Received: by outflank-mailman (input) for mailman id 732994;
 Thu, 30 May 2024 19:39:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LA40=NB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sClcS-00065c-Mv
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 19:39:24 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50d53f1f-1ebc-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 21:39:23 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2e95a883101so16615601fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 12:39:23 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91ce8773sm502891fa.102.2024.05.30.12.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 12:39:22 -0700 (PDT)
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
X-Inumbo-ID: 50d53f1f-1ebc-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717097963; x=1717702763; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+nrLzN7m2dk4bnSZ+3NSo2S7ZYGMRvpTxgRNUYuc4/Y=;
        b=CEHRECgrfqIMxpoOlLZqW5fZFkmxpsuFXGahe3CeLpLokaRrNCsn9qp56SK6/I6ldu
         bX8YvMCF3JTxvS07NsfywV+fYan6VYKmR1KfsoJQwp0TCvNp7eD74sBNrpceNGul9AC6
         oV1UUGOPkMVUxX7OEmj8bpp2jFQj8TfTt1PBeN9+0+x2PDqM6CMbUMVHt5Ieec0UGC+V
         1dwBydaJpHoQ/arvvqxOKJCgN3yeIqqLVCY7kwy9N21iVulrzPAit3udBeLntZ5FSRiw
         Y3mdW57T0j6aqeHYwvrboPzd9LQiiF5I+k/sTQrVr3RhrEtXmdSrxTPCp44eKnvLjAf6
         qyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717097963; x=1717702763;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+nrLzN7m2dk4bnSZ+3NSo2S7ZYGMRvpTxgRNUYuc4/Y=;
        b=gTRm7Aw6i/Q6cGnxPac+PVNYr42FR75p34310WZJtHXUJUTS+w1h8nsjq2I8rPMDAe
         SIJ8u/EJUIdq5HXOUGu0LO7PSGef01J4Fv/Lk57wfs75Kcsn3uQHCFvxqstkVYAxUn0D
         KNLKvhgXTT7m+4SB+en5/CDh/dYjZYjCuXIAV3SV1VJn+6T4rcrAubRB7dFypJgnaSnf
         AubOW1Vf+LUql3YBiHh7dq/XrWhpJYG1HDYtPrJSI0jRIw28fqkA365tRu4581XWAyYL
         Jp6KmzW+ib51rJgncsfqdVoTT+QT6sA89kHCZh6r8IHgkhn5PNvOcYBHkAo4i792nGto
         c+ww==
X-Forwarded-Encrypted: i=1; AJvYcCWfphNmcK95XnTt2/pkdOfhaevHIGQqx4TgyHfU2Z5yXd9MclVRzUYAk07ASQZvQP4Dn6wkEGB/IwqMRY1LA8areDl6k/HT49s9AqTeHrQ=
X-Gm-Message-State: AOJu0YxDElIb+UsG3UfbYJKnaj79VkHfuD6/Wq+jHYKec9l3+6trz5YP
	jZg3NT+d7m9UlBUu6lIL8IruCXkCEiirHIV3hpsXqy4mRuRISCoi
X-Google-Smtp-Source: AGHT+IFvZ6E7VIR1loWl5lNDeAIlA3+tQEMoEMJpUbEaBHSY07oLpZeoGlNno/mrIcv1dXk9nkmB4g==
X-Received: by 2002:a2e:7a09:0:b0:2e9:5689:6fde with SMTP id 38308e7fff4ca-2ea8479f906mr18058261fa.14.1717097962518;
        Thu, 30 May 2024 12:39:22 -0700 (PDT)
Message-ID: <a925b579a3a7309532248f9d647e7ffcfc2d30af.camel@gmail.com>
Subject: Re: [PATCH for-4.19 0/2] arch/irq: Untangle no_irq_type
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Date: Thu, 30 May 2024 21:39:21 +0200
In-Reply-To: <20240530184027.44609-1-andrew.cooper3@citrix.com>
References: <20240530184027.44609-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-30 at 19:40 +0100, Andrew Cooper wrote:
> Found when reviewing Oleksii's series to enable the RISC-V build.
>=20
> The way no_irq_type works is horrifying.=C2=A0 Make it less-so.
>=20
> Andrew Cooper (2):
> =C2=A0 arch/irq: Make irq_ack_none() mandatory
> =C2=A0 arch/irq: Centralise no_irq_type
>=20
> =C2=A0xen/arch/arm/include/asm/irq.h |=C2=A0 3 +++
> =C2=A0xen/arch/arm/irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++------------
> =C2=A0xen/arch/ppc/stubs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 11 ++++-------
> =C2=A0xen/arch/x86/irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +----------
> =C2=A0xen/common/irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 +++++++++++++
> =C2=A0xen/include/xen/irq.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 8 +++++++-
> =C2=A06 files changed, 30 insertions(+), 30 deletions(-)
>=20
>=20
> base-commit: 9a905d7dc65883af082532b4dc91ce0131e54047
I am okay to have it in release if the necessary acks will be recieved.

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


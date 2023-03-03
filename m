Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD736A958F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:49:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505851.778824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2yI-0002Em-Hg; Fri, 03 Mar 2023 10:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505851.778824; Fri, 03 Mar 2023 10:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2yI-0002Bk-Ev; Fri, 03 Mar 2023 10:49:06 +0000
Received: by outflank-mailman (input) for mailman id 505851;
 Fri, 03 Mar 2023 10:49:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y5Qx=63=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pY2ou-0005jk-8g
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:39:24 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a932bc37-b9af-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 11:39:22 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id b10so1907674ljr.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 02:39:22 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 r2-20020a2e8e22000000b00295b6bdfdfdsm248570ljk.4.2023.03.03.02.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:39:22 -0800 (PST)
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
X-Inumbo-ID: a932bc37-b9af-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677839962;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jBWgFJNWip+tyTcYc5WrRRw32M0fkAbakg28KHyQrWw=;
        b=Gto9XXSD28Q2wbsaaNYWHKq/bU00vLEUbavKQPgG6bM82zG0I0+OJMfDX5v0y2iHCA
         5CUWKC9wboq5NQZUYnIT1UHNyfuKL1K3ACem1CPV1gQ/NgG8rQVugJEmWn7CMSc2QpwE
         sZAA78o162O7pTMtq+ZVjzxV0i+TXWVxnbGbfOLr8+/FK8Y19tfJ+UrItkzk03+edYH1
         uoAdu/NaqTY5bU6m69ZTHm1ASZoDOmGl+LhErDIk6CSXFUCdi5dgLb7wFpZjyx6cLJRE
         6cgBuH1ldcMvNoDHYhTWiVIY6KOZgHWWs2+/RVRe7UTgVeUs5tsXB9EXYjReiycDOGq7
         Hk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677839962;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jBWgFJNWip+tyTcYc5WrRRw32M0fkAbakg28KHyQrWw=;
        b=P1B016BSqrieBTVjKytka5fud1fjAI4lZwdQKvVW6t0C9SQD7kQDNRMsq1YmQaoPiZ
         KuT3HrDfIuv2IkYPfn7IvKtvXaKyiuZwc5Se86lDgunPljPDZDI03GoarjygLPCPloqc
         hfsUqGvGnzhoK9wM51SwbK/WV2KNkxr1AYxIJWI6W8lNyPIdNzxa+kOsfFhHq19LMfgE
         D90zTuqnWXF7ryJWo0JxTfCMBa4vBmYWlkVyjw7nY1jJjYiuZPJFmy1iGCRfwq30xbfE
         rujwNd7RHg3tqQeJju3Hm7wfSXn/IBl7VMbDSGOqEckkbpKdDzlajYaZn8jFfT/7Iq0X
         CH3g==
X-Gm-Message-State: AO0yUKVBChVYLPCCGbJVoBMIY759DDgVHh4m0/2GO+k4Sq/z6u+9LnQw
	m7wT+Opz9afKMEx4XErnqovD40V6+h4=
X-Google-Smtp-Source: AK7set/4Ht8IqFWidyXT+X2xQ7vGw6sVuE7xZPlYUphMP14Z0VRfi9bzQWb+za2uBcrhR3Jpp31eQg==
X-Received: by 2002:a2e:7815:0:b0:293:4be5:de5a with SMTP id t21-20020a2e7815000000b002934be5de5amr386721ljc.14.1677839962417;
        Fri, 03 Mar 2023 02:39:22 -0800 (PST)
Message-ID: <d72374ec501e9f0f589904cc18f04e3aca95d6ec.camel@gmail.com>
Subject: Re: [PATCH v3 2/3] xen/riscv: read/save hart_id and dtb_base passed
 by bootloader
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Date: Fri, 03 Mar 2023 12:39:20 +0200
In-Reply-To: <8fd12d0f-cf2f-ee66-6b05-9a7d116ac422@citrix.com>
References: <cover.1677838213.git.oleksii.kurochko@gmail.com>
	 <43aaa58fac47029b7d11f1d80d310786d7a078a6.1677838213.git.oleksii.kurochko@gmail.com>
	 <8fd12d0f-cf2f-ee66-6b05-9a7d116ac422@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-03-03 at 10:27 +0000, Andrew Cooper wrote:
> On 03/03/2023 10:24 am, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although it
> occurs to me...
>=20
> > diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> > index 1c87899e8e..d9723fe1c0 100644
> > --- a/xen/arch/riscv/setup.c
> > +++ b/xen/arch/riscv/setup.c
> > @@ -7,7 +7,8 @@
> > =C2=A0unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
> > =C2=A0=C2=A0=C2=A0=C2=A0 __aligned(STACK_SIZE);
> > =C2=A0
> > -void __init noreturn start_xen(void)
> > +void __init noreturn start_xen(unsigned long bootcpu_id,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long dtb_base)
>=20
> dtb_base probably wants renaming to dtb_paddr as the pagetable series
> is
> just about to make it a non-identity mapping between the two address
> spaces.
>=20
> Can fix on commit if you're happy with the suggestion?
I will be happy with that.

Thanks.

~ Oleksii


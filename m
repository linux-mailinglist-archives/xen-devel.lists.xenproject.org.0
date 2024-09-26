Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B938986EC4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 10:28:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805044.1216054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stjrG-0008JI-HZ; Thu, 26 Sep 2024 08:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805044.1216054; Thu, 26 Sep 2024 08:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stjrG-0008H7-EX; Thu, 26 Sep 2024 08:28:18 +0000
Received: by outflank-mailman (input) for mailman id 805044;
 Thu, 26 Sep 2024 08:28:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukdd=QY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1stjrF-0008H1-5Z
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 08:28:17 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46763982-7be1-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 10:28:15 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-535dc4ec181so801099e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 01:28:15 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a85e634bsm729382e87.77.2024.09.26.01.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 01:28:13 -0700 (PDT)
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
X-Inumbo-ID: 46763982-7be1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727339295; x=1727944095; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lGRp41j8jBr+fOL6zCtCnSshxAN4WSLO1iAz64CXBhA=;
        b=SsTLSc7Zam8wODU3k8m+nfjUNdT2ZOl8rmPH5HCJ2LKR1r/pQ3D3e4VAUogzQosEH2
         bOFDD4PrQXE9kyk2V791Lnd9DYqXhhrty7AsE6XGLHFAb++MFQIDxk0S8hHb3mySh62a
         nOF7wsnulIsckFJ08bCtGxmJmr87gE/5gaknnMayAyfwhIhteHKOcDRA90Up9E72Tnye
         JbWcStOI1Fr1Q8aTeWsy0SsSOTa3ccQ0mAZuJYu1hBjsjeUULg85UXJ32VfOs+lw/UhT
         wZAMTuzm0bje9KlOGFiOC26FDvTTH4yxjlRyYOpWLBnkhXcmwyz0v76PAgXNV7QXB8Wq
         Z6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727339295; x=1727944095;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lGRp41j8jBr+fOL6zCtCnSshxAN4WSLO1iAz64CXBhA=;
        b=K/sYAcB6wElLLmYsoA1HvyNwiw/f4t2ZriVBH95gffpcczbkvaYNO5Vmus8UlQfbfM
         XKAcn2QygEVHvbyVFKPMVRg93jd+CT2V+aH8N/s+aAbjp3i4PqVX35H7opJKPiQJ+fML
         WeBz8KPFx3DNLa/g2uQjoWaM4vUX388YLwALycEWk1fpJO++M67OPw1dWKY1aA5ur7fO
         LIqOaObcCXxorcouqXTAP8B0NXMhw8dMUru6Cip+mb5XNp87XDEYUGjvpK6JXWwNVAwY
         OCfS5ePRyP4MRgTq8uDr5y8y105KLis38WrNF2HdwH7FKEZGD8Hn78FPpTxsondxN8rU
         l7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVxo9Td0GO4Mintg+4Szqjc5MQMNTeICOKagLAgz8OwbCEbdNDwCVerDr09/OtPED6KLjlQEQzl8bM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9s1NmAdHSQywGnV2oXc7igLH8dEaDpzrw7s3UNHXvwtt/oaJv
	+ZuPYSqbChyci4GDvz1XvCYXGCttwU97S+LoUBNiGPMNTSUZrZdd
X-Google-Smtp-Source: AGHT+IFDPjFXr7mWPe80f06uvFnItJCSd9+8+KDyOBrJWzU9de/vCxYviVK/mKVUPoOwZ/NIWPbsjA==
X-Received: by 2002:a05:6512:128b:b0:536:54df:bffa with SMTP id 2adb3069b0e04-5387755cc03mr3523734e87.45.1727339294225;
        Thu, 26 Sep 2024 01:28:14 -0700 (PDT)
Message-ID: <fb48c9346b18d78b0bd94443d2d7505b0eeed438.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] xen: move per-cpu area management into common
 code
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2024 10:28:12 +0200
In-Reply-To: <9256b42d-fc9d-4a4a-b2b6-799da107bdbf@suse.com>
References: <cover.1727185495.git.oleksii.kurochko@gmail.com>
	 <e573f9d46e7af0806381f6a41af00dc415bf87bb.1727185495.git.oleksii.kurochko@gmail.com>
	 <9256b42d-fc9d-4a4a-b2b6-799da107bdbf@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-09-25 at 17:12 +0200, Jan Beulich wrote:
> On 24.09.2024 18:42, Oleksii Kurochko wrote:
> > --- a/xen/include/asm-generic/percpu.h
> > +++ b/xen/include/asm-generic/percpu.h
> > @@ -10,7 +10,14 @@
> > =C2=A0extern char __per_cpu_start[];
> > =C2=A0extern const char __per_cpu_data_end[];
>=20
> Afaics the only users of these two are in the new common/percpu.c.
> These
> decls want to mover there then, I think, to limit exposure.
>=20
> > =C2=A0extern unsigned long __per_cpu_offset[NR_CPUS];
>=20
> The definition for this moves to the new common/percpu.c. Hence this
> declaration wants to move to xen/percpu.c.
>=20
> Overall with the generalization you do I'd expect asm-
> generic/percpu.h
> to go away altogether. That is, ...
>=20
> > -void percpu_init_areas(void);
> > +
> > +#ifndef PARK_OFFLINE_CPUS
> > +/*
> > + * Do we, for platform reasons, need to actually keep CPUs online
> > when we
> > + * would otherwise prefer them to be off?
> > + */
> > +#define park_offline_cpus false
> > +#endif
>=20
> ... this, for example, would likely also better be put in
> xen/percpu.h in
> the new model.
Agree, we could move everything to xen/percpu.h and just leave asm-
generic/percpu.h empty for Arm, PPC and RISC-V usage and define
asm/percpu.h only for x86.

I will stick to this approach.

Thanks.

~ Oleksii


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6180796B876
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 12:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790045.1199748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnES-0005gE-7W; Wed, 04 Sep 2024 10:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790045.1199748; Wed, 04 Sep 2024 10:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnES-0005dm-43; Wed, 04 Sep 2024 10:27:24 +0000
Received: by outflank-mailman (input) for mailman id 790045;
 Wed, 04 Sep 2024 10:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JixD=QC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1slnEQ-0005dW-CK
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 10:27:22 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4513c97d-6aa8-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 12:27:21 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-533461323cdso8025705e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 03:27:21 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535698c49ecsm76876e87.3.2024.09.04.03.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 03:27:20 -0700 (PDT)
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
X-Inumbo-ID: 4513c97d-6aa8-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725445641; x=1726050441; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8cNyBJ6r1ka3gDMbOpt26U7LmwemhxNxhmmBhgwtreI=;
        b=fktvyt1oZiOOptspUlq1W9Rh9KPzDyGBDy2bNCkuu65xrUMuIyxaNKCuTak8Io7DlD
         WOt7aFvM73W0gVO3UdMTZYLSRUNmwoWhMLzasxDTXRC+SjrsZ4C9QKchn7aCAbxTsQWo
         a5xR+wNbQwsLXURiWgcQhiWxppMCDY4D1gk9HvkKYgDQW4Q0cnCkf4FYbHBVR7GqRLaf
         7okf0Vg0IX7k9G4ZBKg7t0qXB8vJx0m+7J5pfSmBUCeqyzCPTi+70wUUMxI/ANXbb47n
         CBFbt8wcAut45e95WCMNcoOy1n3TPO6nxyHp6XIsfLZ9FMq425dd9Ey8fDmUVUWwFdaR
         IQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725445641; x=1726050441;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8cNyBJ6r1ka3gDMbOpt26U7LmwemhxNxhmmBhgwtreI=;
        b=FOFGcxaESF1bFug/klZoQ7m7L9/1U4RlMqG8XSlZtVhngJhoqe1yRtQyzSCRgPsguG
         iL17pwGUx6/GLSu8a2xc+TXvztrkUjKhs+6M0uxXAtrUpI1UpLmaIoJEMN/ypVBqMzDo
         3wC2eEUArJCvybqtptBlCnapjAMMCs2an5Z0F2l+Sy7evG4WK9qThZWevZuThWGVr/aq
         ZZRgCHPEVKSr/YkzTMrOi/BbL7d++mKP589fBQGZB3cx1SXAbJVFQQl0PACXOkhY686t
         ZReUhhPBrWYVMi9XHNWlNTlefos56IsW51PUI3hLQq2hkUUU/BNyFClDzH7Dq3ko9Cd3
         J9jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMH6PXPuOr27hB4HjIbG0WqnawHNSKjE0ubAfOjtOVxpyVmWrZajv/6coeSjv6IY21kK9XQtsKZWQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8l59QrRPy1PSaZ76viYZnkYTrv5mz+WJ/meuJmQ0PmcAShVuc
	xx33l4+GMApTAz84xc5B5snGEzGgviEgktup4ktpZg82RXRfzw0x
X-Google-Smtp-Source: AGHT+IHmwnF8XIMEQ7V7Q92WboPqMJRIFmWR29TZnulsE3qPHwhIawmacx7nXkTAIOe+s5KYDlJMtg==
X-Received: by 2002:a05:6512:138e:b0:530:ea6a:de42 with SMTP id 2adb3069b0e04-53546b2a186mr10332762e87.26.1725445640873;
        Wed, 04 Sep 2024 03:27:20 -0700 (PDT)
Message-ID: <c6e42423d925e26942f2cfd0dafba09e0ed5b78a.camel@gmail.com>
Subject: Re: [PATCH v6 2/9] xen/riscv: use {read,write}{b,w,l,q}_cpu() to
 define {read,write}_atomic()
From: oleksii.kurochko@gmail.com
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Date: Wed, 04 Sep 2024 12:27:19 +0200
In-Reply-To: <577dea81-06a7-4ca3-9a22-e76c966b5dcf@citrix.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
	 <4b62d7e3faa24f6070430607262a3aed1bbf1861.1725295716.git.oleksii.kurochko@gmail.com>
	 <577dea81-06a7-4ca3-9a22-e76c966b5dcf@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-09-03 at 15:21 +0100, Andrew Cooper wrote:
> On 02/09/2024 6:01 pm, Oleksii Kurochko wrote:
> > diff --git a/xen/arch/riscv/include/asm/atomic.h
> > b/xen/arch/riscv/include/asm/atomic.h
> > index 31b91a79c8..3c6bd86406 100644
> > --- a/xen/arch/riscv/include/asm/atomic.h
> > +++ b/xen/arch/riscv/include/asm/atomic.h
> > @@ -31,21 +31,17 @@
> > =C2=A0
> > =C2=A0void __bad_atomic_size(void);
> > =C2=A0
> > -/*
> > - * Legacy from Linux kernel. For some reason they wanted to have
> > ordered
> > - * read/write access. Thereby read* is used instead of read*_cpu()
> > - */
> > =C2=A0static always_inline void read_atomic_size(const volatile void *p=
,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *res,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int size)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 switch ( size )
> > =C2=A0=C2=A0=C2=A0=C2=A0 {
> > -=C2=A0=C2=A0=C2=A0 case 1: *(uint8_t *)res =3D readb(p); break;
> > -=C2=A0=C2=A0=C2=A0 case 2: *(uint16_t *)res =3D readw(p); break;
> > -=C2=A0=C2=A0=C2=A0 case 4: *(uint32_t *)res =3D readl(p); break;
> > +=C2=A0=C2=A0=C2=A0 case 1: *(uint8_t *)res =3D readb_cpu(p); break;
> > +=C2=A0=C2=A0=C2=A0 case 2: *(uint16_t *)res =3D readw_cpu(p); break;
> > +=C2=A0=C2=A0=C2=A0 case 4: *(uint32_t *)res =3D readl_cpu(p); break;
> > =C2=A0#ifndef CONFIG_RISCV_32
> > -=C2=A0=C2=A0=C2=A0 case 8: *(uint32_t *)res =3D readq(p); break;
> > +=C2=A0=C2=A0=C2=A0 case 8: *(uint32_t *)res =3D readq_cpu(p); break;
>=20
> This cast looks suspiciously like it's wrong already in staging...
Thanks for noticing that, it should be really uint64_t. I'll update
that in the next patch version.

~ Oleksii


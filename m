Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E26026A1FE4
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 17:44:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501294.772978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbAp-0008H2-OL; Fri, 24 Feb 2023 16:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501294.772978; Fri, 24 Feb 2023 16:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbAp-0008FK-LT; Fri, 24 Feb 2023 16:43:55 +0000
Received: by outflank-mailman (input) for mailman id 501294;
 Fri, 24 Feb 2023 16:43:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVbAn-0008EV-KT
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 16:43:53 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b57e1a2-b462-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 17:43:52 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id i9so18482718lfc.6
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 08:43:52 -0800 (PST)
Received: from [192.168.8.199] (46.204.108.92.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.92]) by smtp.gmail.com with ESMTPSA id
 i19-20020a056512007300b004dd7fefd2c8sm571491lfo.242.2023.02.24.08.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 08:43:51 -0800 (PST)
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
X-Inumbo-ID: 6b57e1a2-b462-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BPSRDjzdeB6txEqgf31L69bsNBIZpJBcGCUVmQUMvow=;
        b=Jbwivhhsyp6NmIirVTDq0Ay8uIPynWaFixc1ORAuEuyO5BA09TSEKNoxBU07mhU/w7
         P2kmIW2xjtls2yXvoj5po+TmYC1exZh5ddp9uJJ3R2caQMBp/CBKRMYxDlTHe28pEGuq
         iEN47V6JN804Mm/eeVfWE4ma6jeg2UkBMXWlgZ8BDvWtLF8h9eK5387x3sUE7yKNlMS2
         louajjp48udf6eMeiJ6iZYQ3vW7zhvd82KU60c+RIfyKQo+bspVmpXLYHKR5O8EXRPjB
         5mWMwg0LkTqEPpOgN0dwgIC8zEsv979VXwW1IL0RTi9nfw/ooZSKhx9uHdwoy6m2o0fG
         O+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BPSRDjzdeB6txEqgf31L69bsNBIZpJBcGCUVmQUMvow=;
        b=vc1rP1q/V75nL7FZUHDhbYszyicewejeBbGQA8wqEzIaBAjwZYQkOcLhORl5zyO/90
         KVrJHZqoF4GszW21+WW8c0qJvhnXK9t03EM/Juon0WyoDltS4xrDPrWrTRkIQcAyJvca
         1AUSv+gPCVbvvjiB6iuO8wnYRKILQajfHN9XS8ulHOQBcrCeVtIJnbk/jNqKFhitakYU
         jFx5UIDemvgPQr3+xCev+X+wUYHudc0dGdBrF1/cXEsjj3lGerfXSXQ24bDELy4dWF+A
         WNCVsG9dlcaq53Ibg6m1shczwUdCPhsdAFHQDpj+z0Aw00AeadLaV3j2+cxyQg/Gig+x
         ergw==
X-Gm-Message-State: AO0yUKVpFWroOdF9nCueGz+UBMKhDGDzHfnV78E5qFIbzR33bGmN/Iqt
	0YRybXcXbS936EJp1Qw2ivk=
X-Google-Smtp-Source: AK7set9PCqIaaQPnEYXdGQws7RFxWAeG1oClAj3Y/Ca2uM2PFg5Zs3wNYslc9KKRwVURrbXVL/UvbA==
X-Received: by 2002:a19:ac45:0:b0:4cb:1189:285c with SMTP id r5-20020a19ac45000000b004cb1189285cmr6453054lfc.10.1677257031376;
        Fri, 24 Feb 2023 08:43:51 -0800 (PST)
Message-ID: <a7f7160d431041d861bedb0921a76461bb09a00d.camel@gmail.com>
Subject: Re: [PATCH] xen/riscv: init bss section
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Fri, 24 Feb 2023 18:43:49 +0200
In-Reply-To: <d0a46792-ed15-788e-6a61-f6b0d8f36983@suse.com>
References: 
	<134bf758ecd93deffc6623605a8c020a17f64be8.1677249688.git.oleksii.kurochko@gmail.com>
	 <d0a46792-ed15-788e-6a61-f6b0d8f36983@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-02-24 at 15:56 +0100, Jan Beulich wrote:
> On 24.02.2023 15:48, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/setup.c
> > +++ b/xen/arch/riscv/setup.c
> > @@ -24,6 +24,18 @@ static void test_macros_from_bug_h(void)
> > =C2=A0=C2=A0=C2=A0=C2=A0 early_printk("WARN is most likely working\n");
> > =C2=A0}
> > =C2=A0
> > +static void __init init_bss(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 extern char __bss_start;
> > +=C2=A0=C2=A0=C2=A0 extern char __bss_end;
>=20
> Better use [] and then perhaps omit the & operators further down.
> However, I thought we have a compiler warning option in use which
> precludes extern declarations which aren't at file scope. Even if
> I'm misremembering, perhaps better to move them.
Thanks. I will update the code then to use [].
>=20
> > +=C2=A0=C2=A0=C2=A0 char *bss =3D &__bss_start;
> > +
> > +=C2=A0=C2=A0=C2=A0 while ( bss < &__bss_end ) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *bss =3D 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bss++;
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
>=20
> If you're sure you can defer this until being in C code, why not use
> memset()?
I had an issue with from <xen/string.h>


#ifndef __HAVE_ARCH_MEMSET
#define memset(s, c, n) __builtin_memset(s, c, n)
#endif

but there is no issue any more so I think I can use memset().
>=20
> Jan
~ Oleksii


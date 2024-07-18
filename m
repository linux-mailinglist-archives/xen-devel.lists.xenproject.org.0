Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDDA934D4B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 14:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760462.1170314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQMZ-0002YX-Eo; Thu, 18 Jul 2024 12:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760462.1170314; Thu, 18 Jul 2024 12:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUQMZ-0002VS-CD; Thu, 18 Jul 2024 12:35:59 +0000
Received: by outflank-mailman (input) for mailman id 760462;
 Thu, 18 Jul 2024 12:35:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lg7+=OS=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sUQMX-0002VL-Re
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 12:35:57 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45e3096e-4502-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 14:35:55 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1721306142615762.886477000092;
 Thu, 18 Jul 2024 05:35:42 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e04196b7603so760319276.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 05:35:42 -0700 (PDT)
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
X-Inumbo-ID: 45e3096e-4502-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; t=1721306149; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m3zpbycuyT4tdA4frOLQc1KUJnzxVxZBU3l+1loALEwkQdiM7E0Cr2/Rnoravrq1bgb7EAhzyTiFkEYIucR3aGuiWrsr7Dkqc08Xip1Cyb675SPLuVXQqSJi0FCKH1EHwojufKJox7Z2RWrmWuDBdR/6hiEzBWohYPv8KbmCzdU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1721306149; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FRgdaSUZyLRQ3CEP0Nm1cYTilO/hWIfCThtWEAs/Pc8=; 
	b=cuQx11HkDm5L+Y9MHhi9hQIWx++gIKko0xPnvs4p3Ma1ehI7ITxQSLjpF3v0wfLkvKqm0NIy+CU6X5fW+N+3xoqYxpKiqUYjC7U25PlVvvfzRLhp3WixwmTr3yg6XYfsbHcEIL570VicPNylEqdSHZmiYKp1Rdb1za8p+LWWNWg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1721306149;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FRgdaSUZyLRQ3CEP0Nm1cYTilO/hWIfCThtWEAs/Pc8=;
	b=fgxzNepkciV5dmzw4JNCBawaWbNVZjIqhwL4mShqsL6AldoYq935HCazph7mHvf6
	ighMg5KRLfLeHfyWXwYs9wZTYyTYoPs1tfmnl3cOt/NzbXR3x9H6I/K/mbGb/r81EVN
	Ez5pJziKj3I+QjTEzhgMGQEjzGuykwMiDdhsbaLU=
X-Forwarded-Encrypted: i=1; AJvYcCU/BErzsmr3M1RQ9f5Zzx4+iiZ2laWzh1l6yZgcFVUrGwiiTI3xRCyKVWDV5DcSXifPJLnuOzqXdait18JNi8jZXNvABf9VVj1Aox3sDwA=
X-Gm-Message-State: AOJu0YxFN+EcXF6GvKKQLa1HkoOXbh3qzw1ogI903EPEqnIoy/N6KFiy
	VA5BVb5wjSXOx9ct17zNuHWfJ7myfKXBGxsqI3dxacfIudK7wk3rWc9B7V5CNCU0IWxkyCmqXCT
	sw35Dk67yg1WM2Hdzu5oG59eITOQ=
X-Google-Smtp-Source: AGHT+IFkRiVyFjWVz1scjTWu2eSsIXxkMsps6hGwC5ufvZuTLUMhXqCVrgo1tiedOqRSSRkDFoutJ34/FrFZI41q9Hk=
X-Received: by 2002:a05:6902:2b02:b0:e03:4efe:df92 with SMTP id
 3f1490d57ef6-e05ed79632cmr5916397276.53.1721306141820; Thu, 18 Jul 2024
 05:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
 <32302065-672c-480f-8491-d73982598e77@suse.com>
In-Reply-To: <32302065-672c-480f-8491-d73982598e77@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2024 08:35:05 -0400
X-Gmail-Original-Message-ID: <CABfawh=_Zg+jQe6muxfd5T+sfy2SJUdF03Q4qXVaF8aNVjhGyQ@mail.gmail.com>
Message-ID: <CABfawh=_Zg+jQe6muxfd5T+sfy2SJUdF03Q4qXVaF8aNVjhGyQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 7:03=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 26.06.2024 00:47, Tamas K Lengyel wrote:
> > This target enables integration into oss-fuzz. Changing invalid input r=
eturn
> > to -1 as values other then 0/-1 are reserved by libfuzzer.
>
> And existing behavior (for afl) is unaffected because there we (wrongly)
> ignore the return value altogether.
>
> > @@ -67,7 +70,8 @@ distclean: clean
> >
> >  .PHONY: clean
> >  clean:
> > -     rm -f *.a *.o $(DEPS_RM) afl-harness afl-harness-cov *.gcda *.gcn=
o *.gcov
> > +     rm -f *.a *.o $(DEPS_RM) *.gcda *.gcno *.gcov \
> > +        afl-harness afl-harness-cov libfuzzer-harness
> >       rm -rf x86_emulate x86-emulate.c x86-emulate.h wrappers.c cpuid.c
>
> This is what I said for v1:
>
> "I'm inclined to suggest it's time to split this line (e.g. keeping all t=
he
>  wildcard patterns together and moving the rest to a new rm invocation)."
>
> Could this really be misunderstood to mean anything other than
>
> clean:
>         rm -f *.a *.o $(DEPS_RM) *.gcda *.gcno *.gcov
>         rm -f afl-harness afl-harness-cov libfuzzer-harness
>         rm -rf x86_emulate x86-emulate.c x86-emulate.h wrappers.c cpuid.c
>
> ?

Evidently, yes.

> With that
> Acked-by: Jan Beulich <jbeulich@suse.com>
> and I'm kind of okay making that adjustment myself while committing.

Thanks! That is appreciated.
Tamas


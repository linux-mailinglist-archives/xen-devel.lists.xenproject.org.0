Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F646923ACA
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 11:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752190.1160328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaDL-0007eq-AP; Tue, 02 Jul 2024 09:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752190.1160328; Tue, 02 Jul 2024 09:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaDL-0007d9-7U; Tue, 02 Jul 2024 09:54:19 +0000
Received: by outflank-mailman (input) for mailman id 752190;
 Tue, 02 Jul 2024 09:54:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOaDJ-0007d3-ET
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 09:54:17 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ab7f3d3-3859-11ef-a59d-41c015c667e1;
 Tue, 02 Jul 2024 11:54:15 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5295e488248so5056183e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 02:54:15 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab10032sm1755525e87.70.2024.07.02.02.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 02:54:14 -0700 (PDT)
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
X-Inumbo-ID: 0ab7f3d3-3859-11ef-a59d-41c015c667e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719914055; x=1720518855; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gURZLjQedFdRgRZH7hmw9O0YrnVLnTjmRqB06Mf0L+g=;
        b=jatWDhGU3uPdXaQtzqPS4cudHNx19Q66Ln5nwXDx7+htDzimB4V6WADtoAl3mlmti3
         5b1D3czosw7RJzW28eoMXlZ+t6iPxEbHv/CS5udWP65sD5MwcCxEU0DHzz/tK+5cZM3l
         QSa4ssWakr8IjDAe3t4qJ6QsH9Db80KoCFYYVo2fqM9lUFKeFOiov88SparZn8pGpRNT
         teNyKMYQjSsefXLV6/7A9c8Ww8VaMRBooGInfRILNsku3SBPUDhqwbKfbD3lbkMgBSEW
         uk+ZX3x1rVsVAhfajzaRpEHA3Q+/A/8GyLgBdtzTIIZHFce8DuufAUIfWtBs+2V5OQpA
         kyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719914055; x=1720518855;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gURZLjQedFdRgRZH7hmw9O0YrnVLnTjmRqB06Mf0L+g=;
        b=XkunttvOHiX/C3EMpQLowweIlbPMaxr9Vj/eVQz+F7cHid9UfVZoP/ANJFmvGXW7dy
         6uUXfnd1DCy2rh3V7Z7CU+FYSMn6mmHCg4N1FTItpuoTF/wovgbqHZeg3AO8hn6BOOjO
         9xAkf+j4Q1L6AfsS9Tw+yiJ1sBv3EzW9CMJecuUPm+6YEtOIfCghBLmIzqlrzr4Jwid4
         m02zVWFnOHq8FZpJufLOwhIwgwfltVi3g15sQ4rNvXACfHa4p/94RGT4H2uf60tEiMjS
         tmJABlw40bwHP1iht5Ypy/nJU8GfehJgVOT8aqEIJqBbtSjrb94eoZolJ5VrA95d8mhI
         FqDw==
X-Forwarded-Encrypted: i=1; AJvYcCUSgxwjRaij9jXsqTyCQarFHsTrL/Zmrq/U/6uiuEvfGAxa5VVPzc6CgjCjGxJnjH0hP9kJ0bdB7vJuDw0n7pMbR18+HW4vZlwaRCI1gZY=
X-Gm-Message-State: AOJu0YzIGgwhZ1pyIVzPo5okFYMI6XZTiyVVpaIwKP7KmyHZChujXgEZ
	Exe4kDzJoQQwmgWkeivKDP+vBrFYwQsTHQ404sp6IYjZ7zaB19l3
X-Google-Smtp-Source: AGHT+IHcpu07EQMyi69IjlRkzh3FOKOw5w7jUHYZy26TLHoSA36QuuscbeJnByWgPAOGsUvXxezgsw==
X-Received: by 2002:a05:6512:b8c:b0:52c:e171:ba2 with SMTP id 2adb3069b0e04-52e8267191amr5667896e87.17.1719914054915;
        Tue, 02 Jul 2024 02:54:14 -0700 (PDT)
Message-ID: <196a92b89db9935ea6b0adecd10de3277b978dff.camel@gmail.com>
Subject: Re: [PATCH for-4.19] x86/entry: don't clear DF when raising #UD for
 lack of syscall handler
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,  "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Date: Tue, 02 Jul 2024 11:54:14 +0200
In-Reply-To: <378af810-02ea-4a66-b003-c1303f599e2a@citrix.com>
References: <36cf1c15-faa5-4e25-8fdd-9c52076f4ca2@suse.com>
	 <378af810-02ea-4a66-b003-c1303f599e2a@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-01 at 16:35 +0100, Andrew Cooper wrote:
> On 06/03/2024 1:44 pm, Jan Beulich wrote:
> > --- a/xen/arch/x86/x86_64/entry.S
> > +++ b/xen/arch/x86/x86_64/entry.S
> > @@ -47,12 +55,13 @@ UNLIKELY_START(z, syscall_no_callback) /
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 testb $4, X86_EXC_UD *=
 TRAPINFO_sizeof +
> > TRAPINFO_flags(%rdi)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 setnz %cl
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lea=C2=A0=C2=A0 TBF_EX=
CEPTION(, %rcx, TBF_INTERRUPT), %ecx
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or=C2=A0=C2=A0=C2=A0 $~0, %=
esi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 # don't clear DF
>=20
> Our predominant comment style is /* */
>=20
> > =C2=A0UNLIKELY_END(syscall_no_callback)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 movq=C2=A0 %rax,TRAPBO=
UNCE_eip(%rdx)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 movb=C2=A0 %cl,TRAPBOU=
NCE_flags(%rdx)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 call=C2=A0 create_boun=
ce_frame
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 andl=C2=A0 $~X86_EFLAGS_DF,=
UREGS_eflags(%rsp)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and=C2=A0=C2=A0 %esi, UREGS=
_eflags(%rsp)
>=20
> Could we gain a /* Conditionally clear DF */ comment here?
>=20
> Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> CC Oleksii for 4.19.=C2=A0 This fixes a subtle regression in the PV ABI
> caused by a post-XSA fix a few years ago.
>=20
> It's a low-risk fix to take; while I still don't have an XTF test
> covering this, the corner case it's changing used to be completely
> fatal
> to guests, so it's a corner unused in practice.
>=20
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii



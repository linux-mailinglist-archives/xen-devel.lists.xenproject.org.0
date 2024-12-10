Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162299EB460
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 16:12:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852709.1266431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1uI-0007hS-Qa; Tue, 10 Dec 2024 15:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852709.1266431; Tue, 10 Dec 2024 15:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1uI-0007fj-Mz; Tue, 10 Dec 2024 15:12:14 +0000
Received: by outflank-mailman (input) for mailman id 852709;
 Tue, 10 Dec 2024 15:12:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3V8=TD=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tL1uH-0007fd-PV
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 15:12:13 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 221d651c-b709-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 16:12:12 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aa6a3c42400so138762966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 07:12:12 -0800 (PST)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d149a49f79sm7749154a12.32.2024.12.10.07.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 07:12:11 -0800 (PST)
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
X-Inumbo-ID: 221d651c-b709-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733843532; x=1734448332; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65Em8QSlUXLFR8ulOa1t0ycxHy3COnuTlh9s0EWbqSk=;
        b=NXc3UqVF87fzkWpzVidV9LXMeHCKPosrWgZFy0V8TMKL7GxXrBGG7cGmZf0t5AJDEY
         uLlWRzqRpyl0pt2kr4T/e04jAB0f3W4nWKWYzqw6cZKI/W6GNNsDGayUk1d5OnbnzWuD
         MPJJu2AKTTf+eiMmotiC+tJH53So+IFR64EEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733843532; x=1734448332;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=65Em8QSlUXLFR8ulOa1t0ycxHy3COnuTlh9s0EWbqSk=;
        b=YovfYVpKsFuqh7NlO+MiM3HR1VHlCiznAAO5ltW7xz6sfIyb7ffrwLbj7d3u4vZRV5
         42tVXE6/l1ZbjODtNTZ9+unBk91R2SRtAXYsJv8Be6surfvyxI3bnbFoGdIjpRSQq6aB
         nzstgpDZCChu2ddA0oz+TgYIsVF1EK/yhu0sNfYUkA1XkfHToC+hrP9PhsdNjjybN9tX
         EtKwXy5ZHoquSLeEKZ97czVQ9cXxpT/vXt2j/pTptiljKZBE7P7F6PFNORamzwYctCdQ
         JTZRRwWztaZ5X8tf1fzKc5JmG0D6hfcEd+0BgKQHuaDzyqTh6M67kJdFZyqtgKoc/j6u
         HjxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWvlCU9TlFlxq/xEt8z2G6q9RhQuC94zpUwPwrZJsi1B+QO3sqPoBy7LEMClt6CCp3vXU9D3jY4+Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKXJPyKgHV4tpAO+bH/d3JuJf8qTL1Eb77ofU6HgSNEuOpW5O6
	hrkGfr+l94mhwxpGxE558L/F3clw3k2LenwR8yyKAE+VTxLXs0VCH31Ql7M+698=
X-Gm-Gg: ASbGnctglyKp4REShRAKkr+av+J9QJGHXGXC8nVL94l5R3EBwCSzl+2s88t3W/H3XWl
	odzyT6AcrGr89H+V9jn1bYP1/CPV7Ca643grQrXyY00sYviHhGREULA1ciEdiKivgQli14YXstM
	ucExe8e8+4JSArno4Jnkb9qlOfKneTg1QEu9PCiBUcli8FjFPT1YzCwoZOEoVTLM1n0JtYCk9YD
	iI/WTZqH/IgSjFm6ab2dDxxoOzGw2vzMmBk4hfgzJ4tkmd9nbcAPS7K8UsnZXo=
X-Google-Smtp-Source: AGHT+IFIUHccvHq+Av5npUzk+AJpA5aiV6QG7iPrplhLCKBUdR0VTOwGyDMQI7HBRLhthRO0bdwFpg==
X-Received: by 2002:a17:907:3da1:b0:a9a:6c41:50a8 with SMTP id a640c23a62f3a-aa6a01bebf7mr397425366b.17.1733843532191;
        Tue, 10 Dec 2024 07:12:12 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Dec 2024 15:12:09 +0000
Message-Id: <D6848HMS6BT5.RX9OAXRM91C8@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/FPU: make vcpu_reset_fpu() build again with old gcc
X-Mailer: aerc 0.18.2
References: <da8320f7-1baf-41f5-b7ac-c05b6371e1e4@suse.com>
 <D6838QWBS1OG.37M94XNPN17P7@cloud.com>
 <4e9c0566-bed7-47a6-aa6d-2ac76c0a1bfe@suse.com>
In-Reply-To: <4e9c0566-bed7-47a6-aa6d-2ac76c0a1bfe@suse.com>

On Tue Dec 10, 2024 at 2:34 PM GMT, Jan Beulich wrote:
> On 10.12.2024 15:25, Alejandro Vallejo wrote:
> > On Mon Dec 9, 2024 at 3:13 PM GMT, Jan Beulich wrote:
> >> Fields of anonymous structs/unions may not be part of an initializer f=
or
> >> rather old gcc.
> >=20
> > Can you add the specific version for tracking purposes?
>
> It's all the same as before, and I really didn't want to waste time on
> once again figuring out which exact version it was that the behavior
> changed to the better.

Just checked on Godbolt. 4.7.1 works and 4.6.4 doesn't. Adding that data po=
int
to the commit message really helps when navigating git-blame, even if it's =
not
as precise as it could be. Particularly if one wants to understand exactly
which quirk of which version of which compiler is being dealt with.

>
> >> Fixes: 49a068471d77 ("x86/fpu: Rework fpu_setup_fpu() uses to split it=
 in two")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> --- a/xen/arch/x86/i387.c
> >> +++ b/xen/arch/x86/i387.c
> >> @@ -306,13 +306,13 @@ void vcpu_reset_fpu(struct vcpu *v)
> >>  {
> >>      v->fpu_initialised =3D false;
> >>      *v->arch.xsave_area =3D (struct xsave_struct) {
> >> -        .fpu_sse =3D {
> >> -            .mxcsr =3D MXCSR_DEFAULT,
> >> -            .fcw =3D FCW_RESET,
> >> -            .ftw =3D FXSAVE_FTW_RESET,
> >> -        },
> >>          .xsave_hdr.xstate_bv =3D X86_XCR0_X87,
> >>      };
> >> +
> >> +    /* Old gcc doesn't permit these to be part of the initializer. */
> >> +    v->arch.xsave_area->fpu_sse.mxcsr =3D MXCSR_DEFAULT;
> >> +    v->arch.xsave_area->fpu_sse.fcw =3D FCW_RESET;
> >> +    v->arch.xsave_area->fpu_sse.ftw =3D FXSAVE_FTW_RESET;
> >=20
> > That's not quite the same though. A more apt equivalence would be to me=
mset the
> > area to zero ahead of the assignments. Otherwise rubble will be left be=
hind.
>
> No. I didn't delete the initializer. All fields not mentioned there will
> be default-initialized.

Right. I misread the diff and thought you had nuked the initializer. That's
indeed all fine. Which means...

>
> >>  }
> >> =20
> >>  void vcpu_setup_fpu(struct vcpu *v, const void *data)
> >=20
> > Out of context and not triggering the GCC bug, but vcpu_setup_fpu() sho=
uld
> > probably share the same initialization style as vcpu_reset_fpu(), imo.
>
> Why?

... there's indeed no reason to touch that.

>
> Jan

With the commit message adjusted with the offending GCC version (i.e: <4.7.=
1):

  Acked-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Cheers,
Alejandro


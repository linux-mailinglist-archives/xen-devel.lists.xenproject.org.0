Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6746A6A9F4
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:31:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922613.1326499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHrl-0007NA-6Q; Thu, 20 Mar 2025 15:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922613.1326499; Thu, 20 Mar 2025 15:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHrl-0007L4-3r; Thu, 20 Mar 2025 15:31:29 +0000
Received: by outflank-mailman (input) for mailman id 922613;
 Thu, 20 Mar 2025 15:31:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51pQ=WH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tvHrk-0007J5-DS
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:31:28 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63a3b303-05a0-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 16:31:27 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5e6ff035e9aso1820091a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:31:27 -0700 (PDT)
Received: from localhost ([46.149.103.12]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e81692e5b7sm10393482a12.13.2025.03.20.08.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 08:31:26 -0700 (PDT)
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
X-Inumbo-ID: 63a3b303-05a0-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1742484687; x=1743089487; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/GijB/q753y8Oa23iWj9M0wlYC7lxPkEzCweyP7t1Q=;
        b=j1kAcYryoVKhDs/9QL/TDfPuRwavPq8iLYUtlMeD1H8PWXf63K2s8W73gGhXBNf9Rp
         Y+J47Z5qPG8ncjWzKy+j0kOd7j8uV4iSn7rpWM9P053hLoq05blCpqX+ITk3P3GDRVy4
         KG+d/KOVJt1CG5f8jGLF5ELyJy4zTZTYs5wK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484687; x=1743089487;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z/GijB/q753y8Oa23iWj9M0wlYC7lxPkEzCweyP7t1Q=;
        b=VCY5ihR3E+21BHTNPMsQVl/3oqh9kn/JeS81Q0gpPZcjTBH7YFzpN1H0uuBQe6Vv/E
         3kfbRs2KmXdOeLSVraoggYs1rvVgc0rZvFN72HNYA9R3Jtbuxec13LtJaO0J33UyPvdS
         dQunbjaryuwhJ1yTfaHRdqFt/AHZEIZmWpq5lZrwzr52lEesDzmD1smNoojsw/I6mi8T
         SsCJkowAeiaaoX6MkCnUc0GBQWN47feYbVMXJxpQf/JGqpLDVVs68Yn8sYQ+jVMKdGTd
         ajfndkf1JzUI8oDepmeqQX5ZG6LuFmCLzUbr94nV+j6nPMPfRV8oP/3GDKBFIFkntcrD
         OkcQ==
X-Gm-Message-State: AOJu0YzFYnkCoUnfKQ27x/Q+W8AfAdJA5AI2+PVD2mIlQCtGCwwTpKFZ
	TOHI4mshHU92VlSSRpV67kHMbRyCoWOBQOYNC/u1InYIc7Y+Xmr3Tlkom6Sl9Aw=
X-Gm-Gg: ASbGncvV+iYfVU+DdndWxKTsWyuvRE1biOKSNcthSn8cRYXHVFyml0bQGPrHfjbfwPG
	7PthKL0QfdO1t4uUsk4gzUxcasgBsZvUsL+63XQWtTcNjG3QchbPgtMVLO5kqzPHyTWLk0c0zVR
	Jbe6Jaolv9rXEMXQ7r6e26wpmyczG1gCVATDsNZo/ywxDxYnBYq3aW/vql6xlYsuLeA2QBk1BH3
	9RaBrEtEtQWuB2BrJ59eFUu0FP2Xxr1/NkumEvXmSQB3vUbNmkN1vBDia7MqahKg6kYcLjVWsEb
	ZofCd3n/7ztJf9PTHIn5pkkmoVrnWtANA2XlR41qAmLttHupu1fUGhH7LkyM+Q==
X-Google-Smtp-Source: AGHT+IGEFm9/RRE/WtwC9EuJdpJb7WWZSbTBrTfgfq7Z9W/uHkDLBK6Kx2g5aPBih6tOpN7nOq0PCg==
X-Received: by 2002:a05:6402:2355:b0:5e7:f728:5812 with SMTP id 4fb4d7f45d1cf-5eb80d18e70mr8181821a12.19.1742484686737;
        Thu, 20 Mar 2025 08:31:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Mar 2025 15:31:25 +0000
Message-Id: <D8L79PLVQ1AA.2QU3KQUS8YYJN@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Xen-devel" <xen-devel@lists.xenproject.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Sergiy Kibrik" <sergiy_kibrik@epam.com>
Subject: Re: [PATCH v1] x86: make Viridian support optional
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.18.2
References: <20250317071919.3766976-1-Sergiy_Kibrik@epam.com>
 <CAFi36o263XOQbTpSGDcM3PmpY+MwodHi1tOXDp3W60N0n9b9YA@mail.gmail.com>
 <93e98ebb-4679-4c34-a5af-f105e89c7304@epam.com>
 <D8L6ZRL4CIUK.FGKVDP8TJAGU@cloud.com>
 <7a319cbb-d19c-44f2-b407-e173d575ba8b@suse.com>
In-Reply-To: <7a319cbb-d19c-44f2-b407-e173d575ba8b@suse.com>

On Thu Mar 20, 2025 at 3:22 PM GMT, Jan Beulich wrote:
> On 20.03.2025 16:18, Alejandro Vallejo wrote:
> > On Thu Mar 20, 2025 at 9:39 AM GMT, Sergiy Kibrik wrote:
> >> hi Alejandro,
> >>
> >> 17.03.25 11:19, Alejandro Vallejo:
> >> [..]
> >>>      =C2=A0endif
> >>>
> >>>     +config HVM_VIRIDIAN
> >>>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool "Viridian enlightenments support=
" if EXPERT
> >>>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on HVM
> >>>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0default y
> >>>     +
> >>>
> >>>
> >>>
> >>> I don't see why this should be gated by EXPERT, provided a
> >>> suitable (now absent) help message was to exist explaining
> >>> what it does in plain simple words.
> >>
> >> The option is intended primarily for fine-tuned systems optimized for=
=20
> >> particular platform and mode of operation. As for generic systems (e.g=
.=20
> >> distributions) whey wouldn't want to disable it anyway.
> >=20
> >=20
> >=20
> >>>
> >>> For the title, I'd say it needs to properly state it refers to
> >>> enlightenments for guests, rather than enlightenments for
> >>> Xen itself when running under Hyper-V. As it is, it sounds
> >>> ambiguous (Maybe "Hyper-V enlighnments for guests"?).
> >>>
> >>
> >> Agree, "Hyper-V enlighnments for guests" is better title.
> >> As for help message, would the one below be sufficient?:
> >>
> >>   help
> >>     Support optimizations for Hyper-V guests such as faster hypercalls=
,
> >>     efficient timer and interrupt handling, and enhanced paravirtualiz=
ed
> >>     I/O. This is to improve performance and compatibility of Windows V=
Ms.
> >>
> >>     If unsure, say Y.
> >=20
> > Sounds good enough to me.
> >=20
> >>
> >>
> >>> On a personal nitpicky preference note, I'd say HVM_VIRIDIAN sounds
> >>> rather redundant, and I think just VIRIDIAN works just as well
> >>> while being shorter.
> >>>
> >>
> >> this is rather to highlight the fact that the code is part of HVM=20
> >> support, a bit of self-documenting
> >>
> >> [..]
> >=20
> > That's fair enough.
> >=20
> >>>     diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h
> >>>     b/xen/arch/x86/include/asm/hvm/vcpu.h
> >>>     index 196fed6d5d..bac35ec47a 100644
> >>>     --- a/xen/arch/x86/include/asm/hvm/vcpu.h
> >>>     +++ b/xen/arch/x86/include/asm/hvm/vcpu.h
> >>>     @@ -171,8 +171,9 @@ struct hvm_vcpu {
> >>>
> >>>      =C2=A0 =C2=A0 =C2=A0/* Pending hw/sw interrupt (.vector =3D -1 m=
eans nothing
> >>>     pending). */
> >>>      =C2=A0 =C2=A0 =C2=A0struct x86_event=C2=A0 =C2=A0 =C2=A0inject_e=
vent;
> >>>     -
> >>>     +#ifdef CONFIG_HVM_VIRIDIAN
> >>>      =C2=A0 =C2=A0 =C2=A0struct viridian_vcpu *viridian;
> >>>     +#endif
> >>>      =C2=A0};
> >>>
> >>>      =C2=A0#endif /* __ASM_X86_HVM_VCPU_H__ */
> >>>
> >>>
> >>> nit: I suspect the code would be far less cluttered with "if=20
> >>> viridian..." if the
> >>> init/deinit/etc functions had dummy versions of those functions when
> >>> !HVM_VIRIDIAN in the header.
> >>>
> >>
> >> as Jan explained some time ago [1] it's preferable to compile as much =
as=20
> >> possible in all build configuration. Besides most of calls to viridian=
=20
> >> code are already guarded by is_viridian_domain() & not actually requir=
e=20
> >> stubs.
> >>
> >>   -Sergiy
> >>
> >> [1]=20
> >> https://lore.kernel.org/xen-devel/36708a3f-2664-4b04-9f5d-f115d362d100=
@suse.com/
> >=20
> > That answer seems to state a preference for...
> >=20
> >     if ( foo_enabled() )
> >         rc =3D foo();
> >=20
> > ... against...
> >=20
> >     #ifdef CONFIG_FOO
> >     rc =3D foo();
> >     #endif
> >=20
> > ... where foo() in the header looks like...
> >=20
> >     #ifdef CONFIG_FOO
> >     int foo(void);
> >     #else /* CONFIG_FOO */
> >     static inline int foo(void)
> >     {
> >         return /*some-error*/;
> >     }
> >     #endif /* CONFIG_FOO */
> >=20
> > But that's not what's going on here, I think? I didn't initially notice=
 the
> > subtlety of the change. On more careful look, it seems to rely on the c=
ompiler
> > doing dead-code-elimination. The functions missing in the linking stage=
 don't
> > cause a compile-time error because the conditionals are completely gone=
 by
> > then. Neat as it is, it sounds a bit fragile. Can we really rely on thi=
s
> > behaviour not changing? Furthermore, does MISRA have views about having=
 dead
> > code calls to unimplemented functions?
>
> We use DCE like this in many places, so we already rely on this behavior =
not
> changing.
>
> Jan

I wasn't aware, fair enough. Feel free to ignore then.

Cheers,
Alejandro


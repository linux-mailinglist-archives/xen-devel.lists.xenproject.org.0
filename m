Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9C7939E48
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 11:53:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762935.1173173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWCCh-0003dU-OF; Tue, 23 Jul 2024 09:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762935.1173173; Tue, 23 Jul 2024 09:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWCCh-0003am-LS; Tue, 23 Jul 2024 09:53:07 +0000
Received: by outflank-mailman (input) for mailman id 762935;
 Tue, 23 Jul 2024 09:53:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KExd=OX=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sWCCg-0003ac-C3
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 09:53:06 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aaa7ddb-48d9-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 11:53:03 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52e9a550e9fso4340879e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 02:53:04 -0700 (PDT)
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
X-Inumbo-ID: 5aaa7ddb-48d9-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721728384; x=1722333184; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uBH9IVomAXq4MaU7zMo2A8cztCq5v4exMss+XEA2YjU=;
        b=YUnrOIhFk8NtYV1XQc/L2Lire/gLnN/ngMpLWfCYwZP/obY55zHhlVLPF9qVja2CMM
         SrRzhq1TrWDVTsMtjjitDhm1JId+lEovcEQN79WVLSBAo8y9GMCCYrAxccFmvYO9Q8eP
         IEvm6sWt8GJH5TvsCCSw8dizyLG7a3NPb09S4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721728384; x=1722333184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBH9IVomAXq4MaU7zMo2A8cztCq5v4exMss+XEA2YjU=;
        b=UNLzpekZ3sRk/hsuHDkvI0a3AI3ldpoj7cTvyXglcVuY8/7XtmhpiqF5R5Fx5xuaA7
         CP++j3j/3tmk3f3oer/tBtggXUKJfor0vY+2lFiAot63HdI9kyM5egfmEPZHqyfpf1cu
         c5V4f6jOeRHI/+iJSkG1rMD/roj241vIJNzxGDQ2rUf7MnBN/fLHMLP7LCULmYJ0aYlt
         m9C9ZWRUbC9tznAxFT404bnE0dQJG9fcxSc1iN41FJUKIWZPXnvnp+IhgJiFLUgiTY4X
         8XFCRPxX9fJzUqnbmiVH0fxn7rbFZj2oehZbtBIpGJvb+OGJdL5Z/w1pcpVuAF+Qu9KP
         fWrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfeva/f6yrb3iFolNkFWKbWGXljLRtTxoK6fV/dpaGq+pHwJ0sawIklTV9zWISwZM/W9VsY6xCioM+MWhScDjL+C9kSZjGtWOYdv/FPAE=
X-Gm-Message-State: AOJu0YwWCR5QyA4tODF6POikTIYe38d1upXbWxccRHF7NZZaOPGWU1e0
	xuJvj7hPa1JDwJFwEY0sj5vcF5op/sulFT0MNZuTXFRazs3d++YYs5Ggdc3lWGPf3Butn45CgUy
	/MuNrWawZ/2BG7wTJr/7FuyzaNJ7DM+wDDbDMGg==
X-Google-Smtp-Source: AGHT+IHtUmH3yfkt+4+6Eg91qfNwjzXLO0DlSD3A/DXCXTTeVS2TQQF9FXBzJONT8IwUdv0DenOXXvZkQCcuL8ZXL94=
X-Received: by 2002:a05:6512:3053:b0:52f:79f8:a445 with SMTP id
 2adb3069b0e04-52fc66effddmr462734e87.8.1721728383273; Tue, 23 Jul 2024
 02:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240712130749.1272741-1-fouad.hilly@cloud.com>
 <20240712130749.1272741-5-fouad.hilly@cloud.com> <313d214c-3a96-45ad-9f53-8e4f54510e50@suse.com>
In-Reply-To: <313d214c-3a96-45ad-9f53-8e4f54510e50@suse.com>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Tue, 23 Jul 2024 10:52:52 +0100
Message-ID: <CAJKAvHbDAfC2JUHJLW9QuzgWpuHOhLy3cy3_-jH9-zmYSoeUbw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] x86/ucode: Utilize ucode_force and remove opt_ucode_allow_same
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000af694d061de72053"

--000000000000af694d061de72053
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 3:59=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 12.07.2024 15:07, Fouad Hilly wrote:
> > --- a/xen/arch/x86/cpu/microcode/core.c
> > +++ b/xen/arch/x86/cpu/microcode/core.c
> > @@ -90,6 +90,16 @@ struct ucode_mod_blob {
> >      size_t size;
> >  };
> >
> > +struct microcode_patch_with_flags {
> > +    unsigned int flags;
> > +    struct microcode_patch *patch;
> > +};
> > +
> > +struct microcode_nmi_patch_with_flags {
> > +    unsigned int flags;
> > +    const struct microcode_patch *patch;
> > +};
>
> Why two different structures? I have to admit that I can't spot where the
> difference (const or not) would matter?
I will remove the struct with const and update:
static int control_thread_fn(*const struct microcode_patch *patch*,
                             unsigned int flags)
>
> Also for an internal struct I don't think you need the microcode_
prefixes.
I will remove microcode_prefixes.
>
> > @@ -284,21 +286,22 @@ static enum microcode_match_result cf_check
compare_patch(
> >      return compare_revisions(old->rev, new->rev);
> >  }
> >
> > -static int cf_check apply_microcode(const struct microcode_patch
*patch)
> > +static int cf_check apply_microcode(const struct microcode_patch
*patch,
> > +                                    unsigned int flags)
> >  {
> >      uint64_t msr_content;
> >      unsigned int cpu =3D smp_processor_id();
> >      struct cpu_signature *sig =3D &this_cpu(cpu_sig);
> >      uint32_t rev, old_rev =3D sig->rev;
> >      enum microcode_match_result result;
> > +    bool ucode_force =3D flags =3D=3D XENPF_UCODE_FORCE;
>
> Why =3D=3D ? The term "flags" usually stands for there being multiple boo=
lean
> indicators in a single value. That would demand use of & here.
Will be fixed in v6
>
> Jan

Thanks,

Fouad

--000000000000af694d061de72053
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Tue, Jul 16, 2024 at 3:59=E2=80=AFPM Jan Beulic=
h &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:=
<br>&gt;<br>&gt; On 12.07.2024 15:07, Fouad Hilly wrote:<br>&gt; &gt; --- a=
/xen/arch/x86/cpu/microcode/core.c<br>&gt; &gt; +++ b/xen/arch/x86/cpu/micr=
ocode/core.c<br>&gt; &gt; @@ -90,6 +90,16 @@ struct ucode_mod_blob {<br>&gt=
; &gt; =C2=A0 =C2=A0 =C2=A0size_t size;<br>&gt; &gt; =C2=A0};<br>&gt; &gt;<=
br>&gt; &gt; +struct microcode_patch_with_flags {<br>&gt; &gt; + =C2=A0 =C2=
=A0unsigned int flags;<br>&gt; &gt; + =C2=A0 =C2=A0struct microcode_patch *=
patch;<br>&gt; &gt; +};<br>&gt; &gt; +<br>&gt; &gt; +struct microcode_nmi_p=
atch_with_flags {<br>&gt; &gt; + =C2=A0 =C2=A0unsigned int flags;<br>&gt; &=
gt; + =C2=A0 =C2=A0const struct microcode_patch *patch;<br>&gt; &gt; +};<br=
>&gt;<br>&gt; Why two different structures? I have to admit that I can&#39;=
t spot where the<br>&gt; difference (const or not) would matter?<br>I will =
remove the struct with const and update:<br>static int control_thread_fn(<u=
>const struct microcode_patch *patch</u>,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0unsigned int flags)<br>&gt;<br>&gt; Also for an internal struct I don&#3=
9;t think you need the microcode_ prefixes.<div>I will remove microcode_pre=
fixes.<br>&gt;<br>&gt; &gt; @@ -284,21 +286,22 @@ static enum microcode_mat=
ch_result cf_check compare_patch(<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0return c=
ompare_revisions(old-&gt;rev, new-&gt;rev);<br>&gt; &gt; =C2=A0}<br>&gt; &g=
t;<br>&gt; &gt; -static int cf_check apply_microcode(const struct microcode=
_patch *patch)<br>&gt; &gt; +static int cf_check apply_microcode(const stru=
ct microcode_patch *patch,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0unsigned int flags)<br>&gt; &gt; =C2=A0{<br>&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0uint64_t msr_content;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0=
unsigned int cpu =3D smp_processor_id();<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0s=
truct cpu_signature *sig =3D &amp;this_cpu(cpu_sig);<br>&gt; &gt; =C2=A0 =
=C2=A0 =C2=A0uint32_t rev, old_rev =3D sig-&gt;rev;<br>&gt; &gt; =C2=A0 =C2=
=A0 =C2=A0enum microcode_match_result result;<br>&gt; &gt; + =C2=A0 =C2=A0b=
ool ucode_force =3D flags =3D=3D XENPF_UCODE_FORCE;<br>&gt;<br>&gt; Why =3D=
=3D ? The term &quot;flags&quot; usually stands for there being multiple bo=
olean<br>&gt; indicators in a single value. That would demand use of &amp; =
here.</div><div>Will be fixed in v6<br>&gt;<br>&gt; Jan</div><div><br></div=
><div>Thanks,</div><div><br></div><div>Fouad</div></div>

--000000000000af694d061de72053--


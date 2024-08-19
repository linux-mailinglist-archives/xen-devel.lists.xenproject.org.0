Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BBA956620
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 10:57:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779413.1189160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyCV-00075e-KJ; Mon, 19 Aug 2024 08:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779413.1189160; Mon, 19 Aug 2024 08:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyCV-000742-H7; Mon, 19 Aug 2024 08:57:19 +0000
Received: by outflank-mailman (input) for mailman id 779413;
 Mon, 19 Aug 2024 08:57:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mhAH=PS=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sfyCU-0006TG-6q
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 08:57:18 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08967104-5e09-11ef-8776-851b0ebba9a2;
 Mon, 19 Aug 2024 10:57:16 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52f025bc147so4901489e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 01:57:16 -0700 (PDT)
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
X-Inumbo-ID: 08967104-5e09-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724057836; x=1724662636; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rTHPhbrvA8ByK/HwQ7kpAhg4dkZhSLBjuawHVSKUq3w=;
        b=exljJ+EGOuV+xtQWVDQfq5MeZbBXdkAV9v3zGB9rF+F7IlThM7i/NTdJWnX0PMPgJW
         4lVSgONCzYHtokRSVTcveeF5/gbcLVhOHIox66p9YRwEHy5jnZo45OHgcaRaR66oATy7
         JCq7gJmk+l5MV54KLfENzCEWdOXN4Fzx957QA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724057836; x=1724662636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTHPhbrvA8ByK/HwQ7kpAhg4dkZhSLBjuawHVSKUq3w=;
        b=XmzXkJ8DA8QOhXjkCUnSgnI6hdcYaTmT1ats4B/sPBkIMTgHeJQpV9JkoW6iRX/dTC
         2GndzSeceZtnQgdYJT03ZayaWKXsdCgNUDODne4yCImifvHdM5WLkhQUE6I4atQoQEF2
         uVwje0JGgId10/sZ6EHPLYS4QyfeJG8g3e3ZOaCQKPGpDXXx5Qxmf9Dbtnns6QBGBHC/
         0xbeYwlzZmlgNekthiQ0U/5H3mrxspkcL6MkNMrZsgA3eFg3vYOm5jHWbP8P6onWs/b1
         YV1YYTGKonCbrB6GgpnbjKN1E3ufDML4coL6k5j1/YbKc8fNFqgSgApRDwg/b6Rc3PFc
         GKlw==
X-Forwarded-Encrypted: i=1; AJvYcCVvQ+WrZdV20UQB0pyRhz6z3xGCnRc6x4dZ+PGpCevrGKzhmzJKjkQTUiDBvUiBAVIy+OARMKGSE4m4E0mHJ0fgM02vw45lFUDqLDneEIs=
X-Gm-Message-State: AOJu0Yzg5Mz0/Ekkd5GDjzItVl/Di67Y2N0CuCn5mwZcIZx3y17ToXxa
	t1OLXTHeDUH1a3IDUx8Zz4AiE40jpt7A11v6rf0IC/A8RJNMZ7CqLDwu11UQwxaMWQN/5SYKBwU
	gAWHS4vlkqXAyS6BgmMDno7A7AVEMwi7SlhE5UQ==
X-Google-Smtp-Source: AGHT+IGkd2R7on/PGIfDvHhwRb+DbX9+W2mM7e/ISWTjVz5eVrxzuHOb7c5TGRlxXNLVDrKM8CdqfKNYjWx8Euxdryg=
X-Received: by 2002:a05:6512:68c:b0:532:ef03:a72c with SMTP id
 2adb3069b0e04-5331c6b5ac3mr5764326e87.32.1724057835411; Mon, 19 Aug 2024
 01:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240725082725.2685481-1-fouad.hilly@cloud.com>
 <20240725082725.2685481-5-fouad.hilly@cloud.com> <f0925d77-db8d-410c-873f-0bf38727aca9@suse.com>
In-Reply-To: <f0925d77-db8d-410c-873f-0bf38727aca9@suse.com>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Mon, 19 Aug 2024 09:57:04 +0100
Message-ID: <CAJKAvHY1CiXM+S1TNLrasPFZZPrdZo5QsJvhxCbptJFPyBqtqA@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] x86/ucode: Utilize ucode_force and remove opt_ucode_allow_same
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000da303e0620057eef"

--000000000000da303e0620057eef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 12:30=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:

> On 25.07.2024 10:27, Fouad Hilly wrote:
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -2650,7 +2650,7 @@ performance.
> >     Alternatively, selecting `tsx=3D1` will re-enable TSX at the users =
own
> risk.
> >
> >  ### ucode
> > -> `=3D List of [ <integer> | scan=3D<bool>, nmi=3D<bool>, allow-same=
=3D<bool> ]`
> > +> `=3D List of [ <integer> | scan=3D<bool>, nmi=3D<bool> ]`
> >
> >      Applicability: x86
> >      Default: `nmi`
> > @@ -2682,11 +2682,6 @@ precedence over `scan`.
> >  stop_machine context. In NMI handler, even NMIs are blocked, which is
> >  considered safer. The default value is `true`.
> >
> > -'allow-same' alters the default acceptance policy for new microcode to
> permit
> > -trying to reload the same version.  Many CPUs will actually reload
> microcode
> > -of the same version, and this allows for easy testing of the late
> microcode
> > -loading path.
>
> The removal of a command line (sub)option should come with a CHANGELOG.md
> entry.
>

Will be fixed in v7

>
> > --- a/xen/arch/x86/cpu/microcode/core.c
> > +++ b/xen/arch/x86/cpu/microcode/core.c
> > @@ -90,6 +90,11 @@ struct ucode_mod_blob {
> >      size_t size;
> >  };
> >
> > +struct patch_with_flags {
> > +    unsigned int flags;
> > +    struct microcode_patch *patch;
>
> Pointer-to-const? If the const was omitted here just because of
> microcode_free_patch(), then I think the issue should be taken care
> of there.
>

This struct is required as is, I initially added a similar struct with
const (which was removed in v6).
updated control_thread_fn()
-static int control_thread_fn(const struct microcode_patch *patch)
+static int control_thread_fn(struct microcode_patch *patch,
+                             unsigned int flags)

> @@ -237,7 +238,11 @@ static DEFINE_PER_CPU(int, loading_err);
> >   */
> >  static cpumask_t cpu_callin_map;
> >  static atomic_t cpu_out, cpu_updated;
> > -static const struct microcode_patch *nmi_patch =3D ZERO_BLOCK_PTR;
> > +static struct patch_with_flags nmi_patch_with_flags =3D
>
> Could the variable name perhaps continue to be "nmi_patch"? Or be
> simply "nmi_arg" or some such?
>

Sure, will keep it as nmi_patch

>
> > +{
> > +    .flags  =3D 0,
>
> Nit: This isn't really needed.
>
> > @@ -379,7 +386,8 @@ static int secondary_nmi_work(void)
> >      return wait_for_state(LOADING_EXIT) ? 0 : -EBUSY;
> >  }
> >
> > -static int primary_thread_work(const struct microcode_patch *patch)
> > +static int primary_thread_work(struct microcode_patch *patch,
> > +                               unsigned int flags)
> >  {
>
> Why is this change needed?
>
This will be reverted in v7

>
> > @@ -446,7 +455,8 @@ static int secondary_thread_fn(void)
> >      return this_cpu(loading_err);
> >  }
> >
> > -static int primary_thread_fn(const struct microcode_patch *patch)
> > +static int primary_thread_fn(struct microcode_patch *patch,
> > +                             unsigned int flags)
>
> Same here.
>

 This will be reverted in v7

>
> Jan
>

Thanks,

Fouad

--000000000000da303e0620057eef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 29, 2024 at 12:30=E2=80=
=AFPM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_blank=
">jbeulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 25.07.2024 10:27, Fouad Hilly wrote:<br>
&gt; --- a/docs/misc/xen-command-line.pandoc<br>
&gt; +++ b/docs/misc/xen-command-line.pandoc<br>
&gt; @@ -2650,7 +2650,7 @@ performance.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Alternatively, selecting `tsx=3D1` will re-enable T=
SX at the users own risk.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ### ucode<br>
&gt; -&gt; `=3D List of [ &lt;integer&gt; | scan=3D&lt;bool&gt;, nmi=3D&lt;=
bool&gt;, allow-same=3D&lt;bool&gt; ]`<br>
&gt; +&gt; `=3D List of [ &lt;integer&gt; | scan=3D&lt;bool&gt;, nmi=3D&lt;=
bool&gt; ]`<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 Applicability: x86<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Default: `nmi`<br>
&gt; @@ -2682,11 +2682,6 @@ precedence over `scan`.<br>
&gt;=C2=A0 stop_machine context. In NMI handler, even NMIs are blocked, whi=
ch is<br>
&gt;=C2=A0 considered safer. The default value is `true`.<br>
&gt;=C2=A0 <br>
&gt; -&#39;allow-same&#39; alters the default acceptance policy for new mic=
rocode to permit<br>
&gt; -trying to reload the same version.=C2=A0 Many CPUs will actually relo=
ad microcode<br>
&gt; -of the same version, and this allows for easy testing of the late mic=
rocode<br>
&gt; -loading path.<br>
<br>
The removal of a command line (sub)option should come with a CHANGELOG.md<b=
r>
entry.<br></blockquote><div><br></div><div>Will be fixed in v7=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; --- a/xen/arch/x86/cpu/microcode/core.c<br>
&gt; +++ b/xen/arch/x86/cpu/microcode/core.c<br>
&gt; @@ -90,6 +90,11 @@ struct ucode_mod_blob {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 size_t size;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +struct patch_with_flags {<br>
&gt; +=C2=A0 =C2=A0 unsigned int flags;<br>
&gt; +=C2=A0 =C2=A0 struct microcode_patch *patch;<br>
<br>
Pointer-to-const? If the const was omitted here just because of<br>
microcode_free_patch(), then I think the issue should be taken care<br>
of there.<br></blockquote><div><br></div><div>This struct is required as is=
, I initially added a similar struct with const (which was removed in v6).<=
/div><div>updated control_thread_fn()</div><div>-static int control_thread_=
fn(const struct microcode_patch *patch)<br>+static int control_thread_fn(st=
ruct microcode_patch *patch,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int flags=
)<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
&gt; @@ -237,7 +238,11 @@ static DEFINE_PER_CPU(int, loading_err);<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 static cpumask_t cpu_callin_map;<br>
&gt;=C2=A0 static atomic_t cpu_out, cpu_updated;<br>
&gt; -static const struct microcode_patch *nmi_patch =3D ZERO_BLOCK_PTR;<br=
>
&gt; +static struct patch_with_flags nmi_patch_with_flags =3D<br>
<br>
Could the variable name perhaps continue to be &quot;nmi_patch&quot;? Or be=
<br>
simply &quot;nmi_arg&quot; or some such?<br></blockquote><div><br></div><di=
v>Sure, will keep it as nmi_patch=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 .flags=C2=A0 =3D 0,<br>
<br>
Nit: This isn&#39;t really needed.<br>
<br>
&gt; @@ -379,7 +386,8 @@ static int secondary_nmi_work(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return wait_for_state(LOADING_EXIT) ? 0 : -EBUSY;<=
br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static int primary_thread_work(const struct microcode_patch *patch)<b=
r>
&gt; +static int primary_thread_work(struct microcode_patch *patch,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int flags)<br>
&gt;=C2=A0 {<br>
<br>
Why is this change needed?<br></blockquote><div>This will be reverted in v7=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; @@ -446,7 +455,8 @@ static int secondary_thread_fn(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return this_cpu(loading_err);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static int primary_thread_fn(const struct microcode_patch *patch)<br>
&gt; +static int primary_thread_fn(struct microcode_patch *patch,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int flags)<br>
<br>
Same here.<br></blockquote><div><br></div><div>=C2=A0This will be reverted =
in v7</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Jan<br></blockquote><div><br></div><div>Thanks,</div><div><br></div><div>Fo=
uad=C2=A0</div></div></div>

--000000000000da303e0620057eef--


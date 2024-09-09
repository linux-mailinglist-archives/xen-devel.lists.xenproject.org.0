Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB0D971522
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794182.1202934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbSw-00058w-Un; Mon, 09 Sep 2024 10:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794182.1202934; Mon, 09 Sep 2024 10:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbSw-00056c-Rn; Mon, 09 Sep 2024 10:17:50 +0000
Received: by outflank-mailman (input) for mailman id 794182;
 Mon, 09 Sep 2024 10:17:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1snbSv-00055i-Jk
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:17:49 +0000
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [2001:4860:4864:20::32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c274e9a5-6e94-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 12:17:47 +0200 (CEST)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-277c861d9f6so2473474fac.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:17:47 -0700 (PDT)
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
X-Inumbo-ID: c274e9a5-6e94-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725877066; x=1726481866; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8NxRbKKkRRsepfuapfQ7h7hnNBtrSBXwtZrVD7nFtKY=;
        b=VcZCLHqqDbrMnbTHKGEu/B2gyl6x6ZGUT2oU67ldLkFsbbmAMtyZ77/ldguh6h06WS
         jsI8t6GQSIYeiVeANAsWSQmItejcWcTjMXtkxm0MEJIp85wzCLOmtuigIKddCD1nnubK
         gW+stgvJZ6a5icatR9T2QlB8dDV5zAx8NhPms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725877066; x=1726481866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NxRbKKkRRsepfuapfQ7h7hnNBtrSBXwtZrVD7nFtKY=;
        b=tXuKh8aSsD0gimalhWvbKioE2eh2H9xNm1zpPnQyEN7uq++enpkkQGrPjHukAoI/o5
         /NAYOdQAKI5o2IoMADyGJagi9e+hqZqHQo2KGW9xPy1IYpyqpGJ4JIQyg3NetHpCNd20
         v/rZxPaN7VC+8WVDOcikC8IDAp6omrRbWtNoGzDGpUJ07R/qiCCsjbCnV8niqbXvA1RR
         DF2C0uTZf3ouLbFpLM/3+7qOYzxMEOd3jsKlxvIxjHcWEg/Qt230NSS4/4j8ayfhxehw
         fO+4m73db1wHbXPIh9gwsLN6josSHHCEUVsxzEsBR72ODSKkxRufYV8TFNtYJ5jB40vS
         wDQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxqJDkkChiDbMLMXNjg5F9NNS9kYBckbycyKJgb+9RrUGy6BWLwpB8onBreqBwXkXqlizunSzXd0I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8XRUqW7uAA31MClMjBwVPTnvnW3qjO7En9qotxhROUmcY5mhZ
	7oSaKfhgYrnbNWK7knNitURRV2ax04GQFDNsV20XSIPABEkjvtzzNsaZVG3H76uxVlJWoNj2jPB
	UmEmC0QqH0U/ae5CNvcCE3SLw1+M/00vMoSIF+Q==
X-Google-Smtp-Source: AGHT+IHBqQHMffVRSu6/Fwb/EVhxAZGPHbHd4SBzvAgJb3oKUA7JcinfrmFiEZGr0VkJAsPJ/sNsVWgFVEEGPeftTNU=
X-Received: by 2002:a05:6870:6122:b0:261:86d:89e2 with SMTP id
 586e51a60fabf-27b82fab13amr12104657fac.36.1725877066132; Mon, 09 Sep 2024
 03:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240904145648.33707-1-frediano.ziglio@cloud.com>
 <20240904145648.33707-3-frediano.ziglio@cloud.com> <91963d5c-3e59-4b00-98ca-ab4535947210@suse.com>
In-Reply-To: <91963d5c-3e59-4b00-98ca-ab4535947210@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 9 Sep 2024 11:17:35 +0100
Message-ID: <CACHz=Zi_-c=xO9eGm_5PQjio4qxnBSQy3ppU=DGjQdSSAAfmzA@mail.gmail.com>
Subject: Re: [RFC 2/5] x86/boot: create a C bundle for 32 bit boot code and
 use it
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000007415e10621ad1179"

--0000000000007415e10621ad1179
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 11:10=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 04.09.2024 16:56, Frediano Ziglio wrote:
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -251,8 +251,7 @@ xen/System.map
> >  xen/arch/x86/boot/mkelf32
> >  xen/arch/x86/boot/cmdline.S
> >  xen/arch/x86/boot/reloc.S
> > -xen/arch/x86/boot/*.bin
> > -xen/arch/x86/boot/*.lnk
> > +xen/arch/x86/boot/build32.*.lds
>
> Please retain (largely) alphabetic sorting.
>
>
Changed locally.


> > --- a/xen/arch/x86/boot/build32.lds
> > +++ b/xen/arch/x86/boot/build32.lds.S
> > @@ -15,22 +15,54 @@
> >   * with this program.  If not, see <http://www.gnu.org/licenses/>.
> >   */
> >
> > -ENTRY(_start)
> > +#undef ENTRY
> > +
> > +#ifdef FINAL
> > +# define GAP 0
> > +# define MULT 0
> > +# define TEXT_START
> > +#else
> > +# define GAP 0x010200
> > +# define MULT 1
> > +# define TEXT_START 0x408020
> > +#endif
> > +# define DECLARE_IMPORT(name) name =3D . + (__LINE__ * MULT)
> > +
> > +ENTRY(dummy_start)
> >
> >  SECTIONS
> >  {
> > -  /* Merge code and data into one section. */
> > -  .text : {
> > +  /* Merge code and read-only data into one section. */
> > +  .text TEXT_START : {
> > +        /* Silence linker warning, we are not going to use it */
> > +        dummy_start =3D .;
> > +
> > +        /* Declare below any symbol name needed.
> > +         * Each symbol should be on its own line.
> > +         * It looks like a tedious work but we make sure the things we
> use.
> > +         * Potentially they should be all variables. */
> > +        DECLARE_IMPORT(__base_relocs_start);
> > +        DECLARE_IMPORT(__base_relocs_end);
> > +        . =3D . + GAP;
> >          *(.text)
> >          *(.text.*)
> > -        *(.data)
> > -        *(.data.*)
> >          *(.rodata)
> >          *(.rodata.*)
> > +  }
> > +
> > +  /* Writeable data sections. Check empty.
> > +   * We collapse all into code section and we don't want it to be
> writeable. */
> > +  .data : {
> > +        *(.data)
> > +        *(.data.*)
> >          *(.bss)
> >          *(.bss.*)
> >    }
> > -
> > +  /DISCARD/ : {
> > +       *(.comment)
> > +       *(.comment.*)
> > +       *(.note.*)
> > +  }
> >    /* Dynamic linkage sections.  Collected simply so we can check
> they're empty. */
> >    .got : {
> >          *(.got)
> > @@ -49,6 +81,7 @@ SECTIONS
> >    }
> >    .rel : {
> >          *(.rel.*)
> > +        *(.data.rel.*)
>
> This looks like you're mixing up .data.rel (a data section, where some
> items
> may require relocation) and .rel.data (the relocation section for .data).
> If
> you want all .data.* empty, this section should be empty, too. (I also
> don't
> think this would ever take effect, due to the earlier *(.data.*).)
>
>
Removed this last hunk, yes, it's useless.


> Jan
>

Thanks,
   Frediano

--0000000000007415e10621ad1179
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Sep 9, 2024 at 11:10=E2=80=AFAM Jan Beulich &lt;<a href=3D"m=
ailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 04.09.2024 16:56, Frediano Zig=
lio wrote:<br>
&gt; --- a/.gitignore<br>
&gt; +++ b/.gitignore<br>
&gt; @@ -251,8 +251,7 @@ xen/System.map<br>
&gt;=C2=A0 xen/arch/x86/boot/mkelf32<br>
&gt;=C2=A0 xen/arch/x86/boot/cmdline.S<br>
&gt;=C2=A0 xen/arch/x86/boot/reloc.S<br>
&gt; -xen/arch/x86/boot/*.bin<br>
&gt; -xen/arch/x86/boot/*.lnk<br>
&gt; +xen/arch/x86/boot/build32.*.lds<br>
<br>
Please retain (largely) alphabetic sorting.<br>
<br></blockquote><div><br></div><div>Changed locally.</div><div>=C2=A0<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; --- a/xen/arch/x86/boot/build32.lds<br>
&gt; +++ b/xen/arch/x86/boot/build32.lds.S<br>
&gt; @@ -15,22 +15,54 @@<br>
&gt;=C2=A0 =C2=A0* with this program.=C2=A0 If not, see &lt;<a href=3D"http=
://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.g=
nu.org/licenses/</a>&gt;.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 <br>
&gt; -ENTRY(_start)<br>
&gt; +#undef ENTRY<br>
&gt; +<br>
&gt; +#ifdef FINAL<br>
&gt; +# define GAP 0<br>
&gt; +# define MULT 0<br>
&gt; +# define TEXT_START<br>
&gt; +#else<br>
&gt; +# define GAP 0x010200<br>
&gt; +# define MULT 1<br>
&gt; +# define TEXT_START 0x408020<br>
&gt; +#endif<br>
&gt; +# define DECLARE_IMPORT(name) name =3D . + (__LINE__ * MULT)<br>
&gt; +<br>
&gt; +ENTRY(dummy_start)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SECTIONS<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 /* Merge code and data into one section. */<br>
&gt; -=C2=A0 .text : {<br>
&gt; +=C2=A0 /* Merge code and read-only data into one section. */<br>
&gt; +=C2=A0 .text TEXT_START : {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Silence linker warning, we are not goi=
ng to use it */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dummy_start =3D .;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Declare below any symbol name needed.<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Each symbol should be on its own =
line.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* It looks like a tedious work but =
we make sure the things we use.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Potentially they should be all va=
riables. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DECLARE_IMPORT(__base_relocs_start);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DECLARE_IMPORT(__base_relocs_end);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 . =3D . + GAP;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.text)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.text.*)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.data)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.data.*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.rodata)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.rodata.*)<br>
&gt; +=C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 /* Writeable data sections. Check empty.<br>
&gt; +=C2=A0 =C2=A0* We collapse all into code section and we don&#39;t wan=
t it to be writeable. */<br>
&gt; +=C2=A0 .data : {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.data)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.data.*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.bss)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.bss.*)<br>
&gt;=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; +=C2=A0 /DISCARD/ : {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*(.comment)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*(.comment.*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*(.note.*)<br>
&gt; +=C2=A0 }<br>
&gt;=C2=A0 =C2=A0 /* Dynamic linkage sections.=C2=A0 Collected simply so we=
 can check they&#39;re empty. */<br>
&gt;=C2=A0 =C2=A0 .got : {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.got)<br>
&gt; @@ -49,6 +81,7 @@ SECTIONS<br>
&gt;=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 .rel : {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.rel.*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.data.rel.*)<br>
<br>
This looks like you&#39;re mixing up .data.rel (a data section, where some =
items<br>
may require relocation) and .rel.data (the relocation section for .data). I=
f<br>
you want all .data.* empty, this section should be empty, too. (I also don&=
#39;t<br>
think this would ever take effect, due to the earlier *(.data.*).)<br>
<br></blockquote><div><br></div><div>Removed this last hunk, yes, it&#39;s =
useless.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Jan<br></blockquote><div><br></div><div>Thanks,</div><div>=C2=A0=C2=A0 Fred=
iano</div><div>=C2=A0<br></div></div></div>

--0000000000007415e10621ad1179--


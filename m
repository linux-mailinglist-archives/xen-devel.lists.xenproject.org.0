Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD372A555C
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 13:56:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4kue-0005Tf-2I; Mon, 02 Sep 2019 11:54:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9ETX=W5=gmail.com=adam.zerella@srs-us1.protection.inumbo.net>)
 id 1i4kuc-0005Ta-6q
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 11:54:22 +0000
X-Inumbo-ID: 669f5bf4-cd78-11e9-8980-bc764e2007e4
Received: from mail-yb1-xb43.google.com (unknown [2607:f8b0:4864:20::b43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 669f5bf4-cd78-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 11:54:21 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id 1so4776887ybj.8
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2019 04:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=82nFSZHd58PUyoaOvu91Z6e3GHQfz8rJSPQ4H88lHSk=;
 b=Nuzq33c0r46JUJqyJhQ6/xemtdfR0bTIOIhGieMQtnH8ycMklFzNcyYNRWo0YFOnaF
 hN3dlBRf/JvKTImJmJcdFyzuDru0Ug4SfAyvkWsoXE32HtEmvjiA1iLc8ya9UxPFmxZ+
 znezx9nKK58CRJy/zvpOj8xnsdwUwJV152n4of6DjKrhPlCPDyXMuRrRBugG55QHZ2Tp
 yrEFJOJBEUiAprtHf21Vqz96tW+s2CeOwbuqTRUi12BMxV+7S5mvrvVDPGv52Veo57F2
 x5n+FB9d4yqxQ/hLo+1gnWqvxW4K3sge733XCKb1qCjZyK83J66ZATll0Q8tYG/rxGxd
 V8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=82nFSZHd58PUyoaOvu91Z6e3GHQfz8rJSPQ4H88lHSk=;
 b=gMv1VtfAmdSYtXlRnj8DNTL2v6ejx8PLPfMa2aDLvpzBX3NqY4npC7eu10qCb6+SyL
 DC5H2eQmmP/SEfNfaCsyiaBUSLNFj25xn72TgGkxT6hnIEdi6aPt7L1jqoKcDXSKAxO7
 yGn1pyovoLhM0I7eTckwicMIIBy+bl8fHzY7SW1k/eSD79sCH26XqPV8bbR/P8Pupufc
 IPpdaIDb5lihwVFhkE/FwzPJMqjkoZ0wmZlhzXxEvO7KJSzDnpwwbKv34rvWk3iZ4PG3
 NnVpQubWGryLqCO6Ci/GT8pyITc+wwqxfITI15yIG1TX2Cktd2etRCuLOgfkiKFSE7qA
 KqVQ==
X-Gm-Message-State: APjAAAVYW2ZTuq336oBaw04Q4sduwAKM67p1xycCEb+HHgwU5r5VEOMr
 VJHq18bFF+lqi5a1gZScnhLNdCwK1jS2gZ2kCYw=
X-Google-Smtp-Source: APXvYqy+F72FCO7jnPxJBkGTCZIT2GQHSCjDuq9dO7TQM7WSPEZ5ai0NKX2DA2mBOWUjnOJ8BVH5L3aj7rBmUrEtQA0=
X-Received: by 2002:a25:1e09:: with SMTP id e9mr20664696ybe.293.1567425259665; 
 Mon, 02 Sep 2019 04:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190901065828.7762-1-adam.zerella@gmail.com>
 <84ce8eca-b02a-de32-2e1b-a0bf3542c674@suse.com>
In-Reply-To: <84ce8eca-b02a-de32-2e1b-a0bf3542c674@suse.com>
From: Adam Zerella <adam.zerella@gmail.com>
Date: Mon, 2 Sep 2019 21:53:53 +1000
Message-ID: <CAPtnKNnEi4=fkq4wrW=xx=Hx=Fw34TW7E+bOjAWBhNyWDO67YQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] x86/xen/efi: Fix EFI variable 'name' type
 conversion
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: multipart/mixed; boundary="===============8213512188204495249=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8213512188204495249==
Content-Type: multipart/alternative; boundary="000000000000d07d7e059190a1a8"

--000000000000d07d7e059190a1a8
Content-Type: text/plain; charset="UTF-8"

Ahh, I see that I definitely should have made the patch notes more
descriptive. I could be wrong but I was under the impression that casting
the data type of wchar_t to efi_char16_t (unsigned short) was acceptable as
I've seen it in similar patches before, see here
https://lkml.org/lkml/2019/7/21/126. The Sparse warning threw me off.

I thought the cast would inform the compiler better when it came to unicode
characters, I may be wrong here, I'm very new to submitting patches...

On Mon, 2 Sep 2019 at 17:54, Jan Beulich <jbeulich@suse.com> wrote:

> On 01.09.2019 08:58, Adam Zerella wrote:
> > This resolves a type conversion from 'char *' to 'unsigned short'.
>
> Could you explain this? There's no ...
>
> > --- a/arch/x86/xen/efi.c
> > +++ b/arch/x86/xen/efi.c
> > @@ -118,8 +118,8 @@ static enum efi_secureboot_mode
> xen_efi_get_secureboot(void)
> >       unsigned long size;
> >
> >       size = sizeof(secboot);
> > -     status = efi.get_variable(L"SecureBoot", &efi_variable_guid,
> > -                               NULL, &size, &secboot);
> > +     status = efi.get_variable((efi_char16_t *)L"SecureBoot",
> > +                               &efi_variable_guid, NULL, &size,
> &secboot);
>
> ... "char *" resulting as type for L"" type strings, hence there
> should be no need for a cast: In fact I consider such casts
> dangerous, as they may hide actual problems. To me this looks
> more like something that wants fixing in sparse; the compilers,
> after all, have no issue with such wide character string literals.
>
> > @@ -158,7 +158,7 @@ static enum efi_secureboot_mode
> xen_efi_get_secureboot(void)
> >       return efi_secureboot_mode_unknown;
> >  }
> >
> > -void __init xen_efi_init(struct boot_params *boot_params)
> > +static void __init xen_efi_init(struct boot_params *boot_params)
> >  {
> >       efi_system_table_t *efi_systab_xen;
>
> If I was a maintainer of this code, I'd request this not be part
> of a patch with a title being entirely unrelated to the change.
>
> Jan
>

Adam

--000000000000d07d7e059190a1a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D""><=
span style=3D"font-family:tahoma,sans-serif">Ahh, I see that I definitely s=
hould have made the patch notes more descriptive.=C2=A0</span><span style=
=3D"font-family:tahoma,sans-serif">I could be wrong but I was under the imp=
ression that casting the data type of=C2=A0</span>wchar_t<font face=3D"taho=
ma, sans-serif">=C2=A0to efi_char16_t (unsigned short) was acceptable as I&=
#39;ve seen it in similar patches before, see here=C2=A0</font><a href=3D"h=
ttps://lkml.org/lkml/2019/7/21/126">https://lkml.org/lkml/2019/7/21/126</a>=
. The Sparse warning threw me off.</div><div class=3D"gmail_default" style=
=3D""><br></div><div class=3D"gmail_default" style=3D"">I thought the cast =
would inform the compiler better when it came to unicode characters, I may =
be wrong here, I&#39;m very new to submitting patches...</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 2 Sep=
 2019 at 17:54, Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeuli=
ch@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 01.09.2019 08:58, Adam Zerella wrote:<br>
&gt; This resolves a type conversion from &#39;char *&#39; to &#39;unsigned=
 short&#39;.<br>
<br>
Could you explain this? There&#39;s no ...<br>
<br>
&gt; --- a/arch/x86/xen/efi.c<br>
&gt; +++ b/arch/x86/xen/efi.c<br>
&gt; @@ -118,8 +118,8 @@ static enum efi_secureboot_mode xen_efi_get_secure=
boot(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long size;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D sizeof(secboot);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0status =3D efi.get_variable(L&quot;SecureBoot&quo=
t;, &amp;efi_variable_guid,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &amp;size, &amp;secboot);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D efi.get_variable((efi_char16_t *)L&quo=
t;SecureBoot&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;efi_variable_guid, NULL, &am=
p;size, &amp;secboot);<br>
<br>
... &quot;char *&quot; resulting as type for L&quot;&quot; type strings, he=
nce there<br>
should be no need for a cast: In fact I consider such casts<br>
dangerous, as they may hide actual problems. To me this looks<br>
more like something that wants fixing in sparse; the compilers,<br>
after all, have no issue with such wide character string literals.<br>
<br>
&gt; @@ -158,7 +158,7 @@ static enum efi_secureboot_mode xen_efi_get_secure=
boot(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return efi_secureboot_mode_unknown;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -void __init xen_efi_init(struct boot_params *boot_params)<br>
&gt; +static void __init xen_efi_init(struct boot_params *boot_params)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0efi_system_table_t *efi_systab_xen;<br>
<br>
If I was a maintainer of this code, I&#39;d request this not be part<br>
of a patch with a title being entirely unrelated to the change.<br>
<br>
Jan<br>
</blockquote></div><br clear=3D"all"><div><span style=3D"font-family:tahoma=
,sans-serif"><span class=3D"gmail_default" style=3D"font-family:tahoma,sans=
-serif"></span>Adam</span><br></div><br><div dir=3D"ltr" class=3D"gmail_sig=
nature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D=
"ltr"><div></div><div></div></div></div></div></div></div></div></div>

--000000000000d07d7e059190a1a8--


--===============8213512188204495249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8213512188204495249==--


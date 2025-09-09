Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A920B4A780
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 11:22:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115986.1462425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvuY7-0005Gg-Aw; Tue, 09 Sep 2025 09:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115986.1462425; Tue, 09 Sep 2025 09:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvuY7-0005Ex-7m; Tue, 09 Sep 2025 09:22:03 +0000
Received: by outflank-mailman (input) for mailman id 1115986;
 Tue, 09 Sep 2025 09:22:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wvTB=3U=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uvuY6-0005Er-K6
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 09:22:02 +0000
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [2607:f8b0:4864:20::b2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70b9b4d6-8d5e-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 11:22:01 +0200 (CEST)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-ea0297e9cd4so1791470276.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 02:22:01 -0700 (PDT)
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
X-Inumbo-ID: 70b9b4d6-8d5e-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757409720; x=1758014520; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ed7LZ2xg4GvAWyGx7uRH5GevbRcowu1w3Knng+7fX9k=;
        b=Ao1ngiwao41StB2An+KPh4oFNSe/SfPGNIG/blGUZtsYrlnnULR8eJMiQB7MJWdbwT
         48TGfL/5WXAeQbfRx6P7SA+IGd/SJd8WAtxQVjNHNK1PFqwZpUKQlLd30bDOStW+NwJD
         LJGEPGEwqRHmxmOTjlL43zE1PjIPuZsvbYago=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409720; x=1758014520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ed7LZ2xg4GvAWyGx7uRH5GevbRcowu1w3Knng+7fX9k=;
        b=bpTqG92dcW5Jt6MW7MPSrcFubJSJgNU2TcUhDUMKOyMQ/cvTNGAUz7kmjKtjnyYTJs
         V7RCNcsVaCQ1JVfklLVmVyRhXoAEg3gwi8gwQ3UXDZaSfza/bDu0xU5OeqpFOlD8j/qw
         PCkQ5y1Ug3sEz3XCDY022sXNRHuTBL4MwtDCrOCd9PVUbsP8Hj+kN2VUQYvnjhCR6KSN
         DbQWYgIsG9T6PNyDBxbYw8gUljt1/wHqmJ7BkY3fiqUqSTPq2dPDqnAYPH2gSZgXQuK8
         zCrRBIOIl8QQ4ZjxpE9/SW7zh7FRuG0bWwBlvErG4fH80gDxRIzDoyyhby5UrJ3u+WyR
         V/Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUc7R1SVKoU6Qnxcs9Aactsu53tWuDgfAWHitBsqD2tItapUvTmzjtLgrbiG2xrrMk+y8wBy42M0Z0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDvXzEkCBgGQWnbRVsU8r2TJddOVjZLXrK6mho4Dy6yrKVnjmP
	OE+fbxKPLnDv2rzTx5aAGBtzxA9GmHO5SVs609lnDU5DQ0QsGwEWUhaHBrQ0T0Q7grvL4a0SXOp
	cNxBmAMw03eC9l+t3zvwMWebpMn4jKaxGK89qAfXVAjdJKp6xCJhx2kz4YA==
X-Gm-Gg: ASbGncupeWa1OWyGIur7X3cqujlHMsm5g3NcN3oC590Mkn96sz4A+JKzUbi5/eYIigN
	XgluD/g1I1dxNvm6fXT5a4T+NI6iEUX3ea7snveP4tnFsR8iFRXvdnkjJ2Z23xQIA80Z5TFtCxy
	1Bv/Qs8fRjYQUBSDLy+/pLcDkkNdhuiVDOxNtADFFXkKN9gzHHSwpav0zPC80h7y38MWNFlHvTo
	Zn4hQ==
X-Google-Smtp-Source: AGHT+IFkUInW1d9tToYDaO3KHKozP6J1/Vp9+e6EVZXMA+bRp2vl05Nn8fAQ4vTZThtusnO0rLY/Y8Y2mHdkQzlq9e8=
X-Received: by 2002:a05:6902:2b0e:b0:ea0:f4c6:5812 with SMTP id
 3f1490d57ef6-ea0f4d5ad88mr6585449276.32.1757409719783; Tue, 09 Sep 2025
 02:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1757071716.git.gerald.elder-vass@cloud.com>
 <8d66f9ce2c9c352794c0c144f6e00d0a9d465dbe.1757071716.git.gerald.elder-vass@cloud.com>
 <ed2e2406-bfab-4111-a9d0-025c85b51bdb@suse.com> <CAOJ+D-UkSveZ4LdYK5GA3VucxxSbQgBv5m9jfZ0H_MyuHP-UZQ@mail.gmail.com>
 <bf218191-fca6-439d-ad75-04162335b3ca@suse.com> <aL6nedjTUxgKh2uq@mail-itl>
In-Reply-To: <aL6nedjTUxgKh2uq@mail-itl>
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Date: Tue, 9 Sep 2025 10:21:49 +0100
X-Gm-Features: AS18NWCLnFQ8EaKYaAKaD_Lme80PLQ_otAAs_onfwJQPt3WB5jCMDoan9Nfp0Ss
Message-ID: <CAOJ+D-UECKGmKzpu3n76Bdd53sqC3X163gFwRQ1MGcA2qRBQOQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] efi: Add a function to check if Secure Boot mode
 is enabled
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000012b5a2063e5ad6ba"

--00000000000012b5a2063e5ad6ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 > On Mon, Sep 08, 2025 at 11:41:55AM +0200, Jan Beulich wrote:
> > On 08.09.2025 11:35, Gerald Elder-Vass wrote:
> > >>> +          size =3D=3D 1 && data =3D=3D 0) )
> > >>
> > >> ... any reason it's literal 1 here?
> > >
> > > The size variable is also used as output from GetVariable and we
should
> > > verify that the size of the returned data is as expected, it is
simply one
> > > byte so probably not worth defining any macros to make it clearer
> >
> > I don't understand this reply. Why would the initializer of the variabl=
e
> > use one thing (sizeof()) and the checking of the variable another
(literal
> > 1)? Even consistently using 1 would already be better imo; consistently
> > using sizeof() is what I think would be best.
>
 > 'size' as input value is the allocated size of the data parameter, so
> makes sense to be sizeof(data). IOW, 'size' as the input value comes
> from the size of the 'data' variable, while the output value check comes
> from UEFI spec. While the size of the 'data' variable should match the
>spec, IMO changing its type (to a wider one) should not break the
>behavior here.

 The UEFI spec defines the "SecureBoot" global variable as an 8-bit unsigne=
d
integer, in the event the size of the data used for output was not large
enough to
contain the output then it would return an EFI_BUFFER_TOO_SMALL status
(which the function would then interpret as "play it safe and assume
enabled").

The "SecureBoot" variable is defined:
https://uefi.org/specs/UEFI/2.11/03_Boot_Manager.html#globally-defined-vari=
ables

So I believe we are correct in using uint8_t here


*Gerald Elder-Vass*
Senior Software Engineer

XenServer
Cambridge, UK


On Mon, Sep 8, 2025 at 10:53=E2=80=AFAM Marek Marczykowski-G=C3=B3recki <
marmarek@invisiblethingslab.com> wrote:

> On Mon, Sep 08, 2025 at 11:41:55AM +0200, Jan Beulich wrote:
> > On 08.09.2025 11:35, Gerald Elder-Vass wrote:
> > >>> +          size =3D=3D 1 && data =3D=3D 0) )
> > >>
> > >> ... any reason it's literal 1 here?
> > >
> > > The size variable is also used as output from GetVariable and we shou=
ld
> > > verify that the size of the returned data is as expected, it is simpl=
y
> one
> > > byte so probably not worth defining any macros to make it clearer
> >
> > I don't understand this reply. Why would the initializer of the variabl=
e
> > use one thing (sizeof()) and the checking of the variable another
> (literal
> > 1)? Even consistently using 1 would already be better imo; consistently
> > using sizeof() is what I think would be best.
>
> 'size' as input value is the allocated size of the data parameter, so
> makes sense to be sizeof(data). IOW, 'size' as the input value comes
> from the size of the 'data' variable, while the output value check comes
> from UEFI spec. While the size of the 'data' variable should match the
> spec, IMO changing its type (to a wider one) should not break the
> behavior here.
>
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab
>

--00000000000012b5a2063e5ad6ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>
&gt;

<span class=3D"gmail-im">On Mon, Sep 08, 2025 at 11:41:55AM +0200, Jan Beul=
ich wrote:<br></span>
&gt;

<span class=3D"gmail-im">&gt; On 08.09.2025 11:35, Gerald Elder-Vass wrote:=
<br></span>
&gt;

<span class=3D"gmail-im">&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 size =3D=3D 1 &amp;&amp; data =3D=3D 0) )<br></span>
&gt;

<span class=3D"gmail-im">&gt; &gt;&gt;<br></span>
&gt;

<span class=3D"gmail-im">&gt; &gt;&gt; ... any reason it&#39;s literal 1 he=
re?<br></span>
&gt;

<span class=3D"gmail-im">&gt; &gt;=C2=A0<br></span>
&gt;

<span class=3D"gmail-im">&gt; &gt; The size variable is also used as output=
 from GetVariable and we should<br></span>
&gt;

<span class=3D"gmail-im">&gt; &gt; verify that the size of the returned dat=
a is as expected, it is simply one<br></span>
&gt;

<span class=3D"gmail-im">&gt; &gt; byte so probably not worth defining any =
macros to make it clearer<br></span>
&gt;

<span class=3D"gmail-im">&gt;=C2=A0<br></span>
&gt;

<span class=3D"gmail-im">&gt; I don&#39;t understand this reply. Why would =
the initializer of the variable<br></span>
&gt;

<span class=3D"gmail-im">&gt; use one thing (sizeof()) and the checking of =
the variable another (literal<br></span>
&gt;

<span class=3D"gmail-im">&gt; 1)? Even consistently using 1 would already b=
e better imo; consistently<br></span>
&gt;

<span class=3D"gmail-im">&gt; using sizeof() is what I think would be best.=
<br></span>
&gt;

<br>=C2=A0&gt;

&#39;size&#39; as input value is the allocated size of the data parameter, =
so<br>
&gt;

makes sense to be sizeof(data). IOW, &#39;size&#39; as the input value come=
s<br>
&gt;

from the size of the &#39;data&#39; variable, while the output value check =
comes<br>
&gt;

from UEFI spec. While the size of the &#39;data&#39; variable should match =
the<br>&gt;spec, IMO changing its type (to a wider one) should not break th=
e<br>&gt;behavior here.</div><div><br></div><div>=C2=A0The UEFI spec define=
s the &quot;SecureBoot&quot; global variable as an 8-bit unsigned</div><div=
>integer, in the event the size of the data used for output was not large e=
nough to</div><div>contain the output then it would return an EFI_BUFFER_TO=
O_SMALL status</div><div>(which the function would then interpret as &quot;=
play it safe and assume enabled&quot;).</div><div><br></div><div>The &quot;=
SecureBoot&quot; variable is defined:</div><div><a href=3D"https://uefi.org=
/specs/UEFI/2.11/03_Boot_Manager.html#globally-defined-variables">https://u=
efi.org/specs/UEFI/2.11/03_Boot_Manager.html#globally-defined-variables</a>=
</div><div><br></div><div>So I believe we are correct in using uint8_t here=
</div><div><br clear=3D"all"></div><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><b><br></b=
></div><div><b>Gerald Elder-Vass</b></div><div>Senior Software Engineer</di=
v><div><br></div><div>XenServer</div><div>Cambridge, UK</div></div></div></=
div><br></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Sep 8, 2025 at 10:53=E2=80=AFAM Marek=
 Marczykowski-G=C3=B3recki &lt;<a href=3D"mailto:marmarek@invisiblethingsla=
b.com">marmarek@invisiblethingslab.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Mon, Sep 08, 2025 at 11:41:55AM +0=
200, Jan Beulich wrote:<br>
&gt; On 08.09.2025 11:35, Gerald Elder-Vass wrote:<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D=3D 1 &amp;&a=
mp; data =3D=3D 0) )<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; ... any reason it&#39;s literal 1 here?<br>
&gt; &gt; <br>
&gt; &gt; The size variable is also used as output from GetVariable and we =
should<br>
&gt; &gt; verify that the size of the returned data is as expected, it is s=
imply one<br>
&gt; &gt; byte so probably not worth defining any macros to make it clearer=
<br>
&gt; <br>
&gt; I don&#39;t understand this reply. Why would the initializer of the va=
riable<br>
&gt; use one thing (sizeof()) and the checking of the variable another (lit=
eral<br>
&gt; 1)? Even consistently using 1 would already be better imo; consistentl=
y<br>
&gt; using sizeof() is what I think would be best.<br>
<br>
&#39;size&#39; as input value is the allocated size of the data parameter, =
so<br>
makes sense to be sizeof(data). IOW, &#39;size&#39; as the input value come=
s<br>
from the size of the &#39;data&#39; variable, while the output value check =
comes<br>
from UEFI spec. While the size of the &#39;data&#39; variable should match =
the<br>
spec, IMO changing its type (to a wider one) should not break the<br>
behavior here.<br>
<br>
-- <br>
Best Regards,<br>
Marek Marczykowski-G=C3=B3recki<br>
Invisible Things Lab<br>
</blockquote></div>

--00000000000012b5a2063e5ad6ba--


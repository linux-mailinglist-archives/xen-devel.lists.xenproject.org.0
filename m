Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E287C5031E2
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 01:34:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305966.521116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfVSG-0006LN-9h; Fri, 15 Apr 2022 23:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305966.521116; Fri, 15 Apr 2022 23:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfVSG-0006Ic-6K; Fri, 15 Apr 2022 23:34:20 +0000
Received: by outflank-mailman (input) for mailman id 305966;
 Fri, 15 Apr 2022 23:34:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6WtN=UZ=gmail.com=julien.grall@srs-se1.protection.inumbo.net>)
 id 1nfVSE-0006IW-HX
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 23:34:18 +0000
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [2607:f8b0:4864:20::d36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90ac761e-bd14-11ec-a405-831a346695d4;
 Sat, 16 Apr 2022 01:34:17 +0200 (CEST)
Received: by mail-io1-xd36.google.com with SMTP id b16so9577243ioz.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Apr 2022 16:34:17 -0700 (PDT)
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
X-Inumbo-ID: 90ac761e-bd14-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jeaoYUKUL61or4HyLQQqgOlw63VbKTQ0KLIlQ62k0w4=;
        b=BTSL9zh+DO29jjB+y19O5XX0kTNctJJJU0WJ4+rVxBHzdijJyf6HXkU8ORoHbSPoPe
         ALyhAgV37MlQIden1ISUVkCKbwL97B3D+ZX20nDRFvtBcOjmANdsjFS04eybz6aOSzCY
         lH7dnqGMKV8ZspiTdTBszyjLyIUVJ5yi/ePSNYYbbBbthNyfhRovyq86X7dROK4iXEGm
         yU+8h1HzfgLSdND5CnybC698LD6NY53zdc8WJhcb+hc9jFhz0UBl+Cr3Zrc71FpuIO5u
         u+JrgcNivnUH8RiddPYNUcc+fOXizCuCrqFV3Vj/In0YyelONtmIqCl4vDik0XobYB0g
         XKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jeaoYUKUL61or4HyLQQqgOlw63VbKTQ0KLIlQ62k0w4=;
        b=n0vALS1AUXZbnNqW3+LS3j3R2irTbt5yuLPWDnMzb9KBNQnW+eN4p5Hf8pl6J+ZZb7
         vNoWB5sAeUM9HzsGGNrS8vRLEmcl6Cwqf10Rfm+99NI0TXMejM8angZzJAAdI2hvPd06
         5ZkF6Rbv1fBdfaECn0hL7qDZr7i2UQFeocTBBnCXCA9ZF7wuj+4oCuAUncYQxhw8769r
         UC7yH8TFNsbcprsbjXAMKf1aNhfw5qNL351LhERXetErelxmiQAhZ4/1OSsW6GCxvgwV
         tH+kOmmclY+WBme81IHcqR+PWoQFzZzN35BuvZlQE8UQtiCC/gsWpDo0VfDOOPRNmeye
         f4Gw==
X-Gm-Message-State: AOAM532h/U+Gwf1DfwYGV0/uZcX8lWHghNdbsM5ZJKcYoTXXLFzGftr+
	+Mo1/KXAqOETBuufh/jZ64pAY5Y3ZIzllzUmmr8=
X-Google-Smtp-Source: ABdhPJwvuwBQRNRRouqsaPF3MNC/+/Pn6uxNPLuIjscP+b3L0dIi5QIaucDlm6uPNBUT10+02BtVuUMEcNo3IuFPskQ=
X-Received: by 2002:a02:b899:0:b0:328:522b:9417 with SMTP id
 p25-20020a02b899000000b00328522b9417mr627893jam.79.1650065656096; Fri, 15 Apr
 2022 16:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220311061123.1883189-1-Penny.Zheng@arm.com> <20220311061123.1883189-3-Penny.Zheng@arm.com>
 <eefa9cf2-a04c-ba8d-74cb-0d2aaa35badb@suse.com> <DU2PR08MB7325265A2356A09AC1DA5FDDF7EE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
In-Reply-To: <DU2PR08MB7325265A2356A09AC1DA5FDDF7EE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Julien Grall <julien.grall@gmail.com>
Date: Fri, 15 Apr 2022 23:34:04 +0000
Message-ID: <CAF3u54AffFUvjz1OJ41LSaMaUOU_QScFSYnztw6bx8w1Ksh8pg@mail.gmail.com>
Subject: Re: [PATCH v1 02/13] xen/arm: introduce a special domain DOMID_SHARED
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Penny Zheng <penzhe01@a011292.shanghai.arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Wei Chen <Wei.Chen@arm.com>, Wei Liu <wl@xen.org>, nd <nd@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000049acf205dcb9d97c"

--00000000000049acf205dcb9d97c
Content-Type: text/plain; charset="UTF-8"

Hi Penny,

Sorry for the formatting.

On Fri, 15 Apr 2022 at 09:53, Penny Zheng <Penny.Zheng@arm.com> wrote:

> Hi jan
>
> > -----
> > > +#ifdef CONFIG_STATIC_SHM
> > > +static void __init setup_shared_domain(void) {
> > > +    /*
> > > +     * Initialise our DOMID_SHARED domain.
> > > +     * This domain owns statically shared pages when owner domain is
> not
> > > +     * explicitly defined.
> > > +     */
> > > +    dom_shared = domain_create(DOMID_SHARED, NULL, CDF_directmap);
> > > +    if ( IS_ERR(dom_shared) )
> > > +        panic("Failed to create d[SHARED]: %ld\n",
> > > +PTR_ERR(dom_shared));
> >
> > I don't think this should be a panic - the system ought to be able to
> come up
> > fine, just without actually using this domain. After all this is an
> optional
> > feature which may not actually be used.
> >
> > Also, along the lines of what Stefano has said, this setting up of the
> domain
> > would also better live next to where the other special domains are set
> up. And
> > even if it was to remain here, ...
> >
>
> The reason why I place the setting up here is that DOMID_SHARED needs to
> map
> pre-configured static shared memory in its p2m table, so it must be set up
> after system P2M initialization(setup_virt_paging()).
> setup_system_domains()
> is called before system P2M initialization on xen/arch/arm/setup.c, which
> can't meet the requirement.


AFAIU, DOM_SHARED (or whatever you want to call it) will never run and the
GFN will always be equal to the MFN. So it sounds to me that creating a P2M
is a bit over the top. Instead, we should have a special case in
get_page_from_gfn like we did for DOM_XEN.

Cheers,
-- 
Julien Grall

--00000000000049acf205dcb9d97c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Hi Penny,</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Sorry for the formatting.</div><div><br><div class=3D"gmail_quote=
"></div></div></div><div><div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Fri, 15 Apr 2022 at 09:53, Penny Zheng &lt;<a href=
=3D"mailto:Penny.Zheng@arm.com" target=3D"_blank">Penny.Zheng@arm.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;=
border-left-color:rgb(204,204,204)">Hi jan <br>
<br>
&gt; -----<br>
&gt; &gt; +#ifdef CONFIG_STATIC_SHM<br>
&gt; &gt; +static void __init setup_shared_domain(void) {<br>
&gt; &gt; +=C2=A0 =C2=A0 /*<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* Initialise our DOMID_SHARED domain.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* This domain owns statically shared pages w=
hen owner domain is not<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* explicitly defined.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; +=C2=A0 =C2=A0 dom_shared =3D domain_create(DOMID_SHARED, NULL, C=
DF_directmap);<br>
&gt; &gt; +=C2=A0 =C2=A0 if ( IS_ERR(dom_shared) )<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 panic(&quot;Failed to create d[SHARE=
D]: %ld\n&quot;,<br>
&gt; &gt; +PTR_ERR(dom_shared));<br>
&gt; <br>
&gt; I don&#39;t think this should be a panic - the system ought to be able=
 to come up<br>
&gt; fine, just without actually using this domain. After all this is an op=
tional<br>
&gt; feature which may not actually be used.<br>
&gt; <br>
&gt; Also, along the lines of what Stefano has said, this setting up of the=
 domain<br>
&gt; would also better live next to where the other special domains are set=
 up. And<br>
&gt; even if it was to remain here, ...<br>
&gt; <br>
<br>
The reason why I place the setting up here is that DOMID_SHARED needs to ma=
p<br>
pre-configured static shared memory in its p2m table, so it must be set up<=
br>
after system P2M initialization(setup_virt_paging()). setup_system_domains(=
)<br>
is called before system P2M initialization on xen/arch/arm/setup.c, which<b=
r>
can&#39;t meet the requirement.</blockquote><div dir=3D"auto"><br></div></d=
iv></div></div><div><div><div class=3D"gmail_quote"><div dir=3D"auto">AFAIU=
, DOM_SHARED (or whatever you want to call it) will never run and the GFN w=
ill always be equal to the MFN. So it sounds to me that creating a P2M is a=
 bit over the top. Instead, we should have a special case in get_page_from_=
gfn like we did for DOM_XEN.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Cheers,</div></div></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature">Julien Grall</div>

--00000000000049acf205dcb9d97c--


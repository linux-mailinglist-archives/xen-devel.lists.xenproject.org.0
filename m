Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3973C453
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 08:33:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haaJD-0002XI-9k; Tue, 11 Jun 2019 06:31:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r3et=UK=gmail.com=fdwargee6@srs-us1.protection.inumbo.net>)
 id 1haaJB-0002XD-O5
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 06:31:01 +0000
X-Inumbo-ID: 7a288f78-8c12-11e9-8980-bc764e045a96
Received: from mail-it1-x144.google.com (unknown [2607:f8b0:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7a288f78-8c12-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 06:31:00 +0000 (UTC)
Received: by mail-it1-x144.google.com with SMTP id n189so2991741itd.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2019 23:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=IR3auwZ4Ldo+Rw6yitWtDEMW2CaKhqT4SYr1DtJ+PSQ=;
 b=jCAysOeGqiBkVwSOrTtJ6zABsQgLX6aXB2DlsDbpCa9iYNA+riDQGSLi+qtKRdGTaQ
 OOms6mNsmxfGI8BZAxBNzTjNbOlYfIFaV5ykCkoo5YxrWjblN0h/+kYNPthPVlYCLVQV
 gRhxlzP+B4tR49sXb7DpRA2rp54EnEU5vuNwWlyGJvP0FmLP1cTs8/VpJCcnncHnq+xU
 2BmzC5iO4Dmi96geeut7hUAl9hCXYoJou56DPAg/juoeU7u6OkEgu02NZxxkN0dFJ0IG
 cNVni/I6PKN9MAMB4phcgrK97S5I6xbtwsnvkOL1qKq3aDoqSeK65A464pkzE0SwU0Sm
 VJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=IR3auwZ4Ldo+Rw6yitWtDEMW2CaKhqT4SYr1DtJ+PSQ=;
 b=hddBexXs6Brcm2IVwhvuq/EoSmpFxAScbPkM5RlYJZEfJmPG+zDfs2zrfJs4WpDy3x
 2aSdmI52KVSOjBznTfeZylfWVjqJqNs9eG5LdtJilgSjtqbapegs+ekFeZP20NP6prAg
 b6nd+RxGu5CvlyfUoVcl8NfBXmA11SbHBKFjP5au8wUwizFfcPUWVP0WOxL+jpF8Vp03
 UmIh4g/WrXadMGTarZdydFCGcUanRvWAyhDmDdML7pBytArszjykojN6sGi1WelwlwH5
 //JEbe/ZBfgAsTLlpWi8MvecHWrfhjG7wsMCDf5X4xkTD8ccW3fu0GyHKAdd6Df4cAWp
 no2w==
X-Gm-Message-State: APjAAAUI1+LxExhO/k+5iGnZH96vzMgNa21L59wvTVOOvAsjHvI7hWkM
 JynptCkuueQ6YPi7WyxXuuUDJX7t9P2NN2r4wyBh1cIm
X-Google-Smtp-Source: APXvYqwk4a2OwUDaVoq54uy37PSUYhUcdcZbM29Z4seZRLAVNS5YAI4SO6JIpXPkzqt6oBD7dyBTb2k6cjygjl0SZ+0=
X-Received: by 2002:a24:7592:: with SMTP id y140mr18306679itc.47.1560234659372; 
 Mon, 10 Jun 2019 23:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <1050197223.47376247.1559909190275.JavaMail.zimbra@cert.pl>
 <20190610094143.GA30852@perard.uk.xensource.com>
 <edf0eaff-2a00-b4a7-8ed9-2a1d8975264e@cert.pl>
In-Reply-To: <edf0eaff-2a00-b4a7-8ed9-2a1d8975264e@cert.pl>
From: Fanny Dwargee <fdwargee6@gmail.com>
Date: Tue, 11 Jun 2019 08:30:47 +0200
Message-ID: <CAOz6fc_te580vPxvkJGehQZ0rtR9JedoenoQfOQSTz1w4R81=Q@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: Re: [Xen-devel] Relevance of global lock (/var/lock/xl) in xl tool
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
Content-Type: multipart/mixed; boundary="===============0738603245330967555=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0738603245330967555==
Content-Type: multipart/alternative; boundary="000000000000a3613e058b067019"

--000000000000a3613e058b067019
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'd like to point out that a patch for getting ride of the lock was
provided by Dmitry Isaykin on March but unfortunately seems that nobody
noticed.

https://lists.xenproject.org/archives/html/xen-devel/2019-03/msg00567.html

El lun., 10 jun. 2019 a las 22:00, Micha=C5=82 Leszczy=C5=84ski (<
michal.leszczynski@cert.pl>) escribi=C3=B3:

> Hello,
>
> I've tested the scenario with restoring too many domains having lock
> commented out. It turns out that in case when there is no memory left for
> XEN to allocate, all pending *xl restore* commands will simply fail with
> an internal error.
>
> As far as I understand, it's not going to do any damage unless I request
> too much memory?
>
> If so, then there is some place for improvement, i.e. to make xl acquire
> the lock, allocate memory, release the lock and then start restoring the
> domain state. Maybe I could provide some pull request if I would manage t=
o
> implement such behavior.
>
>
> Best regards,
> Micha=C5=82 Leszczy=C5=84ski
>
>
> On 10.06.2019 11:41, Anthony PERARD wrote:
>
> On Fri, Jun 07, 2019 at 02:06:30PM +0200, Micha=C5=82 Leszczy=C5=84ski wr=
ote:
>
> Hello,
>
> Hi,
>
>
> when either "xl restore" or "xl create" command is invoked, a global lock=
 is acquired here:
> https://github.com/xen-project/xen/blob/master/tools/xl/xl_vmcontrol.c#L8=
76
>
> I'm trying to figure out what is the exact importance of this lock? Is it=
 really critical for XL operation? I have a pretty powerful machine on whic=
h I want to run a few dozen of short-lived VMs. This lock is seriously slow=
ing me down, not letting to restore more than one domain at once. Turns out=
 that everything still works fine (and much faster) when I comment-out the =
lock in the abovementioned place, but I'm not sure if it's a correct impres=
sion.
>
> Does anyone know if there is a situation in which Xen would screw up with=
out this lock?
>
> Here is the reason for the lock:https://xenbits.xen.org/gitweb/?p=3Dxen.g=
it;a=3Dcommit;h=3Dea4dce89d478d62341cd2f9d8944e215f7086144
>
>   xl: free memory before building a domain
>   Free the needed amount of memory before proceeding with the domain
>   build.
>   Use a filelock to prevent other xl instances from conflicting during
>   this operation.
>
> So there are probably configurations where the lock isn't useful, or
> there are better ways to reserve memory for domain creation.
>
>
> --
> Pozdrawiam
> Micha=C5=82 Leszczy=C5=84ski
> CERT Polska/NASK
> +48 532 461 124
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000a3613e058b067019
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;d like to point out that a patch for getting ride of=
 the lock was provided by Dmitry Isaykin on March but unfortunately seems t=
hat nobody noticed.<div><br><div><a href=3D"https://lists.xenproject.org/ar=
chives/html/xen-devel/2019-03/msg00567.html">https://lists.xenproject.org/a=
rchives/html/xen-devel/2019-03/msg00567.html</a>=C2=A0=C2=A0<br></div></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>El lun., 10 jun. 2019 a las 22:00, Micha=C5=82 Leszczy=C5=84ski (&lt;<a hr=
ef=3D"mailto:michal.leszczynski@cert.pl">michal.leszczynski@cert.pl</a>&gt;=
) escribi=C3=B3:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <p>Hello,</p>
    <p>I&#39;ve tested the scenario with restoring too many domains having
      lock commented out. It turns out that in case when there is no
      memory left for XEN to allocate, all pending <i>xl restore</i>
      commands will simply fail with an internal error.</p>
    <p>As far as I understand, it&#39;s not going to do any damage unless I
      request too much memory?</p>
    <p>If so, then there is some place for improvement, i.e. to make xl
      acquire the lock, allocate memory, release the lock and then start
      restoring the domain state. Maybe I could provide some pull
      request if I would manage to implement such behavior.<br>
    </p>
    <p><br>
    </p>
    <p>Best regards,<br>
      Micha=C5=82 Leszczy=C5=84ski</p>
    <p><br>
    </p>
    <div class=3D"gmail-m_2859570387042066216moz-cite-prefix">On 10.06.2019=
 11:41, Anthony PERARD
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre class=3D"gmail-m_2859570387042066216moz-quote-pre">On Fri, Jun 0=
7, 2019 at 02:06:30PM +0200, Micha=C5=82 Leszczy=C5=84ski wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"gmail-m_2859570387042066216moz-quote-pre">Hello,
</pre>
      </blockquote>
      <pre class=3D"gmail-m_2859570387042066216moz-quote-pre">Hi,

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"gmail-m_2859570387042066216moz-quote-pre">when either=
 &quot;xl restore&quot; or &quot;xl create&quot; command is invoked, a glob=
al lock is acquired here:

<a class=3D"gmail-m_2859570387042066216moz-txt-link-freetext" href=3D"https=
://github.com/xen-project/xen/blob/master/tools/xl/xl_vmcontrol.c#L876" tar=
get=3D"_blank">https://github.com/xen-project/xen/blob/master/tools/xl/xl_v=
mcontrol.c#L876</a>

I&#39;m trying to figure out what is the exact importance of this lock? Is =
it really critical for XL operation? I have a pretty powerful machine on wh=
ich I want to run a few dozen of short-lived VMs. This lock is seriously sl=
owing me down, not letting to restore more than one domain at once. Turns o=
ut that everything still works fine (and much faster) when I comment-out th=
e lock in the abovementioned place, but I&#39;m not sure if it&#39;s a corr=
ect impression.

Does anyone know if there is a situation in which Xen would screw up withou=
t this lock?
</pre>
      </blockquote>
      <pre class=3D"gmail-m_2859570387042066216moz-quote-pre">Here is the r=
eason for the lock:
<a class=3D"gmail-m_2859570387042066216moz-txt-link-freetext" href=3D"https=
://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3Dea4dce89d478d62341cd2=
f9d8944e215f7086144" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3D=
xen.git;a=3Dcommit;h=3Dea4dce89d478d62341cd2f9d8944e215f7086144</a>

  xl: free memory before building a domain
  Free the needed amount of memory before proceeding with the domain
  build.
  Use a filelock to prevent other xl instances from conflicting during
  this operation.

So there are probably configurations where the lock isn&#39;t useful, or
there are better ways to reserve memory for domain creation.

</pre>
    </blockquote>
    <pre class=3D"gmail-m_2859570387042066216moz-signature" cols=3D"72">--=
=20
Pozdrawiam
Micha=C5=82 Leszczy=C5=84ski
CERT Polska/NASK
+48 532 461 124</pre>
  </div>

_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div>

--000000000000a3613e058b067019--


--===============0738603245330967555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0738603245330967555==--


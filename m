Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36413970DB
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 12:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134761.250667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo1Fk-0005eB-Fz; Tue, 01 Jun 2021 10:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134761.250667; Tue, 01 Jun 2021 10:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo1Fk-0005bi-Cr; Tue, 01 Jun 2021 10:04:04 +0000
Received: by outflank-mailman (input) for mailman id 134761;
 Tue, 01 Jun 2021 10:04:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v8JE=K3=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1lo1Fj-0005bc-Cj
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 10:04:03 +0000
Received: from mail-ej1-x632.google.com (unknown [2a00:1450:4864:20::632])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77026a2f-d279-4d9b-95a7-8a1790c11c2e;
 Tue, 01 Jun 2021 10:04:02 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id b9so20714962ejc.13
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jun 2021 03:04:02 -0700 (PDT)
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
X-Inumbo-ID: 77026a2f-d279-4d9b-95a7-8a1790c11c2e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NguXytoAzNDpHJ9iVaOA6ZF/SSQbqCjlr5BrWtTX8Hw=;
        b=Ive3Q/KNhC813q24syndBkjVnehTGM3ui91Kt9a+rF/7Bk7PJMLgdELeWPbCiwOOLm
         pkqNKDqnBu9c+2ki3c6skBVvm3eVNoWPZBeMHGyMH1ejgFU4YhYiLpbvwrMUVG2PKbmZ
         8D0Bm9C6vrIGq1pn+q7sICkWZWzcz9SS9UnGcZkhjhXAAhGDRnocAPkDWQpW7UX+SVzT
         8Bzrc2KA83SZSPQTh2CxkQP/wHNplYkI5PBtGGIxmnmcd0V+eFGV9MW1ofvnM40DL+bc
         5QMsJYwF6Ezy0xLySzg3zhWO7AxsAhjcdoB0vu4kLwKXdNgUMPRLa8sdKwFf0aQHyegM
         DV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NguXytoAzNDpHJ9iVaOA6ZF/SSQbqCjlr5BrWtTX8Hw=;
        b=t+qod+BVOG+Nl5qfPcoM157ekCfBiy5sJmLkRjcGWkbdTpgV/2C3F4lsWuHqIdUuW1
         Ifz1GatIZJFy1YwMB85nyVOgKMNWWRBRCD1xhjArS8vUwoJpXGEh/9zeE1ZP+USorEZ0
         EmfAW+OyN0hZvDp2y2FQgZp+oxi0h/eBHvW3EYRTXMJN16CVtJsvOy1c1xMVw8jnCkm1
         oIwwrb+Jt2+DeHOQ9D9ZkbfwiU9WzUqf7Cct3e8bCTrLREX7kvFGo0RX4oWpU1hPimGA
         ZXX4GwqwpOwammvzfhgTLqHiKdPJJWE7XMPg+GTmXtySqqA8Q4VMO0jg8kaQPlwnSk/9
         1esw==
X-Gm-Message-State: AOAM533C5w/sElpq+KSYkKdWvnzmlLmwXQLZ1jzsQyW2ydsFSlZZXMnF
	NLkHUS5c67UyqBGnszX6TDyUh5TV/A4ZfCj2LEL8oWnD
X-Google-Smtp-Source: ABdhPJxp9o6N7j96dsbOaH9JpXUniB66j4tTybQqUDB5cE5krtieoD9RKNHDJaxna3FskSM3IuJRwo9/fVj9NjBPXHs=
X-Received: by 2002:a17:906:51c7:: with SMTP id v7mr28934642ejk.86.1622541841528;
 Tue, 01 Jun 2021 03:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <9562f5c0911567f12ed9fef8830f3018@mail.rmail.be>
In-Reply-To: <9562f5c0911567f12ed9fef8830f3018@mail.rmail.be>
From: George Dunlap <dunlapg@umich.edu>
Date: Tue, 1 Jun 2021 11:03:50 +0100
Message-ID: <CAFLBxZZqvdmGmSXS9P7XzsCahpyTcnrwQr+OLw-x_jqHwceWsg@mail.gmail.com>
Subject: Re: pci passthrough issue introduced between 4.14.1 and 4.15.0
To: AL13N <alien@rmail.be>, Ian Jackson <Ian.Jackson@citrix.com>, 
	Anthony Perard <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000018feaa05c3b1769a"

--00000000000018feaa05c3b1769a
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 1, 2021 at 8:34 AM AL13N <alien@rmail.be> wrote:

> Not 100% it's a bug or something i did wrong, but,
>
> with xl create i start a PV with 3 pci passthroughs
>
> after wards, xl pci-list shows all 3 nicely
>
> looking at the domU boot logs, pcifront is only creating one pci device
> and lspci in the guest shows only 1 pci entry
>
> in at least 4.14.1 it still works.
>
> looking deeper, if you start with only 1 entry or 0 and you do
> pci-attach for the other pci entries, all of this works fine.
>
> this is the pci section in question:
>
> pci=['0000:04:00.0,permissive=1',
> '0000:00:1a.0,permissive=1,rdm_policy=relaxed,seize=1',
> '0000:00:1d.0,permissive=1,rdm_policy=relaxed,seize=1']
>
> this works fine in 4.12.1 and 4.14.1, but fails in 4.15.0, however
>
> booting with pci=['0000:04:00.0,permissive=1'] and then doing
>
> []# xl pci-attach <domain>
> '0000:00:1a.0,permissive=1,rdm_policy=relaxed,seize=1'
> []# xl pci-attach <domain>
> '0000:00:1d.0,permissive=1,rdm_policy=relaxed,seize=1'
>
> also works,
>

Sounds like it might be a tools issue?

 -George

--00000000000018feaa05c3b1769a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 1, 2021 at 8:34 AM AL13N =
&lt;<a href=3D"mailto:alien@rmail.be">alien@rmail.be</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Not 100% it&#39;s a bug=
 or something i did wrong, but,<br>
<br>
with xl create i start a PV with 3 pci passthroughs<br>
<br>
after wards, xl pci-list shows all 3 nicely<br>
<br>
looking at the domU boot logs, pcifront is only creating one pci device <br=
>
and lspci in the guest shows only 1 pci entry<br>
<br>
in at least 4.14.1 it still works.<br>
<br>
looking deeper, if you start with only 1 entry or 0 and you do <br>
pci-attach for the other pci entries, all of this works fine.<br>
<br>
this is the pci section in question:<br>
<br>
pci=3D[&#39;0000:04:00.0,permissive=3D1&#39;, <br>
&#39;0000:00:1a.0,permissive=3D1,rdm_policy=3Drelaxed,seize=3D1&#39;, <br>
&#39;0000:00:1d.0,permissive=3D1,rdm_policy=3Drelaxed,seize=3D1&#39;]<br>
<br>
this works fine in 4.12.1 and 4.14.1, but fails in 4.15.0, however<br>
<br>
booting with pci=3D[&#39;0000:04:00.0,permissive=3D1&#39;] and then doing<b=
r>
<br>
[]# xl pci-attach &lt;domain&gt; <br>
&#39;0000:00:1a.0,permissive=3D1,rdm_policy=3Drelaxed,seize=3D1&#39;<br>
[]# xl pci-attach &lt;domain&gt; <br>
&#39;0000:00:1d.0,permissive=3D1,rdm_policy=3Drelaxed,seize=3D1&#39;<br>
<br>
also works,<br></blockquote><div><br></div><div>Sounds like it might be a t=
ools issue?</div><div><br></div><div>=C2=A0-George<br></div><div>=C2=A0</di=
v></div></div>

--00000000000018feaa05c3b1769a--


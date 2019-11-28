Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8688610CF21
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 21:19:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaQCq-0004qN-DF; Thu, 28 Nov 2019 20:16:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yOAp=ZU=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iaQCo-0004qI-Lh
 for xen-devel@lists.xen.org; Thu, 28 Nov 2019 20:16:02 +0000
X-Inumbo-ID: e56e9908-121b-11ea-a55d-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e56e9908-121b-11ea-a55d-bc764e2007e4;
 Thu, 28 Nov 2019 20:16:01 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id f16so20906719lfm.3
 for <xen-devel@lists.xen.org>; Thu, 28 Nov 2019 12:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M14Vm5I/P50IBZuplHVoMsP6z5P8CbARm/pHUt5icRI=;
 b=oIA9ZGK1P6qIq9QOpX8sciBJ8Z5Fe1Cx6S+CQmvb+S+2gLfVkGpdRuojlrMtST0cvb
 FMNN1Dk1neUi7JhXrEy+Y1jxeQr7lRXX+4LhPwjKvDztyTZCJKUJIFTgv6WdqFsfypEH
 3rhl5PEj2AOI69WnbiHMHswVwx57SIa+eSgrqFmce5QkG8BQd3R6flkZP7kaJo2coUo6
 0AzX+RMDdMHt5e44U9wOLYTJMa5JcRY/4hnpeZGPCiYOWlhacXx/1Mj5C0E4WeJj7PL2
 WMTVQDkkSQlz68GgVwyFy0wAdowRLwrmBDup9hnYYYHqSW9BH6IjqEjieawvVvXzjDSV
 iyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M14Vm5I/P50IBZuplHVoMsP6z5P8CbARm/pHUt5icRI=;
 b=Z+usvoahhlWBLcoVaCeE7X+e909LlLpTpihvUGzm+vlIk/HXZriwINCTbkkWGxKuX3
 Rgn8vV/CAYbe9hWke/bKwC/xskgy7fm6Hbu2G/PXQU/g/HmVwQm+vipyJV7PzKkP6zfm
 +X2e/dlnnxlDGD9tLFiXUWL0EXcct0OyOxV4/wu/EOyUFUAlKwKgacqTZqVG2GJ5RYv6
 jSThPiGoUbhMa/V78C90BmeqoRlbCimHK49qK8R0y7FMH8sqXQIZWgnVlUcke61cHFV5
 HS8rFigpbKa9sUv8T8sNoDU7RO2i29CRa5aNvkxpOJCMLQg+TxI1QKDP6JoXV24Sb1Cx
 EeMg==
X-Gm-Message-State: APjAAAWPBsjs9B/jpwRIJYpjiIb7aKl0OmBonBBwv+Rb5ZErn0m3fh31
 igvQJKR2QBvefcI1AT6TLy3vfiYLmK47vK1/jFQ=
X-Google-Smtp-Source: APXvYqzDX+l4HQTurRPiKyeWN8hKrh6Ot3sQzLdHEwB0Zy2h8Fva9+h/ski0Jh2khYgSQPEC1lOxsUWbUpg+kv9jAnE=
X-Received: by 2002:ac2:4199:: with SMTP id z25mr4592268lfh.102.1574972160656; 
 Thu, 28 Nov 2019 12:16:00 -0800 (PST)
MIME-Version: 1.0
References: <20191122080226.6817-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911221105360.11302@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1911261241260.8205@sstabellini-ThinkPad-T480s>
 <942a60db-fd30-a63e-25b1-e6b739b17c4e@xen.org>
 <alpine.DEB.2.21.1911261306370.8205@sstabellini-ThinkPad-T480s>
 <e98515e2-8e2e-569a-557e-523e9f134bef@xen.org>
 <13d490f1-cd9e-e2aa-d118-2c96cf03eb9b@suse.com>
 <AM0PR04MB4481C1F43E0827D5652148F488440@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <e846a55b-3379-a22d-93db-862bc5279b64@suse.com>
 <alpine.DEB.2.21.1911270753580.27669@sstabellini-ThinkPad-T480s>
 <c6c26fc6-d9ab-5222-3787-3d083b3b7a97@xen.org>
 <3d63788e-b28a-c8fd-dae3-99ad9f4b9a04@suse.com>
 <9d32e677-dc13-cb56-6684-01ceabf4ae47@xen.org>
 <4b5f402d-1c24-4a27-6f6c-1c134c15d83c@suse.com>
 <b27d00bf-5bc4-e62b-3a09-7f5b4bded0a6@xen.org>
 <alpine.DEB.2.21.1911281004520.15579@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1911281004520.15579@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 28 Nov 2019 18:41:06 +0000
Message-ID: <CAJ=z9a1kcE3CnAbC_NxDiS+ubVOrZosNGxCM+2f95wJx2emomA@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] [PATCH V2] arch: arm: vgic-v3: fix GICD_ISACTIVER
 range
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>, committers@xenproject.org,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/mixed; boundary="===============0901996638318413543=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0901996638318413543==
Content-Type: multipart/alternative; boundary="0000000000002aca3405986dc83e"

--0000000000002aca3405986dc83e
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Nov 2019, 18:09 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Thu, 28 Nov 2019, Julien Grall wrote:
> > > In both cases I see no reason to keep wrong code.
> > >
> > > Either the patch will let run Linux 5.4 fine - then the patch should
> > > definitely be taken.
> > That's up to Stefano and Peng to provide me information why this is fine.
> > FAOD, the current justification provided is not acceptable for me.
>
> I disagree. This is a typo fix. The original design was never spec
> compliant. You cannot expect the typo fix to explain why the original
> behavior is tolerable. That is out of scope and should *not* be required
> for this fix.


May I remind you that as a maintainer, this is in my right to say no to a
patch.


> We cannot expect typo fixes to go and trigger vgic/gic reworks and deep
> investigations. This is a wrong expectation now, and going forward.
>

That's the best way to turn Xen into a bunch of hacks.

I pointed out several times a potential issue with this patch. I also spent
some part of my week-end investigating it and provide some insight. Did you
look at them?

If you want this patch in, then please help explaining why 5.4 is going to
run fine on Xen 4.13 rather than keeping arguing this is a typo fix.

Cheers,

--0000000000002aca3405986dc83e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, 28 Nov 2019, 18:09 Stefano Stabellini, &lt;<a =
href=3D"mailto:sstabellini@kernel.org" target=3D"_blank" rel=3D"noreferrer"=
>sstabellini@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">On Thu, 28 Nov 2019, Julien Grall wrote:<br>
&gt; &gt; In both cases I see no reason to keep wrong code.<br>
&gt; &gt; <br>
&gt; &gt; Either the patch will let run Linux 5.4 fine - then the patch sho=
uld<br>
&gt; &gt; definitely be taken.<br>
&gt; That&#39;s up to Stefano and Peng to provide me information why this i=
s fine.<br>
&gt; FAOD, the current justification provided is not acceptable for me.<br>
<br>
I disagree. This is a typo fix. The original design was never spec<br>
compliant. You cannot expect the typo fix to explain why the original<br>
behavior is tolerable. That is out of scope and should *not* be required<br=
>
for this fix.</blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">May I remind you that as a<span style=3D"font-family:sans-serif">=
=C2=A0maintainer, this is in my right to say no to a patch.</span></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto"></div><div dir=3D"auto"></div><d=
iv dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
We cannot expect typo fixes to go and trigger vgic/gic reworks and deep<br>
investigations. This is a wrong expectation now, and going forward.<br></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">That&#39=
;s the best way to turn Xen into a bunch of hacks.</div><div dir=3D"auto">=
=C2=A0</div><div dir=3D"auto">I pointed out several times a potential issue=
 with this patch. I also spent some part of my week-end investigating it an=
d provide some insight. Did you look at them?</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">If you want this patch in, then please help explainin=
g why 5.4 is going to run fine on Xen 4.13 rather than keeping arguing this=
 is a typo fix.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000002aca3405986dc83e--


--===============0901996638318413543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0901996638318413543==--


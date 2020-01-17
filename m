Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31A8141185
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 20:16:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isX3b-0005PU-Fc; Fri, 17 Jan 2020 19:13:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Fq2d=3G=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1isX3Z-0005Os-5Z
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 19:13:21 +0000
X-Inumbo-ID: 63afae98-395d-11ea-aecd-bc764e2007e4
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63afae98-395d-11ea-aecd-bc764e2007e4;
 Fri, 17 Jan 2020 19:13:05 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id m25so11579058ioo.8
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2020 11:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:message-id:date
 :cc:to; bh=tyBICh6qsCgunZL1K2GBhM102Q/jB8XWzGZMyystfTk=;
 b=epoormgAWciJxg0ninbf5DuQWEldxxyw8e01dagRB0X8ssHmCX0R6j/pUvGmwGWxEs
 vlFu0OsKU1IQgAVPqDIZg/127ODKGPKVTnjvOrG7ovzYZnzK8ixPGheQjgxryCLrkh9j
 FbKXly7Au4kkOe0D2btAZRziV2LCs5VlQ51PZHalj6EcQPJqrlZ8YAyox+tfYsvdVtta
 fUeKyRcfTqx/0UHsfrfz5gxmKLGmh0kpgtt512+75jG2EVhQTaJ6fvMUUbwDlCKOe8IE
 O4pTmdq1Y6I4sPzhZqo+hLL1aRwcat2eMgl/TouhDHsPQr5s5v4aKSWZiDifNPuAtIea
 uqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:message-id:date:cc:to;
 bh=tyBICh6qsCgunZL1K2GBhM102Q/jB8XWzGZMyystfTk=;
 b=iDhHdTEIFMmGbXcXt89d3uLC8I/Ts7upivNBD0iDegVWWa4Cde3cx5wjkICik5EK2U
 p2RAzKBIjMSVgO3IJ9zpbbvRuC0P/o9FNr59OQ61X8ZQ22Gsbd+m9v/LmlCdyxrWXdiM
 seEVcH4NOl+B+DvzJ7BqaCvx+9PZEbn7zPqnL8tjDYKimk7/tnbaLc2JemykkgvDnBsk
 V5/7pCLsMl1W/3iKBjiix5Xgqj0IfhnEZfo5VGgZ3/zxhy9vOEbOJJk3pXynZPLd24/m
 iT95r0vXV0HHjEsVTbTZAnfDn2wzOyHUFzn5kr0fdNDHsPQjP/bmfGA/gOerM60mLI/b
 xskg==
X-Gm-Message-State: APjAAAWTxxbhRDJ73zGnlcJp6o7061c/pWL5fi+J5kuMEcz56g3oA6+y
 Wm2AT5fyPUpZsyS3Rc0bHDA=
X-Google-Smtp-Source: APXvYqwECXtvNRHVp9D3bGDOmtma8eKiOBRROoy0nlYr5SsX50wWrWUftQ7b1rEBoMT4z4uz+sHf3g==
X-Received: by 2002:a5e:8505:: with SMTP id i5mr30307611ioj.158.1579288385223; 
 Fri, 17 Jan 2020 11:13:05 -0800 (PST)
Received: from [100.64.72.109] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id f72sm8138964ilg.84.2020.01.17.11.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jan 2020 11:13:04 -0800 (PST)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <646A4BEA-C544-4C62-A7A3-B736D3860912@gmail.com>
Date: Fri, 17 Jan 2020 14:13:04 -0500
To: =?utf-8?Q?Pasi_K=C3=A4rkk=C3=A4inen?= <pasik@iki.fi>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
X-Mailer: iPad Mail (17C54)
Subject: Re: [Xen-devel] [PATCH V3 2/2] Xen/PCIback: Implement PCI
 flr/slot/bus reset with 'reset' SysFS attribute
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Jason Andryuk <jandryuk@gmail.com>, George Dunlap <George.Dunlap@citrix.com>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Anthony Perard <anthony.perard@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?utf-8?Q?H=C3=A5kon_Alstadheim?= <hakon@alstadheim.priv.no>
Content-Type: multipart/mixed; boundary="===============0708346127413096689=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0708346127413096689==
Content-Type: multipart/alternative; boundary=Apple-Mail-A6CB21B9-01BB-452E-8AFB-2FC142F4EDBE
Content-Transfer-Encoding: 7bit


--Apple-Mail-A6CB21B9-01BB-452E-8AFB-2FC142F4EDBE
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Aug 26, 2019, at 17:08, Pasi K=C3=A4rkk=C3=A4inen <pasik@iki.fi> wrote:
> =EF=BB=BFHi,
>=20
>> On Mon, Oct 08, 2018 at 10:32:45AM -0400, Boris Ostrovsky wrote:
>>> On 10/3/18 11:51 AM, Pasi K=C3=A4rkk=C3=A4inen wrote:
>>> On Wed, Sep 19, 2018 at 11:05:26AM +0200, Roger Pau Monn=C3=A9 wrote:
>>>> On Tue, Sep 18, 2018 at 02:09:53PM -0400, Boris Ostrovsky wrote:
>>>>> On 9/18/18 5:32 AM, George Dunlap wrote:
>>>>>>> On Sep 18, 2018, at 8:15 AM, Pasi K=C3=A4rkk=C3=A4inen <pasik@iki.fi=
> wrote:
>>>>>>> Hi,
>>>>>>> On Mon, Sep 17, 2018 at 02:06:02PM -0400, Boris Ostrovsky wrote:
>>>>>>>> What about the toolstack changes? Have they been accepted? I vaguel=
y
>>>>>>>> recall there was a discussion about those changes but don't remembe=
r how
>>>>>>>> it ended.
>>>>>>> I don't think toolstack/libxl patch has been applied yet either.
>>>>>>> "[PATCH V1 0/1] Xen/Tools: PCI reset using 'reset' SysFS attribute":=

>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00664.html
>>>>>>> "[PATCH V1 1/1] Xen/libxl: Perform PCI reset using 'reset' SysFS att=
ribute":
>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00663.html
>>>>> Will this patch work for *BSD? Roger?
>>>> At least FreeBSD don't support pci-passthrough, so none of this works
>>>> ATM. There's no sysfs on BSD, so much of what's in libxl_pci.c will
>>>> have to be moved to libxl_linux.c when BSD support is added.
>>> Ok. That sounds like it's OK for the initial pci 'reset' implementation i=
n xl/libxl to be linux-only..
>>=20
>> Are these two patches still needed? ISTR they were  written originally
>> to deal with guest trying to use device that was previously assigned to
>> another guest. But pcistub_put_pci_dev() calls
>> __pci_reset_function_locked() which first tries FLR, and it looks like
>> it was added relatively recently.
>=20
> Replying to an old thread.. I only now realized I forgot to reply to this m=
essage earlier.
>=20
> afaik these patches are still needed. H=C3=A5kon (CC'd) wrote to me in pri=
vate that
> he gets a (dom0) Linux kernel crash if he doesn't have these patches appli=
ed.
>=20
>=20
> Here are the links to both the linux kernel and libxl patches:
>=20
>=20
> "[Xen-devel] [PATCH V3 0/2] Xen/PCIback: PCI reset using 'reset' SysFS att=
ribute":
> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00659.html
>=20
> [Note that PATCH V3 1/2 "Drivers/PCI: Export pcie_has_flr() interface" is a=
lready applied in upstream linux kernel, so it's not needed anymore]
>=20
> "[Xen-devel] [PATCH V3 2/2] Xen/PCIback: Implement PCI flr/slot/bus reset w=
ith 'reset' SysFS attribute":
> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00661.html
>=20
>=20
> "[Xen-devel] [PATCH V1 0/1] Xen/Tools: PCI reset using 'reset' SysFS attri=
bute":
> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00664.html
>=20
> "[Xen-devel] [PATCH V1 1/1] Xen/libxl: Perform PCI reset using 'reset' Sys=
FS attribute":
> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00663.html

[dropping Linux mailing lists]

What is required to get the Xen patches merged?  Rebasing against Xen master=
?  OpenXT has been carrying a similar patch for many years and we would like=
 to move to an upstream implementation.  Xen users of PCI passthrough would b=
enefit from more reliable device reset.

  2017 thread, including OpenXT patch: https://lists.gt.net/xen/devel/492945=

  2017-2019 thread: https://lists.gt.net/xen/devel/532648

Rich=

--Apple-Mail-A6CB21B9-01BB-452E-8AFB-2FC142F4EDBE
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">On Aug 26, 2019, at 17:08,=
 Pasi K=C3=A4rkk=C3=A4inen &lt;pasik@iki.fi&gt; wrote:<div dir=3D"ltr"><bloc=
kquote type=3D"cite"><br></blockquote></div><blockquote type=3D"cite"><div d=
ir=3D"ltr">=EF=BB=BF<span>Hi,</span><br><span></span><br><span>On Mon, Oct 0=
8, 2018 at 10:32:45AM -0400, Boris Ostrovsky wrote:</span><br><blockquote ty=
pe=3D"cite"><span>On 10/3/18 11:51 AM, Pasi K=C3=A4rkk=C3=A4inen wrote:</spa=
n><br></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
>On Wed, Sep 19, 2018 at 11:05:26AM +0200, Roger Pau Monn=C3=A9 wrote:</span=
><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>On Tue, Sep 18, 2018 at 02:09:53PM -0=
400, Boris Ostrovsky wrote:</span><br></blockquote></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>On 9/18/18 5:32 AM, George Dunlap wrote:<=
/span><br></blockquote></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>On Se=
p 18, 2018, at 8:15 AM, Pasi K=C3=A4rkk=C3=A4inen &lt;pasik@iki.fi&gt; wrote=
:</span><br></blockquote></blockquote></blockquote></blockquote></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span></span><br></blockquote></blockquote></blockquote></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>Hi,</span><br></blockquote></=
blockquote></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></s=
pan><br></blockquote></blockquote></blockquote></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>On Mon, Sep 17, 2018 at 02:06:02PM -0400, Boris Ostrovsky=
 wrote:</span><br></blockquote></blockquote></blockquote></blockquote></bloc=
kquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>What about the tools=
tack changes? Have they been accepted? I vaguely</span><br></blockquote></bl=
ockquote></blockquote></blockquote></blockquote></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>recall there was a discussion about those c=
hanges but don't remember how</span><br></blockquote></blockquote></blockquo=
te></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>it ended.</span><br></blockquote></blockquote></blockquote></bl=
ockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span></span><br></blockquote></blockquote></blockquote></blockquote></blo=
ckquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>I don't think toolstack/libxl pa=
tch has been applied yet either.</span><br></blockquote></blockquote></block=
quote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquo=
te></blockquote></blockquote></blockquote></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n></span><br></blockquote></blockquote></blockquote></blockquote></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>"[PATCH V1 0/1] Xen/Tools: PCI reset using 'reset' S=
ysFS attribute":</span><br></blockquote></blockquote></blockquote></blockquo=
te></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>https://lists.xen.org/archives/html/x=
en-devel/2017-12/msg00664.html</span><br></blockquote></blockquote></blockqu=
ote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote=
></blockquote></blockquote></blockquote></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
"[PATCH V1 1/1] Xen/libxl: Perform PCI reset using 'reset' SysFS attribute":=
</span><br></blockquote></blockquote></blockquote></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>https://lists.xen.org/archives/html/xen-devel/2017-12=
/msg00663.html</span><br></blockquote></blockquote></blockquote></blockquote=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></bl=
ockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span>Will this patch work for *BSD? Roger?</span><br></blockquote></blockqu=
ote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>At least FreeBSD don't support pci-pas=
sthrough, so none of this works</span><br></blockquote></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>ATM. There's no sysfs on BSD, so much of what's in libxl_pci.c w=
ill</span><br></blockquote></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>have to be move=
d to libxl_linux.c when BSD support is added.</span><br></blockquote></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span></span><br></blockquote></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Ok. That sounds l=
ike it's OK for the initial pci 'reset' implementation in xl/libxl to be lin=
ux-only.. </span><br></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span></span><br></blockquote></blockquote><blockquot=
e type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><spa=
n>Are these two patches still needed? ISTR they were&nbsp; written originall=
y</span><br></blockquote><blockquote type=3D"cite"><span>to deal with guest t=
rying to use device that was previously assigned to</span><br></blockquote><=
blockquote type=3D"cite"><span>another guest. But pcistub_put_pci_dev() call=
s</span><br></blockquote><blockquote type=3D"cite"><span>__pci_reset_functio=
n_locked() which first tries FLR, and it looks like</span><br></blockquote><=
blockquote type=3D"cite"><span>it was added relatively recently.</span><br><=
/blockquote><blockquote type=3D"cite"><span></span><br></blockquote><span></=
span><br><span>Replying to an old thread.. I only now realized I forgot to r=
eply to this message earlier.</span><br><span></span><br><span>afaik these p=
atches are still needed. H=C3=A5kon (CC'd) wrote to me in private that</span=
><br><span>he gets a (dom0) Linux kernel crash if he doesn't have these patc=
hes applied.</span><br><span></span><br><span></span><br><span>Here are the l=
inks to both the linux kernel and libxl patches:</span><br><span></span><br>=
<span></span><br><span>"[Xen-devel] [PATCH V3 0/2] Xen/PCIback: PCI reset us=
ing 'reset' SysFS attribute":</span><br><span>https://lists.xen.org/archives=
/html/xen-devel/2017-12/msg00659.html</span><br><span></span><br><span>[Note=
 that PATCH V3 1/2 "Drivers/PCI: Export pcie_has_flr() interface" is already=
 applied in upstream linux kernel, so it's not needed anymore]</span><br><sp=
an></span><br><span>"[Xen-devel] [PATCH V3 2/2] Xen/PCIback: Implement PCI f=
lr/slot/bus reset with 'reset' SysFS attribute":</span><br><span>https://lis=
ts.xen.org/archives/html/xen-devel/2017-12/msg00661.html</span><br><span></s=
pan><br><span></span><br><span>"[Xen-devel] [PATCH V1 0/1] Xen/Tools: PCI re=
set using 'reset' SysFS attribute":</span><br><span>https://lists.xen.org/ar=
chives/html/xen-devel/2017-12/msg00664.html</span><br><span></span><br><span=
>"[Xen-devel] [PATCH V1 1/1] Xen/libxl: Perform PCI reset using 'reset' SysFS=
 attribute":</span><br><span>https://lists.xen.org/archives/html/xen-devel/2=
017-12/msg00663.html</span></div></blockquote><div><br></div><div>[dropping L=
inux mailing lists]</div><br><div>What is required to get the Xen patches me=
rged? &nbsp;Rebasing against Xen master? &nbsp;OpenXT has been carrying a si=
milar patch for many years and we would like to move to an upstream implemen=
tation. &nbsp;Xen users of PCI passthrough would benefit from more reliable d=
evice reset.</div><div><br></div><div>&nbsp; 2017 thread, including OpenXT p=
atch:&nbsp;<a href=3D"https://lists.gt.net/xen/devel/492945">https://lists.g=
t.net/xen/devel/492945</a></div><div>&nbsp; 2017-2019 thread:&nbsp;<a href=3D=
"https://lists.gt.net/xen/devel/532648">https://lists.gt.net/xen/devel/53264=
8</a></div><div><br></div><div>Rich</div></div></body></html>=

--Apple-Mail-A6CB21B9-01BB-452E-8AFB-2FC142F4EDBE--


--===============0708346127413096689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0708346127413096689==--


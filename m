Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED111459EC
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 17:31:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuIr3-0002U4-Ff; Wed, 22 Jan 2020 16:27:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kBu+=3L=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1iuIr1-0002Tv-FY
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 16:27:43 +0000
X-Inumbo-ID: 1cb60cbe-3d34-11ea-8e9a-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cb60cbe-3d34-11ea-8e9a-bc764e2007e4;
 Wed, 22 Jan 2020 16:27:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b19so7448162wmj.4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 08:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=89Y9pzoD1ZWxrugMvroXmDP8OCW1Jlz3uHHb5BhPbJk=;
 b=c32wD03hP4Myy7nehtiy3tprL8nmHa6w3w9LOt+svfujvjyfXVWOPGYGk7MVce7cBT
 WipJaT+qAl0TK/APVUgmQePScZwi4vAtO/mNTLqo6nEuJ9LuB9XE7F4ag/YBXrMFV1Su
 PJdKMm1OEKs/B0x2D8VfQZjeSy7VwNZAkBsTgwKcC9S9MXGmvZlbsnH7pgG495JmIZG9
 1lwaXIRKTnoc4G4GZd844PEcQseahlA5axuXjj83k6S0oSnPt8CRUicIUPK6flBkob1H
 QhODpGctBfn3a51aEMNCtHLd2j8RHxJbDFWarirLbRKPkWrQ/uchYxjEeMGHYzGfbct0
 3ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=89Y9pzoD1ZWxrugMvroXmDP8OCW1Jlz3uHHb5BhPbJk=;
 b=CQ5p2ooaYPrDLmNOqAY2c/tNEIIcgJczMQmlLr3uI7utESPj21oJePd1agMSFzhXC/
 m25g8aUOrg15q6SkpUCGq9G/Syjk97o/py5YcqqLgimSPAb2+kwxRoXZs1fuLmf9zzub
 uH4+uw9wVvOU4EfEBy6Zf4Dnnq/DQ1kZ+Lsuq+AGsNFvFsyDUTYZT1DzaGGW/sepnEzP
 CUGtUh/KBfg4WrPMSIMdCnMbupkRT4tVccDG+jUsjYfruQ12ZPicB3m1Lbo11vaekOMk
 J1jyr2/HWn1HsK6AR6gDIMCNGcsZrAeo/oJbVk/BDdj4FBSMjOuMIUL2sylhkxx2rmka
 mbVw==
X-Gm-Message-State: APjAAAWhgB2ox7QT4YBEag9Vv9yX6Y9S0uuHJArq+vFII+bI0QrZL1tD
 89JEOYV1zIYWqugvxU8/eU8=
X-Google-Smtp-Source: APXvYqz3EliM0EqGJqKYJdmzIMfeoN9oQZxP/AxNDXUflMMPjphC2W81zQaU8sKTbB/pDCWvEgyz1A==
X-Received: by 2002:a1c:f210:: with SMTP id s16mr3656620wmc.57.1579710460923; 
 Wed, 22 Jan 2020 08:27:40 -0800 (PST)
Received: from ?IPv6:2a02:c7f:ac73:9500:85af:2aa9:5413:b74e?
 ([2a02:c7f:ac73:9500:85af:2aa9:5413:b74e])
 by smtp.gmail.com with ESMTPSA id p18sm4760147wmb.8.2020.01.22.08.27.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jan 2020 08:27:39 -0800 (PST)
From: Lars Kurth <lars.kurth.xen@gmail.com>
X-Google-Original-From: Lars Kurth <lars.kurth@xenproject.org>
Message-Id: <052081D4-2F9F-401A-A6F6-8A9CDC1069AC@xenproject.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Wed, 22 Jan 2020 16:27:39 +0000
In-Reply-To: <f8ca4739-83c7-5829-4663-b1e5796e6490@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <f8ca4739-83c7-5829-4663-b1e5796e6490@citrix.com>
X-Mailer: Apple Mail (2.3445.104.11)
Subject: Re: [Xen-devel] [RFC XEN PATCH 00/23] xen: beginning support for
 RISC-V
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
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============6122974368978164642=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6122974368978164642==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_D5101D87-5F59-4DD5-9899-23BD99C89402"


--Apple-Mail=_D5101D87-5F59-4DD5-9899-23BD99C89402
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 22 Jan 2020, at 14:57, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> On 22/01/2020 01:58, Bobby Eshleman wrote:
>> Hey everybody,
>>=20
>> This is an RFC patchset for the very beginnings of adding RISC-V =
support
>> to Xen.  This RFC is really just to start a dialogue about supporting
>> RISC-V and align with the Xen project and community before going
>> further.  For that reason, it is very rough and very incomplete.=20
>>=20
>> My name is Bobby Eshleman, I'm a software engineer at
>> Star Lab / Wind River on the ARM team, mostly having worked in the =
Linux
>> kernel.  I've also been involved a good amount with Xen on ARM here,
>> mostly dealing with tooling, deployment, and testing.  A lot of this
>> patchset is heavily inspired by the Xen/ARM source code (particularly
>> the early setup up code).
>>=20
>> Currently, this patchset really only sets up virtual memory for Xen =
and
>> initializes UART to enable print output.  None of RISC-V's
>> virtualization support has been implemented yet, although that is the
>> next road to start going down.  Many functions only contain dummy
>> implementations.  Many shortcuts have been taken and TODO's have been
>> left accordingly.  It is very, very rough.  Be forewarned: you are =
quite
>> likely to see some ungainly code here (despite my efforts to clean it =
up
>> before sending this patchset out).  My intent with this RFC is to =
align
>> early and gauge interest, as opposed to presenting a totally complete
>> patchset.
>>=20
>> Because the ARM and RISC-V use cases will likely bear resemblance, =
the
>> RISC-V port should probably respect the design considerations that =
have
>> been laid out and respected by Xen on ARM for dom0less, safety
>> certification, etc...  My inclination has been to initially target or
>> prioritize dom0less (without excluding dom0full) and use the ARM
>> dom0less implementation as a model to follow.  I'd love feedback on =
this
>> point and on how the Xen project might envision a RISC-V =
implementation.
>>=20
>> This patchset has _some_ code for future support for 32-bit, but
>> currently my focus is on 64-bit.
>>=20
>> Again, this is a very, very rough and totally incomplete patchset.  =
My
>> goal here is just to gauge community interest, begin discussing what =
Xen
>> on RISC-V may look like, receive feedback, and see if I'm heading in =
the
>> right direction.
>>=20
>> My big questions are:
>> 	Does the Xen project have interest in RISC-V?
>=20
> There is very large downstream interest in RISC-V.  So a definite yes.
>=20
>> 	What can be done to make the RISC-V port as upstreamable as
>> 		possible?
>> 	Any major pitfalls?
>>=20
>> It would be great to hear all of your feedback.
>=20
> Both RISC-V and Power9 are frequently requested things, and both =
suffer
> from the fact that, while we as a community would like them, the
> upstream intersection of "people who know Xen" and "people who know
> enough arch $X to do an initial port" is 0.
>=20
> This series clearly demonstrates a change in the status quo, and I =
think
> a lot of people will be happy.
>=20
> To get RISC-V to being fully supported, we will ultimately need to get
> hardware into the CI system, and an easy way for developers to test
> changes.  Do you have any thoughts on production RISC-V hardware
> (ideally server form factor) for the CI system, and/or dev boards =
which
> might be available fairly cheaply?
>=20
> How much time do you have to put towards the port?  Is this something =
in
> your free time, or something you are doing as part of work?  =
Ultimately,
> we are going to need to increase the level of RISC-V knowledge in the
> community to maintain things in the future.
>=20
> Other than that, very RFC series are entirely fine.  A good first step
> would be simply to get the build working, and get some kind of
> cross-compile build in CI, to make sure that we don't clobber the =
RISC-V
> build with common or other-arch changes.
>=20
> I hope this helps.

I totally agree with what Andy says.=20

You should also leverage the developer summit: see =
https://events.linuxfoundation.org/xen-summit/program/cfp/ =
<https://events.linuxfoundation.org/xen-summit/program/cfp/>
CfP closes March 6th. Design sessions can be submitted afterwards

Community calls may also be a good option to deal with specific issues / =
questions, e.g. around compile support in the CI, etc.

Lars





--Apple-Mail=_D5101D87-5F59-4DD5-9899-23BD99C89402
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 22 Jan 2020, at 14:57, Andrew Cooper &lt;<a =
href=3D"mailto:andrew.cooper3@citrix.com" =
class=3D"">andrew.cooper3@citrix.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">On 22/01/2020 =
01:58, Bobby Eshleman wrote:</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">Hey everybody,<br class=3D""><br =
class=3D"">This is an RFC patchset for the very beginnings of adding =
RISC-V support<br class=3D"">to Xen. &nbsp;This RFC is really just to =
start a dialogue about supporting<br class=3D"">RISC-V and align with =
the Xen project and community before going<br class=3D"">further. =
&nbsp;For that reason, it is very rough and very incomplete.<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><br =
class=3D"">My name is Bobby Eshleman, I'm a software engineer at<br =
class=3D"">Star Lab / Wind River on the ARM team, mostly having worked =
in the Linux<br class=3D"">kernel. &nbsp;I've also been involved a good =
amount with Xen on ARM here,<br class=3D"">mostly dealing with tooling, =
deployment, and testing. &nbsp;A lot of this<br class=3D"">patchset is =
heavily inspired by the Xen/ARM source code (particularly<br =
class=3D"">the early setup up code).<br class=3D""><br =
class=3D"">Currently, this patchset really only sets up virtual memory =
for Xen and<br class=3D"">initializes UART to enable print output. =
&nbsp;None of RISC-V's<br class=3D"">virtualization support has been =
implemented yet, although that is the<br class=3D"">next road to start =
going down. &nbsp;Many functions only contain dummy<br =
class=3D"">implementations. &nbsp;Many shortcuts have been taken and =
TODO's have been<br class=3D"">left accordingly. &nbsp;It is very, very =
rough. &nbsp;Be forewarned: you are quite<br class=3D"">likely to see =
some ungainly code here (despite my efforts to clean it up<br =
class=3D"">before sending this patchset out). &nbsp;My intent with this =
RFC is to align<br class=3D"">early and gauge interest, as opposed to =
presenting a totally complete<br class=3D"">patchset.<br class=3D""><br =
class=3D"">Because the ARM and RISC-V use cases will likely bear =
resemblance, the<br class=3D"">RISC-V port should probably respect the =
design considerations that have<br class=3D"">been laid out and =
respected by Xen on ARM for dom0less, safety<br class=3D"">certification, =
etc... &nbsp;My inclination has been to initially target or<br =
class=3D"">prioritize dom0less (without excluding dom0full) and use the =
ARM<br class=3D"">dom0less implementation as a model to follow. =
&nbsp;I'd love feedback on this<br class=3D"">point and on how the Xen =
project might envision a RISC-V implementation.<br class=3D""><br =
class=3D"">This patchset has _some_ code for future support for 32-bit, =
but<br class=3D"">currently my focus is on 64-bit.<br class=3D""><br =
class=3D"">Again, this is a very, very rough and totally incomplete =
patchset. &nbsp;My<br class=3D"">goal here is just to gauge community =
interest, begin discussing what Xen<br class=3D"">on RISC-V may look =
like, receive feedback, and see if I'm heading in the<br class=3D"">right =
direction.<br class=3D""><br class=3D"">My big questions are:<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>Does the Xen project have interest in RISC-V?<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">There is very large downstream interest in RISC-V.&nbsp; So a =
definite yes.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>What can =
be done to make the RISC-V port as upstreamable as<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>possible?<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>Any major pitfalls?<br =
class=3D""><br class=3D"">It would be great to hear all of your =
feedback.<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Both RISC-V and Power9 are frequently requested things, and =
both suffer</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">from the fact =
that, while we as a community would like them, the</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">upstream =
intersection of "people who know Xen" and "people who know</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">enough arch =
$X to do an initial port" is 0.</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">This series clearly demonstrates a change in the status quo, =
and I think</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">a lot of =
people will be happy.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">To get RISC-V to being fully supported, we will ultimately =
need to get</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">hardware into =
the CI system, and an easy way for developers to test</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">changes.&nbsp; =
Do you have any thoughts on production RISC-V hardware</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">(ideally =
server form factor) for the CI system, and/or dev boards which</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">might be =
available fairly cheaply?</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">How much time do you have to put towards the port?&nbsp; Is =
this something in</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">your free time, or something you are doing as part of =
work?&nbsp; Ultimately,</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">we are going to need to increase the level of RISC-V =
knowledge in the</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">community to maintain things in the future.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Other than =
that, very RFC series are entirely fine.&nbsp; A good first =
step</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">would be =
simply to get the build working, and get some kind of</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">cross-compile =
build in CI, to make sure that we don't clobber the RISC-V</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">build with =
common or other-arch changes.</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">I hope this helps.</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><br =
class=3D""></div><div>I totally agree with what Andy =
says.&nbsp;</div><div><br class=3D""></div><div>You should also leverage =
the developer summit: see&nbsp;<a =
href=3D"https://events.linuxfoundation.org/xen-summit/program/cfp/" =
class=3D"">https://events.linuxfoundation.org/xen-summit/program/cfp/</a><=
/div><div>CfP closes March 6th. Design sessions can be submitted =
afterwards</div><div><br class=3D""></div><div>Community calls may also =
be a good option to deal with specific issues / questions, e.g. around =
compile support in the CI, etc.</div><div><br =
class=3D""></div><div>Lars</div><div><br class=3D""></div><div><br =
class=3D""></div><div><br class=3D""></div><br class=3D""></body></html>=

--Apple-Mail=_D5101D87-5F59-4DD5-9899-23BD99C89402--


--===============6122974368978164642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6122974368978164642==--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C361F3912
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:10:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jic94-0003Lg-ER; Tue, 09 Jun 2020 11:10:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eRw/=7W=recoil.org=anil@srs-us1.protection.inumbo.net>)
 id 1jic92-0003Ky-Tv
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:10:16 +0000
X-Inumbo-ID: c7e79196-aa41-11ea-bb8b-bc764e2007e4
Received: from honk.recoil.org (unknown [2604:1380:2001:1300::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7e79196-aa41-11ea-bb8b-bc764e2007e4;
 Tue, 09 Jun 2020 11:10:09 +0000 (UTC)
Received: from [IPv6:2a02:390:81d4::e5a2:aa13:2826:18e8] (unknown
 [IPv6:2a02:390:81d4:0:e5a2:aa13:2826:18e8])
 by honk.recoil.org (Postfix) with ESMTPSA id A86393C0189;
 Tue,  9 Jun 2020 10:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=recoil.org;
 s=selector1; t=1591699841;
 bh=TR8w4REWHYr5hfE0wj/02gw9m0ryu0Z1r9I3BSO9ZMs=;
 h=From:Subject:Date:In-Reply-To:Cc:To:References:From;
 b=f6lSShSP3s+IZmHoHFm+A2Z12+X+dqbZxtCVZFbjWX44UG8qdagW4B6D6RfqKiOAa
 kX3qcyNmMRnyvLF75X8ifsOpUpKKq04gmy2LEt01ER/Oj9lRyBVmZx4EwNRWY95uI+
 cKqr/ixcJGyZZHFzU2vRHFHUtZXijXrRarx8HAbI=
From: Anil Madhavapeddy <anil@recoil.org>
Message-Id: <B13ACF6F-11B5-4E5C-AF94-CD5DE401B1DB@recoil.org>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_A71BAFB1-63AF-4E1D-953C-5E8D0B4A25A2"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: XENMAPSPACE_grant_table vs. GNTTABOP_setup_table
Date: Tue, 9 Jun 2020 11:50:39 +0100
In-Reply-To: <3c7269b9-bf3f-5359-6ce2-049f935c8e84@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200609094425.GB9734@nodbug.lucina.net>
 <3c7269b9-bf3f-5359-6ce2-049f935c8e84@citrix.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Martin Lucina <martin@lucina.net>,
 mirageos-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--Apple-Mail=_A71BAFB1-63AF-4E1D-953C-5E8D0B4A25A2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On 9 Jun 2020, at 11:22, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> On 09/06/2020 10:44, Martin Lucina wrote:
>> Hi,
>>=20
>> I've been making progress on bootstrapping a new, PVHv2 only, Xen =
platform
>> stack for MirageOS [1]. The basics are now functional and I have =
started to
>> re-implement the grant table code.
>>=20
>> After studying both the Mini-OS and Linux implementations some, I =
don't
>> understand the difference between using XENMAPSPACE_grant_table vs.
>> GNTTABOP_setup_table to set up the initial grant table mapping for =
the
>> guest.
>>=20
>> Are these calls just newer and older ways of accomplishing the same =
thing?
>> The Linux driver seems to use both in various conditions, whereas =
Mini-OS
>> uses the former on ARM and the latter on x86.
>>=20
>> If these are functionally equivalent, then for my purposes I'd rather =
use
>> XENMAPSPACE_setup_table, since IIUC this lets me map the grant table =
at an
>> address of my choosing rather than GNTTABOP_setup_table which at =
least on
>> x86_64 appears to be returning PFNs at the top of the address space.
>>=20
>> Any advice much appreciated,
>=20
> There is a little bit of history here...
>=20
> GNTTABOP_setup_table was the original PV way of doing things (specify
> size as an input, get a list of frames as an output to map), and
> XENMAPSPACE_grant_table was the original HVM way of doing things (as
> mapping is the other way around - I specify a GFN which I'd like to =
turn
> into a grant table mapping).
>=20
> When grant v2 came along, it was only XENMAPSPACE_grant_table updated =
to
> be compatible.  i.e. you have to use XENMAPSPACE_grant_table to map =
the
> status frames even if you used GNTTABOP_setup_table previously.
>=20
> It is a mistake that GNTTABOP_setup_table was usable in HVM guests to
> being with.  Returning -1 is necessary to avoid an information leak =
(the
> physical address of the frames making up the grant table) which an HVM
> guest shouldn't, and has no use knowing.
>=20
> An with that note, ARM is extra special because the grant API is
> specified to use host physical addresses rather than guest physical =
(at
> least for dom0, for reasons of there generally not being an IOMMU),
> which is why it does use the old PV way.

Thanks, that makes sense. It doesn't seem too much of a mess from the =
guest
perspective to use just XENMAPSPACE_grant_table exclusively then.  With
Martin's work, the MirageOS Xen backend should just use the latest and =
greatest
APIs, with no backwards compatibility to older Xen versions required.

I'm still a little confused about ARM though -- is there an equivalent =
of
XENMAPSPACE_grant_table there? It sounds like we can't leave the
GNTTABOP macros behind entirely...

regards,
Anil=

--Apple-Mail=_A71BAFB1-63AF-4E1D-953C-5E8D0B4A25A2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">On =
9 Jun 2020, at 11:22, Andrew Cooper &lt;<a =
href=3D"mailto:andrew.cooper3@citrix.com" =
class=3D"">andrew.cooper3@citrix.com</a>&gt; wrote:<br =
class=3D""><div><blockquote type=3D"cite" class=3D""><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">On 09/06/2020 =
10:44, Martin Lucina wrote:</span><br style=3D"caret-color: rgb(0, 0, =
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
text-decoration: none;" class=3D"">Hi,<br class=3D""><br class=3D"">I've =
been making progress on bootstrapping a new, PVHv2 only, Xen platform<br =
class=3D"">stack for MirageOS [1]. The basics are now functional and I =
have started to<br class=3D"">re-implement the grant table code.<br =
class=3D""><br class=3D"">After studying both the Mini-OS and Linux =
implementations some, I don't<br class=3D"">understand the difference =
between using XENMAPSPACE_grant_table vs.<br =
class=3D"">GNTTABOP_setup_table to set up the initial grant table =
mapping for the<br class=3D"">guest.<br class=3D""><br class=3D"">Are =
these calls just newer and older ways of accomplishing the same =
thing?<br class=3D"">The Linux driver seems to use both in various =
conditions, whereas Mini-OS<br class=3D"">uses the former on ARM and the =
latter on x86.<br class=3D""><br class=3D"">If these are functionally =
equivalent, then for my purposes I'd rather use<br =
class=3D"">XENMAPSPACE_setup_table, since IIUC this lets me map the =
grant table at an<br class=3D"">address of my choosing rather than =
GNTTABOP_setup_table which at least on<br class=3D"">x86_64 appears to =
be returning PFNs at the top of the address space.<br class=3D""><br =
class=3D"">Any advice much appreciated,<br class=3D""></blockquote><br =
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
none; float: none; display: inline !important;" class=3D"">There is a =
little bit of history here...</span><br style=3D"caret-color: rgb(0, 0, =
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
class=3D"">GNTTABOP_setup_table was the original PV way of doing things =
(specify</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">size as an =
input, get a list of frames as an output to map), and</span><br =
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
none; float: none; display: inline !important;" =
class=3D"">XENMAPSPACE_grant_table was the original HVM way of doing =
things (as</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">mapping is =
the other way around - I specify a GFN which I'd like to turn</span><br =
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
none; float: none; display: inline !important;" class=3D"">into a grant =
table mapping).</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">When grant v2 came along, it was only XENMAPSPACE_grant_table =
updated to</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">be =
compatible.&nbsp; i.e. you have to use XENMAPSPACE_grant_table to map =
the</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">status frames =
even if you used GNTTABOP_setup_table previously.</span><br =
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
none; float: none; display: inline !important;" class=3D"">It is a =
mistake that GNTTABOP_setup_table was usable in HVM guests to</span><br =
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
none; float: none; display: inline !important;" class=3D"">being =
with.&nbsp; Returning -1 is necessary to avoid an information leak =
(the</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">physical =
address of the frames making up the grant table) which an HVM</span><br =
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
none; float: none; display: inline !important;" class=3D"">guest =
shouldn't, and has no use knowing.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
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
class=3D"">An with that note, ARM is extra special because the grant API =
is</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">specified to =
use host physical addresses rather than guest physical (at</span><br =
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
none; float: none; display: inline !important;" class=3D"">least for =
dom0, for reasons of there generally not being an IOMMU),</span><br =
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
none; float: none; display: inline !important;" class=3D"">which is why =
it does use the old PV way.</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><br =
class=3D""></div>Thanks, that makes sense. It doesn't seem too much of a =
mess from the guest<div class=3D"">perspective to use just =
XENMAPSPACE_grant_table exclusively then. &nbsp;With</div><div =
class=3D"">Martin's work, the MirageOS Xen backend should just use the =
latest and greatest</div><div class=3D"">APIs, with no backwards =
compatibility to older Xen versions required.</div><div class=3D""><br =
class=3D""></div><div class=3D"">I'm still a little confused about ARM =
though -- is there an equivalent of</div><div =
class=3D"">XENMAPSPACE_grant_table there? It sounds like we can't leave =
the</div><div class=3D"">GNTTABOP macros behind entirely...</div><div =
class=3D""><br class=3D""></div><div class=3D"">regards,</div><div =
class=3D"">Anil</div></body></html>=

--Apple-Mail=_A71BAFB1-63AF-4E1D-953C-5E8D0B4A25A2--


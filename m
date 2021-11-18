Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9674D456039
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 17:12:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227506.393487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnk0O-0001yn-Tr; Thu, 18 Nov 2021 16:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227506.393487; Thu, 18 Nov 2021 16:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnk0O-0001vt-PZ; Thu, 18 Nov 2021 16:11:20 +0000
Received: by outflank-mailman (input) for mailman id 227506;
 Thu, 18 Nov 2021 16:11:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tNz=QF=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mnk0N-0001vn-SS
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 16:11:20 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29b2e6da-488a-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 17:11:18 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id n29so12525752wra.11
 for <xen-devel@lists.xenproject.org>; Thu, 18 Nov 2021 08:11:18 -0800 (PST)
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
X-Inumbo-ID: 29b2e6da-488a-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1HYeqxis+aGi5Y3C5fGaYpoMxSBQvYbGj60inG9Lp0Q=;
        b=kouxNU4IhU4rH6/wm1xc7RGJnmYCOIJZ5d6gq+Rq2V3dBTcKCjHitBx/A7IgEoJBDC
         4oOcwB+k0n5UaXk0MUwwTnw9TYLBnfP0EX3+uSFfYAXqv2PnLKopvQpRDRY2CAC4bQev
         R3/uVjBi8XhsEDhfHBVcM0yK+MMDZngwT4CZsm5b2iErkmRmwXErxA9I4bgVsXDheC12
         L37pp8UC8jXWXCm4J3If+p0M7mKKM56e+YjbszB1XLsazREjR7qvj0M/dMouhva9rhuB
         Fo/H6fpB5WW2frncYGgoOOnQOYopgFv+y9F/Krwmr05KiKGB0N5rS7Pp8fgJGcqcq98s
         R70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1HYeqxis+aGi5Y3C5fGaYpoMxSBQvYbGj60inG9Lp0Q=;
        b=UKtG15LX4DV15WQRyfuit0SuZ7X229Bl2Gmw4HeLK28B4/D+nP2VCKLhhoJ/y5ZAEF
         MBz9IMgfbApNh8bH+VlakzrRQX1Ctj1ttU9LMNT1sDZicprd3xzNt2814fL3YBqGv+la
         OVXQtrROf+32XdCHd4i5zBj4K6edlCf0mk+wNZq1NWZX8NO+XLsehDgNwL1zQBwnwhBK
         2h0Kt0XeDh569rL/83Nmzab0eAJ/hqpFw5XZVvQrqaZdcF9SCgVLSCPgQcXZjzM6JY8K
         UnS+6XT1Qa6dXgcBkT5+AiEhsa8FPajNQDEOPl2VC5+7GC770m5VnPAMlaBJ9BYudLXv
         lfww==
X-Gm-Message-State: AOAM531oIHVB0rtVEfG3saw6DmrBzEDz8hu29EVN2MsCIarpTBFNgQOq
	RvDCRVM39kgmSgv/Y+WQ/OMTFX75W3XENN8SGlY=
X-Google-Smtp-Source: ABdhPJxrCWAtRFTzeWA3wDPTU+yLgEqOV5nCxvwhxCLQQTtyp+pDpG8kGkapuOoJuQI5ytx/hjflXZY9uD8eSorvoTI=
X-Received: by 2002:adf:e842:: with SMTP id d2mr31336751wrn.399.1637251877978;
 Thu, 18 Nov 2021 08:11:17 -0800 (PST)
MIME-Version: 1.0
References: <20211117095338.14947-1-roger.pau@citrix.com> <20211117095338.14947-3-roger.pau@citrix.com>
In-Reply-To: <20211117095338.14947-3-roger.pau@citrix.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Thu, 18 Nov 2021 18:11:07 +0200
Message-ID: <CAPD2p-nb7u7om7zv5-KvfZTsmGis9uGfBkvwjEXrym_+4PN-RQ@mail.gmail.com>
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Alistair Francis <alistair.francis@wdc.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Christian Lindig <christian.lindig@citrix.com>, 
	Christopher Clark <christopher.w.clark@gmail.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
	Dario Faggioli <dfaggioli@suse.com>, David Scott <dave@recoil.org>, Doug Goldstein <cardoe@cardoe.com>, 
	Elena Ufimtseva <elena.ufimtseva@oracle.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Josh Whitehead <josh.whitehead@dornerworks.com>, Juergen Gross <jgross@suse.com>, 
	Julien Grall <julien@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Meng Xu <mengxu@cis.upenn.edu>, Nick Rosbrook <rosbrookn@ainfosec.com>, 
	Paul Durrant <paul@xen.org>, Quan Xu <quan.xu0@gmail.com>, Rahul Singh <rahul.singh@arm.com>, 
	Ross Lagerwall <ross.lagerwall@citrix.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Shriram Rajagopalan <rshriram@cs.ubc.ca>, Stefano Stabellini <sstabellini@kernel.org>, 
	Stewart Hildebrand <stewart.hildebrand@dornerworks.com>, Tamas K Lengyel <tamas@tklengyel.com>, 
	Tim Deegan <tim@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Wei Liu <wl@xen.org>, 
	Community Manager <community.manager@xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000098463905d11268a2"

--00000000000098463905d11268a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2021 at 11:54 AM Roger Pau Monne <roger.pau@citrix.com>
wrote:

Hi Roger, all

[Sorry for the possible format issues]

Document some of the relevant changes during the 4.16 release cycle,
> likely more entries are missing.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  CHANGELOG.md | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index ad1a8c2bc2..8b0bdd9cf0 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -21,6 +21,17 @@ The format is based on [Keep a Changelog](
> https://keepachangelog.com/en/1.0.0/)
>   - qemu-traditional based device models (both, qemu-traditional and
> ioemu-stubdom) will
>     no longer be built per default. In order to be able to use those,
> configure needs to
>     be called with "--enable-qemu-traditional" as parameter.
> + - Fixes for credit2 scheduler stability in corner case conditions.
> + - Ongoing improvements in the hypervisor build system.
> + - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
> + - 32bit PV guests only supported in shim mode.
> + - Improved PVH dom0 debug key handling.
> + - Fix booting on some Intel systems without a PIT (i8254).
>

I would add "Various fixes for OP-TEE mediator (Arm)" here and ...



> +
> +### Added
> + - 32bit Arm builds to the automated tests.
> + - New x86 pagetable APIs.
> + - Arm vPMU support.
>

"Extended regions support, device tree only (Arm)" here.

...
The extended regions are ranges of unused address space exposed to domains
as
"safe to use" for special memory mappings.


[snip]


--=20
Regards,

Oleksandr Tyshchenko

--00000000000098463905d11268a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 11:54 AM Roge=
r Pau Monne &lt;<a href=3D"mailto:roger.pau@citrix.com" target=3D"_blank">r=
oger.pau@citrix.com</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail=
_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr">Hi Roger, all<br><br=
>[Sorry for the possible format issues]<br></div><div dir=3D"ltr" class=3D"=
gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Doc=
ument some of the relevant changes during the 4.16 release cycle,<br>
likely more entries are missing.<br>
<br>
Signed-off-by: Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.=
com" target=3D"_blank">roger.pau@citrix.com</a>&gt;<br>
---<br>
=C2=A0CHANGELOG.md | 11 +++++++++++<br>
=C2=A01 file changed, 11 insertions(+)<br>
<br>
diff --git a/CHANGELOG.md b/CHANGELOG.md<br>
index ad1a8c2bc2..8b0bdd9cf0 100644<br>
--- a/CHANGELOG.md<br>
+++ b/CHANGELOG.md<br>
@@ -21,6 +21,17 @@ The format is based on [Keep a Changelog](<a href=3D"htt=
ps://keepachangelog.com/en/1.0.0/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://keepachangelog.com/en/1.0.0/</a>)<br>
=C2=A0 - qemu-traditional based device models (both, qemu-traditional and i=
oemu-stubdom) will<br>
=C2=A0 =C2=A0 no longer be built per default. In order to be able to use th=
ose, configure needs to<br>
=C2=A0 =C2=A0 be called with &quot;--enable-qemu-traditional&quot; as param=
eter.<br>
+ - Fixes for credit2 scheduler stability in corner case conditions.<br>
+ - Ongoing improvements in the hypervisor build system.<br>
+ - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.<br>
+ - 32bit PV guests only supported in shim mode.<br>
+ - Improved PVH dom0 debug key handling.<br>
+ - Fix booting on some Intel systems without a PIT (i8254).<br></blockquot=
e><div>=C2=A0</div><div>I would add &quot;Various fixes for OP-TEE mediator=
 (Arm)&quot; here and ...</div><div><br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
+<br>
+### Added<br>
+ - 32bit Arm builds to the automated tests.<br>
+ - New x86 pagetable APIs.<br>
+ - Arm vPMU support.<br></blockquote><div>=C2=A0</div><div>&quot;Extended =
regions support, device tree only (Arm)&quot; here.</div><div><br></div><di=
v>...</div><div>The extended regions are ranges of unused address space exp=
osed to domains as<br>&quot;safe to use&quot; for special memory mappings.<=
br></div><div><br></div><div><br></div><div>[snip]</div><div>=C2=A0</div></=
div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><span style=3D"background-color:rgb(255,255,=
255)"><font size=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial=
,sans-serif">Regards,</span></font></span></div><div dir=3D"ltr"><br></div>=
<div dir=3D"ltr"><div><span style=3D"background-color:rgb(255,255,255)"><fo=
nt size=3D"2">Oleksandr Tyshchenko</font></span></div></div></div></div></d=
iv></div></div></div>

--00000000000098463905d11268a2--


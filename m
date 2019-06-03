Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6C632932
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 09:16:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXh9c-0005hB-2U; Mon, 03 Jun 2019 07:13:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H0ij=UC=os.amperecomputing.com=vishnu@srs-us1.protection.inumbo.net>)
 id 1hXh9a-0005h6-JB
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 07:13:10 +0000
X-Inumbo-ID: 09639c3e-85cf-11e9-8980-bc764e045a96
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe42::70c])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 09639c3e-85cf-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 07:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector2-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1WQDPXdg11/9ngGu8oq+DWkDGaW9aC3HoAIveSYZyA=;
 b=RPEUzULh7CHXiPmDV7huWJuk2kOuahNS+S/ez5LuAk4vVeZGOkG8p+M4c3v4sVvo/hs69GG/bwMLjnS29e72YXZyWgPBy2yGVP5wbVKLT06XK7PpJ6ZCsNqMsQBxs9eiACKjWuLP8mZULLuMraDIceigk7KJ1zaNHO9PbkG1KI0=
Received: from MN2PR01MB5598.prod.exchangelabs.com (20.179.98.224) by
 MN2PR01MB5616.prod.exchangelabs.com (20.179.99.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.18; Mon, 3 Jun 2019 07:13:04 +0000
Received: from MN2PR01MB5598.prod.exchangelabs.com
 ([fe80::31b0:25bb:7167:52c3]) by MN2PR01MB5598.prod.exchangelabs.com
 ([fe80::31b0:25bb:7167:52c3%7]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 07:13:03 +0000
From: Vishnu Pajjuri OS <vishnu@os.amperecomputing.com>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] xen/arm: p2m: configure stage-2 page table to support
 upto 42-bit PA systems
Thread-Index: AQHVFr2lcxcx0EO9ikSAfxMidE75jKaFhd6AgAP2WiY=
Date: Mon, 3 Jun 2019 07:13:03 +0000
Message-ID: <MN2PR01MB5598E348F792D6A8A675E42EE6140@MN2PR01MB5598.prod.exchangelabs.com>
References: <1559203823-4092-1-git-send-email-vishnu@os.amperecomputing.com>,
 <244fdc8f-cd62-ba15-ed6f-046cb2778637@arm.com>
In-Reply-To: <244fdc8f-cd62-ba15-ed6f-046cb2778637@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vishnu@os.amperecomputing.com; 
x-originating-ip: [182.75.130.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 345e3ded-5752-4a3d-ae1a-08d6e7f2eb9a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR01MB5616; 
x-ms-traffictypediagnostic: MN2PR01MB5616:
x-microsoft-antispam-prvs: <MN2PR01MB5616A7C83A0F1019F35BDFF5E6140@MN2PR01MB5616.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(39840400004)(396003)(136003)(376002)(199004)(189003)(25786009)(476003)(3846002)(6116002)(91956017)(76116006)(66946007)(54906003)(256004)(11346002)(446003)(33656002)(110136005)(6246003)(14444005)(73956011)(107886003)(53936002)(4326008)(486006)(478600001)(74316002)(14454004)(316002)(8936002)(8676002)(81156014)(81166006)(229853002)(6436002)(66556008)(66446008)(6606003)(64756008)(66476007)(7736002)(9686003)(54896002)(55016002)(186003)(26005)(68736007)(2501003)(66066001)(19627405001)(102836004)(76176011)(71190400001)(6506007)(53546011)(52536014)(5660300002)(7696005)(71200400001)(86362001)(2906002)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR01MB5616;
 H:MN2PR01MB5598.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZvS4T12lAH3d1j/IxPXFrci2GXrBZ+jzk7ptDhYyOsblZaDBhpn3x+uNEPeDdOYW0aj/is1a02vBnp566GeittVfDV0pBRAz+mGhhbpj89/OQRYp6AXVlCTEJK7+Ntuz8knFLyYF0q+zrOwkgDKLNtVE7U9BPCZkYW+Q4Pn1RZEHPWPU9Z6kNFhtFGsw+5d+3rRsODHJAIiIOl7WbUEPLTI6ZBzZ0s38YiRH2cIBQ457+i1JgipnC/kEpeODj4ojBSiZAxNbFuz1+tYrnIL+/HNbzUA+J4cQF9jnw1z5tg1+4d3ViSa5oFupiiLSYO6ey5VGHdt3LJYvwEtRoaf6PFmyGXpOAh8uDp0U6zhT0aa6Kuz5QoUUDMDXFoHV0noM1ZQQFxj6VppoX0ZeN6b2V7Pcg8GYgV5slhd1CYJD28g=
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 345e3ded-5752-4a3d-ae1a-08d6e7f2eb9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 07:13:03.6520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vishnu@os.amperecomputing.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5616
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: p2m: configure stage-2 page
 table to support upto 42-bit PA systems
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Feng Kan OS <fengkan@os.amperecomputing.com>
Content-Type: multipart/mixed; boundary="===============5791577372463708202=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5791577372463708202==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_MN2PR01MB5598E348F792D6A8A675E42EE6140MN2PR01MB5598prod_"

--_000_MN2PR01MB5598E348F792D6A8A675E42EE6140MN2PR01MB5598prod_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Julien Grall,

    It is a pleasure for your review on Xen patch.

And Thanks for your commit suggestion and we completely agree with your com=
mit suggestion.


And very grateful for taking this patch into the mainstream.


Best Regards,

-Vishnu.


________________________________
From: Julien Grall <julien.grall@arm.com>
Sent: 31 May 2019 23:22
To: Vishnu Pajjuri OS; xen-devel@lists.xenproject.org
Cc: Open Source Submission; sstabellini@kernel.org; Feng Kan OS
Subject: Re: [PATCH v2] xen/arm: p2m: configure stage-2 page table to suppo=
rt upto 42-bit PA systems

Hi,

Title: s/upto/ I think?

Also how about: "Properly configure stage-2 for 42-bit PA system".

On 30/05/2019 08:59, Vishnu Pajjuri OS wrote:
> XEN configures stage-2 page table to expose 40 bits of IPA
> (Intermediate Physical Address) bits for systems with 42 bits of PA

I think you want to drop the first "bits".

> (Physical Address). This setting prevents the 42-bit PA systems from boot=
ing
> DOM0's kernel since access above 40 bits results in a fault.


This sentence is difficult to read if you don't read the next one first.

>
> This patch adds support for 42-bit system
> which has a full 42-bit address range.

The line-wrap looks strange here.

>
> The fix will allocate 8 pages for stage 2 mapping for both DOM0 and guest=
s.

s/mapping/root page-tables/

> It is a bit wasteful but not an issue since most of these systems should =
have
> sufficiently large memory capacity.

Here a suggestion for the commit message:

"At the moment, on platform supporting 42-bit PA, Xen will only expose 40-b=
it
worth of IPA to all domains.

The limitation was to prevent allocating too much memory for the root page
tables as those platforms only support 3-levels page-tables. At the time, t=
his
was deemed acceptable because none of the platforms had address wired above=
 40-bits.

However, newer platforms take advantage of the full address space. This wil=
l
result to break Dom0 boot as it can't access anything above 40-bit.

The only way to support 42-bit IPA is to allocate 8 pages for the root
page-tables. This is a bit a waste of memory as Xen does not offer per-gues=
t
stage-2 configuration. But it is considered acceptable as current platforms
support 42-bit PA have a lot of memory.

In the future, we may want to consider per-guest stage-2 configuration to r=
educe
the waste.
"

If you are happy with the commit message, I will update use it on commit.

>
> Signed-off-by: Feng Kan <fengkan@os.amperecomputing.com>
> Signed-off-by: Vishnu <vishnu@os.amperecomputing.com>
> ---

It is common to briefly describe after --- the changes you made in the new =
version.

>   xen/arch/arm/p2m.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 92c2413..7712991 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1995,7 +1995,7 @@ void __init setup_virt_paging(void)
>           [0] =3D { 32,      32/*32*/,  0,          1 },
>           [1] =3D { 36,      28/*28*/,  0,          1 },
>           [2] =3D { 40,      24/*24*/,  1,          1 },
> -        [3] =3D { 42,      24/*22*/,  1,          1 },
> +        [3] =3D { 42,      22/*22*/,  3,          1 },
>           [4] =3D { 44,      20/*20*/,  0,          2 },
>           [5] =3D { 48,      16/*16*/,  0,          2 },
>           [6] =3D { 0 }, /* Invalid */
> --
> 1.8.3.1
>

--
Julien Grall

--_000_MN2PR01MB5598E348F792D6A8A675E42EE6140MN2PR01MB5598prod_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI=
 Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p style=3D"margin-top:0; margin-bottom:0">Hi Julien Grall,</p>
<p style=3D"margin-top:0; margin-bottom:0"></p>
<p style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;A=
pple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;S=
egoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 1=
6px;">
&nbsp; &nbsp; It is a pleasure for your review on Xen patch.</p>
<p style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;A=
pple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;S=
egoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 1=
6px;">
And Thanks for your commit suggestion and we completely agree with your com=
mit suggestion.</p>
<p style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;A=
pple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;S=
egoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 1=
6px;">
<br>
</p>
<p style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;A=
pple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;S=
egoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 1=
6px;">
And very&nbsp;grateful&nbsp;for taking this patch into the mainstream.</p>
<p></p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0"><u>Best Regards</u>,</p>
<p style=3D"margin-top:0; margin-bottom:0">-Vishnu.</p>
<br>
<br>
<div style=3D"color:rgb(0,0,0)">
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Julien Grall &lt;juli=
en.grall@arm.com&gt;<br>
<b>Sent:</b> 31 May 2019 23:22<br>
<b>To:</b> Vishnu Pajjuri OS; xen-devel@lists.xenproject.org<br>
<b>Cc:</b> Open Source Submission; sstabellini@kernel.org; Feng Kan OS<br>
<b>Subject:</b> Re: [PATCH v2] xen/arm: p2m: configure stage-2 page table t=
o support upto 42-bit PA systems</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Hi,<br>
<br>
Title: s/upto/ I think?<br>
<br>
Also how about: &quot;Properly configure stage-2 for 42-bit PA system&quot;=
.<br>
<br>
On 30/05/2019 08:59, Vishnu Pajjuri OS wrote:<br>
&gt; XEN configures stage-2 page table to expose 40 bits of IPA<br>
&gt; (Intermediate Physical Address) bits for systems with 42 bits of PA<br=
>
<br>
I think you want to drop the first &quot;bits&quot;.<br>
<br>
&gt; (Physical Address). This setting prevents the 42-bit PA systems from b=
ooting<br>
&gt; DOM0's kernel since access above 40 bits results in a fault.<br>
<br>
<br>
This sentence is difficult to read if you don't read the next one first.<br=
>
<br>
&gt; <br>
&gt; This patch adds support for 42-bit system<br>
&gt; which has a full 42-bit address range.<br>
<br>
The line-wrap looks strange here.<br>
<br>
&gt; <br>
&gt; The fix will allocate 8 pages for stage 2 mapping for both DOM0 and gu=
ests.<br>
<br>
s/mapping/root page-tables/<br>
<br>
&gt; It is a bit wasteful but not an issue since most of these systems shou=
ld have<br>
&gt; sufficiently large memory capacity.<br>
<br>
Here a suggestion for the commit message:<br>
<br>
&quot;At the moment, on platform supporting 42-bit PA, Xen will only expose=
 40-bit <br>
worth of IPA to all domains.<br>
<br>
The limitation was to prevent allocating too much memory for the root page =
<br>
tables as those platforms only support 3-levels page-tables. At the time, t=
his <br>
was deemed acceptable because none of the platforms had address wired above=
 40-bits.<br>
<br>
However, newer platforms take advantage of the full address space. This wil=
l <br>
result to break Dom0 boot as it can't access anything above 40-bit.<br>
<br>
The only way to support 42-bit IPA is to allocate 8 pages for the root <br>
page-tables. This is a bit a waste of memory as Xen does not offer per-gues=
t <br>
stage-2 configuration. But it is considered acceptable as current platforms=
 <br>
support 42-bit PA have a lot of memory.<br>
<br>
In the future, we may want to consider per-guest stage-2 configuration to r=
educe <br>
the waste.<br>
&quot;<br>
<br>
If you are happy with the commit message, I will update use it on commit.<b=
r>
<br>
&gt; <br>
&gt; Signed-off-by: Feng Kan &lt;fengkan@os.amperecomputing.com&gt;<br>
&gt; Signed-off-by: Vishnu &lt;vishnu@os.amperecomputing.com&gt;<br>
&gt; ---<br>
<br>
It is common to briefly describe after --- the changes you made in the new =
version.<br>
<br>
&gt;&nbsp;&nbsp; xen/arch/arm/p2m.c | 2 &#43;-<br>
&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c<br>
&gt; index 92c2413..7712991 100644<br>
&gt; --- a/xen/arch/arm/p2m.c<br>
&gt; &#43;&#43;&#43; b/xen/arch/arm/p2m.c<br>
&gt; @@ -1995,7 &#43;1995,7 @@ void __init setup_virt_paging(void)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [0] =3D { =
32,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32/*32*/,&nbsp; 0,&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 },<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [1] =3D { =
36,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 28/*28*/,&nbsp; 0,&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 },<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [2] =3D { =
40,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 24/*24*/,&nbsp; 1,&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 },<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [3] =3D { 42,&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 24/*22*/,&nbsp; 1,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 1 },<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [3] =3D { 42,&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 22/*22*/,&nbsp; 3,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 1 },<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [4] =3D { =
44,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 20/*20*/,&nbsp; 0,&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 },<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [5] =3D { =
48,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16/*16*/,&nbsp; 0,&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2 },<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [6] =3D { =
0 }, /* Invalid */<br>
&gt; --<br>
&gt; 1.8.3.1<br>
&gt; <br>
<br>
-- <br>
Julien Grall<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_MN2PR01MB5598E348F792D6A8A675E42EE6140MN2PR01MB5598prod_--


--===============5791577372463708202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5791577372463708202==--


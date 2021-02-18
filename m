Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE7831E866
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 11:14:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86523.162542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCgJf-0007qv-1n; Thu, 18 Feb 2021 10:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86523.162542; Thu, 18 Feb 2021 10:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCgJe-0007qW-V5; Thu, 18 Feb 2021 10:13:46 +0000
Received: by outflank-mailman (input) for mailman id 86523;
 Thu, 18 Feb 2021 10:13:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJ9M=HU=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lCgJd-0007qR-KH
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 10:13:45 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7eca57f8-13b3-46a1-ba2b-826405a8d42f;
 Thu, 18 Feb 2021 10:13:44 +0000 (UTC)
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
X-Inumbo-ID: 7eca57f8-13b3-46a1-ba2b-826405a8d42f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613643223;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=mvD//k+mnJawP31ZUy/eUC99eCmCfx6eayuNUTQap3o=;
  b=DvOiwHMMUZTuoaQQ+vvVMsrSTze1ALeOd9nN8l3JTGHaU41JCE0NDGWl
   0XTbJnq9Ghy34yXrcFU8XoE20GwCE0gP/kmmzOWg2cLtjZLK2DfXx7I5M
   goj/ievGQs+Y1TkeidCGdAiUeaIqwX1kERTX41Ob0GnFWArvCkCzRt1uF
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ElurHBGuJ8z1ELb231YywTqaXFsLfMZllvXRjPZehCw6/ZXkQ/Il6V45a1qb63ihU0r5LOlzcK
 Urolrpaj8E5lInWV4pDK2qNLH2tHb+HwLC32z7u6K8GQJZqxnSJ6EUnL8EBh9VbvoTEsE4rzlY
 nHP6usVTbfEXldkjqw5g4r2qnXfJ/GMhhKmUrQ7U6aQJKesEf2L8QzpJRqotQ1BkpvuQ4YA3jB
 PubDTTdG65fReSFJf+DCvsYYULTRUPU6jsOOQV43whXjmb4pgJktfWoR6mHIKJbOWp1/gJ9wiH
 smg=
X-SBRS: 5.2
X-MesageID: 37520510
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,186,1610427600"; 
   d="scan'208,217";a="37520510"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpnHaZMjYenfg//z7z6U4RmFm5K3om05+cWaHgsd8kBWsexP3Z8E5sqOj1czMj5Y6Xixw3Yz2Necz8RlHJdUXV+L9HyChAOwNYJQlB1vOGV/vOuA16E5GXsbXWZhcDkDhiAsDOfyb6brii8z4rMe3sxjOWa6+eV/w4aQBFTl/Rq+GpOhD8WANjMeHnclu8wVjbct0kYJCbuT5PqjD3A6gkpgbxF3hR67nuWU1UUcJry3E42aNnmZSZJOCx7kUf8iaUIEqAl1luS5FXEBtP73Za0XVsFvd5lRuwyTI5g8NCxsea6Lz4Us7e4TR9roj23KVdpAoLh2F1ZdcCrdGXK5rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvD//k+mnJawP31ZUy/eUC99eCmCfx6eayuNUTQap3o=;
 b=EYpXHWbMIp9y1iyH7eamexK7Y2hPqpanLQL55XJQw3hSrxkMHv7mq/MiE1leE93c0W7fBGoUWaDkwObrXyVWdGPTC/rlT4ycdT5WNspRxJBa/Lo6Z7rm7TLM4LfK48vEIQskuo0coDZB/sJKY/t6znlkinAkwdOujMu2E7qqrNWVt5kYFvTCliwEAaoVWXPXjApar0DX8vfpwIkfS4wTOJxCL6kG91LHtNsSP2RKuKVKBjxszORVU4iEf0M8/UKJF7Fb1jzE9nHHivr1gQOxqLRPx6FYfKngnei886qvYLVPu09hBuNNoiGItWwhSOhY+w27lk+briWJL73J2mjlHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvD//k+mnJawP31ZUy/eUC99eCmCfx6eayuNUTQap3o=;
 b=dx6oPCkYm9vDVJDmNyHRavjkn6gLM1amB+mMh/efNHNdsu0iwHI7jfYhWRCmpdxw4dMMncfjFlsEytjEHHJkcQwnuF2+kpHcNrPxeL6VeiMCkxhqWF5awkwTaDl17zv6yKQvl++SsxreIUYPZgRfqz+qlq9rcBnmPH9mGZCehFw=
From: Edwin Torok <edvin.torok@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>,
	=?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: oxenstored restart after system crash
Thread-Topic: oxenstored restart after system crash
Thread-Index: AQHXBdrqiMKXv9cDnkSLt+pdzqCGoKpdrxcg
Date: Thu, 18 Feb 2021 10:13:38 +0000
Message-ID: <SJ0PR03MB5888497D41C2C4B3FD14D86D9B859@SJ0PR03MB5888.namprd03.prod.outlook.com>
References: <YC43ZrCyScGxHEVE@Air-de-Roger>
In-Reply-To: <YC43ZrCyScGxHEVE@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7a1de27-39bc-4e3c-d4b7-08d8d3f5dc33
x-ms-traffictypediagnostic: BYAPR03MB4184:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB4184A4A75FD56D2A4CC7FCB29B859@BYAPR03MB4184.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QcIeRp8C4Vyeusd/5ipgTmUFjVKFn3ZtXYWqsQsIYEDcHgvsbMcGuPCanWjTdxKwzxFhH51ztS4wiCXjvpGKUBL106oZw7OKVLzJruA8iy6Xo9+x8s1C94/8AEmiAegwWuZsAJh/7QgR1Z4ZYke6HYJWYh58QJRvVtc3orrSfHIAiffZ2toYhGn6nIKxxUEDl4Z/L8NkJE5+TN55CG1m0+IB9e2ebcBxpIG7v5CNmPW4XQsKxIa7ZxImK2BwBLbdvNaFcotOGXHawUBOxaTxMB65+iluSrbC/LUfzzO8FxPDjSrRw709By2HFc7+/uo48cTehawYhXCExd/v2PxnrG2LM1VGdT5gb0VlkcHGeXKRc17qa2IWllTBohvoXLVu1uRx8rw0tk5PsI/w/4BvmiOfq2V0Uf7moBSmmd8geKzUqDzeuGgr45rJEgKjsWBySPYDbk/vD1UkfhUHRBJRLDMTbJv+8v5QwcBOdKEzboQ715kPD5JGzjDJIDu3kOBWMRrr7rMVFI0gtqBUyv1A/NQqmXXhrhCY3JSo+r40pfLrkurY6JWnvGFjSdB5HvCY6BxZB3vyfVChLpXjGEr1INv1fjignnovI8iZJWBO4Xk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39850400004)(346002)(366004)(76116006)(2906002)(166002)(26005)(86362001)(9686003)(83380400001)(91956017)(71200400001)(33656002)(64756008)(54906003)(66556008)(66946007)(66476007)(19627405001)(110136005)(7696005)(8936002)(52536014)(66574015)(21615005)(4326008)(966005)(55016002)(478600001)(5660300002)(66446008)(53546011)(186003)(8676002)(6506007)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?HrFyQOq1/QAUwM5MiTUoZ6K9rravF84fIY81c6/99IH1ur0m/vaBEzYFvV?=
 =?iso-8859-1?Q?FafwxGk0XbnJZIBjxoXmBsoLBjz74jK0Xfju5iPzZ5sCL/J1HU/PmTDV+f?=
 =?iso-8859-1?Q?cwQKkZ61/rtAMtWZ/oZ8mGKqwAF2r65NaKIv2djS5Qhxv54MXd2lma01Lu?=
 =?iso-8859-1?Q?W2C3F17LoXltGHcvpjtUVyNGAr5tw1cTQftRbdY5qlQ0tPedOLkjDwqW0r?=
 =?iso-8859-1?Q?FeABw1THzyK6GYNX0MPBidXPn7ktg+9EMOftxPmqPEHMPRHjIIWKcsmcvL?=
 =?iso-8859-1?Q?bR/1g6BYZO4olfYMsskFsplWSsvmNZTiAr/A78/xiRJvXeqYtgs5i0cePi?=
 =?iso-8859-1?Q?88U6DhTwAYWj1tyBUyUJbXGE6vaMx4R9clwIfqFbgjgnXn15zznHRGl/Mb?=
 =?iso-8859-1?Q?GMj8hMy92mstFzh1xq60lTjsp1KYaxqlrvTapa6pD2JoqVIejZbPIqiNvF?=
 =?iso-8859-1?Q?s7MFnARPWm7FbifX0OD1Kw5Y8u+pq5AQwlHDnNSE+jnPThfwWRcaQ9XQL2?=
 =?iso-8859-1?Q?cxAIFv7BZ7zCZdRY8ZaJcVaXF3dva+WM+4toSX7jKJBv+xsdUCdSXG5hEF?=
 =?iso-8859-1?Q?aDES4U4LusHUqnb+2J4G1nLUb3nsXwnXAmoKtWCk4m5y2DZQhTICqC+rG6?=
 =?iso-8859-1?Q?qbxoebzlJv9nI5u565nS6QgOAImxteHYhRd0FtCiotvflMjKt0M21lAQ8K?=
 =?iso-8859-1?Q?+l6RpXvMgg525BOlW9MUCOIX9aSjuwMG3bLbGZ2XJOqOVKC8eax86iycX3?=
 =?iso-8859-1?Q?RTwxfQCSkrFKCricIGbgPJOhmSXdObPK0/V4HbP/mFnsD2Lw0wNwtEpZeS?=
 =?iso-8859-1?Q?UVUkT6pLM2VezbARj3xIY6ZCRAniT5BjIpXwsVCBLTRW/IfL4jkdRpGJOd?=
 =?iso-8859-1?Q?xH081Ix++dBxzihhG0Y8y+FaR/VEOtaZQQE2YwdkNJsoc4uzah5JlBHyB+?=
 =?iso-8859-1?Q?fltq7JpsRmXqQxZWpBoQFckBzkKAi0dZU0G1LvshydsG0d7lSc4agoNsG8?=
 =?iso-8859-1?Q?RIHJhBjUVE/XT856nXuxA+XSe29LsQRE8lhiZd6mONt41pNGZFDXkSEC4E?=
 =?iso-8859-1?Q?cYJDPed0fHF1OWJOrJHsQ8nm6t4E41qB0pneuWLVAKXxPfKUOb08M83psJ?=
 =?iso-8859-1?Q?w5YhQ4dDAaNSM2XvLMD9d5mpUuwrZe988WFVCq/zMKBT1GDLps9LyqfTN3?=
 =?iso-8859-1?Q?qO8/rX801db4/oLD0M3gEkIpqnfwe5YIzwD5lGhSk8pglZoQfFJes5Zv8g?=
 =?iso-8859-1?Q?Ep3N+afj0pidfVj/LzaLldBKWpcsnStuoi9kuwdK6cZOG5Tf0fgh8ez2Lt?=
 =?iso-8859-1?Q?+ud7+FqfR3xhG2NLOe8uXbFowJt8WagZX+4yMYUVl2oneNM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR03MB5888497D41C2C4B3FD14D86D9B859SJ0PR03MB5888namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a1de27-39bc-4e3c-d4b7-08d8d3f5dc33
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2021 10:13:38.6971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1K/C/K9SMi2pElsRt/uC83MJUtMfFyvDyDDM2d9IbuhTOu+H/4z46e1zwKSbkOaF7Zsf6HrCFy1E1WLOWGYNOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4184
X-OriginatorOrg: citrix.com

--_000_SJ0PR03MB5888497D41C2C4B3FD14D86D9B859SJ0PR03MB5888namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

oxenstored doesn't have a tdb file, by default it stores the entire tree in=
 memory only.

There is a way to persistently store the tree (--persistent), but that is n=
ot enabled by default and I don't know whether it even works.
Master (or the hotfixed releases) have a live-update functionality now that=
 dump and restore state properly (and reuses some of the persistent disk co=
de, but also dumps some additional state).

The default location of the "persistent" database is /var/run/xenstored, wh=
ich is a tmpfs and thus cleared on every boot. So if you'd ensure that oxen=
stored uses the equivalent of that on FreeBSD (or have a script on boot tha=
t clears it) that would solve any issues like this.

I don't know about C xenstored's behaviour, I'll let someone else answer th=
at.

Best regards,
--Edwin

________________________________
From: Roger Pau Monne <roger.pau@citrix.com>
Sent: 18 February 2021 09:46
To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>
Cc: Christian Lindig <christian.lindig@citrix.com>; Edwin Torok <edvin.toro=
k@citrix.com>; J=FCrgen Gro=DF <jgross@suse.com>; Ian Jackson <iwj@xenproje=
ct.org>
Subject: oxenstored restart after system crash

Hello,

Last month I got a query from a FreeBSD Xen user having issues with
xenstored after a power failure:

https://lists.freebsd.org/pipermail/freebsd-xen/2021-January/003446.html

I'm not sure what's the right approach here. I've been told cxenstored
will attempt to unlink the tdb file when starting, does oxenstored
attempt to do the same?

Should the tdb file be placed in a path that's cleaned up on boot?

Should xencommons remove the stale tdb before starting xenstored?

Mostly wanted to know what's the approach on Linux so that I can do
the same on FreeBSD.

Thanks, Roger.

--_000_SJ0PR03MB5888497D41C2C4B3FD14D86D9B859SJ0PR03MB5888namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
oxenstored doesn't have a tdb file, by default it stores the entire tree in=
 memory only.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
There is a way to persistently store the tree (--persistent), but that is n=
ot enabled by default and I don't know whether it even works.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Master (or the hotfixed releases) have a live-update functionality now that=
 dump and restore state properly (and reuses some of the persistent disk co=
de, but also dumps some additional state).</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
The default location of the &quot;persistent&quot; database is /var/run/xen=
stored, which is a tmpfs and thus cleared on every boot. So if you'd ensure=
 that oxenstored uses the equivalent of that on FreeBSD (or have a script o=
n boot that clears it) that would solve any
 issues like this.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I don't know about C xenstored's behaviour, I'll let someone else answer th=
at.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
--Edwin<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Roger Pau Monne &lt;r=
oger.pau@citrix.com&gt;<br>
<b>Sent:</b> 18 February 2021 09:46<br>
<b>To:</b> xen-devel@lists.xenproject.org &lt;xen-devel@lists.xenproject.or=
g&gt;<br>
<b>Cc:</b> Christian Lindig &lt;christian.lindig@citrix.com&gt;; Edwin Toro=
k &lt;edvin.torok@citrix.com&gt;; J=FCrgen Gro=DF &lt;jgross@suse.com&gt;; =
Ian Jackson &lt;iwj@xenproject.org&gt;<br>
<b>Subject:</b> oxenstored restart after system crash</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hello,<br>
<br>
Last month I got a query from a FreeBSD Xen user having issues with<br>
xenstored after a power failure:<br>
<br>
<a href=3D"https://lists.freebsd.org/pipermail/freebsd-xen/2021-January/003=
446.html">https://lists.freebsd.org/pipermail/freebsd-xen/2021-January/0034=
46.html</a><br>
<br>
I'm not sure what's the right approach here. I've been told cxenstored<br>
will attempt to unlink the tdb file when starting, does oxenstored<br>
attempt to do the same?<br>
<br>
Should the tdb file be placed in a path that's cleaned up on boot?<br>
<br>
Should xencommons remove the stale tdb before starting xenstored?<br>
<br>
Mostly wanted to know what's the approach on Linux so that I can do<br>
the same on FreeBSD.<br>
<br>
Thanks, Roger.<br>
</div>
</span></font></div>
</body>
</html>

--_000_SJ0PR03MB5888497D41C2C4B3FD14D86D9B859SJ0PR03MB5888namp_--


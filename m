Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB97F8F41E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 21:08:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyL3z-0007IC-Ci; Thu, 15 Aug 2019 19:05:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fU+k=WL=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1hyL3x-0007I7-Cv
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 19:05:29 +0000
X-Inumbo-ID: a4339332-bf8f-11e9-a661-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.139]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4339332-bf8f-11e9-a661-bc764e2007e4;
 Thu, 15 Aug 2019 19:05:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BiQQY6as0nJi5jv2oCpMS5Z2SLoErQwgFi66WN6HnAnDSqCii6I57Nvl25xsMuCWel189Gy2iQYUOdlJYhzKi8DMxi2ceUWnQ4RbWau8OgpQTZJ5KdxVbAsJ5Hr7od7ynFako85+n8DPoObWp2jc7/YOq2W9Q4583wFM7nUqR/pU3gBiOFHfeHFn5WkCYrGsmsFqnrra7FO+pqdFzwB4A7+vxF+eukjqUO9SFlJFphwhFCtwQQFrnaFNPiPLatLixsMdpaZU+bzhJmBP2SYJIFeqD5cYWuHzBv7VHdoVHuSGCFfmlFZ9kvRIm5T21WbzZq6KWzulcWlzslpf0Xp2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+cpSF/gJZFHD10jX7QOPUYJ73zkkXhciY8tdQTo4ao=;
 b=iyg0rDAZAgJeDmihQNvqB1GGnAjgqzmlDaNxEbHceQ1h6pZMRUHtB1VGXfVTbf/0KiusGUzaGUorPsSV8YFUv8N909B8Fta7/INBGPL1X+jB35OtSOASH/xurcA+sCF2ovg31aXYApZjQHcRGkD5gogO2xt44s+kFA5vkhCILaU+Tk5/6sS9yYSxmPe5K84OCThPmMr8Aud3KIuIXbXbvzkQHGs4KWtewc9XH3pyp2fympo6W0SrRUIZnhMHRZZPKAYUmAEt4WwkgHmUJ1WtXfmJqjSjRNT5ob8vo7xm3b8i5IhnxGu6O64Ql5re7/Z+H20Pf8BCbcuVjQBAeaV0uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=durham.ac.uk; dmarc=pass action=none header.from=durham.ac.uk;
 dkim=pass header.d=durham.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=durhamuniversity.onmicrosoft.com;
 s=selector2-durhamuniversity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+cpSF/gJZFHD10jX7QOPUYJ73zkkXhciY8tdQTo4ao=;
 b=iWMfN7U7DGx/6ZvQIpnhKM4u8Xut5+zFzE1adwsOCnrAR9MJLOSMsz+qWTYw2+EfvEy6WlGVXeulwxetZNMZs5ab8kTn4qZtyGUs62SmEV/PL9z1Z7GuGA0YNa2MgxGfsQUlyNhnmMVe54Wvps1SpnV5qSxznf7ccOlaSi3qMhU=
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com (20.177.200.18) by
 VI1PR06MB5711.eurprd06.prod.outlook.com (20.178.122.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 15 Aug 2019 19:05:25 +0000
Received: from VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::3164:1b3d:165e:ac42]) by VI1PR06MB4720.eurprd06.prod.outlook.com
 ([fe80::3164:1b3d:165e:ac42%6]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 19:05:25 +0000
From: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
To: Steven Haigh <netwiz@crc.id.au>
Thread-Topic: [PATCH] read grubenv and set default from saved_entry or
 next_entry
Thread-Index: AQHVUvuqPvsRoX8NVkqUHn9yEgeJ1qb7Ud0AgABmEYCAANrgAA==
Date: Thu, 15 Aug 2019 19:05:25 +0000
Message-ID: <alpine.LFD.2.21.1908151959060.2715@austen3.home>
References: <alpine.LFD.2.21.1908150030150.2807@austen3.home>
 <alpine.LFD.2.21.1908150055060.2807@austen3.home>
 <18fb961102e8da16d1ad9576742bccf2@crc.id.au>
In-Reply-To: <18fb961102e8da16d1ad9576742bccf2@crc.id.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Alpine 2.21 (LFD 202 2017-01-01)
x-originating-ip: [2a00:23c4:9208:400:c49a:db08:8036:b390]
x-clientproxiedby: LO2P265CA0323.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::23) To VI1PR06MB4720.eurprd06.prod.outlook.com
 (2603:10a6:803:90::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=m.a.young@durham.ac.uk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-x-sender: michael@austen3.home
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae2051f0-6af3-485c-b257-08d721b38772
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:VI1PR06MB5711; 
x-ms-traffictypediagnostic: VI1PR06MB5711:
x-microsoft-antispam-prvs: <VI1PR06MB571159049CD1A7E90EA7BD0E87AC0@VI1PR06MB5711.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(189003)(199004)(8936002)(81156014)(81166006)(8676002)(5660300002)(229853002)(86362001)(14454004)(58126008)(99286004)(54906003)(186003)(386003)(6916009)(478600001)(11346002)(6506007)(102836004)(52116002)(76176011)(46003)(446003)(486006)(476003)(316002)(786003)(25786009)(6436002)(4326008)(5024004)(256004)(6116002)(6512007)(9686003)(2906002)(66556008)(66446008)(66476007)(53346004)(64756008)(6246003)(53936002)(66946007)(66616009)(6486002)(99936001)(71190400001)(36756003)(305945005)(7736002)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR06MB5711;
 H:VI1PR06MB4720.eurprd06.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: durham.ac.uk does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: X1A0d0ehQZP2RobWtynxph/x7Pl2mx5TdXW2hDMyyiFSeXDvlNhOiL/Sl2lz/pX512VJvxGzL4PrEiJfxCU1kcEnHSSqAU3c2El68UMTPAERrxCsUU9hPDxxy3G+LpyAakHES+Ecoejd/LOy8HTvgqRfJUlZ6NFb8z84lExiWte9QSFyXDs2GaHgXdKIRSIK/H+SHVlcsnSnQqyy06Hr3qS+JYvUTPuONlqfpeezcuPXDMwhAwzoH0mopihvXK9AWhrLSPoBR7MHooABxWHk9UGXdVKPZY9hmM3LqLL3AZL04XVAQCqDBduyMtvo8clVC9oGjov4tcy4A6MAbzfUVshEfCbnjdeXIq4qx4n+jVnpgDBwinLlYSAHaS8DWiVVsUcS95T21h+finFTnLz2nV91BiKlEsHag0JCN8OYp00=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_002_alpineLFD22119081519590602715austen3home_"
MIME-Version: 1.0
X-OriginatorOrg: durham.ac.uk
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2051f0-6af3-485c-b257-08d721b38772
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 19:05:25.4046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7250d88b-4b68-4529-be44-d59a2d8a6f94
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: czaFerp9RpwuAygPxG/ol83xY6TE0muroGp3sBNdrqRzzk6xuYtmWVdgzywRbuNSzXRTr7cP6mYLBvUVP3xL1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB5711
Subject: Re: [Xen-devel] [PATCH] read grubenv and set default from
 saved_entry or next_entry
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_002_alpineLFD22119081519590602715austen3home_
Content-Type: text/plain; charset="us-ascii"
Content-ID: <47ACB925F1A22C4FBC6EF1343A181E99@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

On Thu, 15 Aug 2019, Steven Haigh wrote:

> Having a bit of a look here....
>
> My test system grubenv file has:
> # GRUB Environment Block
> saved_entry=3D0
> kernelopts=3Droot=3DUUID=3D5346b4d9-885f-4673-8aff-04a16bf1971a ro=20
> rootflags=3Dsubvol=3Droot selinux=3D0 rhgb quiet
> boot_success=3D1
> #########################################################################=
###########################################################################=
###########################################################################=
###########################################################################=
###########################################################################=
###########################################################################=
###########################################################################=
###########################################################################=
###########################################################################=
###########################################################################=
###########################################################################=
##########################################

I have attached a revision of the first patch which should handle a=20
numeric saved_entry.

 	Michael Young=

--_002_alpineLFD22119081519590602715austen3home_
Content-Type: text/plain;
	name="0001-read-grubenv-and-set-default-from-saved_entry-or-nex.patch"
Content-Description:  0001-read-grubenv-and-set-default-from-saved_entry-or-nex.patch
Content-Disposition: attachment;
	filename="0001-read-grubenv-and-set-default-from-saved_entry-or-nex.patch";
	size=3527; creation-date="Thu, 15 Aug 2019 19:05:25 GMT";
	modification-date="Thu, 15 Aug 2019 19:05:25 GMT"
Content-ID: <alpine.LFD.2.21.1908152005220.2715@austen3.home>
Content-Transfer-Encoding: base64

RnJvbSA1MWE5ZGNlOWRlM2VhMTU5MDExOTI4ZTJkYjg1NDFmM2M3ZTgzODNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogTWljaGFlbCBZb3VuZyA8bS5hLnlvdW5nQGR1cmhhbS5hYy51
az4NCkRhdGU6IFRodSwgMTUgQXVnIDIwMTkgMTk6NTU6MzAgKzAxMDANClN1YmplY3Q6IFtQQVRD
SF0gcmVhZCBncnViZW52IGFuZCBzZXQgZGVmYXVsdCBmcm9tIHNhdmVkX2VudHJ5IG9yIG5leHRf
ZW50cnkNCg0KVGhpcyBwYXRjaCBsb29rcyBmb3IgYSBncnViZW52IGZpbGUgaW4gdGhlIHNhbWUg
ZGlyZWN0b3J5IGFzIHRoZQ0KZ3J1Yi5jZmcgZmlsZSBhbmQgaW5jbHVkZXMgaXQgYXQgZnJvbnQg
b2YgdGhlIGdydWIuY2ZnIGZpbGUgd2hlbiBwYXNzZWQNCnRvIHBhcnNlKCkNCg0KQXMgdGhlIGdy
dWJlbnYgZmlsZSBjb25zaXN0cyBvZiB2YXJpYWJsZT12YWx1ZSBsaW5lcyBwYWRkZWQgYnkgaGFz
aGVzIHRoZXNlDQphcmUgdHJlYXRlZCBhcyBjb21tYW5kcyBpbiBwYXJzZSgpIHdoZXJlIGl0IHVz
ZXMgdGhlIHZhbHVlIG9mIHNhdmVkX2VudHJ5DQpvciBuZXh0X2VudHJ5IChpZiBzZXQpIHRvIHNl
dCB0aGUgZGVmYXVsdCBlbnRyeSBpZiBhIHRpdGxlIG1hdGNoZXMgb3IgaXMNCmEgbnVtYmVyLg0K
LS0tDQogdG9vbHMvcHlncnViL3NyYy9HcnViQ29uZi5weSB8IDExICsrKysrKysrKysrDQogdG9v
bHMvcHlncnViL3NyYy9weWdydWIgICAgICB8IDEzICsrKysrKysrKysrKy0NCiAyIGZpbGVzIGNo
YW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL3Rv
b2xzL3B5Z3J1Yi9zcmMvR3J1YkNvbmYucHkgYi90b29scy9weWdydWIvc3JjL0dydWJDb25mLnB5
DQppbmRleCA1OTQxMzliYWM3Li4yMmUwOTQ4ZGEyIDEwMDY0NA0KLS0tIGEvdG9vbHMvcHlncnVi
L3NyYy9HcnViQ29uZi5weQ0KKysrIGIvdG9vbHMvcHlncnViL3NyYy9HcnViQ29uZi5weQ0KQEAg
LTM4Myw2ICszODMsOCBAQCBjbGFzcyBHcnViMkNvbmZpZ0ZpbGUoX0dydWJDb25maWdGaWxlKToN
CiAgICAgICAgIGltZyA9IE5vbmUNCiAgICAgICAgIHRpdGxlID0gIiINCiAgICAgICAgIG1lbnVf
bGV2ZWw9MA0KKyAgICAgICAgaW1nX2NvdW50PTANCisgICAgICAgIGRlZmF1bHRfdGl0bGU9IiIN
CiAgICAgICAgIGZvciBsIGluIGxpbmVzOg0KICAgICAgICAgICAgIGwgPSBsLnN0cmlwKCkNCiAg
ICAgICAgICAgICAjIHNraXAgYmxhbmsgbGluZXMNCkBAIC00MDgsNiArNDEwLDkgQEAgY2xhc3Mg
R3J1YjJDb25maWdGaWxlKF9HcnViQ29uZmlnRmlsZSk6DQogICAgICAgICAgICAgICAgICAgICBy
YWlzZSBSdW50aW1lRXJyb3IoInN5bnRheCBlcnJvcjogY2Fubm90IG5lc3QgbWVudWVudHJ5ICgl
ZCAlcykiICUgKGxlbihpbWcpLGltZykpDQogICAgICAgICAgICAgICAgIGltZyA9IFtdDQogICAg
ICAgICAgICAgICAgIHRpdGxlID0gdGl0bGVfbWF0Y2guZ3JvdXAoMSkNCisgICAgICAgICAgICAg
ICAgaWYgdGl0bGUgPT0gZGVmYXVsdF90aXRsZToNCisgICAgICAgICAgICAgICAgICAgIHNldGF0
dHIoc2VsZiwgJ2RlZmF1bHQnLCBpbWdfY291bnQpDQorICAgICAgICAgICAgICAgIGltZ19jb3Vu
dCArPSAxDQogICAgICAgICAgICAgICAgIGNvbnRpbnVlDQogDQogICAgICAgICAgICAgaWYgbC5z
dGFydHN3aXRoKCJzdWJtZW51Iik6DQpAQCAtNDMyLDYgKzQzNywxMCBAQCBjbGFzcyBHcnViMkNv
bmZpZ0ZpbGUoX0dydWJDb25maWdGaWxlKToNCiANCiAgICAgICAgICAgICAoY29tLCBhcmcpID0g
Z3J1Yl9leGFjdF9zcGxpdChsLCAyKQ0KICAgICAgICAgDQorICAgICAgICAgICAgaWYgY29tID09
ICJzYXZlZF9lbnRyeSIgb3IgY29tID09ICJuZXh0X2VudHJ5IjoNCisgICAgICAgICAgICAgICAg
ZGVmYXVsdF90aXRsZSA9IGFyZw0KKyAgICAgICAgICAgICAgICBjb250aW51ZQ0KKw0KICAgICAg
ICAgICAgIGlmIGNvbSA9PSAic2V0IjoNCiAgICAgICAgICAgICAgICAgKGNvbSxhcmcpID0gZ3J1
YjJfaGFuZGxlX3NldChhcmcpDQogICAgICAgICAgICAgICAgIA0KQEAgLTQ0OSw2ICs0NTgsOCBA
QCBjbGFzcyBHcnViMkNvbmZpZ0ZpbGUoX0dydWJDb25maWdGaWxlKToNCiAgICAgICAgICAgICBl
bHNlOg0KICAgICAgICAgICAgICAgICBsb2dnaW5nLndhcm5pbmcoIlVua25vd24gZGlyZWN0aXZl
ICVzIiAlKGNvbSwpKQ0KICAgICAgICAgICAgIA0KKyAgICAgICAgaWYgZGVmYXVsdF90aXRsZS5p
c2RpZ2l0KCk6DQorICAgICAgICAgICAgc2V0YXR0cihzZWxmLCAnZGVmYXVsdCcsIGRlZmF1bHRf
dGl0bGUpDQogICAgICAgICBpZiBpbWcgaXMgbm90IE5vbmU6DQogICAgICAgICAgICAgcmFpc2Ug
UnVudGltZUVycm9yKCJzeW50YXggZXJyb3I6IGVuZCBvZiBmaWxlIHdpdGggb3BlbiBtZW51ZW50
cnkoJWQgJXMpIiAlIChsZW4oaW1nKSxpbWcpKQ0KIA0KZGlmZiAtLWdpdCBhL3Rvb2xzL3B5Z3J1
Yi9zcmMvcHlncnViIGIvdG9vbHMvcHlncnViL3NyYy9weWdydWINCmluZGV4IGNlN2FiMGViOGMu
LjI2Nzc4ODc5NWIgMTAwNzU1DQotLS0gYS90b29scy9weWdydWIvc3JjL3B5Z3J1Yg0KKysrIGIv
dG9vbHMvcHlncnViL3NyYy9weWdydWINCkBAIC00NTQsOCArNDU0LDE5IEBAIGNsYXNzIEdydWI6
DQogICAgICAgICBpZiBzZWxmLl9fZGljdF9fLmdldCgnY2YnLCBOb25lKSBpcyBOb25lOg0KICAg
ICAgICAgICAgIHJhaXNlIFJ1bnRpbWVFcnJvcigiY291bGRuJ3QgZmluZCBib290bG9hZGVyIGNv
bmZpZyBmaWxlIGluIHRoZSBpbWFnZSBwcm92aWRlZC4iKQ0KICAgICAgICAgZiA9IGZzLm9wZW5f
ZmlsZShzZWxmLmNmLmZpbGVuYW1lKQ0KKyAgICAgICAgZmVudiA9IHNlbGYuY2YuZmlsZW5hbWUu
cmVwbGFjZSgiZ3J1Yi5jZmciLCJncnViZW52IikNCisgICAgICAgIGlmIGZlbnYgIT0gc2VsZi5j
Zi5maWxlbmFtZSBhbmQgZnMuZmlsZV9leGlzdHMoZmVudik6DQorICAgICAgICAgICAgIyBpZiBn
cnViZW52IGZpbGUgZXhpc3RzIG5leHQgdG8gZ3J1Yi5jZmcgcHJlcGVuZCBpdA0KKyAgICAgICAg
ICAgIGZlbnZmID0gZnMub3Blbl9maWxlKGZlbnYpDQorICAgICAgICAgICAgaWYgc3lzLnZlcnNp
b25faW5mb1swXSA8IDM6DQorICAgICAgICAgICAgICAgIGZzZXAgPSAiXG4iDQorICAgICAgICAg
ICAgZWxzZToNCisgICAgICAgICAgICAgICAgZnNlcCA9IGIiXG4iDQorICAgICAgICAgICAgYnVm
ID0gZnNlcC5qb2luKChmZW52Zi5yZWFkKEZTX1JFQURfTUFYKSxmLnJlYWQoRlNfUkVBRF9NQVgp
KSkNCisgICAgICAgICAgICBkZWwgZmVudmYNCiAgICAgICAgICMgbGltaXQgcmVhZCBzaXplIHRv
IGF2b2lkIHBhdGhvbG9naWNhbCBjYXNlcw0KLSAgICAgICAgYnVmID0gZi5yZWFkKEZTX1JFQURf
TUFYKQ0KKyAgICAgICAgZWxzZToNCisgICAgICAgICAgICBidWYgPSBmLnJlYWQoRlNfUkVBRF9N
QVgpDQogICAgICAgICBkZWwgZg0KICAgICAgICAgaWYgc3lzLnZlcnNpb25faW5mb1swXSA8IDM6
DQogICAgICAgICAgICAgc2VsZi5jZi5wYXJzZShidWYpDQotLSANCjIuMjEuMA0KDQo=

--_002_alpineLFD22119081519590602715austen3home_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--_002_alpineLFD22119081519590602715austen3home_--


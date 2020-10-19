Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEAA29262A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 13:02:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8700.23305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUSuE-0001SE-Ax; Mon, 19 Oct 2020 11:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8700.23305; Mon, 19 Oct 2020 11:00:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUSuE-0001Ro-6m; Mon, 19 Oct 2020 11:00:46 +0000
Received: by outflank-mailman (input) for mailman id 8700;
 Mon, 19 Oct 2020 11:00:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GZg0=D2=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kUSuC-0001Rj-JS
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 11:00:44 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14f711cb-7c44-4597-9d87-0d059df63ff5;
 Mon, 19 Oct 2020 11:00:43 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GZg0=D2=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kUSuC-0001Rj-JS
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 11:00:44 +0000
X-Inumbo-ID: 14f711cb-7c44-4597-9d87-0d059df63ff5
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 14f711cb-7c44-4597-9d87-0d059df63ff5;
	Mon, 19 Oct 2020 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603105243;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DSFoGlvzf1IlAYNb1LzPQyz0U5BnYVTIcg0pPUWdenA=;
  b=Y+5KlKsT7E+4jdWj5OxNZCrXrCswIDFatAVcEMvUv1DXuQFjikqDuCsQ
   RhH7IPFPrIO/uXk6DXcHsyHbBboXOJy7nagHj+VcP9148sbCNo4czZDmb
   XQnNz5+VSW6x9E72OvfO5b0UMjEA6vpzdditxw9JLhHtRjl4AiZ8UhTAc
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: v9t/f9TQSgyyb8szPH97tR8seIGQtZRLY54ohttaEZRq70kVNaquYswqSnklLo2k4c3GaTUspE
 LL8Mg13bP9LnXiKGA1tkql0tKZvYtlZrFboszDHOyg7457pAP9S1my2eDts5q9FvYASRjY9R22
 wyQvp0BK4sr8MmL60snx/sR9Xk0lF/gS7V5e6GDZ92WJXkSuDUcyyd0IWphD5fOAh5pLUqP9GL
 CbtjyLe9NQ23ghas/cmKiVQkDla8hIl6W42/24Pt7zR93EVL+MqO1CAUmDAkmollCy8McKKUGL
 lIA=
X-SBRS: None
X-MesageID: 29619253
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,394,1596513600"; 
   d="scan'208";a="29619253"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mt/UwtDwCWVSAHkaCAv76r3pp/fX7IPFZ+9di9sNLzCe5ZiFoM/mcrtVEXuUbXCYzTssbCL24RbE5wQn0JTWyqSFO23A1ENerV+cq54m8dFDcmdka7+6mYAsinYgrBSUH8v/QNHWvFu4cdeuZyZkb2mcTp8EYjFW7BUf0v7rZoIQ7KT/oc8L6TXfqwUJaINEsUFBTwugDU0b1leuPl4qd01XaVz32z9VdLQxYxkTWWtuyUY2ScJ2hZ1zYI/76BjTsk/M9mV/AtD7TJw95RJU98/5cKgrMuTlrTbSaG41gvXHJL4SgXhw/SQDczqJOunrvIaCeM6SExKlgxF+0lbYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSFoGlvzf1IlAYNb1LzPQyz0U5BnYVTIcg0pPUWdenA=;
 b=VCycboW1kHvsh8J2WmxtwJhEoGY9ZhAwOwVslOdbnkd9AFgeGZ7wV6LogLCiBeDpmp4bv6kZC00A6Z6EuzEoEFj+/QuPt1amlKSqJPWaoTA8kvkpXRRvSFSEXoqsJXmb+lqPBQQw1Dm27J5mD9zD3DMZR7xwENsH9QAeTtj6+1X/rjKP4Ql0VZZ9xMbFNSGkgFucBlO/z6zwykqNLpGZthCh1aU/IUlnrh1feaY8xM7c63C66u36TeRUHj9bsYBfaH6MxiyiX0MjbZW5Tzp+U7Z22hAbiBEKgZ/jjjoAkJ5BCZoMNoESCuwZCD33HuKqGrz+ifWkHRmcZK5bcCZ84w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSFoGlvzf1IlAYNb1LzPQyz0U5BnYVTIcg0pPUWdenA=;
 b=DpguoH+OUwU/eB3/GrpTTtCLOIMkSs4fWrh5JC6lGBnOyB2REnZZzDQeabPnUWjGTloQFhIisA7p/OvivMLBNBxLsp68MHxFCQFXoIsDg+mlFYkiL+mSLUX8LQyYQ/y7gTeyl+oM2a1Kkn8tYEnGktufjykJo2AcSkwcCpkrnJs=
From: George Dunlap <George.Dunlap@citrix.com>
To: Wei Liu <wl@xen.org>
CC: Rich Persaud <persaur@gmail.com>, =?utf-8?B?UGFzaSBLw6Rya2vDpGluZW4=?=
	<pasik@iki.fi>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, Jan Beulich <JBeulich@suse.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	=?utf-8?B?SMOla29uIEFsc3RhZGhlaW0=?= <hakon@alstadheim.priv.no>, "Roger Pau
 Monne" <roger.pau@citrix.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
	Paul Durrant <pdurrant@amazon.com>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [Xen-devel] [PATCH V3 2/2] Xen/PCIback: Implement PCI
 flr/slot/bus reset with 'reset' SysFS attribute
Thread-Topic: [Xen-devel] [PATCH V3 2/2] Xen/PCIback: Implement PCI
 flr/slot/bus reset with 'reset' SysFS attribute
Thread-Index: AQHV2EvZHHXF37OTcE6DktrDrf9FJ6mgXYmA
Date: Mon, 19 Oct 2020 11:00:34 +0000
Message-ID: <A325DB30-0282-4512-96D4-06AE661ADB5A@citrix.com>
References: <646A4BEA-C544-4C62-A7A3-B736D3860912@gmail.com>
 <20200131153332.r4oe3sadhvoly7ho@debian>
In-Reply-To: <20200131153332.r4oe3sadhvoly7ho@debian>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1e0884d-63fc-4e0f-7f08-08d8741e355b
x-ms-traffictypediagnostic: BYAPR03MB4198:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB41982F2E662D10EE8BA16C74991E0@BYAPR03MB4198.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5kvKBTKDW2hkaCZ/l5v8jzpsjxuQ+8Q7MefA/UJ3zUYPp2xGI7TdihDDhqr5r0dUCdrXWKnTmjkWxg5lLh/tex53Ap0ZBm0KZayF9m7gdOFXNW4AOswOf75VEzO7sGZW1S8bZdDl3YGOkELDVJWL1aGktM+Uu/Nk2aueKosPs808BXL9tUbOscSRNw58oU98LMCoTw//5qkLkdHna84RMcKLm7p3ZMX5ugfCYHeKA5fJ0X+ITEvArpSX4JjM7xl1G/7CaO2lrGVbgXicMNXwBAXhLo49fKaK6hzRNznVK2K+pqnnmADEbMM2KSP1jDJUo/HDlYPfHorclTauePNuZOGYJ040eeSdDUGT0dqeJbiMIm80pCaoBgMe/MBGlUkKKa9r0pmgwBpPCQhxcSdLDg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4229.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(86362001)(6916009)(966005)(6512007)(478600001)(2906002)(5660300002)(54906003)(36756003)(316002)(33656002)(8936002)(83380400001)(8676002)(186003)(66574015)(2616005)(7416002)(53546011)(55236004)(91956017)(26005)(66476007)(6506007)(66446008)(71200400001)(76116006)(64756008)(66556008)(66946007)(6486002)(107886003)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: EGiKMfF8LDxQri6auJ3iLg5OAEcjHEqhBswlXC0oySyzDydgvBZfV6gZv9W7mybtSjsFPoa4P24aP/JSB13vH82G7N/QkFA+p37TbjfRDmeHiCd5ul0/meXpV/8debSDKl1azueeFtwot15m0GHfDw97gGtU3rVrth7gnThRPClLVs0973rtppuujwuXdkuvT225HlIJlR/ATV2qgBbbIS4XhNCyRpoBOaFo3f00qsc8xqbOm5q7QF1HwHlkbIei1NnAT/JXUbKyi9HpDwt5xVq9v9ju0PcEoEtENYegx6fFYH1zV6psFq42vHbdNLnF85kC41f/7XyQrg7CVBskF6OIUU5GXv23nMrqtbnwe5p2tTjKVzcRU9CYbU9M/BnOEL9u2RrTl5LMZ1YZOTNHMxdjzNMlUj5a6anVc6AeZjj7RJMzjLLUJxWMQHfmOfQZ9CUf+umsv69TFo2W8HjicXmlyYB3RR7UeFKpFYoLklGqzFSzNAK3Y9+R1kYKWn9UVTt8k7gpk8bHQbKJ9cJeKBEe6L0gr66Kf53oY22HgtPjjfchac7mSjt6+V/4kSDb1Exu4Igo5TbyDpW03taenaY6L6YGmeiOp/XF1smRTwEx7OmEOKjYuIlGPb/bskPAH67F0gXmHyhJJrdxmbTvGQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B1FD84D1E8F194BB94E48866DBB10B0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e0884d-63fc-4e0f-7f08-08d8741e355b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2020 11:00:34.9764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cy4pSqODLIdAxZs/B1LFyhML0pX6UbDwVgr37EXNJYab7TJBbxgo1HdZ+3bU8fYKPy1H2jTZLSGksAdxs5D6uBnRTbzHsEkVhhV5SQ1d1q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4198
X-OriginatorOrg: citrix.com

DQoNCj4gT24gSmFuIDMxLCAyMDIwLCBhdCAzOjMzIFBNLCBXZWkgTGl1IDx3bEB4ZW4ub3JnPiB3
cm90ZToNCj4gDQo+IE9uIEZyaSwgSmFuIDE3LCAyMDIwIGF0IDAyOjEzOjA0UE0gLTA1MDAsIFJp
Y2ggUGVyc2F1ZCB3cm90ZToNCj4+IE9uIEF1ZyAyNiwgMjAxOSwgYXQgMTc6MDgsIFBhc2kgS8Ok
cmtrw6RpbmVuIDxwYXNpa0Bpa2kuZmk+IHdyb3RlOg0KPj4+IO+7v0hpLA0KPj4+IA0KPj4+PiBP
biBNb24sIE9jdCAwOCwgMjAxOCBhdCAxMDozMjo0NUFNIC0wNDAwLCBCb3JpcyBPc3Ryb3Zza3kg
d3JvdGU6DQo+Pj4+PiBPbiAxMC8zLzE4IDExOjUxIEFNLCBQYXNpIEvDpHJra8OkaW5lbiB3cm90
ZToNCj4+Pj4+IE9uIFdlZCwgU2VwIDE5LCAyMDE4IGF0IDExOjA1OjI2QU0gKzAyMDAsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4gT24gVHVlLCBTZXAgMTgsIDIwMTggYXQgMDI6MDk6
NTNQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOg0KPj4+Pj4+PiBPbiA5LzE4LzE4IDU6
MzIgQU0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+Pj4+Pj4+Pj4gT24gU2VwIDE4LCAyMDE4LCBh
dCA4OjE1IEFNLCBQYXNpIEvDpHJra8OkaW5lbiA8cGFzaWtAaWtpLmZpPiB3cm90ZToNCj4+Pj4+
Pj4+PiBIaSwNCj4+Pj4+Pj4+PiBPbiBNb24sIFNlcCAxNywgMjAxOCBhdCAwMjowNjowMlBNIC0w
NDAwLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6DQo+Pj4+Pj4+Pj4+IFdoYXQgYWJvdXQgdGhlIHRv
b2xzdGFjayBjaGFuZ2VzPyBIYXZlIHRoZXkgYmVlbiBhY2NlcHRlZD8gSSB2YWd1ZWx5DQo+Pj4+
Pj4+Pj4+IHJlY2FsbCB0aGVyZSB3YXMgYSBkaXNjdXNzaW9uIGFib3V0IHRob3NlIGNoYW5nZXMg
YnV0IGRvbid0IHJlbWVtYmVyIGhvdw0KPj4+Pj4+Pj4+PiBpdCBlbmRlZC4NCj4+Pj4+Pj4+PiBJ
IGRvbid0IHRoaW5rIHRvb2xzdGFjay9saWJ4bCBwYXRjaCBoYXMgYmVlbiBhcHBsaWVkIHlldCBl
aXRoZXIuDQo+Pj4+Pj4+Pj4gIltQQVRDSCBWMSAwLzFdIFhlbi9Ub29sczogUENJIHJlc2V0IHVz
aW5nICdyZXNldCcgU3lzRlMgYXR0cmlidXRlIjoNCj4+Pj4+Pj4+PiBodHRwczovL2xpc3RzLnhl
bi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNy0xMi9tc2cwMDY2NC5odG1sDQo+Pj4+
Pj4+Pj4gIltQQVRDSCBWMSAxLzFdIFhlbi9saWJ4bDogUGVyZm9ybSBQQ0kgcmVzZXQgdXNpbmcg
J3Jlc2V0JyBTeXNGUyBhdHRyaWJ1dGUiOg0KPj4+Pj4+Pj4+IGh0dHBzOi8vbGlzdHMueGVuLm9y
Zy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE3LTEyL21zZzAwNjYzLmh0bWwNCj4+Pj4+Pj4g
V2lsbCB0aGlzIHBhdGNoIHdvcmsgZm9yICpCU0Q/IFJvZ2VyPw0KPj4+Pj4+IEF0IGxlYXN0IEZy
ZWVCU0QgZG9uJ3Qgc3VwcG9ydCBwY2ktcGFzc3Rocm91Z2gsIHNvIG5vbmUgb2YgdGhpcyB3b3Jr
cw0KPj4+Pj4+IEFUTS4gVGhlcmUncyBubyBzeXNmcyBvbiBCU0QsIHNvIG11Y2ggb2Ygd2hhdCdz
IGluIGxpYnhsX3BjaS5jIHdpbGwNCj4+Pj4+PiBoYXZlIHRvIGJlIG1vdmVkIHRvIGxpYnhsX2xp
bnV4LmMgd2hlbiBCU0Qgc3VwcG9ydCBpcyBhZGRlZC4NCj4+Pj4+IE9rLiBUaGF0IHNvdW5kcyBs
aWtlIGl0J3MgT0sgZm9yIHRoZSBpbml0aWFsIHBjaSAncmVzZXQnIGltcGxlbWVudGF0aW9uIGlu
IHhsL2xpYnhsIHRvIGJlIGxpbnV4LW9ubHkuLg0KPj4+PiANCj4+Pj4gQXJlIHRoZXNlIHR3byBw
YXRjaGVzIHN0aWxsIG5lZWRlZD8gSVNUUiB0aGV5IHdlcmUgIHdyaXR0ZW4gb3JpZ2luYWxseQ0K
Pj4+PiB0byBkZWFsIHdpdGggZ3Vlc3QgdHJ5aW5nIHRvIHVzZSBkZXZpY2UgdGhhdCB3YXMgcHJl
dmlvdXNseSBhc3NpZ25lZCB0bw0KPj4+PiBhbm90aGVyIGd1ZXN0LiBCdXQgcGNpc3R1Yl9wdXRf
cGNpX2RldigpIGNhbGxzDQo+Pj4+IF9fcGNpX3Jlc2V0X2Z1bmN0aW9uX2xvY2tlZCgpIHdoaWNo
IGZpcnN0IHRyaWVzIEZMUiwgYW5kIGl0IGxvb2tzIGxpa2UNCj4+Pj4gaXQgd2FzIGFkZGVkIHJl
bGF0aXZlbHkgcmVjZW50bHkuDQo+Pj4gDQo+Pj4gUmVwbHlpbmcgdG8gYW4gb2xkIHRocmVhZC4u
IEkgb25seSBub3cgcmVhbGl6ZWQgSSBmb3Jnb3QgdG8gcmVwbHkgdG8gdGhpcyBtZXNzYWdlIGVh
cmxpZXIuDQo+Pj4gDQo+Pj4gYWZhaWsgdGhlc2UgcGF0Y2hlcyBhcmUgc3RpbGwgbmVlZGVkLiBI
w6Vrb24gKENDJ2QpIHdyb3RlIHRvIG1lIGluIHByaXZhdGUgdGhhdA0KPj4+IGhlIGdldHMgYSAo
ZG9tMCkgTGludXgga2VybmVsIGNyYXNoIGlmIGhlIGRvZXNuJ3QgaGF2ZSB0aGVzZSBwYXRjaGVz
IGFwcGxpZWQuDQo+Pj4gDQo+Pj4gDQo+Pj4gSGVyZSBhcmUgdGhlIGxpbmtzIHRvIGJvdGggdGhl
IGxpbnV4IGtlcm5lbCBhbmQgbGlieGwgcGF0Y2hlczoNCj4+PiANCj4+PiANCj4+PiAiW1hlbi1k
ZXZlbF0gW1BBVENIIFYzIDAvMl0gWGVuL1BDSWJhY2s6IFBDSSByZXNldCB1c2luZyAncmVzZXQn
IFN5c0ZTIGF0dHJpYnV0ZSI6DQo+Pj4gaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0
bWwveGVuLWRldmVsLzIwMTctMTIvbXNnMDA2NTkuaHRtbA0KPj4+IA0KPj4+IFtOb3RlIHRoYXQg
UEFUQ0ggVjMgMS8yICJEcml2ZXJzL1BDSTogRXhwb3J0IHBjaWVfaGFzX2ZscigpIGludGVyZmFj
ZSIgaXMgYWxyZWFkeSBhcHBsaWVkIGluIHVwc3RyZWFtIGxpbnV4IGtlcm5lbCwgc28gaXQncyBu
b3QgbmVlZGVkIGFueW1vcmVdDQo+Pj4gDQo+Pj4gIltYZW4tZGV2ZWxdIFtQQVRDSCBWMyAyLzJd
IFhlbi9QQ0liYWNrOiBJbXBsZW1lbnQgUENJIGZsci9zbG90L2J1cyByZXNldCB3aXRoICdyZXNl
dCcgU3lzRlMgYXR0cmlidXRlIjoNCj4+PiBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAxNy0xMi9tc2cwMDY2MS5odG1sDQo+Pj4gDQo+Pj4gDQo+Pj4gIltY
ZW4tZGV2ZWxdIFtQQVRDSCBWMSAwLzFdIFhlbi9Ub29sczogUENJIHJlc2V0IHVzaW5nICdyZXNl
dCcgU3lzRlMgYXR0cmlidXRlIjoNCj4+PiBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAxNy0xMi9tc2cwMDY2NC5odG1sDQo+Pj4gDQo+Pj4gIltYZW4tZGV2
ZWxdIFtQQVRDSCBWMSAxLzFdIFhlbi9saWJ4bDogUGVyZm9ybSBQQ0kgcmVzZXQgdXNpbmcgJ3Jl
c2V0JyBTeXNGUyBhdHRyaWJ1dGUiOg0KPj4+IGh0dHBzOi8vbGlzdHMueGVuLm9yZy9hcmNoaXZl
cy9odG1sL3hlbi1kZXZlbC8yMDE3LTEyL21zZzAwNjYzLmh0bWwNCj4+IA0KPj4gW2Ryb3BwaW5n
IExpbnV4IG1haWxpbmcgbGlzdHNdDQo+PiANCj4+IFdoYXQgaXMgcmVxdWlyZWQgdG8gZ2V0IHRo
ZSBYZW4gcGF0Y2hlcyBtZXJnZWQ/ICBSZWJhc2luZyBhZ2FpbnN0IFhlbg0KPj4gbWFzdGVyPyAg
T3BlblhUIGhhcyBiZWVuIGNhcnJ5aW5nIGEgc2ltaWxhciBwYXRjaCBmb3IgbWFueSB5ZWFycyBh
bmQNCj4+IHdlIHdvdWxkIGxpa2UgdG8gbW92ZSB0byBhbiB1cHN0cmVhbSBpbXBsZW1lbnRhdGlv
bi4gIFhlbiB1c2VycyBvZiBQQ0kNCj4+IHBhc3N0aHJvdWdoIHdvdWxkIGJlbmVmaXQgZnJvbSBt
b3JlIHJlbGlhYmxlIGRldmljZSByZXNldC4NCj4gDQo+IFJlYmFzZSBhbmQgcmVzZW5kPw0KPiAN
Cj4gU2tpbW1pbmcgdGhhdCB0aHJlYWQgSSB0aGluayB0aGUgbWFqb3IgY29uY2VybiB3YXMgYmFj
a3dhcmQNCj4gY29tcGF0aWJpbGl0eS4gVGhhdCBzZWVtZWQgdG8gaGF2ZSBiZWVuIGFkZHJlc3Nl
ZC4NCj4gDQo+IFVuZm9ydHVuYXRlbHkgSSBkb24ndCBoYXZlIHRoZSB0aW1lIHRvIGRpZyBpbnRv
IExpbnV4IHRvIHNlZSBpZiB0aGUNCj4gY2xhaW0gdGhlcmUgaXMgdHJ1ZSBvciBub3QuDQo+IA0K
PiBJdCB3b3VsZCBiZSBoZWxwZnVsIHRvIHdyaXRlIGEgY29uY2lzZSBwYXJhZ3JhcGggdG8gc2F5
IHdoeSBiYWNrd2FyZA0KPiBjb21wYXRpYmlsaXR5IGlzIG5vdCByZXF1aXJlZC4NCg0KSnVzdCBn
b2luZyB0aHJvdWdoIG15IG9sZCDigJxtYWtlIHN1cmUgc29tZXRoaW5nIGhhcHBlbnMgd2l0aCB0
aGlz4oCdIG1haWxzLiAgRGlkIGFueXRoaW5nIGV2ZXIgaGFwcGVuIHdpdGggdGhpcz8gIFdobyBo
YXMgdGhlIGJhbGwgaGVyZSAvIHdobyBpcyB0aGlzIHN0dWNrIG9uPw0KDQogLUdlb3JnZQ==


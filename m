Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA7F2516B3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 12:37:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAWKL-0004Qw-Ce; Tue, 25 Aug 2020 10:37:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cRSc=CD=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kAWKK-0004Qr-Aw
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 10:37:16 +0000
X-Inumbo-ID: 9937a8d5-9014-4864-a31a-1399b1514dd9
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9937a8d5-9014-4864-a31a-1399b1514dd9;
 Tue, 25 Aug 2020 10:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598351834;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pxLrsPA+3fTbppJ6ZPySM29QSEc6Aq04Hj8rioNmjU0=;
 b=Aafxci6qniOF0n6rtcWjmGMIBFTm9U5W1WhqBvFKPkI4Muyh+/9xGflW
 Msi6mCaThp6QLYVpPrGJSs8+gesxFghiw7arLz8BM/+oHj7sVq3ZBrL8L
 47J1wqB1U/usbZoYEq5FxZz3gOO/MTihn1nGp6LG3Q1Wz2R1KcSDOF8Og k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: ph7z6ZhSF3aFbHy3as+X9BqjhP8J6AiYVv1Ww6dE9iY5hhb3EH+JTapu/Sh84JVMtuPoZ2jS8N
 8LpOyK8fl5sFvN0+HGMEyR8xLXhRp1P9Gch3KKUYDoR+4risVHiv86Jga7KtHTIV4xKK1w9S1c
 6GSyKbAzoc3QkBb4luH7OUZ/SrnFXQHIsOrBBGORBKi/k3gM1SPMonGkYXxZJO0bTvByl71SkX
 6eiu5BWRlmpc0G9ZRSxzkuR8cGyjYCWfh/L7g2uyY8wu9VvX0pCqSwBAptHNyXt7z8tUfuPwlr
 XxY=
X-SBRS: 2.7
X-MesageID: 25374419
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,352,1592884800"; d="scan'208";a="25374419"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+lrfMUp7d6Du7sm7bD4b2qJ8GXehL8kEJjd9gX11YA3DC5dbLkv0/tWE+bPLAzuNTweu/J6xNKTpzkrXzACFkW0yKOfRxdugmz7WryTgcU00bnkmn/AahiGbOT3nNzTqIHGjc5y3nQwsdvLIw96J2xhUUtF/wp1qxvKM0gVvCVJVUfmv9K+JPlGkj82rX5wxGkH0gbTjnqRads8HIZXo6RtqJhn51mryzMEHD04YiCyCj18zk6yI5T7x+DCba1oV5FUt8B+PEdcMGJi1goHQPuV+tLBKlC+A4Zq79kct1JUdP7Qy5kocqB6P+KCVNnYi7QS2gW5lNHBKYj0d7BG2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxLrsPA+3fTbppJ6ZPySM29QSEc6Aq04Hj8rioNmjU0=;
 b=ZKUBEYVgVTYAcVGqTzdSJ1yxu8XZshPdokb7IURGKDpQ3kIXrWRmIv8WtltwyM8spdoT51BwbrOGkUbXjETW56zfevZHNAi/oHTh22QXlwajzmODonNmYbAGCg785yLoK/iWcyp3O2Pg1V7pTtX7gHw0k+AHfdi3mwbHG/2LWcWJxNfCzu86Mw0Tr12/7Ud60UEgXK46Jq6flvymZyQYubHFJPZAKqWRQj8h1vPi0crcispwZAOdjx0hMhWpKSoXEIkkZb7Nbz+Ns+8jcdFQ9sl/s0vctT+yjJWk5KlBfOgv8l12uFiOQVY4q1drF7njSKmrBGBXOh+cgmzk2e8JFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxLrsPA+3fTbppJ6ZPySM29QSEc6Aq04Hj8rioNmjU0=;
 b=j5/JN/yTugzH8nH9S0yzXvhQCfGcnj0Dx0jaXT6SgTuZFdS8VyW6CVxpkW5X+xaOey6rA332XzxCEyyuza0vQWRGBDcCVgtMbtwcopNwxgAfYG3DbHCKavNPw0QFj9UMIllQxgntjWDmoSPuHzaYKfK5cIQCmosVjNtER96TrX8=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, Anthony Perard
 <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
Thread-Topic: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
Thread-Index: AQHWaW0Cnjv2J5dpD0iO4FcEWA2no6kn31uAgAAShQCAAAIpAIAABZqAgAAA3oCAAADsgIAAAV+AgAALJACAHzPlgIAAHe+AgAEqsYCAAEAOAA==
Date: Tue, 25 Aug 2020 10:37:09 +0000
Message-ID: <B99E1A82-FBE8-4EE3-943A-4384BA504184@citrix.com>
References: <e8dd70a7-bdde-e12a-3f4d-f52e58016234@suse.com>
 <20200804141639.k2tpoqy7jj34gcm6@liuwe-devbox-debian-v2>
 <CAEBZRSf4opmGw2fDOCOMZLTtjisFXaP=Oe9aD6E2fTfUs2YFQQ@mail.gmail.com>
 <0deed4c6-ca87-09d3-a19c-ac0c00003cb7@suse.com>
 <20200804155043.vq7aupbrvmmcgzlv@liuwe-devbox-debian-v2>
 <12790d2b-020d-b6fe-4924-2233a4e93d83@suse.com>
 <20200804155707.rrtzkksrle2nojbj@liuwe-devbox-debian-v2>
 <43f706e4-0292-5758-eb19-9fbb99b1337e@suse.com>
 <CAEBZRSc=xUjYq7ao9Rv-EEJsjiBkt5mio5QofvixErZj_SJUcw@mail.gmail.com>
 <289981a3-9baf-bf6a-abbd-e4d613709f2a@suse.com>
 <20200824145849.GA8275@FED-nrosbr-BE.crux.rad.ainfosec.com>
 <3e6858f4-bb63-5533-c523-cffd13503f2c@suse.com>
In-Reply-To: <3e6858f4-bb63-5533-c523-cffd13503f2c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1e6bf59-fdd2-45cc-989e-08d848e2d1d3
x-ms-traffictypediagnostic: BYAPR03MB4197:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB41970847C56CAB0CD746EA9B99570@BYAPR03MB4197.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kWXpgydUtv0lGY75D63dwPI6OSHWqklTzwmHwlIr5BVQ0WJbMktBmRFRcxGgiS8uoevd0GANaKmwNr52L0y0nXCcUuMZ92w+UmOS6kF9sstlGTM2Fp2ypdFduQ+yhNIK5heHJXgxxAUwVZCht2rsvzuPn68PB3fQUEzTEZr7r6iWhv14xj+B0S+9C4JwADSdfX0mxQ857aj0i8VDpRymANTrV2tYVK+UZxeZfxZfhRGSHgkm0QcB67vQGdE7NF+8M7SafxbrjUfXul2MvrqToTwHG6O+SpemZe9bH1aRtbnY7Ha4QlUD8D9lbiM93+ZH8DdO1SVMd5njJLE4a2xdGA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(26005)(6512007)(4326008)(186003)(2616005)(6506007)(83380400001)(8936002)(71200400001)(6486002)(107886003)(8676002)(53546011)(91956017)(66446008)(66476007)(66556008)(64756008)(478600001)(36756003)(54906003)(33656002)(76116006)(5660300002)(66946007)(316002)(86362001)(6916009)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: MP9qPuZwuIGJXcAQiRU+0v1zrkcaYJOtQr9vHfZYXhr3bWNnBNH3MXZuxOWOMYmllUhuX8Qw42MDYkwpKSCq4cV3vxotJbCv0SB1023ndMUl06T0ft8pAvohGtBMltCcLJ1xXZ0DQokxa8LZqYnNmIlmbgcaPEn29Bd8mTox2ZYEC7eQUQXq73Z622SeO2yFSJANnkjeZDmYKz0m991gkR7LiuTPOVEZPAc3RXYL4sMSFl9erX8ywz9LN4aSagfRfQeuETtk2FHlqV7SkT9aZBZXjo0EKvf3ccU8WYla/IxmLwJQv+4GyIlDRsdpcY0uPPuXDmf2sUJIXE3rxIq8Ftpas/UpXEJJ8sv8N3u52TcMl7fuiYQwGxsXHaD3jufVTJiuoa4gTFefk1dhS1mK++LHD+Ujs+SOUF7qC0B5tl+K6rQsgGAdtA+ecJTFgHVzRsKULGTPrb4bv7cQFn+xWp3U77ou84lJ6f20PZh6iC/tyLssleIAX3C/T8mutvXJ9Ke6llFtgLH5QQ/Hpm+h0aUEKHsHuw/oOiquJDBlLvuMDJeu6TwMCDGoTLvpJDgFM2zR1eB9iu+UeiTnNrJH/qkGGr7jyqqnbCTScJCN8MEsEvH/GVYxABg/65it7EQfuqcfE0YJOUXTf51JyfWWOA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <85880107A5774645A8C643D925A0ACA1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e6bf59-fdd2-45cc-989e-08d848e2d1d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2020 10:37:09.2049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ULCAAweRZNyRRqf4M8L43UPawGRwUJrF7x7mKODkMDSIuhGkfR6AgnFCF1Jysza9pqaXjIWDN4xnYRw8NM13rw6W3dYKrpUAAoLzkWZiWWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4197
X-OriginatorOrg: citrix.com
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXVnIDI1LCAyMDIwLCBhdCA3OjQ3IEFNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjQuMDguMjAyMCAxNjo1OCwgTmljayBSb3Nicm9v
ayB3cm90ZToNCj4+IE15IHVuZGVyc3RhbmRpbmcgd2FzIHRoYXQgeW91IHdlcmUgZ29pbmcgdG8g
dXNlIG1vdmUtaWYtY2hhbmdlZCB0byBmaXgNCj4+IHRoaXMgZm9yIG5vdyAoaXQgc2VlbWVkIGV2
ZXJ5b25lIGFncmVlZCB0aGlzIHdhcyB0aGUgcXVpY2tlc3Qgc2hvcnQtdGVybSBmaXgpLg0KPiAN
Cj4gQSB0ZWNobmljYWwgYW5kIGEgbm9uLXRlY2huaWNhbCByZW1hcms6DQo+IA0KPiBUaGlua2lu
ZyBhYm91dCB0aGlzIHNvbWUgbW9yZSwgSSdtIG5vIGxvbmdlciBjb252aW5jZWQgdGhlDQo+IG1v
dmUtaWYtY2hhbmdlZCBhcHByb2FjaCBpcyBhcHByb3ByaWF0ZSBoZXJlLiBJdCBpcyB0eXBpY2Fs
bHkNCj4gdXNlZCB0byBhdm9pZCB1cGRhdGluZyBmaWxlcyB3aXRoIGEgbGFyZ2Ugc2V0IG9mIGRl
cGVuZGVudHMNCj4gKGFsbCBvZiB3aGljaCB3b3VsZCBuZWVkIHJlLWJ1aWxkaW5nIGlmIHRoZSBm
aWxlIGluIHF1ZXN0aW9uDQo+IGNoYW5nZWQsIGV2ZW4gaWYgbWVyZWx5IGluIGl0cyB0aW1lIHN0
YW1wKSwgYW5kIHdoZXJlIHRoZQ0KPiBjb3N0IG9mIHJlLWdlbmVyYXRpbmcgKGFuZCBjb21wYXJp
bmcpIGlzIHJlbGF0aXZlbHkgbG93Lg0KPiBXaGlsZSBJIGNhbid0IHJlYWxseSBhc3Nlc3MgdGhl
IGNvc3QgcGFydCBoZXJlIChJIGtub3cgdG9vDQo+IGxpdHRsZSBvZiBQeXRob24gdG8gYmUgYWJs
ZSB0byBjb21wYXJlIGl0cyB1c2Ugd2l0aCBlLmcuIGENCj4gc2hlbGwgc2NyaXB0KSwgSSBkb24n
dCB0aGluayB0aGUgImxhcmdlIHNldCBvZiBkZXBlbmRlbmNpZXMiDQo+IGFzcGVjdCBhcHBsaWVz
IGhlcmUgYXQgYWxsLg0KPiANCj4gT24gdGhlIG5vbi10ZWNobmljYWwgc2lkZSBJIGhhdmUgdG8g
YWRtaXQgdGhhdCBJIGZpbmQgaXQsDQo+IHdlbGwsIHVuZnJpZW5kbHkgdG8gaGF2ZSBhIHBlcnNv
biBub3Qgb25seSBydW4gaW50byBhbmQNCj4gaW52ZXN0aWdhdGUgYSAocmVjZW50KSByZWdyZXNz
aW9uLCBidXQgYWxzbyBtYWtlIG11bHRpcGxlDQo+IGF0dGVtcHRzIGF0IGZpeGluZyAob3IgYXQg
bGVhc3Qgd29ya2luZyBhcm91bmQpIGl0LiBJJ2QNCj4gcmF0aGVyIHZpZXcgdGhpcyBhcyBwcmVm
ZXJhYmx5IHRoZSByZXNwb25zaWJpbGl0eSBvZiB0aGUNCj4gcGVyc29uIGhhdmluZyBpbnRyb2R1
Y2VkIGFuIGlzc3VlLiBJbiB0aGUgY2FzZSBhdCBoYW5kIGl0IGlzDQo+IHF1aXRlIGNsZWFyIHRo
YXQgSSB3YXNuJ3QgZXZlbiByZW1vdGVseSBhd2FyZSBvZiB0aGUNCj4gcmVxdWlyZW1lbnRzLCBh
bmQgaGVuY2UgZGV0ZXJtaW5hdGlvbiBhbmQgdGVzdGluZyBvZiBhIG1vcmUNCj4gYWRlcXVhdGUg
c29sdXRpb24gd291bGQgZmFyIGJldHRlciBiZSBkb25lIGJ5IHNvbWVvbmUNCj4gZmFtaWxpYXIg
d2l0aCBhbGwgdGhlIGluZmx1ZW5jaW5nIGZhY3RvcnMuIChUaGluZ3MgbWlnaHQNCj4geWV0IGJl
IGRpZmZlcmVudCBpZiBhbiBpc3N1ZSBpcyBkaWZmaWN1bHQgdG8gcmVwcm9kdWNlLCBidXQNCj4g
SSBkb24ndCBzZWUgdGhhdCBiZWluZyB0aGUgY2FzZSBoZXJlLikNCg0KWWVzLCB0aGlzIGhhcyBi
ZWVuIHN1Yi1vcHRpbWFsIGZvciB5b3UgdG8gaGF2ZSB5b3VyIGZ1bmN0aW9uYWxpdHkgYnJva2Vu
IGZvciBzZXZlcmFsIHdlZWtzLg0KDQpBcyBhbiBleHBsYW5hdGlvbiwgdGhlcmUgYXJlIGEgY29t
YmluYXRpb24gb2YgdGhpbmdzLiBZb3UgcHJvcG9zZWQgQSAocmVtb3ZlIHRoZSBkZXBlbmRlbmN5
KSwgSWFuIHByb3Bvc2VkIEIgKHVzZSBtb3ZlLWlmLWNoYW5nZWQpLCBidXQgd2XigJlyZSBob3Bp
bmcgdG8gZG8gQyAoaGF2ZSBhbiBleHRlcm5hbCB0cmVlKSBiZWZvcmUgdGhlIG5leHQgcmVsZWFz
ZS4gIEkgaGF2ZW7igJl0IGhhZCB0aGUgdGltZSB0byBsb29rIGludG8gZWl0aGVyIEIgb3IgQyAo
bm9yLCB1bmZvcnR1bmF0ZWx5LCB0byByZXZpZXcgTmlja+KAmXMgc3VibWlzc2lvbnMgdG8gb3Ro
ZXIgcGFydHMgb2YgdGhlIGNvZGUg4oCUIHNvcnJ5IE5pY2shKTsgYnV0IEnigJl2ZSBzdGlsbCBi
ZWVuIHJlbHVjdGFudCB0byBnbyBmb3IgQS4NCg0KSSB0aGluayBiYXNpY2FsbHksIHVubGVzcyBz
b21lb25lIGlzIHJlYWR5IHRvIHRhY2tsZSBCIG9yIEMgaW1tZWRpYXRlbHksIHdlIHNob3VsZCBq
dXN0IGNoZWNrIGluIEphbuKAmXMgZml4IChvciBwcm9iYWJseSBiZXR0ZXIsIGp1c3QgcmV2ZXJ0
IHRoZSBwYXRjaCB0aGF0IGludHJvZHVjZWQgdGhlIGRlcGVuZGVuY3kpLiAgSXQgd2lsbCBiZSBh
bm5veWluZyB0byBoYXZlIHRvIHBvdGVudGlhbGx5IGZpeCB1cCB0aGUgZ2VuZXJhdGVkIGdvbGFu
ZyBiaW5kaW5ncywgYnV0IHRoYXQgcHV0cyB0aGUgaW5jZW50aXZlcyBpbiB0aGUgcmlnaHQgcGxh
Y2UuDQoNCiAtR2Vvcmdl


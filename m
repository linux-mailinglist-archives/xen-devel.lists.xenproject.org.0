Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC9D252B73
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 12:34:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAskd-0000Op-D9; Wed, 26 Aug 2020 10:33:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wGzu=CE=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kAskc-0000Ok-Is
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 10:33:54 +0000
X-Inumbo-ID: b022565a-272d-46ce-a75e-cca20175af93
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b022565a-272d-46ce-a75e-cca20175af93;
 Wed, 26 Aug 2020 10:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598438032;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1J0RSBj88CXHUatCxfyKc3Yzs00lDrMn4zGDRd0dupw=;
 b=JIYQQSSzAChfoMONFZLli3WuD4hhgWxWwl2l59oedE3jJx3uZfpTSBW4
 pBVAbQV82hWpSZUUFkYtnMoRwG72hE7ESSHCTSmBfN4wg13KUCYqAJIPB
 5K4W2k22Zcj0YoWOmzLX4sMwR3T0k63xYInBvEpDiE/OlyfiApv343C8k Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: SZDpoTIgCkOmZjaNz5GT51EDAIICfUs8ThTf4eDJ8QKgnRAYTgMEw9I/L6nwQW2k6NXaTY77iw
 BUQn/NGKFz8r14+FPq5YBBJBIDkBMm81ywqLu5x6mLN1SruRYgWCTlr79OtPuG5IMSpr1Ut+Uj
 RFCM3exU1b0yQKSTAWHUBsV3Gi+5TcyURClsQFCjDaH1iXmVGFxUjT73SYVhcEnSYFldGw4Hqk
 3gkG3W13/fhiqRV8Cb017a9a9tPhstCd8i/zBc56Tn/wEOFbw7348XUarpnP0Wh5Vjo78DvU9c
 47A=
X-SBRS: 2.7
X-MesageID: 26267068
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,355,1592884800"; d="scan'208";a="26267068"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYhIlCl6eGGuPPnHij9g846r6osgmUlQ755pLhVWkjmP9mG7lB/EEgzG1GNdwb/dtDUimhtFbl93QLvxfOYl1K8Ie4TPvGYxQP5vJjr8hAaKqXAIkXH7pYnmfOjeBi4wii7vxFKrbPIvr7WsXuNgV6jcigL7Wn9zOV7mDeMKx9sBapERu18kH7WhiN2+aGygpgfDBVi4Ft3V+fqzFRBcCyW3GKD771I/+VtOzRjck56VCu7rPlLeBjQgWJOJmY++aABAKyq3zDSCeezF8kRz5jxtVDX7CaJG0hcDvdYksQhoJdD8vkZ7yIH/sgPXg3iJxevFwSH4BlFyolUHdE01WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1J0RSBj88CXHUatCxfyKc3Yzs00lDrMn4zGDRd0dupw=;
 b=AcKPiraVWdudfrsvn3YlCrwdnZAAQ5DWYJlzX099ckJC8f84S0OvD7J3rJ2Ot+U1afMdoYQMkbkBZiA6j/uW8mdeowApcLqZp5HZYkKKna/S3aGDkpdAKwrMNJptVu/pOqE8xUVglqGZsrGPo7wXDu4Wfl6aepmwQ8yVTdF3GULWxi88DixW0GDbS7l2409Oq4y0yZQatogPPdI5WLUc+LdiHBrmAK8JxAMWwVA4qgj7xs31IqRBowpT2JDQxyIVIa0dQo3RBQsnnQcidgN5SoYUEOngN6bPrn7dTpuvSNWyPpg6+nZvQvvBs8zXd1VJY/kB8FbDWLfpE+1zyZDBag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1J0RSBj88CXHUatCxfyKc3Yzs00lDrMn4zGDRd0dupw=;
 b=Z5aeWtIcs763+uBBqJX6HnLiQEboqe5DR9myEQAA/BppChkCGz0cRnz+olcW4ahQBcHDQinnLDkeyGmjETpT0Xze78m15tqHfXhNNwHhDTqLestUMDMSWoyCXaS0hu/iilAppKTm0Wk72HoFT6isGl23IMxoOiJTwV4Wy5tT290=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, Anthony Perard
 <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
Thread-Topic: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
Thread-Index: AQHWaW0Cnjv2J5dpD0iO4FcEWA2no6kn31uAgAAShQCAAAIpAIAABZqAgAAA3oCAAADsgIAAAV+AgAALJACAHzPlgIAAHe+AgAEqsYCAAEAOAIABYVSAgAAwEYA=
Date: Wed, 26 Aug 2020 10:33:48 +0000
Message-ID: <E62153E8-5EA8-46E5-AA12-6629F480A6BA@citrix.com>
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
 <B99E1A82-FBE8-4EE3-943A-4384BA504184@citrix.com>
 <ea3ab742-84e0-1e98-87ad-2e38b2224917@suse.com>
In-Reply-To: <ea3ab742-84e0-1e98-87ad-2e38b2224917@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97151c55-32d1-441c-8781-08d849ab84b5
x-ms-traffictypediagnostic: SJ0PR03MB5406:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR03MB54069B7002753DBD06F8117099540@SJ0PR03MB5406.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fT1ddkLfW+Uh8iypMNiJcp8LpZ5q/4BI8Vj6bLcUTWpNtToWRDNJVGG4ZojHedWsZwcNYEwD146MTlZMd7C+xqMsgnZByBDCQCxOcXdjKBwrueoCB1thqlXgvb8Y00L5Y5QYe5M2YGQn/dceH3MbX8fVzxG5QukasZckzyyFAjWhq2/fm2o9zAb6yg6y2HUZDxWVSJMqCvE6BHrLMVKGtMdLqZzGF/8cmdGxyhG0XczShK+K6etASd8Qo/MwtUqwbKQQA3i+JqB+/ezUp+MNeh+egOdtXXhGU9YWGQ3wiIV3FNZjz1OgZlo8P1UK6q46X8b6b5AZegnGmZ5EUgXgPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39850400004)(376002)(346002)(396003)(2906002)(86362001)(71200400001)(33656002)(6506007)(66556008)(66446008)(36756003)(66476007)(64756008)(5660300002)(316002)(66946007)(83380400001)(54906003)(76116006)(478600001)(91956017)(8676002)(6486002)(107886003)(2616005)(8936002)(6916009)(186003)(6512007)(53546011)(4326008)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: B8Op6L7ypE+grr6t3/bGanlN2YeaxG5GtIzePWePKZciUZL9ticKcvQkR7zg8rGhYdvrjXFV8EB0kcgDswkODAThnYeJlejJeoOXtL43Rs9y6TS3Xl2D4OASG1RkVyPtSXq487+24RBtKouRpER7quSe641HVrRwDmISPWh8xkgqVGzgJgIeguk18gHN4RI2IrwZTDofmqGfJZXoYOWRJ0r3/fH8fGL5/3/Td4smEISBA16QvUWYx8nzWeo129jku3kHJfmIZ26oTCi43LsbMDmXtafxenrKbVcfzzhcr/iUUWAq3IflklxpwjHlNxV1VxGfcOpmUiR3roC98uPQdYX6XPW6gZNWjC2VUhuMb+QCr8H5/JCpAK+88SuD9caLCqbgSTUpPbr/5W94IaAWYNK4TROoArinDygkG9Wcfr3kvvaK3gJeJLxcGjrz3GRDj0PDlFrfxXeYL+OVkeAmQgU3PezfdzLLUskAHvhHDTnGC6Vr9kLeX/f+SEG1nPfQIaLuaKf2smaO9PAWgLhkcKfgwEWAJhFtFA0hta7rjTc6UCWoGzWZh3oJ3AXs4+5or9VQCUKxkGWTy+4HnfMJ2bVFtM/sZkz+auyNmj7xtC7zQWdyKve7hrCe1ahBfQs98dD0Xs5agb4ELq8MveNm6g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <01666FC715A54B4F94726AE8A7DABCCB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97151c55-32d1-441c-8781-08d849ab84b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2020 10:33:48.6000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fQugYhu84Bj1MJC1K6cJ760n/U4XPFlhIc/iJkHVy8in/u44Dvf+PxmbiHYgnbslIrCtIrFZmyY8f3OIVyqfbzV7iCmcdP0KtBKi+0ypzMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5406
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

DQoNCj4gT24gQXVnIDI2LCAyMDIwLCBhdCA4OjQxIEFNLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjUuMDguMjAyMCAxMjozNywgR2VvcmdlIER1bmxh
cCB3cm90ZToNCj4+IEFzIGFuIGV4cGxhbmF0aW9uLCB0aGVyZSBhcmUgYSBjb21iaW5hdGlvbiBv
ZiB0aGluZ3MuIFlvdSBwcm9wb3NlZCBBIChyZW1vdmUgdGhlIGRlcGVuZGVuY3kpLCBJYW4gcHJv
cG9zZWQgQiAodXNlIG1vdmUtaWYtY2hhbmdlZCksIGJ1dCB3ZeKAmXJlIGhvcGluZyB0byBkbyBD
IChoYXZlIGFuIGV4dGVybmFsIHRyZWUpIGJlZm9yZSB0aGUgbmV4dCByZWxlYXNlLiAgSSBoYXZl
buKAmXQgaGFkIHRoZSB0aW1lIHRvIGxvb2sgaW50byBlaXRoZXIgQiBvciBDIChub3IsIHVuZm9y
dHVuYXRlbHksIHRvIHJldmlldyBOaWNr4oCZcyBzdWJtaXNzaW9ucyB0byBvdGhlciBwYXJ0cyBv
ZiB0aGUgY29kZSDigJQgc29ycnkgTmljayEpOyBidXQgSeKAmXZlIHN0aWxsIGJlZW4gcmVsdWN0
YW50IHRvIGdvIGZvciBBLg0KPj4gDQo+PiBJIHRoaW5rIGJhc2ljYWxseSwgdW5sZXNzIHNvbWVv
bmUgaXMgcmVhZHkgdG8gdGFja2xlIEIgb3IgQyBpbW1lZGlhdGVseSwgd2Ugc2hvdWxkIGp1c3Qg
Y2hlY2sgaW4gSmFu4oCZcyBmaXggKG9yIHByb2JhYmx5IGJldHRlciwganVzdCByZXZlcnQgdGhl
IHBhdGNoIHRoYXQgaW50cm9kdWNlZCB0aGUgZGVwZW5kZW5jeSkuICBJdCB3aWxsIGJlIGFubm95
aW5nIHRvIGhhdmUgdG8gcG90ZW50aWFsbHkgZml4IHVwIHRoZSBnZW5lcmF0ZWQgZ29sYW5nIGJp
bmRpbmdzLCBidXQgdGhhdCBwdXRzIHRoZSBpbmNlbnRpdmVzIGluIHRoZSByaWdodCBwbGFjZS4N
Cj4gDQo+IE9uZSBhZGRpdGlvbmFsIGFzcGVjdCB0byBjb25zaWRlciBpcyB0aGF0IEkgcmFuIGlu
dG8gdGhlIGlzc3VlIGFjdHVhbGx5DQo+IGluIGEgNC4xNCB0cmVlIChiZWNhdXNlIGl0IGp1c3Qg
c28gaGFwcGVuZWQgdGhhdCB0aGUgdGltZXN0YW1wcyBvZiB0aGUNCj4gaW52b2x2ZWQgZmlsZXMg
d2VyZSAicmlnaHQiIGZvciB0aGUgcHJvYmxlbSB0byBiZSBoaXQpLCBpLmUuIHdoYXRldmVyDQo+
IHdlIGRlY2lkZSB0byBkbyB3aWxsIGFsc28gZW5kIHVwIG5lZWRpbmcgYmFja3BvcnRpbmcuIFRv
IG1lIHRoaXMgbG9va3MNCj4gdG8gbWFrZSBBIGxlc3MgYXR0cmFjdGl2ZS4NCg0KSSBkb27igJl0
IHVuZGVyc3RhbmQgd2h5PyAgSWYgaXTigJlzIGEgcmVncmVzc2lvbiBpbiA0LjE0IGZ1bmN0aW9u
YWxpdHksIHdlIGhhdmUgdG8gYmFja3BvcnQgc29tZXRoaW5nIHRvIGZpeCBpdCBvbmUgd2F5IG9y
IGFub3RoZXIuDQoNCklmIHdlIHdlcmUgZ29pbmcgdG8gbGVhdmUgdGhlIGZ1bmN0aW9uYWxpdHkg
dGhlIHdheSBpdCBpcywgaXQgbWlnaHQgbWFrZSBzZW5zZSB0byBtYWtlIGl0IHNvIHRoYXQgdGhl
IGRlcGVuZGVuY3kgd2FzIHRyaWdnZXJlZCBvbmx5IG9uIHN0YWdpbmcvbWFzdGVyOyB0aGUgZ29h
bCwgYWZ0ZXIgYWxsLCB3YXMgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIGdlbmVyYXRlZCBmaWxlcyB3
ZXJlIHVwZGF0ZWQgd2hlbiBsaWJ4bF90eXBlcy5pZGwgd2FzIHVwZGF0ZWQgZHVyaW5nIGRldmVs
b3BtZW50Lg0KDQpCVFcsIG9uZSB3YXkgdG8gcHJldmVudCB0aGlzIGZyb20gaGFwcGVuaW5nIHdv
dWxkIGJlIHRvIGFkZCBhIHZlcnNpb24gb2YgdGhlIGJ1aWxkIHRvIHRoZSBHaXRsYWIgQ0kgbG9v
cCB3aGljaCB3b3VsZCBidWlsZCBvdXQtb2YtdHJlZSBhbmQgZmFpbCBpbiBhIHNpbWlsYXIgbWFu
bmVyLiAgSWYgdGhlcmUgaGFkIGJlZW4gc3VjaCBhIHRlc3QsIHRoaXMgY2hhbmdlIHdvdWxkIGhh
dmUgYmVlbiByZXZlcnRlZCBpbW1lZGlhdGVseS4NCg0KIC1HZW9yZ2UNCg0KDQoNCg0K


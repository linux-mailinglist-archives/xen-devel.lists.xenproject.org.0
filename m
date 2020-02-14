Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E66115E5F2
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 17:44:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2e3J-0005ta-9p; Fri, 14 Feb 2020 16:42:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0jOW=4C=microsoft.com=mikelley@srs-us1.protection.inumbo.net>)
 id 1j2e3H-0005tV-6O
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 16:42:51 +0000
X-Inumbo-ID: 095e28e6-4f49-11ea-b0fd-bc764e2007e4
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (unknown
 [40.107.237.112]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 095e28e6-4f49-11ea-b0fd-bc764e2007e4;
 Fri, 14 Feb 2020 16:42:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDyv/B1HgywKNhePWzZAzazBb2rbx0d6RXHNP4ZfdPSP8H5VDK4VsmT7n9PWkv6M02oK4y+0G+l19gw0Ps6q1Fk4H6i2tcvE0mclRJnAiG4wx/VLCOxffSd2ksBZLQX8EQIh5nvs/4PMFx5yaezs/mrvZiq7bCqRfliHf3v9TN17zddA55/oq00ZzqzS24DH1t1Iha3U8C2eASUtA+7O2WeNuLoRSnJD7tsKp5sCKCpiy1OtjOpFPhsl+NjM8ScW8SJ136kMDzFXzyV7zZj8D67pSkI+2RtGB/l/DqGRa6FFTuaELuOEujSr9DAv0xs2GPD+yvQWFma9an5zHbIMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62VGHS1WCmtD9c8epwijs8XdZNvsQl/O8jGZItqO8Lg=;
 b=WGEDGZoBtAKqilVakSXoKFMxkWWcr+beUt9koQLr9ZrqT/ZvlNNvDg49oyu5CUwSQqmf+j3K3b+VXNqZbPC72dUWXJa0zXLPoDb3PcBHOHgHu2cIylL2L7xIp1z1A2h9rksL+DRHGCEKA0rrORud8qnqRRJEba2eUb1DbM4GUMEgqx0t5DlvfW6pgYWGDvt2/EJkz4X+lV5SEw2l9PMpBitlM5RJnmHlZyiQWfZ5sx8mlJP3jxVzmr4axyzb3Kt+AVgP5A4nGE3AkKeWE8roLO9cghdhSz+EWCIwO7nYDgTdcDoggC/zryRPpDx1Et7FNAqTdysHzqMzXZOqnu1ZFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62VGHS1WCmtD9c8epwijs8XdZNvsQl/O8jGZItqO8Lg=;
 b=Iz5s4tIiuih0BmU9VGvUzklpms5MMubbkYXppKMIKG8Nqu3yLC4CbO8LmeP7o4Tifwb97PTWn1nUEPJ5FmJYhDrzBSQeq3pT4sacNoVKA7ZljQs2/2ERzGUFqOQaSsNgg0zuYUGPJ7Vn6yRjAcRKP7KmSjAeusWCWCbzerNakSI=
Received: from MW2PR2101MB1052.namprd21.prod.outlook.com (52.132.149.16) by
 MW2PR2101MB0924.namprd21.prod.outlook.com (52.132.152.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.3; Fri, 14 Feb 2020 16:42:47 +0000
Received: from MW2PR2101MB1052.namprd21.prod.outlook.com
 ([fe80::79be:4582:d077:d039]) by MW2PR2101MB1052.namprd21.prod.outlook.com
 ([fe80::79be:4582:d077:d039%6]) with mapi id 15.20.2729.010; Fri, 14 Feb 2020
 16:42:47 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 3/3] x86/hyperv: L0 assisted TLB flush
Thread-Index: AQHV4zMfjD20YAviSUGuOvGOMkqKj6ga4CsQ
Date: Fri, 14 Feb 2020 16:42:47 +0000
Message-ID: <MW2PR2101MB105273CC05CACB0F3B0F4AC2D7150@MW2PR2101MB1052.namprd21.prod.outlook.com>
References: <20200214123430.4942-1-liuwe@microsoft.com>
 <20200214123430.4942-4-liuwe@microsoft.com>
In-Reply-To: <20200214123430.4942-4-liuwe@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-02-14T16:42:45.9034313Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=108b8d20-d95b-4a87-a822-7f6f32e2a345;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mikelley@microsoft.com; 
x-originating-ip: [173.197.107.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0dd11969-789e-48cd-f1d1-08d7b16cec63
x-ms-traffictypediagnostic: MW2PR2101MB0924:|MW2PR2101MB0924:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR2101MB0924FB883ABFEEAAD49D3F7BD7150@MW2PR2101MB0924.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 03137AC81E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(189003)(199004)(66946007)(7696005)(478600001)(8676002)(64756008)(33656002)(66556008)(81156014)(66446008)(81166006)(4326008)(5660300002)(8936002)(66476007)(10290500003)(2906002)(52536014)(316002)(76116006)(55016002)(26005)(71200400001)(8990500004)(6506007)(54906003)(86362001)(110136005)(186003)(9686003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW2PR2101MB0924;
 H:MW2PR2101MB1052.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vFqx19OE/12nCMSvi9nD4seQQyVayw4Mk52b76pAiBh3BhmabtZvBl5RbdXVwW8Nqfn1AmRua9+yO0fuksO+AUm1b0kASZga/6d0Z2hWIbwaz5b+dQshu6/QJ3qq6CLEDNsW8BgPUN2De/LWK7OPcVBhqmySDtnqUaUD64MMLP7KVYsO5RGpyjrL1brQ8765ygilhWatrK+CqalVT0offxwPCSLGIXamn+GCnE5I3gTwTPb+oSxLe7qolg+QtFKaGBGvq8c4cHLhrEQEtiblvSzVB9l6NSGHvQ0AbeZ8EuPm5HhR4R2YwLZJfiG4wC9VGH6ir8n6FnWEiHWePHadeNM7VR7Mx7cFW5HGuJ7dN3WNaeswVdQwlI7x3EJBjMuoblQjX1vSXKk0SbVI9NoJNn26hPeb7aHcIrXTsm56+piNMEVL21CQLCxKmLvVAJYw
x-ms-exchange-antispam-messagedata: zj2KCCuY8fEX3fIKSC3aTM2FROJzd3J12btppQjsMdopL59sB59XNDTA9NZAW6JvRjvBYWE3odHj3xvgZXE4fBS6H68axH4dhD16vLJhSL0f6/c+md0g2tGDj/41rQ7+2xtfBtI9PBCtH/avJDItPw==
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd11969-789e-48cd-f1d1-08d7b16cec63
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2020 16:42:47.4653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BqX1tRPEPCAtHhYm3AgbwMJ0FIbvEDL3oX9vAaNdcNz6bSVhDeKSn8ZF7nL1P2xFQquJKXaevHgjnaHL7d2RDb6y28izlU3kkO+d7ivLxtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR2101MB0924
Subject: Re: [Xen-devel] [PATCH v2 3/3] x86/hyperv: L0 assisted TLB flush
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
 Paul Durrant <pdurrant@amazon.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdS54ZW5AZ21haWwuY29tPiBPbiBCZWhhbGYgT2YgV2VpIExp
dSBTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDE0LCAyMDIwIDQ6MzUgQU0KPiAKPiBJbXBsZW1lbnQg
TDAgYXNzaXN0ZWQgVExCIGZsdXNoIGZvciBYZW4gb24gSHlwZXItVi4gSXQgdGFrZXMgYWR2YW50
YWdlCj4gb2Ygc2V2ZXJhbCBoeXBlcmNhbGxzOgo+IAo+ICAqIEhWQ0FMTF9GTFVTSF9WSVJUVUFM
X0FERFJFU1NfTElTVAo+ICAqIEhWQ0FMTF9GTFVTSF9WSVJUVUFMX0FERFJFU1NfTElTVF9FWAo+
ICAqIEhWQ0FMTF9GTFVTSF9WSVJUVUFMX0FERFJFU1NfU1BBQ0UKPiAgKiBIVkNBTExfRkxVU0hf
VklSVFVBTF9BRERSRVNTX1NQQUNFX0VYCj4gCj4gUGljayB0aGUgbW9zdCBlZmZpY2llbnQgaHlw
ZXJjYWxscyBhdmFpbGFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWlj
cm9zb2Z0LmNvbT4KPiAtLS0KPiB2MjoKPiAxLiBBZGRyZXNzIFJvZ2VyIGFuZCBKYW4ncyBjb21t
ZW50cyByZSB0eXBlcyBldGMuCj4gMi4gRml4IHBvaW50ZXIgYXJpdGhtZXRpYy4KPiAzLiBNaXNj
IGltcHJvdmVtZW50IHRvIGNvZGUuCj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYv
TWFrZWZpbGUgIHwgICAxICsKPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgg
fCAgIDkgKysKPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi90bGIuYyAgICAgfCAxNzIgKysr
KysrKysrKysrKysrKysrKysrKysrKysrLQo+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3V0
aWwuYyAgICB8ICA3NCArKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAyNTUgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi91dGlsLmMKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0
L2h5cGVydi9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKPiBp
bmRleCAxODkwMmMzM2U5Li4wZTM5NDEwOTY4IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvTWFrZWZpbGUKPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01h
a2VmaWxlCj4gQEAgLTEsMiArMSwzIEBACj4gIG9iai15ICs9IGh5cGVydi5vCj4gIG9iai15ICs9
IHRsYi5vCj4gK29iai15ICs9IHV0aWwubwo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2L3ByaXZhdGUuaCBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5o
Cj4gaW5kZXggNTA5YmVkYWFmYS4uNzlhNzc5MzBhMCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaAo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBl
cnYvcHJpdmF0ZS5oCj4gQEAgLTI0LDEyICsyNCwyMSBAQAo+IAo+ICAjaW5jbHVkZSA8eGVuL2Nw
dW1hc2suaD4KPiAgI2luY2x1ZGUgPHhlbi9wZXJjcHUuaD4KPiArI2luY2x1ZGUgPHhlbi90eXBl
cy5oPgo+IAo+ICBERUNMQVJFX1BFUl9DUFUodm9pZCAqLCBodl9pbnB1dF9wYWdlKTsKPiAgREVD
TEFSRV9QRVJfQ1BVKHZvaWQgKiwgaHZfdnBfYXNzaXN0KTsKPiAgREVDTEFSRV9QRVJfQ1BVKHVu
c2lnbmVkIGludCwgaHZfdnBfaW5kZXgpOwo+IAo+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGlu
dCBodl92cF9pbmRleCh1bnNpZ25lZCBpbnQgY3B1KQo+ICt7Cj4gKyAgICByZXR1cm4gcGVyX2Nw
dShodl92cF9pbmRleCwgY3B1KTsKPiArfQo+ICsKPiAgaW50IGh5cGVydl9mbHVzaF90bGIoY29u
c3QgY3B1bWFza190ICptYXNrLCBjb25zdCB2b2lkICp2YSwKPiAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IGZsYWdzKTsKPiAKPiArLyogUmV0dXJucyBudW1iZXIgb2YgYmFua3Ms
IC1ldiBpZiBlcnJvciAqLwo+ICtpbnQgY3B1bWFza190b192cHNldChzdHJ1Y3QgaHZfdnBzZXQg
KnZwc2V0LCBjb25zdCBjcHVtYXNrX3QgKm1hc2spOwo+ICsKPiAgI2VuZGlmIC8qIF9fWEVOX0hZ
UEVSVl9QUklWSUFURV9IX18gICovCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnYvdGxiLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3RsYi5jCj4gaW5kZXggNDhm
NTI3MjI5ZS4uZjY4ZTE0ZjE1MSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2L3RsYi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi90bGIuYwo+IEBAIC0x
OSwxNSArMTksMTg1IEBACj4gICAqIENvcHlyaWdodCAoYykgMjAyMCBNaWNyb3NvZnQuCj4gICAq
Lwo+IAo+ICsjaW5jbHVkZSA8eGVuL2NwdS5oPgo+ICAjaW5jbHVkZSA8eGVuL2NwdW1hc2suaD4K
PiAgI2luY2x1ZGUgPHhlbi9lcnJuby5oPgo+IAo+ICsjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVy
di5oPgo+ICsjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVydi1oY2FsbC5oPgo+ICsjaW5jbHVkZSA8
YXNtL2d1ZXN0L2h5cGVydi10bGZzLmg+Cj4gKwo+ICAjaW5jbHVkZSAicHJpdmF0ZS5oIgo+IAo+
ICsvKgo+ICsgKiBJdCBpcyBwb3NzaWJsZSB0byBlbmNvZGUgdXAgdG8gNDA5NiBwYWdlcyB1c2lu
ZyB0aGUgbG93ZXIgMTIgYml0cwo+ICsgKiBpbiBhbiBlbGVtZW50IG9mIGd2YV9saXN0Cj4gKyAq
Lwo+ICsjZGVmaW5lIEhWX1RMQl9GTFVTSF9VTklUICg0MDk2ICogUEFHRV9TSVpFKQo+ICsKPiAr
c3RhdGljIHVuc2lnbmVkIGludCBmaWxsX2d2YV9saXN0KHVpbnQ2NF90ICpndmFfbGlzdCwgY29u
c3Qgdm9pZCAqdmEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgb3JkZXIpCj4gK3sKPiArICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQgPSAodW5zaWduZWQg
bG9uZyl2YTsKPiArICAgIHVuc2lnbmVkIGxvbmcgZW5kID0gc3RhcnQgKyAoUEFHRV9TSVpFIDw8
IG9yZGVyKSAtIDE7Cj4gKyAgICB1bnNpZ25lZCBpbnQgbiA9IDA7Cj4gKwo+ICsgICAgZG8gewo+
ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgcmVtYWluID0gZW5kIC0gc3RhcnQ7CgpUaGUgY2FsY3Vs
YXRlZCB2YWx1ZSBoZXJlIGlzbid0IGFjdHVhbGx5IHRoZSByZW1haW5pbmcgYnl0ZXMgaW4gdGhl
CnJhbmdlIHRvIGZsdXNoIC0tIGl0J3Mgb25lIGxlc3MgdGhhbiB0aGUgcmVtYWluaW5nIGJ5dGVz
IGluIHRoZSByYW5nZQp0byBmbHVzaCBiZWNhdXNlIG9mIHRoZSAtMSBpbiB0aGUgY2FsY3VsYXRp
b24gb2YgJ2VuZCcuICAgVGhhdCBkaWZmZXJlbmNlCndpbGwgbWVzcyB1cCB0aGUgY29tcGFyaXNv
biBiZWxvdyBhZ2FpbnN0IEhWX1RMQl9GTFVTSF9VTklUCmluIHRoZSBjYXNlIHRoYXQgdGhlcmUg
YXJlIGV4YWN0bHkgNDA5NiBwYWdlIHJlbWFpbmluZyB0byBiZQpmbHVzaGVkLiAgSXQgc2hvdWxk
IHRha2UgdGhlICI9IiBjYXNlLCBidXQgd29uJ3QuICBBbHNvLCB0aGUKJy0xJyBpbiAncmVtYWlu
IC0gMScgaW4gdGhlIGVsc2UgY2xhdXNlIGJlY29tZXMgdW5uZWVkZWQsIGFuZAp0aGUgJ3N0YXJ0
ID0gZW5kJyBhc3NpZ25tZW50IHRoZW4gcHJvcGFnYXRlcyB0aGUgZXJyb3IuCgpJbiB0aGUgcGFy
YWxsZWwgY29kZSBpbiBMaW51eCwgaWYgeW91IGZvbGxvdyB0aGUgY2FsbCBzZXF1ZW5jZSB0byBn
ZXQgdG8KZmlsbF9nYXZfbGlzdCgpLCB0aGUgJ2VuZCcgYXJndW1lbnQgaXMgcmVhbGx5IHRoZSBh
ZGRyZXNzIG9mIHRoZSBmaXJzdCBieXRlCm9mIHRoZSBmaXJzdCBwYWdlIHRoYXQgaXNuJ3QgaW4g
dGhlIGZsdXNoIHJhbmdlIChpLmUuLCBvbmUgYmV5b25kIHRoZSB0cnVlCidlbmQnKSBhbmQgc28g
aXMgYSBiaXQgbWlzbmFtZWQuCgpJIHRoaW5rIHRoZSBjYWxjdWxhdGlvbiBvZiAnZW5kJyBzaG91
bGQgZHJvcCB0aGUgLTEsIGFuZCBwZXJoYXBzICdlbmQnCnNob3VsZCBiZSByZW5hbWVkLgoKTWlj
aGFlbAoKPiArCj4gKyAgICAgICAgZ3ZhX2xpc3Rbbl0gPSBzdGFydCAmIFBBR0VfTUFTSzsKPiAr
Cj4gKyAgICAgICAgLyoKPiArICAgICAgICAgKiBVc2UgbG93ZXIgMTIgYml0cyB0byBlbmNvZGUg
dGhlIG51bWJlciBvZiBhZGRpdGlvbmFsIHBhZ2VzCj4gKyAgICAgICAgICogdG8gZmx1c2gKPiAr
ICAgICAgICAgKi8KPiArICAgICAgICBpZiAoIHJlbWFpbiA+PSBIVl9UTEJfRkxVU0hfVU5JVCAp
Cj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBndmFfbGlzdFtuXSB8PSB+UEFHRV9NQVNLOwo+
ICsgICAgICAgICAgICBzdGFydCArPSBIVl9UTEJfRkxVU0hfVU5JVDsKPiArICAgICAgICB9Cj4g
KyAgICAgICAgZWxzZSBpZiAoIHJlbWFpbiApCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBn
dmFfbGlzdFtuXSB8PSAocmVtYWluIC0gMSkgPj4gUEFHRV9TSElGVDsKPiArICAgICAgICAgICAg
c3RhcnQgPSBlbmQ7Cj4gKyAgICAgICAgfQo+ICsKPiArICAgICAgICBuKys7Cj4gKyAgICB9IHdo
aWxlICggc3RhcnQgPCBlbmQgKTsKPiArCj4gKyAgICByZXR1cm4gbjsKPiArfQo+ICsKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs

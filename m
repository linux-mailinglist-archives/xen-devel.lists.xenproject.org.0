Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1586FC01
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 11:19:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpUQx-0006Op-Bn; Mon, 22 Jul 2019 09:16:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wXcs=VT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpUQv-0006Ok-H3
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 09:16:37 +0000
X-Inumbo-ID: 5f186afc-ac61-11e9-bb7e-ab0968b45cb5
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f186afc-ac61-11e9-bb7e-ab0968b45cb5;
 Mon, 22 Jul 2019 09:16:33 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 22 Jul 2019 09:16:22 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 22 Jul 2019 09:16:09 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 22 Jul 2019 09:16:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jt7Ptsyu598LTls00qX/bQ7aI664FRLfcC0qy++hAkcD6oiDaL4JyBU3nNMwn1utMCXt4Mcgq+UL+aaKu7dPX4nGmcBEALqtwbBKXZPbE0OPVQ6bMm4DlMy5C6nY0gUabCYcuvoxbsn3wimIojXGaPsqthVKhicVgSTwopLYiXGUdV7++fCYOcUPn01ShQ7ENHEeKouPHfC7wdxSqItcmLhXK8/2jTD+zy5B+OtyuMoV5/0zUsX1NQ8byvnXiD+Prtt9rQzFoB7z4FfNIAnnMNNuVdPN21xEHSLT+oPJBrEewwHBNqxscHEaxEd4ljHAqdgjTaqG+OKMt69Ysbfnxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbVyaBzImDh218bQFFKnw4paz/0Mzsp/qtnKxUxPqMc=;
 b=ctu1VUt//NmV0uSl6sZbwc91PWOahfBD7vkkqmeHixP3Dcu3ENAS1hjDYmTZ3GkE9lyXAhSoachwYRWxAd9dRtHtjwov+f8vZpQzH0a4oGcYf8yuNWXlZe0lD2KakIXX9rZ71jhbPYgOfWDdTW0HnT0K2LLkz0scPewUppSWZuF8NXswubR8enPSkO31B/tf0ZX+j0rJ5ncnkikqREnti+ONf4IdT7ulvtqJo513yuCUVyHpc284UgIx5HNNL33YYwelKyKDsyLtz8vW4BBm3VUk8zSpRvv0Enh5jipMA0vTmXkIv/eHhX5tbBVa+8Dby7Sivz4C0ayz/wW+66wFTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3417.namprd18.prod.outlook.com (10.255.175.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 09:16:08 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 22 Jul 2019
 09:16:08 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andy Smith <andy@strugglers.net>
Thread-Topic: [Xen-devel] "CPU N still not dead..." messages during microcode
 update stage of boot when smt=0
Thread-Index: AQHVP//515Jyq7gbbE+1g3GDqkihQ6bWXCcA
Date: Mon, 22 Jul 2019 09:16:08 +0000
Message-ID: <7d518504-b12b-a6b9-dc37-7fdb00f8d632@suse.com>
References: <20190721200623.GJ11726@bitfolk.com>
In-Reply-To: <20190721200623.GJ11726@bitfolk.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0402CA0009.eurprd04.prod.outlook.com
 (2603:10a6:4:91::19) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c47c5cd1-4026-452b-f4bc-08d70e853b0a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3417; 
x-ms-traffictypediagnostic: DM6PR18MB3417:
x-microsoft-antispam-prvs: <DM6PR18MB34178A08B554BD2672AE6687B3C40@DM6PR18MB3417.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(199004)(189003)(3846002)(25786009)(15650500001)(6116002)(99286004)(2906002)(446003)(4326008)(6916009)(11346002)(2616005)(476003)(31686004)(478600001)(66066001)(386003)(6506007)(53546011)(102836004)(68736007)(76176011)(52116002)(486006)(14454004)(80792005)(229853002)(26005)(8676002)(186003)(53936002)(6486002)(31696002)(256004)(6436002)(14444005)(86362001)(5660300002)(66946007)(66556008)(66476007)(64756008)(71200400001)(71190400001)(66446008)(305945005)(6512007)(7736002)(36756003)(8936002)(81166006)(81156014)(6246003)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3417;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RQlNg7p/wBwnxVgB1bae63KL6pucgQvTGobj5LXDU28bQe/JdTA9Cu3hvecthAU16pYG4W/6ZvGU2c2P1lT5sqpSXohnbN4t8xolBIKLuvfIFZeRn7EHpUUVZ5qeMqNAiDZcrl9FMiQeA/hdx2r0sFl6h8v2TmShgpOJcMapEVyVhBMN07sCpc/GcPD9FJt2kew1TQ9t1liHGI1wi8FmXsBlUShuwiFR3Tgx0jdItMA1p/OU67mC/miqMj7r2ctIb+amZykYybfF1p9oPj70Caf98gCHwQn8HENUOY7F45CRFRDiVrJgIjpePbY8GvVgEIBRAcxg4jdj8FaxllIVAMihonZQR0d02F/5xj0mwSlEFMEfeo4GKMFPU4LtiBhy9zCYIG5br2P8fIs1woAccuVHRcY9PqXQXgC7Eq3jE+c=
Content-ID: <D69AE74C11F36F4E9C69DB698B59066A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c47c5cd1-4026-452b-f4bc-08d70e853b0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 09:16:08.2286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3417
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] "CPU N still not dead..." messages during microcode
 update stage of boot when smt=0
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDcuMjAxOSAyMjowNiwgQW5keSBTbWl0aCB3cm90ZToNCj4gSGksDQo+IA0KPiBNeSBm
aXJzdCB0aW1lIHVzaW5nIHNtdD0wIG9uIGh5cGVydmlzb3IgY29tbWFuZCBsaW5lIHNvIG5vdCBz
dXJlIGhvdw0KPiBtYW55IHZlcnNpb25zIGFuZCBkaWZmZXJlbnQgcGllY2VzIG9mIGhhcmR3YXJl
IHRoaXMgaGFwcGVucyB3aXRoLA0KPiBidXQgSSBub3RpY2VkIHRoaXMgZHVyaW5nIHRoZSBtaWNy
b2NvZGUgdXBkYXRlIHN0YWdlIG9mIGJvb3Q6DQo+IA0KPiAoWEVOKSBIVk06IEhBUCBwYWdlIHNp
emVzOiA0a0IsIDJNQiwgMUdCDQo+IChYRU4pIEFkZGluZyBjcHUgMSB0byBydW5xdWV1ZSAwDQo+
IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uDQo+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBk
ZWFkLi4uDQo+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uDQo+IChYRU4pIENQVSAxIHN0
aWxsIG5vdCBkZWFkLi4uDQo+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uDQo+IChYRU4p
IENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uDQo+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4u
DQo+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uDQo+IChYRU4pIENQVSAxIHN0aWxsIG5v
dCBkZWFkLi4uDQo+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uDQo+IChYRU4pIENQVSAx
IHN0aWxsIG5vdCBkZWFkLi4uDQo+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uDQo+IChY
RU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uDQo+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFk
Li4uDQo+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uDQo+IChYRU4pIENQVSAxIHN0aWxs
IG5vdCBkZWFkLi4uDQo+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uDQo+IChYRU4pIENQ
VSAxIHN0aWxsIG5vdCBkZWFkLi4uDQo+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uDQo+
IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uDQo+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBk
ZWFkLi4uDQo+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uDQo+IChYRU4pIENQVSAxIHN0
aWxsIG5vdCBkZWFkLi4uDQo+IChYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uDQo+IChYRU4p
IENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uDQo+IChYRU4pIFJlbW92aW5nIGNwdSAxIGZyb20gcnVu
cXVldWUgMA0KPiAoWEVOKSBtaWNyb2NvZGU6IENQVTIgdXBkYXRlZCBmcm9tIHJldmlzaW9uIDB4
MjAwMDA1NyB0byAweDIwMDAwNWUsIGRhdGUgPSAyMDE5LTA0LTAyDQo+IChYRU4pIEFkZGluZyBj
cHUgMiB0byBydW5xdWV1ZSAwDQo+IChYRU4pIEFkZGluZyBjcHUgMyB0byBydW5xdWV1ZSAwDQo+
IChYRU4pIFJlbW92aW5nIGNwdSAzIGZyb20gcnVucXVldWUgMA0KPiAoWEVOKSBtaWNyb2NvZGU6
IENQVTQgdXBkYXRlZCBmcm9tIHJldmlzaW9uIDB4MjAwMDA1NyB0byAweDIwMDAwNWUsIGRhdGUg
PSAyMDE5LTA0LTAyDQo+IChYRU4pIEFkZGluZyBjcHUgNCB0byBydW5xdWV1ZSAwDQo+IChYRU4p
IEFkZGluZyBjcHUgNSB0byBydW5xdWV1ZSAwDQo+IChYRU4pIFJlbW92aW5nIGNwdSA1IGZyb20g
cnVucXVldWUgMA0KPiAoWEVOKSBtaWNyb2NvZGU6IENQVTYgdXBkYXRlZCBmcm9tIHJldmlzaW9u
IDB4MjAwMDA1NyB0byAweDIwMDAwNWUsIGRhdGUgPSAyMDE5LTA0LTAyDQo+IChYRU4pIEFkZGlu
ZyBjcHUgNiB0byBydW5xdWV1ZSAwDQo+IChYRU4pIEFkZGluZyBjcHUgNyB0byBydW5xdWV1ZSAw
DQo+IChYRU4pIFJlbW92aW5nIGNwdSA3IGZyb20gcnVucXVldWUgMA0KPiAoWEVOKSBtaWNyb2Nv
ZGU6IENQVTggdXBkYXRlZCBmcm9tIHJldmlzaW9uIDB4MjAwMDA1NyB0byAweDIwMDAwNWUsIGRh
dGUgPSAyMDE5LTA0LTAyDQo+IChYRU4pIEFkZGluZyBjcHUgOCB0byBydW5xdWV1ZSAwDQo+IChY
RU4pIEFkZGluZyBjcHUgOSB0byBydW5xdWV1ZSAwDQo+IChYRU4pIFJlbW92aW5nIGNwdSA5IGZy
b20gcnVucXVldWUgMA0KPiAoWEVOKSBtaWNyb2NvZGU6IENQVTEwIHVwZGF0ZWQgZnJvbSByZXZp
c2lvbiAweDIwMDAwNTcgdG8gMHgyMDAwMDVlLCBkYXRlID0gMjAxOS0wNC0wMg0KPiAoWEVOKSBB
ZGRpbmcgY3B1IDEwIHRvIHJ1bnF1ZXVlIDANCj4gKFhFTikgQWRkaW5nIGNwdSAxMSB0byBydW5x
dWV1ZSAwDQo+IChYRU4pIFJlbW92aW5nIGNwdSAxMSBmcm9tIHJ1bnF1ZXVlIDANCj4gKFhFTikg
bWljcm9jb2RlOiBDUFUxMiB1cGRhdGVkIGZyb20gcmV2aXNpb24gMHgyMDAwMDU3IHRvIDB4MjAw
MDA1ZSwgZGF0ZSA9IDIwMTktMDQtMDINCj4gKFhFTikgQWRkaW5nIGNwdSAxMiB0byBydW5xdWV1
ZSAwDQo+IChYRU4pIEFkZGluZyBjcHUgMTMgdG8gcnVucXVldWUgMA0KPiAoWEVOKSBSZW1vdmlu
ZyBjcHUgMTMgZnJvbSBydW5xdWV1ZSAwDQo+IChYRU4pIG1pY3JvY29kZTogQ1BVMTQgdXBkYXRl
ZCBmcm9tIHJldmlzaW9uIDB4MjAwMDA1NyB0byAweDIwMDAwNWUsIGRhdGUgPSAyMDE5LTA0LTAy
DQo+IChYRU4pIEFkZGluZyBjcHUgMTQgdG8gcnVucXVldWUgMA0KPiAoWEVOKSBBZGRpbmcgY3B1
IDE1IHRvIHJ1bnF1ZXVlIDANCj4gKFhFTikgUmVtb3ZpbmcgY3B1IDE1IGZyb20gcnVucXVldWUg
MA0KPiAoWEVOKSBCcm91Z2h0IHVwIDggQ1BVcw0KPiAoWEVOKSBQYXJrZWQgOCBDUFVzDQo+IA0K
PiBJdCBkb2Vzbid0IGhhcHBlbiB3aXRoIHNtdD0xIGFuZCBpdCBhbHNvIGRvZXNuJ3QgaGFwcGVu
IHdoZW4gU01UIGlzDQo+IGRpc2FibGVkIGluIHRoZSBCSU9TLg0KPiANCj4gQm9vdCBkb2VzIGNv
bnRpbnVlIG5vcm1hbGx5IGFmdGVyIHRoaXMgcG9pbnQuDQo+IA0KPiBJcyB0aGlzIGV4cGVjdGVk
PyA0LjEyLg0KDQoiRXhwZWN0ZWQiIGlzbid0IHRoZSByaWdodCB3b3JkLiBJJ3ZlIG5vdGljZWQg
dGhpcyB0b28gb24gb25lIG9yIHR3bw0Kb2NjYXNpb25zLCBhbmQgSSBjYW4ndCAoeWV0KSBleHBs
YWluIHdoYXQncyBnb2luZyBvbiB0aGVyZSwgdGhlIG1vcmUNCnRoYXQgc28gZmFyIChpbmNsdWRp
bmcgeW91ciByZXBvcnQpIHRoaXMgaXMgb25seSBldmVyIGZvciB0aGUgZmlyc3QNCkNQVSB0byBn
ZXQgcmUtb2ZmbGluZWQuIFNvbWV0aGluZyB0byBiZSBsb29rZWQgaW50byBhcyB0aW1lIHBlcm1p
dHMuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

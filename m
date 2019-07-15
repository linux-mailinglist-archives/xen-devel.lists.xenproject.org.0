Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0594868696
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 11:46:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmxXG-0007Ly-NX; Mon, 15 Jul 2019 09:44:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hmxXF-0007Lt-3j
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 09:44:41 +0000
X-Inumbo-ID: 2339b7da-a6e5-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2339b7da-a6e5-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 09:44:39 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 09:44:27 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 09:24:05 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 09:24:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbuWDiSeY2rlrVWBMZpGwErMWLOlzjYWcY0J13ZVC22rRn/kZ43NfD00udgPwzsBpeRa3TiAkR4b2gO7L0LP24/TqmIgd6F7u/qIWOriEbHU4PnrPlDxt9HtJuiB1ZIyMERNP90Vn8FI7D+9KnTM7B6Jci2RbiwYutSt2bfnfvPpsbw1B0D8AOc1KIuC8dM9gX9KT5tQTHoMrHlRUDBs985PjVlORCdcqpuSponkme2GnRAky4BDgASdZ0L5sjxTQf0zZek+koga2kFXCh4POFFfzEQs65kBaV54aM6elRhRfyAkH1IInwub+/qIkv2ohborOmwb85VC8prCnyH++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXrr5nPb3dhOU6qJt1cgkNu4atgLf2h81TWJNh73a6A=;
 b=kYLcDuinIvjf3ZKpeagJ+YEyhp76/9qqv/kSofX2g019O9KWGiA9Gt9GBkPRgCeXxSHOl4oPqxy9f6uhjWs2Qoln3jbS8NY+POhl/8CbSiKXpMcOSWS/ZlqrNxkVa6YW4kLwMqvN8iYjt6jLjJpeMi/qMV1X3uJPGTi/qfEm7Ler9QtX8dLyovEuTj5U8ug6PX5zjT04eNAx0C/KaY1Vjl/D0IAbykdo9QOHyHx+vBjVfU4O0fHLKlggyg3itUABXqsqjCD/cogSQ1v8r1RYpMvIEeN06ICaYe/21IgzBcQXQmuiBwBADs8WWzXzTGV2TdJql3Ie14hlwQ0Mg4+Uxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2570.namprd18.prod.outlook.com (20.179.106.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 09:24:04 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 09:24:04 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [PATCH v2] xen/mm.h: add helper function to test-and-clear
 _PGC_allocated
Thread-Index: AQHVOu5JruoXiXL6K0+SvpwJHZPvbabLaDGA
Date: Mon, 15 Jul 2019 09:24:04 +0000
Message-ID: <1bdac424-c50e-309a-7a5b-125dbebf4a06@suse.com>
References: <20190715091756.39065-1-paul.durrant@citrix.com>
In-Reply-To: <20190715091756.39065-1-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0202CA0013.eurprd02.prod.outlook.com
 (2603:10a6:4:29::23) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a76d6d4-1cd1-404b-0b37-08d709062e06
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2570; 
x-ms-traffictypediagnostic: DM6PR18MB2570:
x-microsoft-antispam-prvs: <DM6PR18MB2570E88303F434469E351EE5B3CF0@DM6PR18MB2570.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(199004)(189003)(36756003)(186003)(14454004)(102836004)(26005)(2906002)(86362001)(31696002)(76176011)(6486002)(99286004)(53936002)(53546011)(25786009)(386003)(6436002)(6506007)(6512007)(6116002)(3846002)(80792005)(52116002)(6246003)(31686004)(4326008)(8936002)(4744005)(7416002)(6916009)(5660300002)(68736007)(476003)(256004)(8676002)(71200400001)(71190400001)(81166006)(305945005)(81156014)(7736002)(54906003)(316002)(478600001)(66946007)(66476007)(66556008)(486006)(229853002)(66446008)(66066001)(446003)(11346002)(64756008)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2570;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Glxj2WwSUu2ndr27bEtS1Vzeu+ALgVefS9Ztnvp1Sk1xeFvwuTs7wsY/Y+1RawOUlQ+UB/3XbB4cXop/V3WAq3w/zwtjSGHp5b6Gbb47wkPr6OeQjVn9v9R15IZgOSUDaBwAFWwyfRvky6qBGFc77WknlM4wGe8wDbe1E1qYIUotWaVIyfWGsQUQCtShQqiFEkSgU8AdxH8zxHCbQ51FGJaZxmGwWcrRvFV6X7Ebexh7JxgVXgLBBq/7J5zTMLfVJklWNlAUUaX2qv3TgLqjkNTDOuKgXtXxnJFJg76Ap4T6XZWFSMt/1oMmL683d00slHQ9BRya3RdW3+ed8WKZrYCD/LmHNUI6XYH7Sl92JyYnGWvVcXYv9+PJWGpEwT2CIVHGZu+HAXPUt9mWdv8ExhmyKvbusoGbn4QrztkhCN8=
Content-ID: <CFE5338B7B09FF49B596FF1A72D4659D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a76d6d4-1cd1-404b-0b37-08d709062e06
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 09:24:04.4345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2570
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] xen/mm.h: add helper function to
 test-and-clear _PGC_allocated
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMjAxOSAxMToxNywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiBUaGUgX1BHQ19hbGxv
Y2F0ZWQgZmxhZyBpcyBzZXQgb24gYSBwYWdlIHdoZW4gaXQgaXMgYXNzaWduZWQgdG8gYSBkb21h
aW4NCj4gYWxvbmcgd2l0aCBhbiBpbml0aWFsIHJlZmVyZW5jZSBjb3VudCBvZiBhdCBsZWFzdCAx
LiBUbyBjbGVhciB0aGlzDQo+ICdhbGxvY2F0aW9uJyByZWZlcmVuY2UgaXQgaXMgbmVjZXNzYXJ5
IHRvIHRlc3QtYW5kLWNsZWFyIF9QR0NfYWxsb2NhdGVkIGFuZA0KPiB0aGVuIG9ubHkgZHJvcCB0
aGUgcmVmZXJlbmNlIGlmIHRoZSB0ZXN0LWFuZC1jbGVhciBzdWNjZWVkcy4gVGhpcyBpcyBvcGVu
LQ0KPiBjb2RlZCBpbiBtYW55IHBsYWNlcy4gSXQgaXMgYWxzbyB1bnNhZmUgdG8gdGVzdC1hbmQt
Y2xlYXIgX1BHQ19hbGxvY2F0ZWQNCj4gdW5sZXNzIHRoZSBjYWxsZXIgaG9sZHMgYW4gYWRkaXRp
b25hbCByZWZlcmVuY2UuDQo+IA0KPiBUaGlzIHBhdGNoIGFkZHMgYSBoZWxwZXIgZnVuY3Rpb24s
IHB1dF9wYWdlX2FsbG9jX3JlZigpLCB0byByZXBsYWNlIGFsbCB0aGUNCj4gb3Blbi1jb2RlZCB0
ZXN0LWFuZC1jbGVhci9wdXRfcGFnZSBvY2N1cnJlbmNlcyBhbmQgaW5jb3Jwb3JhdGVzIGluIHRo
YXQgYQ0KPiBCVUdfT04oKSBhbiBhZGRpdGlvbmFsIHBhZ2UgcmVmZXJlbmNlIG5vdCBiZWluZyBo
ZWxkLg0KDQpUaGlzIGxhc3Qgc2VudGVuY2UgcmVhZHMgc29tZXdoYXQgc3RyYW5nZSB0byBtZSAt
IGFyZSB0aGVyZSB3b3Jkcw0KbWlzc2luZyBhbmQvb3IgbWlzLW9yZGVyZWQ/DQoNCj4gU2lnbmVk
LW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCg0KV2l0aCB0
aGUgY29tbWl0IG1lc3NhZ2UgYXNwZWN0IGNsYXJpZmllZA0KQWNrZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs

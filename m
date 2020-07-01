Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E722210AC3
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 14:08:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqbWq-00049f-Px; Wed, 01 Jul 2020 12:07:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WQY8=AM=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jqbWp-000482-5L
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 12:07:51 +0000
X-Inumbo-ID: 7a17a524-bb93-11ea-b7bb-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.48]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a17a524-bb93-11ea-b7bb-bc764e2007e4;
 Wed, 01 Jul 2020 12:07:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kk16XI+ghPhCiQkBBMS/XiXuQjLLelf2CkrmHTYrnEo7H6EUCtlhabsxqlVUQwJyBbHhXDuyQVpJs3GJxZrUDU+uSg4f8Taazwp01idOhoNcWxmX7rYHBnU0e/MajlJuG57zkiyYmUY5YWSk1SHJmFTvGmmf3viIJHA0Wr90G2ZrVFi4+3AFY+u8gRpPSVu1MYADCj29RBfk+hHsUBN/a1XUX4xT7+WlSYxSoOiKmmyv+FbzWtrAm/rfDza3sFzPRSQaojdX/2cT45l7MAbDv6hLj4kRyvE24sGKACLPEf1r4V6A9UqZ/frvNMYKTx2P7pkoIhyXvoBdRwEMnplZcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BgXuofRnRUjDAtDAEIx7EjssbYAkRtZRDtvRze2+00=;
 b=gRye+K4KqQRoMmgGvANMHzReRpGujyMUfdO1c+jQbdNVC38JYB8X6mDaX2MGrpJW6qkRlWA+Bn9ydwvlPEkzIgXy8nYyNnC1rHudYGv6jI3Q0msBj9PIwpUdDWUD80oaOordNSgDNgnHgaUFvGc0EaKOTdUYp+vxpuMDs5PJM70bbmCRAIEHdmRjeW/Nn2VovtZ2bKIbmKzyZKICrpTlXxDs56AryRJ2MPOF9T+yPw1S3qSjF0AeINcyU3ykH9O5prETNVNyAScAw+RZBMPtlZslWcY9qkx+ZFvBjHLtJIO/TaHS3z2deT69Qj1M6rwzarkK73OideBVt38zuniaYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BgXuofRnRUjDAtDAEIx7EjssbYAkRtZRDtvRze2+00=;
 b=Y/iarCbxIj/iAWfa5J4HY+VG79m27MGa8rnkt2XUG230UhU1zF8JOtFKACQPIbpJlMb/YvurA7qJrS6h5bciFfU9vcugrWKIFtanA7uwsQPbw/0KSJex3kYtmk1JP1hwfdlCQyqR3QKD5mVfa+SHoMRKz5nNu4AEzwf8mCySvqagsOHrhch5Q9gJ95sXEuJx3c4MwvQlJ33hl1TP6agchiLz/NyjEZOS5ZSGvUS764yHvBPkeQq18OYKRl9GrRuP4Z+n3YCAIlp9pYSFvoeObgH0XUZqhPpoGuRa8AHBKRHj22IvllAYe3IVD3HJoF4LqMyit6woBSMC5BkT8VMWRQ==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4148.eurprd03.prod.outlook.com (2603:10a6:208:c7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Wed, 1 Jul
 2020 12:07:46 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508%7]) with mapi id 15.20.3131.029; Wed, 1 Jul 2020
 12:07:46 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Oleksandr
 Andrushchenko <andr2000@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "ian.jackson@eu.citrix.com"
 <ian.jackson@eu.citrix.com>, "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v2] xen/displif: Protocol version 2
Thread-Topic: [PATCH v2] xen/displif: Protocol version 2
Thread-Index: AQHWT3f2pfc1d0tAak69A/eTMH1j5qjyit6AgAAWp4A=
Date: Wed, 1 Jul 2020 12:07:46 +0000
Message-ID: <b5a6e034-4d52-d6b2-7c14-3c44c4a19cc3@epam.com>
References: <20200701071923.18883-1-andr2000@gmail.com>
 <dffd127d-c5a1-4c77-baa8-f1d931145bc4@suse.com>
In-Reply-To: <dffd127d-c5a1-4c77-baa8-f1d931145bc4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16e11f91-0095-4161-c96f-08d81db75de3
x-ms-traffictypediagnostic: AM0PR03MB4148:
x-microsoft-antispam-prvs: <AM0PR03MB414890DDB4BD977086E4E45EE76C0@AM0PR03MB4148.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lN3ZWaG/J9hazq2j0S3E/Hrjn7fIstK5pCnPaJ/L1xmrGGq0HVHzA4Epnuyfliu+Bw7kcngnDePRnxQrUGos3j1cHrW3A/WWwTo5QZx3Dv7mXA8PwNqK4Q23oI+fh2j/JwbHoyQePQL8i6r/qChcVFzGY0/k/PgTjqNyYaLoVehV+kOOumEo2tbFY4JkjN0u/HNIFlGJ7SWNZIiM8iT26OzWwEyK2ZEYro4zMgGuKuTfIRMYaez52MByzVKvmPoio/ZItE0P2UKXte28tFhpuSp3reV0YPPGETbdBmA4/fH0hPWWrh+xTu/1Rj/yGKca
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(5660300002)(31696002)(8936002)(71200400001)(110136005)(26005)(478600001)(66946007)(8676002)(76116006)(66446008)(36756003)(64756008)(186003)(66476007)(66556008)(91956017)(6506007)(53546011)(316002)(31686004)(86362001)(2616005)(66574015)(6512007)(2906002)(83380400001)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: bgDLKx4MiH2V4pce61Y3B0jGJ12J66VLhaeopqr0RZHmgGrkCraJosEmB531Fc6QT1PzYqO5zg9cLQahMD5qXk4CS0C0COmBSa1z4rJIo1tKSxKHqeIttPsOKh0SXTKfNV7mco1I8OjbxjavexHNZUveL8H3iYbGLL+Ra7cplkm+Cs1ED6+zIpEjmnrc4IycCeSbuBosQDPNliVUj8Xhv5snslu6cISxIrsYmKyfedPQy4B+zuTdHO9+diIyf7e4GT0VuAFwTssM2oC+wsyDEhnYaqzkjihQ4bGZ2hdrh8puuikkH4+sa/4bxG+6rk+2lsIaKYkPnR2z38sS+0T9XEUKMVtgOIuMXXy87ApgY36k1Ni49qniXHhxIqmzrbka/J7MlHS+euRWxdso5QYmZOK+mN4D8g2RAWGOhPLO43MEqWtRHuh+e56xnxZHLVEvoki07bypps+R9xs2BBzwlgiGlDy8gdwREb2pHuhwvbs=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FC33300C47B714FA2EE8FB7A5313F55@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e11f91-0095-4161-c96f-08d81db75de3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 12:07:46.3050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: knorLwFEQjRjBE7g3ILmGciPcJ2duzx5uvY/xnhDDM0MVIJY4eo/655VC/95bsPn3rAHTYqX8/Ljq0S7rffJwCbdHsZKgWTdkpRgDckDirZ94zNqf/is3jWMrCnfMr9O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4148
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

T24gNy8xLzIwIDE6NDYgUE0sIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+IE9uIDAxLjA3LjIwIDA5
OjE5LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBB
bmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiAx
LiBBZGQgcHJvdG9jb2wgdmVyc2lvbiBhcyBhbiBpbnRlZ2VyDQo+Pg0KPj4gVmVyc2lvbiBzdHJp
bmcsIHdoaWNoIGlzIGluIGZhY3QgYW4gaW50ZWdlciwgaXMgaGFyZCB0byBoYW5kbGUgaW4gdGhl
DQo+PiBjb2RlIHRoYXQgc3VwcG9ydHMgZGlmZmVyZW50IHByb3RvY29sIHZlcnNpb25zLiBUbyBz
aW1wbGlmeSB0aGF0DQo+PiBhbHNvIGFkZCB0aGUgdmVyc2lvbiBhcyBhbiBpbnRlZ2VyLg0KPj4N
Cj4+IDIuIFBhc3MgYnVmZmVyIG9mZnNldCB3aXRoIFhFTkRJU1BMX09QX0RCVUZfQ1JFQVRFDQo+
Pg0KPj4gVGhlcmUgYXJlIGNhc2VzIHdoZW4gZGlzcGxheSBkYXRhIGJ1ZmZlciBpcyBjcmVhdGVk
IHdpdGggbm9uLXplcm8NCj4+IG9mZnNldCB0byB0aGUgZGF0YSBzdGFydC4gSGFuZGxlIHN1Y2gg
Y2FzZXMgYW5kIHByb3ZpZGUgdGhhdCBvZmZzZXQNCj4+IHdoaWxlIGNyZWF0aW5nIGEgZGlzcGxh
eSBidWZmZXIuDQo+Pg0KPj4gMy4gQWRkIFhFTkRJU1BMX09QX0dFVF9FRElEIGNvbW1hbmQNCj4+
DQo+PiBBZGQgYW4gb3B0aW9uYWwgcmVxdWVzdCBmb3IgcmVhZGluZyBFeHRlbmRlZCBEaXNwbGF5
IElkZW50aWZpY2F0aW9uDQo+PiBEYXRhIChFRElEKSBzdHJ1Y3R1cmUgd2hpY2ggYWxsb3dzIGJl
dHRlciBjb25maWd1cmF0aW9uIG9mIHRoZQ0KPj4gZGlzcGxheSBjb25uZWN0b3JzIG92ZXIgdGhl
IGNvbmZpZ3VyYXRpb24gc2V0IGluIFhlblN0b3JlLg0KPj4gV2l0aCB0aGlzIGNoYW5nZSBjb25u
ZWN0b3JzIG1heSBoYXZlIG11bHRpcGxlIHJlc29sdXRpb25zIGRlZmluZWQNCj4+IHdpdGggcmVz
cGVjdCB0byBkZXRhaWxlZCB0aW1pbmcgZGVmaW5pdGlvbnMgYW5kIGFkZGl0aW9uYWwgcHJvcGVy
dGllcw0KPj4gbm9ybWFsbHkgcHJvdmlkZWQgYnkgZGlzcGxheXMuDQo+Pg0KPj4gSWYgdGhpcyBy
ZXF1ZXN0IGlzIG5vdCBzdXBwb3J0ZWQgYnkgdGhlIGJhY2tlbmQgdGhlbiB2aXNpYmxlIGFyZWEN
Cj4+IGlzIGRlZmluZWQgYnkgdGhlIHJlbGV2YW50IFhlblN0b3JlJ3MgInJlc29sdXRpb24iIHBy
b3BlcnR5Lg0KPj4NCj4+IElmIGJhY2tlbmQgcHJvdmlkZXMgZXh0ZW5kZWQgZGlzcGxheSBpZGVu
dGlmaWNhdGlvbiBkYXRhIChFRElEKSB3aXRoDQo+PiBYRU5ESVNQTF9PUF9HRVRfRURJRCByZXF1
ZXN0IHRoZW4gRURJRCB2YWx1ZXMgbXVzdCB0YWtlIHByZWNlZGVuY2UNCj4+IG92ZXIgdGhlIHJl
c29sdXRpb25zIGRlZmluZWQgaW4gWGVuU3RvcmUuDQo+Pg0KPj4gNC4gQnVtcCBwcm90b2NvbCB2
ZXJzaW9uIHRvIDIuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPg0KPiBSZXZpZXdlZC1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQpUaGFuayB5b3UsIGRvIHlvdSB3YW50
IG1lIHRvIHByZXBhcmUgdGhlIHNhbWUgZm9yIHRoZSBrZXJuZWwgc28NCg0KeW91IGhhdmUgaXQg
YXQgaGFuZCB3aGVuIHRoZSB0aW1lIGNvbWVzPw0KDQo+DQo+DQo+IEp1ZXJnZW4=


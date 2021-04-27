Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C0336CE66
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 00:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118913.225219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbVlQ-0008GF-N9; Tue, 27 Apr 2021 22:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118913.225219; Tue, 27 Apr 2021 22:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbVlQ-0008Fq-Jm; Tue, 27 Apr 2021 22:01:04 +0000
Received: by outflank-mailman (input) for mailman id 118913;
 Tue, 27 Apr 2021 22:01:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m5m6=JY=starlab.io=scott.davis@srs-us1.protection.inumbo.net>)
 id 1lbVlO-0008Fl-QO
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 22:01:03 +0000
Received: from GCC02-BL0-obe.outbound.protection.outlook.com (unknown
 [40.107.89.119]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d24e2f0f-6adb-4411-a457-69e338c3ae5f;
 Tue, 27 Apr 2021 22:01:01 +0000 (UTC)
Received: from MN2PR09MB5258.namprd09.prod.outlook.com (2603:10b6:208:220::11)
 by MN2PR09MB4922.namprd09.prod.outlook.com (2603:10b6:208:216::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Tue, 27 Apr
 2021 22:00:56 +0000
Received: from MN2PR09MB5258.namprd09.prod.outlook.com
 ([fe80::2939:7b58:8863:9a07]) by MN2PR09MB5258.namprd09.prod.outlook.com
 ([fe80::2939:7b58:8863:9a07%7]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 22:00:56 +0000
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
X-Inumbo-ID: d24e2f0f-6adb-4411-a457-69e338c3ae5f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoQJ1EiPsungv3GiBzBTvZSiDXfG22wewC1QxqzQEH2OCyqdF9jwUGaSFiGXumwHDPGVpr7k6C6cB3s6IdFpKVzNhnMiQCXTcUpKGdPYnb5hW8XW6P6afET7iVwsBKprSS5jNN38xXgSH5E7J7IuJ3ptrjW8ncNLfXJSbo3hkeO9CXXGadULUPM2CgMtJe4PXNXu+C+csA7bJRl0ynnWfMd1KiFoH0jY73R+zQ6f25EnpiaIhxVjhKfeUSzDnXN5o4ZmVljVS+keCX683StlxfGHNkevleNBtTOznx6mq8EVBjdGnZCxF7lllBiqvWE7d4neTZkCuFsl4+seyF416g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8j6s5msbrbc5bV7Il9956h/ZbycnyfmCNCvD4b0gyE=;
 b=dcw9P13qq6w4CZ9IDqyTzGFo3PWLZMYKqMvvUmPTyFl1ly5nVNxuoUT+CG6pWN9+MkJBluVBLWRWeUMTjbkmdRyXWs5WoifvO8wIKq+7yYyhNjAmDDu7dfKtMmoqRZWvGTssT9sms3W2mYUYGS4z1CHNTSjiCC1t2KjygbiMtukUgmbXSrjWku2dzZGvxyNkkzShtICuZZPKbXnxkVfNvIU03NiIZPA0lJla8aYjyN4grx94UJX1NBerV9haNFRSq47TJVj2F8rqv5JIpA4atBN2UYutPf7OfB+6reBkWdH3GPpjcwSCU5pg8ExLvkV52vUKD5a/FOJP0SpEtFUNlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starlab.io; dmarc=pass action=none header.from=starlab.io;
 dkim=pass header.d=starlab.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starlab.io;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8j6s5msbrbc5bV7Il9956h/ZbycnyfmCNCvD4b0gyE=;
 b=PRa48NEyD6WjwY+Z/WEYdRBjgn05CuAyvzwdMQno5wQaW1BUnusxh73c7ieJofSGQLbHUWp0DQGp8wU88y56SC5D+sO5mgnKkGaof2DPuDKMEyPNfJ0HGfbBiKw15hG6flWyNl3E0Z6m0HX1BCQsuycsAl6kclZ3Fr0SfKEeraw=
From: Scott Davis <scott.davis@starlab.io>
To: Jan Beulich <jbeulich@suse.com>, Scott Davis <scottwd@gmail.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] iommu: make no-quarantine mean no-quarantine
Thread-Topic: [RFC PATCH] iommu: make no-quarantine mean no-quarantine
Thread-Index: AQHXOsEjPlXZorMQi0Kt8384oCpmdqrH72EAgAC5poA=
Date: Tue, 27 Apr 2021 22:00:56 +0000
Message-ID: <56F61E81-511E-4ECA-B2A0-B91F250804D7@starlab.io>
References:
 <0a292d952ff71dbfed5234d27b42a05f7b49a1fe.1619451434.git.scott.davis@starlab.io>
 <cea1d2d0-fd69-a4cd-6653-dd881d07b96a@suse.com>
In-Reply-To: <cea1d2d0-fd69-a4cd-6653-dd881d07b96a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=starlab.io;
x-originating-ip: [73.133.107.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2937f64-52c9-4920-58c0-08d909c7ef26
x-ms-traffictypediagnostic: MN2PR09MB4922:
x-microsoft-antispam-prvs:
 <MN2PR09MB49220B5BB0D6E93E3E9FA76591419@MN2PR09MB4922.namprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oHcUE5vKO4DW8Dyu4K1bT8P5fFVNDuOUnIjHmcwTMaNhldIbc2pGU+QZKMHVOYwxaOoEdoovO4YsafCA/ufgK6hsxxM70JaY3j/hwm0FK359KJXMiklF7gONNjzPvbhHPXKgqdSHoxVBXY565x8itn7TXOwNA97WHBESzs6RWF94idbDA1EY6bT8xQhAY+8jaMK8hVwC+W951+3ZZ3ZTo4kTp1q/KSU9YsyQwRAhvzrnDjz4WiBPUZ4rAjyZG64ROwf1uCJFWJ8oap6rxvkolmj5Gv+eVCl7mJJJq229LP5/cBeMDaTPsOyd366vSS3rgXmUGd70ovqTuTJ+qexgZqUmfNYA9Re3rCAr5voxgDjNQwDcNY32TkH7Za6a9QeaKk0p5Ai/kHb4AH3HT01BuZDfKK1uMqzoAgAdtewIkupe901vMmaaUe7++tMkVJNvxD/yN9OPoKWIXbykwQHA6Js9Jr6XLFkC5aZrhINSx0AOmWmAoCA4CQFBG09gfygevxAduVxFv4FeDJTLCo/yWSeluOEfMq/l8L0fOhhajL1fMiQ1n+/4IhpCGXrUQUVJTOTRqCrwHJ9mGi0Gt4IBkKui3YHVOO0UZ5y8k4a6as/l6BRPrcy0AXcIZQbrm2Hkotz2NaJkRR1c7oxcfedz67giKSP7Z92/dOeVJdg6Jd4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR09MB5258.namprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(66556008)(64756008)(66446008)(76116006)(66946007)(33656002)(66476007)(186003)(86362001)(2616005)(26005)(6506007)(6486002)(71200400001)(6512007)(83380400001)(5660300002)(7416002)(44832011)(508600001)(122000001)(2906002)(4326008)(8936002)(110136005)(36756003)(53546011)(38100700002)(8676002)(54906003)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?NDZ5NjVqR2s4anZSN2lUWjVPVDQ1WTkvbTRvTllUbHlkZnJkVDdqVzcrVEF0?=
 =?utf-8?B?UkhadmtZYkNXU21JNXJqWWFTejdJN1hsQ2lyUW5veHM3RmtCaVpqVElEWnhq?=
 =?utf-8?B?NUVTckJYYWN6ZzRsemtXanNZT0VtZ3RaT2ZGVmlzVE1YSnJVYTZYWmhyWlZU?=
 =?utf-8?B?SGdaVTdwTTF3OGN3QytYK2JYdnZzTENqRkV5bFFhYzlyK21vaDBkM0NlblY4?=
 =?utf-8?B?WVFqQVpIQVJMaDhhSDlscThEN1pxbHlFbUZvVWFVaWk5TEF4SDJ0QURrOEhS?=
 =?utf-8?B?dktWb3Myc3ZHOGttSEdNZ0UvSWk4UUJjc3FyVmNrRlR3cWg1SWdFL0dOMHdr?=
 =?utf-8?B?b2paZ3dMWXNvcXJraW5RM2t6bDBlKzVBcHVIUEd1T1JpM1ZsVXk0dDN4YytG?=
 =?utf-8?B?V0lXWW9vL0ZLbzR3MzNqSHN6ZFc4UG02bXlaclZwbTZUUFBqektOYnNCa3V1?=
 =?utf-8?B?Nmg4ektyVU90a3VSQjEvRzdSTGFrY1VEZ2tyWUhyQTdqY1RaWURhVUFGMTJa?=
 =?utf-8?B?SEp1QXIvZTVSREc5RUtqeUk4TFVMNWpjU3pxQ1VmcVNYQzNYOFN3RW5FMEZO?=
 =?utf-8?B?eTBiSFQwMS9COS9aSEgrNE1mRlRQaFM5T0xQVGltM0VZdVg1aDRJd0xNTXNR?=
 =?utf-8?B?djEzVE5DS1RJY1o5aUwzaFFuK3pCWDkrb3ZkelB3WXhBbkR3VUdmL2pHcWoy?=
 =?utf-8?B?NHFWc1ZFcE1GWHpYYUlSVGxvcnFRZi9nQXRHZ3k4Yktmcmp5WHZmK0o3Y05E?=
 =?utf-8?B?Q0dJWlBSMVlFVXVRZDRkZXdPS3FlUWdFS2Z6N2FyM2d2K0JMUXg5SWFFVGh0?=
 =?utf-8?B?RE9Zc0Zhd1JhcWd3Q0toNEpoTFA4aFFNeC82U0pZTXkrZDVaVElYZEE2UDZW?=
 =?utf-8?B?K2lLZlJmb3o2N1dNcFg1ckNKQ0wxSHp3bmdMb2lTbFI3aUw0N2RINlF2WlFr?=
 =?utf-8?B?NHZhK2NjMUxocUlzT1dlbXc0dUxTKzNiWEJPdHNlTllkWDg1eG1KN3lPSVd3?=
 =?utf-8?B?S0ZpZmJUd000SHdvQ1ozTTdqbTNwVm9JcHNPYU42djZBcWlsUlBLam40eWRj?=
 =?utf-8?B?K0laTXBoUFc4NjRiQnNhRnM0ZnhjdGdGRmZxLzBJY20xTmhQWFlJaXpqZjJN?=
 =?utf-8?B?blZKTjhqVDRsQlo3TzhVZVJRcDRaOWlkYWZZeW5GU0VMYkJTeFVBaEQ4Zmlx?=
 =?utf-8?B?RVJTNXJlYVROZ09hdy96ditjUUpCUTZqTkJZVS9CUGxjZjc4Y1U4UXZMMDdq?=
 =?utf-8?B?VDNtR1VER29aalhnZmFWczhCajJEVWswUy94R25lamtKWElqTHBJaWU4MXhv?=
 =?utf-8?B?a3YvemxKNFRyVGZFNDk0cnZmbUFZdGdReStOQUMxWE1QSXdoUUJJSGtpYXdv?=
 =?utf-8?B?d0RRMG5pbk1FREpYUFhLcVJiZzlTM0VzRlYwbG5yaUlQbU5xUVE0YXRlTFdu?=
 =?utf-8?B?M2QxbTZxQlI2cXJsL01pOUx4M2JJckxtTGgxYjR4dHoyQ2Q5Q2NDQU1yZnVJ?=
 =?utf-8?B?MGIwcFlUZlliVDVwMnR4OTRFSzFrRGpDVU5kdmtwL0FJRFA1dGF4bDhPWHFR?=
 =?utf-8?B?MEY0REo1a25qTWp2WDE5OEExRXcyNUhyd1BPTTNkT202MHFMUnJHK3Z5MlZC?=
 =?utf-8?B?aFBZMmQrcE5qU1ZtMDMyOUplQmpxTzQvN0lLYUdweFhhdzkvRVU5SFFESmRS?=
 =?utf-8?B?MDQrMnZ4OFExZmllKy93MjZTdkZHUW0vTXh0OHJEVEIvZEd4OTNkVVhiMkZS?=
 =?utf-8?Q?mF55+77VVmy5kTBriLrNhKi1fvm7ZhVeIBq2lNu?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5857A24BE7BDE44EA470B30AAB758482@namprd09.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starlab.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR09MB5258.namprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2937f64-52c9-4920-58c0-08d909c7ef26
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 22:00:56.2138
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5e611933-986f-4838-a403-4acb432ce224
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR09MB4922

VGhhbmtzIGZvciB0aGUgZmVlZGJhY2ssIEphbiENCg0KT24gNC8yNy8yMSwgMjo1NiBBTSwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+IE9uIDI2LjA0LjIwMjEgMTk6MjUsIFNjb3R0IERhdmlzIHdyb3Rl
Og0KPj4gVGhpcyBwYXRjaCBtb2RpZmllcyBYZW4ncyBiZWhhdmlvciB3aGVuIG1ha2luZyBkZXZp
Y2VzIGFzc2lnbmFibGUgd2hpbGUgdGhlDQo+PiBpb21tdT1uby1xdWFyYW50aW5lIGNvbW1hbmQg
bGluZSBvcHRpb24gaXMgaW4gZWZmZWN0LiBDdXJyZW50bHkgdGhpcyBvcHRpb24NCj4+IG9ubHkg
YWZmZWN0cyBkZXZpY2UgZGVhc3NpZ25tZW50LCBjYXVzaW5nIGRldmljZXMgdG8gZ2V0IGltbWVk
aWF0ZWx5IGFzc2lnbmVkDQo+PiBiYWNrIHRvIERvbTAgaW5zdGVhZCBvZiB0byB0aGUgcXVhcmFu
dGluZSBkb21faW8gZG9tYWluLiBUaGlzIHBhdGNoIGV4dGVuZHMNCj4+IG5vLXF1YXJhbnRpbmUg
dG8gZGV2aWNlIGFzc2lnbm1lbnQgYXMgd2VsbCwgcHJldmVudGluZyBkZXZpY2VzIGZyb20gYmVp
bmcNCj4+IGFzc2lnbmVkIHRvIGRvbV9pbyB3aGVuIHRoZXkgYXJlIG1hZGUgYXNzaWduYWJsZSB3
aGlsZSBuby1xdWFyYW50aW5lIGlzIGluDQo+PiBlZmZlY3QuDQo+DQo+IFdlbGwsIHRoZSB0ZXJt
ICJxdWFyYW50aW5lIiB0byBtZSBtZWFucyBhIHNhZmV0eSBhY3Rpb24gdGFrZW4gX2FmdGVyXw0K
PiBwb3NzaWJsZSBleHBvc3VyZSB0byBzb21ldGhpbmcgImJhZCIuIFRoZXJlZm9yZSBJIHNlZSB0
aGlzIGJlaW5nIHNwZWNpZmljDQo+IHRvIGRldmljZSBkZS1hc3NpZ25tZW50IGFzIHRoZSBsb2dp
Y2FsIHRoaW5nLiBIZW5jZSBpZiBhIG1vZGUgbGlrZSB3aGF0DQo+IHlvdSBkZXNjcmliZSB3YXMg
d2FudGVkLCBJIGRvbid0IHRoaW5rIGl0IHNob3VsZCBiZSB0aGUgcmVzdWx0IG9mDQo+ICJpb21t
dT1uby1xdWFyYW50aW5lIi4NCg0KU29ycnkgSSdtIGEgYml0IGNvbmZ1c2VkIGJ5IHRoaXMuIENv
cnJlY3QgbWUgaWYgd3JvbmcsIGJ1dCBteSB1bmRlcnN0YW5kaW5nIGlzICANCnRoYXQgdGhlIHB1
cnBvc2Ugb2YgYXNzaWduaW5nIGEgZGV2aWNlIHRvIGRvbV9pbyBvbiBkZS1hc3NpZ25tZW50IGlz
IHRvIHByb3RlY3QgIA0KRG9tMCBmcm9tIHRoZSBlZmZlY3RzIG9mIGluLWZsaWdodCBETUEgb3Bl
cmF0aW9ucyBpbml0aWF0ZWQgYnkgYSBEb21VLiBJIGFzc3VtZWQgIA0KdGhhdCB0aGUgcHVycG9z
ZSBvZiAodGVtcG9yYXJpbHkpIGFzc2lnbmluZyB0byBkb21faW8gb24gYXNzaWdubWVudCB3YXMg
dGhlIHNhbWUgIA0KYnV0IGluIHJldmVyc2U6IHByb3RlY3RpbmcgYSBEb21VIGZyb20gRG9tMC1p
bml0aWF0ZWQgb3BzLiBJcyB0aGlzIG5vdCB0aGUgY2FzZT8NCg0KQWxzbywgZG9jdW1lbnRhdGlv
biBhbmQgY29kZSBhbHJlYWR5IHJlZmVyIHRvIHRoZSBvcGVyYXRpb24gaW4gcXVlc3Rpb24gYXMg
YSANCiJxdWFyYW50aW5lIiAoc2VlIHhsIGNvbW1hbmQgbGluZSBkb2NzIGFuZCBsaWJ4bF9fZGV2
aWNlX3BjaV9hc3NpZ25hYmxlX2FkZCkgDQphbmQgdG8gZGV2aWNlcyB0aGF0IGhhdmUgdW5kZXJn
b25lIGl0IGFzIGJlaW5nICJxdWFyYW50aW5lZCIgKHNlZSBhc3NpZ25fZGV2aWNlIA0KaW4geGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMpLiBTbyBpZiB0aGF0IGlzIG5vdCB0aGUgY29ycmVj
dCB0ZXJtLCB0aGVyZSBtYXkgDQpiZSBzb21lIGFkZGl0aW9uYWwgY2hhbmdlcyBuZWVkZWQgZm9y
IGNvbnNpc3RlbmN5LiBJcyB0aGVyZSBhbm90aGVyIG5hbWUgdGhhdCANCndvdWxkIGJlIG1vcmUg
YXBwcm9wcmlhdGU/DQoNCkkgd291bGQgYWxzbyBwb2ludCBvdXQgdGhhdCwgY3VycmVudGx5LCB0
aGVyZSBkb2VzIG5vdCBhcHBlYXIgdG8gYmUgYSB3YXkgZm9yIGFuIA0KeGwgdXNlciB0byBvcHQg
b3V0IG9mIHF1YXJhbnRpbmUgZnVuY3Rpb25hbGl0eSBpbiBlaXRoZXIgZGlyZWN0aW9uIG90aGVy
IHRoYW4gYnkgDQptYW51YWxseSBtYWtpbmcgZGV2aWNlcyBhc3NpZ25hYmxlLiBUaGVyZSBpcyBu
byB4bCBjb21tYW5kIGxpbmUgZmxhZyB0byBkaXNhYmxlIA0KaXQgYW5kIGlvbW11PW5vLXF1YXJh
bnRpbmUgd2lsbCBoYXZlIG5vIGVmZmVjdCBiZWNhdXNlIGFueSBkZXZpY2UgdGhhdCB4bCBpdHNl
bGYNCm1ha2VzIGFzc2lnbmFibGUgd2lsbCBoYXZlIHRoZSBzdHJ1Y3QgcGNpX2Rldi5xdWFyYW50
aW5lIGZsYWcgc2V0LCB3aGljaCANCm92ZXJyaWRlcyBpb21tdT1uby1xdWFyYW50aW5lLiBJcyB0
aGF0IGludGVudGlvbmFsPw0KDQpJZiBJIG1pc3VuZGVyc3Rvb2QgYW5kIHlvdXIgb2JqZWN0aW9u
IGlzIHNpbXBseSB0aGF0ICJxdWFyYW50aW5lLW9uLWFzc2lnbm1lbnQiICANCmFuZCAicXVhcmFu
dGluZS1vbi1kZWFzc2lnbm1lbnQiIHNob3VsZCBiZSBjb250cm9sbGFibGUgYnkgc2VwYXJhdGUg
aW9tbXUgIA0Kb3B0aW9ucywgdGhhdCdzIGFuIGVhc3kgZW5vdWdoIGNoYW5nZSB0byBtYWtlLiBB
bHRob3VnaCBJIHRoaW5rIHRoYXQgbWlnaHQgYWxzbyANCm5lZ2F0ZSB0aGUgbmVlZCBmb3IvZWZm
ZWN0IG9mIHN0cnVjdCBwY2lfZGV2LnF1YXJhbnRpbmUgYXMgZGVzY3JpYmVkIGFib3ZlLiBJZiAN
CnRoYXQncyB3aGF0IGlzIGRlc2lyZWQsIGFueSB0aG91Z2h0cyBvbiB3aGF0IHRoZSBuZXcgb3B0
aW9uKHMpIHNob3VsZCBiZSBjYWxsZWQ/DQoNCj4+IEJhY2tncm91bmQ6IEkgYW0gc2V0dGluZyB1
cCBhIFFFTVUtYmFzZWQgZGV2ZWxvcG1lbnQgYW5kIHRlc3RpbmcgZW52aXJvbm1lbnQgZm9yDQo+
PiB0aGUgQ3J1Y2libGUgdGVhbSBhdCBTdGFyIExhYiB0aGF0IGluY2x1ZGVzIGVtdWxhdGVkIFBD
SWUgZGV2aWNlcyBmb3INCj4+IHBhc3N0aHJvdWdoIGFuZCBob3RwbHVnLiBJIGVuY291bnRlcmVk
IGFuIGlzc3VlIHdpdGggYHhsIHBjaS1hc3NpZ25hYmxlLWFkZGANCj4+IHRoYXQgY2F1c2VzIHRo
ZSBob3N0IFFFTVUgdG8gcmFwaWRseSBhbGxvY2F0ZSBtZW1vcnkgdW50aWwgZ2V0dGluZyBPT00t
a2lsbGVkLg0KPj4gSSB0aGVuIGZvdW5kIHRoYXQgdGhlIGlzc3VlIGNvdWxkIGJlIHdvcmtlZCBh
cm91bmQgZWl0aGVyIGJ5IHVzaW5nIG1hbnVhbCBzeXNmcw0KPj4gY29tbWFuZHMgdG8gcmViaW5k
IGRldmljZXMgdG8gcGNpYmFjayBvciBieSBza2lwcGluZyBvdmVyIHRoZSBxdWFyYW50aW5lIGxv
Z2ljDQo+PiBpbiBgbGlieGxfX2RldmljZV9wY2lfYXNzaWduYWJsZV9hZGRgLCBwcm9kdWNpbmcg
YSB3b3JraW5nIHN5c3RlbS4gSSBob3BlZCB0aGF0DQo+PiBzZXR0aW5nIGlvbW11PW5vLXF1YXJh
bnRpbmUgb24gdGhlIGNvbW1hbmQgbGluZSB3b3VsZCBoYXZlIHRoZSBzYW1lIGVmZmVjdCwgb25s
eQ0KPj4gdG8gYmUgc3VycHJpc2VkIHRoYXQgaXQgZGlkIG5vdC4NCj4NCj4gLi4uIHNvbWUgb2Yg
dGhpcyAid2h5IGRvIHdlIHdhbnQgdGhpcyIgd291bGQgYmVsb25nIGluIHRoZSBjb21taXQgbWVz
c2FnZQ0KPiBpbW8sIG5vdCBqdXN0IGhlcmUuDQoNClRoYW5rcyBmb3IgdGhlIHRpcCwgSSB3aWxs
IGluY2x1ZGUgdGhpcyBpbmZvIGluIGNvbW1pdCBtZXNzYWdlIGluIGFueSBmdXR1cmUgDQpyZXZp
c2lvbnMuDQoNCkdvb2QgZGF5LA0KU2NvdHQNCg0K


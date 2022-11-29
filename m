Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1D863BD36
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 10:47:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449319.705975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozxCh-0007Ez-Cx; Tue, 29 Nov 2022 09:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449319.705975; Tue, 29 Nov 2022 09:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozxCh-0007Bw-9k; Tue, 29 Nov 2022 09:47:03 +0000
Received: by outflank-mailman (input) for mailman id 449319;
 Tue, 29 Nov 2022 09:47:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wCXv=35=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ozxCf-0007Bo-Pf
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 09:47:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c50166aa-6fca-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 10:47:00 +0100 (CET)
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB10025.eurprd08.prod.outlook.com (2603:10a6:20b:630::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 29 Nov
 2022 09:46:57 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5880.008; Tue, 29 Nov 2022
 09:46:57 +0000
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
X-Inumbo-ID: c50166aa-6fca-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IY83BL5o1BUsi+LK4Xkq+zYGHzE/JL8a1aSRKari2WU1qXO4Q6ogiOn1dhJIiJIoWL8stwW0RTUG4jpIGOQ2EiwZcRWOpGoaATFOr7HE8X2mReXVA0UxW3Qz8Cq6FtYtDpev1iPAitjYuAM0ww+IbTscFdPcrNWlzwEB+CYeBr1EKuyvF82VgUBcBC2j5o9XvZFzdc90e9D/FkZUl6+6duBlu+DLLHow6XmH9/wwzDaTG3Bz/k5dlHvHa1TVhGLjhic0IVvEe06QHwjfuADE6LCqPMLKkLY+VWHwIK/JOeRrg8E9+uWKwLHvveoPKfc8iunvwYTnlvS/uE+/k8HvdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7yKCOPmEG9Emy9mtL6aGpmL1ikd6wWhvDAVQ0KS8zA=;
 b=fSL6o/Fb/sBSZL5rX596dTTABz90PdgLZOrgPv8AlIoUmDSWYV1VlA48RNPSwQ+uQ/pXWUMezO9izrUjPMLlEcTzx+AmXFpQsJIRVjevhP7FQpO8/Fw5gShC7dFtAERx6zV0vW0YI6iofBgsIqCYsG68lOI3fV7LBFcVsICzEdIWlVI9Ay9/wdaGjGsYPc2h0Jk/swN1lxKwf+TG59ejB9wv77o2WcRQd5pRlLlYNBIn7qHyS9i2/+SRIH9AngulnuxyrdvOq+5ycO7I4Dozqx6eIj7MHCbvvOfs6SOQBrcFKrRqxmJUlJhi3o91wsKc6aLuWkC3Ertu5w9xXeApsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7yKCOPmEG9Emy9mtL6aGpmL1ikd6wWhvDAVQ0KS8zA=;
 b=J8WYlWQ1oXpxFO4au7lR9xoFNg2A8QF55i8aedO+YNt8iZK0fvJBDTJwycJhhcAcem/28+F6cExv0kAjFK7yCLtDnnv6uGD9cUZrRYI72PQjdZYjeva2HOq3ladyVeW3eVnYkBqTTqlvsmPA8jTR+2T3XWbeKCZg7OAXT9iyr7M=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 0/4] Static analyser finding deviation
Thread-Topic: [PATCH 0/4] Static analyser finding deviation
Thread-Index: AQHZAzNMLbhXl7Jpp0uxGRE1XtEGda5VJQuAgACDlwA=
Date: Tue, 29 Nov 2022 09:46:57 +0000
Message-ID: <92158E56-BB56-4CEB-BF5A-751F78E2351F@arm.com>
References: <20221128141006.8719-1-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2211281701450.1049131@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2211281701450.1049131@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR08MB3749:EE_|AS8PR08MB10025:EE_
x-ms-office365-filtering-correlation-id: 65041d5c-b265-4fa4-7611-08dad1eea79d
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MwDt4kK3eCkUW19zpsLk8NpSurrlJ2ECiszvT90IIuZADDbg0ELNxwxWdAa79uNL4dtkwa/UqbCveAuF7ng3cfkg4ocTLzvpAAyyIvbf2qNtpD/h5jPZM394dHDwmxyc7/qcTkNmhlYvDq2GZrB7Q8LOYaNXoVol6oNbm1zgA+RdInR70nbDuDHKEHsBMT7l1FoPD6bxW2dO9SMcQKJwsyfN8HoDf4zurAEOs14A3zH5HOiXEyp+ZlGxkEOr22KfICaC/NXP+cwoaAodV2oCPpsfHMBNgXJa+9tPKpmhoLv48+ZMFaxGoi9JqK6lt4/3TLOKx8pphtODJ1bt3n5aGbwrasnzdOEvDdGJjFtBcQ2b6MPynWOwFfrjue4E1ypwJUlsCZQquotWHbH8ZQMsZOOcWHu61RB4n+0SK262Siaq/q4JYt2wyCUiQZMOmZ6uKE9tR8V13FpTSugSND2OSyl0Mgpq5XcRPXkacELHcdybvh691b4NCBfvXsaycuqHL+n4qMAV6Ya5BJjxlL9hGf9nNLe4OZElA23y411Zr1dCJdUtnBMeMPH6CaORQxK9EqvUWMFhYxILVOT+E0kGzDHtS0HREb+o9bqp07dGsgUQDxE5lxxZjPc5orb+YpfFdQo2Xib8m4coRPfob1Ew2P3f/w3k+VKf0mgLqRocIRLAUwZygwJZlnKmNb/mEk1eETUtbCq+/eDaDoc5Vb0spmbetwZmbjilGB7/ZkHXVg0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199015)(53546011)(6486002)(71200400001)(33656002)(6506007)(38070700005)(36756003)(86362001)(38100700002)(186003)(2616005)(122000001)(6916009)(54906003)(5660300002)(91956017)(6512007)(478600001)(26005)(66556008)(2906002)(316002)(76116006)(8676002)(66476007)(8936002)(66446008)(66946007)(64756008)(41300700001)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0RtMHhHWGhPNHV1dGtId2tUeWc0d3p1Y1FEM3FJRkI5SnVsY1hWdzJHOXY4?=
 =?utf-8?B?K25uNGFpM2JZUjMyOEtJTjdzVjJJSmMvMzNkQXFiWHgxeFhSb0RKWlhTRmJR?=
 =?utf-8?B?SVJ3YlB5blVxNFFSYm1UZlBHdXVodHRoWFFLR2dVS1hiRU9pUEJJUEgyVHYr?=
 =?utf-8?B?QUhSWTdQMFY0dDZOaUhnbWRmRGVSVzNmQyt6UHo5T0J6ZmZuRXg1RFlmL2l5?=
 =?utf-8?B?dkRvRVhiUWJyUFJ4b3J0TnhIaFFnUm9lMGpwT1EzUlRiaUhZb2VqdlVkdWxk?=
 =?utf-8?B?am4weWdsM0x6Qk4xaWxRMGxURWVWMXZBc3ozcEQwc0RETEtZcFVYNjYzdG5X?=
 =?utf-8?B?YXZYTWdUOVVpQmdESEdXK3Njd0xlTGVUQk9QU1BLWC9jUld6MHpjOVZtdE9z?=
 =?utf-8?B?L0pzKzBjaUJYNXM1VVNvcmJwTmR0eUxSZnFPVFNWWVhjU053RnRrWXVOWkJC?=
 =?utf-8?B?b1IxRzB6Q2NxbVVVRDlaWlZpRmFHNTFtYXBIYUVZQW9aOERIbjN3S3BSSTlC?=
 =?utf-8?B?U2M3THRIUHBMMmNIUFhBZnFYSE42SWovcG9XK0tuaXQrRmdWSnRzRTRoWG1U?=
 =?utf-8?B?cjVWRFdJQUtFMTJ5ZmplamlqbytWK3FOVzNiVzdyUzE1YllWdVhSODZNUll5?=
 =?utf-8?B?T0F4UVZWd2M1ZWFvdnBISzNjdE4vbEN1MDRBTkUxTTNKKzhOclpNcUhMdWJ6?=
 =?utf-8?B?NGRsRFBuL1VQa0diakxHNG84WDNoZzAzejU1aWErWDI2NHRnZE5yUjRkbGxN?=
 =?utf-8?B?SlNrc3B5TncvZW1SZHRFclRZYnE5KzRyemRTS1VEUmgzY3NNRGlsTzR4Zkdi?=
 =?utf-8?B?bDk4a3NpKzlQbm5za2JEZ0MzTjVyd016ckVZTFpJNUlOS3lkc2pjblpqakYx?=
 =?utf-8?B?SjZiUmM5UlJMTmtLWTNSNzhkYW9WQ2syaG94Y3M0dk9ib3VPYTRHK1JHczJH?=
 =?utf-8?B?a01OQStTd0xXV0lES1IyQVJ2Wkh4NndoRmVEbERkY1dNcHhpQ0NqV0NNek1a?=
 =?utf-8?B?Z0p1blVweTVicGdjNWRNVStrSTA1SWlBbndGNWp0dWU4cVBsT3hkM2ZFR0lR?=
 =?utf-8?B?bmZhWjY2NisrOHFFZ3RiYjBDdk03dStNSlpyc3ZkOW02WEptNjd4QWRrczh4?=
 =?utf-8?B?bkwwOHYrR1VhMXhDYTJXa2xDRlRRN01zOEVwamFEWHQxMmhMRnluQUVtcnND?=
 =?utf-8?B?cGZsWGhvOUlYOGk5R1lLcnl5bm44bWxyUzRMaWc5dEhyZGhJNGdCWUpQdUYy?=
 =?utf-8?B?dUpMRnh3ckUrWG9kTEhwcEM1NjN4M1dFRTM4VWlUYU1TSnRWano5ZHFub0FD?=
 =?utf-8?B?dWJKYit3K0VVQjZycjMyU3RCOUlJU3hzVUdPNnBpaXlJYWZlOVhWeURjWXBi?=
 =?utf-8?B?bk5WWXVteGwrb0RUa0JWMmhuN3lqUzAyY3g3elp4NkUyYUNiN1JKNXluWmgr?=
 =?utf-8?B?OUxuTmV6em1pRkdQVldXVnJJb3VoM1RUK1ZlU2lMZGtSZXFuVzJiT3ZFR2Fp?=
 =?utf-8?B?a0NpQWYzakZ6SVg5VUFnSEYwaC9sMWdpMW9mR1ltdTdEQ2VjZ1UxbkVDelpq?=
 =?utf-8?B?d1p5Z3J5b1ByV0FqODlIRWczWEVreXM3Z0ZPSnR1bERuUVBoaTFvOEsyTVI5?=
 =?utf-8?B?Z0kwVjNZVnpNcWVtMUNNalhRVVRBMDVNS0lNMUFpNzRCTklwY0p1Nk1hSVBa?=
 =?utf-8?B?QnhPeFpDdHh3NlEwSWhBVlBycmFTc3JFMG5BWHJWZzFKU2owekR2UDd5L2Rn?=
 =?utf-8?B?YmpjZzBMVUNZa20rTHg1VVdjVjlZQ0xuclFlT1RvWEtQL2Yxakw4RWM2bm1U?=
 =?utf-8?B?SDNOWE92eHZOTTRtSC90NmI5c3V4T1Z2bVloeThBRmh1U0tPdU9zRlU0UFp2?=
 =?utf-8?B?STgrVVZIdy9kWmZBMzZnNDQ5MG14M29MU2lhTlI0RVNMa1VRSEtZbThCWVlz?=
 =?utf-8?B?NEhJc2dDRFp2cUFISVpLZ0ViVnpHNHZHc1RzMi9YemI3eng4YTFvUUdSRUM5?=
 =?utf-8?B?aEZXUGtPdmpHSzBRckNIcE9uZUZWMndjeElBblp4dEdXV0dSdzZkR2JxbS9O?=
 =?utf-8?B?cFhQWWRUSE52YktRMXQrYkdCSWxHeGtzbzRCci9zdEdWVUZ6d0FQQlYwU0ph?=
 =?utf-8?B?enhwOE5FeDRHRlUvcWRzMGJ4VDNxYldsT21VRHJvOGhMbjdqRTkvb2Rac1Vk?=
 =?utf-8?B?aEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA59CE7BA0C63945A6949A9C69EA24AC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB3749.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65041d5c-b265-4fa4-7611-08dad1eea79d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 09:46:57.0257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ocHeke6VGn/mB8tx75dD8DbWsdrKwNJXp7JLqhU3S1snFY+hadFDeoVRz8l0QBf0uTHDWIQKZP43sT0C+PgWpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10025

DQoNCj4gT24gMjkgTm92IDIwMjIsIGF0IDAxOjU1LCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gTW9uLCAyOCBOb3YgMjAyMiwgTHVj
YSBGYW5jZWxsdSB3cm90ZToNCj4+IFRoaXMgc2VyaWUgaW50cm9kdWNlcyBhIHdheSB0byBzdXBw
cmVzcyBhIHN0YXRpYyBhbmFseXNlciBmaW5kaW5nIHByb3ZpZGluZyBhDQo+PiBwcm9wZXIganVz
dGlmaWNhdGlvbiBmb3IgaXQuDQo+PiBUaGUgcHJvY2VzcyBpcyBleHBsYWluZWQgaW4gdGhlIGRv
Y3MvbWlzcmEvZG9jdW1lbnRpbmctdmlvbGF0aW9ucy5yc3QgZG9jdW1lbnQNCj4+IHRoYXQgdGhp
cyBzZXJpZSB3aWxsIHByb3ZpZGUuDQo+PiBUaGUgdG9vbHMgY3VycmVudGx5IHN1cHBvcnRlZCBh
cmUgZWNsYWlyLCBjb3Zlcml0eSBhbmQgY3BwY2hlY2ssIGJ1dCB0aGUgZGVzaWduDQo+PiBpcyBv
cGVuIHRvIHN1cHBvcnQgbWFueSBvdGhlciBzdGF0aWMgYW5hbHlzaXMgdG9vbC4NCj4+IA0KPj4g
VGhlIGNoYW5nZXMgYXJlIHNwbGl0IGJldHdlZW4gdGhlIGZpcnN0IHR3byBwYXRjaGVzIHRvIHJl
ZHVjZSB0aGUgcmV2aWV3IGVmZm9ydCwNCj4+IHRoZSBmaXJzdCBwYXRjaCBpcyBpbnRyb2R1Y2lu
ZyB0aGUgZGV2aWF0aW9uIHByb2Nlc3MgZm9yIHRoZSBlY2xhaXIgYW5kIGNvdmVyaXR5DQo+PiB0
b29scywgdGhpcyBpcyBiZWNhdXNlIHRoZWlyIGFuYWx5c2lzIHN5c3RlbSBpcyBzaW1pbGFyLg0K
Pj4gDQo+PiBUaGUgc2Vjb25kIHBhdGNoIGlzIGludHJvZHVjaW5nIHRoZSBzYW1lIGRldmlhdGlv
biBwcm9jZXNzIGZvciBjcHBjaGVjaywNCj4+IG1vZGlmeWluZyB0aGUgY3VycmVudCB3YXkgaXQg
aXMgY2FsbGVkIGZyb20gdGhlIG1ha2VmaWxlIGFuZCBpbXByb3ZpbmcgaXRzDQo+PiBhbmFseXNp
cy4NCj4+IA0KPj4gVGhlIHRoaXJkIHBhdGNoIGlzIGEgZml4IGZvciBhIHRvb2wgdXNlZCBmb3Ig
Y3BwY2hlY2sgYW5kIHRoZSBmb3VydGggcGF0Y2gNCj4+IGlzIGFuIGV4YW1wbGUgb2YgaG93IGEg
ZGV2aWF0aW9uIGNhbiBiZSBhcHBsaWVkIGZvciBzb21lIE1JU1JBIGZpbmRpbmdzLg0KDQpIaSBT
dGVmYW5vLA0KDQo+IA0KPiBJIHRyaWVkIHRlc3RpbmcgdGhpcyBzZXJpZXMgd2l0aDoNCj4gDQo+
ICMgc2NyaXB0cy94ZW4tYW5hbHlzaXMucHkgLS1idWlsZC1vbmx5IC0tY3BwY2hlY2staHRtbCAt
LXJ1bi1jcHBjaGVjayAtLWNwcGNoZWNrLWJpbj0vbG9jYWwvcmVwb3MvY3BwY2hlY2svY3BwY2hl
Y2sgLS1jcHBjaGVjay1odG1sLWJpbj0vbG9jYWwvcmVwb3MvY3BwY2hlY2svaHRtbHJlcG9ydC9j
cHBjaGVjay1odG1scmVwb3J0DQo+IA0KPiBCdXQgSSBnZXQgdGhpcyBlcnJvcjoNCj4gDQo+IEVS
Uk9SOiBDYW4ndCBmaW5kIGNwcGNoZWNrIHZlcnNpb24gb3IgdmVyc2lvbiBpcyBub3QgMi43DQo+
IA0KPiANCj4gTm90ZSB0aGF0IG15IGNwcGNoZWNrIGlzIDIuNy40Og0KPiANCj4gIyAuL2NwcGNo
ZWNrIC0tdmVyc2lvbg0KPiBDcHBjaGVjayAyLjcuNA0KDQpZZXMgdGhpcyBpcyBhIGJ1ZywgSeKA
mW0gc3RyaWN0bHkgY2hlY2tpbmcgZm9yIDIuNywgSSB3aWxsIG1vZGlmeSBpdCB0byAyLjcueCBp
ZiB5b3UgYWdyZWUNCg0KPiANCj4gDQo+IEFmdGVyIHJlbW92aW5nIHRoZSB2ZXJzaW9uIGNoZWNr
IGluIGNwcGNoZWNrX2FuYWx5c2lzLnB5LCB0aGUgcHJvY2Vzcw0KPiBzdGFydHMgY29ycmVjdGx5
Lg0KPiANCj4gQWxzbywgd2hlcmUgaXMgdGhlIG91dHB1dCBodG1sIHJlcG9ydCBjcmVhdGVkIGJ5
IGNwcGNoZWNrLWh0bWwgYnkNCj4gZGVmYXVsdD8NCg0KDQpUaGUgaHRtbCBvdXRwdXQgc2hvdWxk
IGJlIGluIHRoZSB4ZW4gZm9sZGVyIFt4ZW5fcmVwb10veGVuL2NwcGNoZWNrLWh0bWxyZXBvcnQv
aHRtbCBidXQgd2hlbiB5b3Ugc3BlY2lmeSAtLWJ1aWxkLW9ubHkgdGhlIHJlcG9ydHMgYXJlIG5v
dCBnZW5lcmF0ZWQsIG9ubHkgdGhlIGJ1aWxkIHBoYXNlIGlzIGV4ZWN1dGVkLg0KDQpIYXZlIHlv
dSB0cmllZCB3aXRob3V0IC0tYnVpbGQtb25seSB0byB0ZXN0IHRoZSByZXBvcnQgZ2VuZXJhdGlv
bnM/DQoNCkNoZWVycywNCkx1Y2E=


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E5C307392
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 11:21:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76850.138842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54Qk-0002xM-JR; Thu, 28 Jan 2021 10:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76850.138842; Thu, 28 Jan 2021 10:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54Qk-0002wx-G5; Thu, 28 Jan 2021 10:21:38 +0000
Received: by outflank-mailman (input) for mailman id 76850;
 Thu, 28 Jan 2021 10:21:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oM/R=G7=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1l54Qi-0002wq-GH
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 10:21:36 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6da1fa26-805b-4896-9ebd-f500fbd334d5;
 Thu, 28 Jan 2021 10:21:35 +0000 (UTC)
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
X-Inumbo-ID: 6da1fa26-805b-4896-9ebd-f500fbd334d5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611829295;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=QLjCGnBX5QaP5ijpRxqAQ4+XlbvysjPwY2siDeiOGaQ=;
  b=GVpxqtc8lLg12ftD5X8M+fTjk41XnDjPLVj2JTRDK2nDCnZtcbV9mQg+
   yZlCqDDLozY80kcRq8Y7qYHGqqRNVqM0sNEgD8lIkA8A51GjlU1eGkRFV
   lT2nyZf0nS/FTED0q1rX+jXbjRJjoWpS5r9wuoVEsYSjWjnQxT027cDuV
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TbHIUTOdaRKcKd/vpoBQFmrmmLEu+HFo5iMW7aDyE+GepHU+JNRFgX89V8/uKVh8K/GAyNxLfu
 JcysAn5b1RSLSzyrzBS7tlnhfEoc0+blTA8dZLKpWlJwqvhmPHyUaMLKvSjnN41UfBaDAON1Gc
 blc9n9fw0/Y7HWdywZ8Sd8C6uZhiuRBmm/+joQJ67c6SylUOUaChtCpoN1tnrlUUN6kUGhJjJk
 TAH4srfmhQREML0Tz34OvYb9hQsMA85P+Cn3QN+pg1vTNw290nBtgMxGoSLM/DxJhZT3448t7E
 +mk=
X-SBRS: 5.2
X-MesageID: 36044457
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,382,1602561600"; 
   d="scan'208";a="36044457"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQ3SAVNiqet/rkAJsPBjmssfB8SExlTtpOJkOSVZtQ6VfcMJpW1aqVly7Tk2UNb+2PxZ7y6g299ozP3KovjJSocp7SF8qFSOrKYzrzuuF8PAQXpyh9On2p60yH9Oar+gGwhZ8sSrj9lhYicOYJCk3tmTyUlttIgGaCwSd9T0DrP9X8bLGpyfaeGqf61C0PwVEurhhQvQIm7hI7g3mRuhweMPeCaYVXWI2gMhZll/uiqy4cxbM4yXst856UstZULzNa87D9iFyHZfhDosRmtCH7E7NKqcd/NHMZPbpirFcj8Ta+GXUkKITXnzG0fB4NXwIPx9BD+xOfGLYkhpFcC6Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLjCGnBX5QaP5ijpRxqAQ4+XlbvysjPwY2siDeiOGaQ=;
 b=anj9bUv3qx+Rzd5sShLJWvoPVORCumPUSr+RrkvJ3+SwAysvja3KPtZii4OnnuRTxB7dS4J1lEN0TZ2Fe1W9i92QiPQYOrzRuY0xE+I5aC34tUnYQMqymfzMDh/gUSjWmEb1ntviHhv52FrIgx8mHL3I77loMo2w3a9l5+x6cPEZQb1vzsDepFp5TnIYKvnIl42EhCDLAoBvEgTfWOQZYLreqE7Sj59plosxg4BkZIwhXxgmdTuwEkWOAC2/bPyJCu5MCB4KKkUS8+xLz2plDI+AmLDNiPU1c/bBV4b9Vuli7EjLMPZVVXG95JXCjqiF+eQ0isOjBOWeD6W/POTtIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLjCGnBX5QaP5ijpRxqAQ4+XlbvysjPwY2siDeiOGaQ=;
 b=vxkUWGGj3sZZFu5t1YSM427ULbfPNcfqp7wnSi43LVskStfFS2yLKbk3K+zvOQM0+otZBWC6JcF/XsQIJ4jPuG7Dz7+BayW+6K8oDaCcA7yQKS/wV+p0V3vvghZyCysdM1iNFEg27vt4+tffvR4egPhY6PJ6lhktKh2NjIwnWVE=
From: George Dunlap <George.Dunlap@citrix.com>
To: "open list:X86" <xen-devel@lists.xenproject.org>
Subject: [ANNOUNCE] NEW CALLIN DETAILS Call for agenda items for 4 February
 Community Call @ 16:00 UTC
Thread-Topic: [ANNOUNCE] NEW CALLIN DETAILS Call for agenda items for 4
 February Community Call @ 16:00 UTC
Thread-Index: AQHW9V9XpZwfaRbVx0ugJLpiqu3cmQ==
Date: Thu, 28 Jan 2021 10:21:30 +0000
Message-ID: <B3DAA06F-08F7-43B0-91B2-65A634FE48AB@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81410dcd-d50c-455f-eb00-08d8c3767a9e
x-ms-traffictypediagnostic: PH0PR03MB5927:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5927B83488E34B7711FDCA3099BA9@PH0PR03MB5927.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o59R9paFUlb5r7sdUJX98Wikg2WQHJmH99gy4FB88kW9flfOUzsDqYBDshsxyLOtit2Y6dFJOmfhPuIp3m1tQ/kfi2ZjgTbF6MSdPH8h75qx1/t7uUZK2LhvV8N0dYSEs9jerIbw0kAF5UrVPWDbmBey46fGwMv7ax80h2+su7/rmiDb94inb5TfwqgQyNvStXtciZHeVE4uNHjlkByshwEY7u5fSNlntVDMoMUIX2O5OzPmEdw7YONgdCoedO5jy8XFoT4wCsO3oXBLt5Y141gDdG6IDOXuXlY3HwhoaMJv9K2lntIiqYbBQDmeghYYNjwUXVCy7IsTi+EY5080VfN7L4ojfXLCCZi9BqzNaz2av9QiD8P11O/TN6Dw2I9+l5ucB+R5Ul5ImWIL2haiCsIC/n9LA0hs6bj/HK7hsmK3tmvEumBtLk5UR8/btybZgNyfKiGIoRJmqrMN4030iIWrSXk9/hE/kGkHGUHldrsc3EFYIC05yETHPHty0TBlb6CU0ReJvLG5gZecPBncwJsbZLFQ2Iw1l+pPKTVw2+E5itG4Ifg5hNzQWjS9sFqEVlaqMiwv+ZpNhvNDi5cyR8X9nymF/OdFErBMziazFPaAP6zssnrlPVWAsREtaIXs7IehHKJ5dVLd/anZjhT1yg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(6506007)(8936002)(7416002)(64756008)(91956017)(66446008)(66476007)(66556008)(186003)(2616005)(316002)(478600001)(7406005)(33656002)(36756003)(966005)(71200400001)(66946007)(2906002)(26005)(5660300002)(76116006)(6486002)(6916009)(6512007)(8676002)(86362001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?czlpRFVzZ0JNY3N6akdyVzZqeWt2OS9tOU9VSzIzb2g5ZkV1OGlaNnNJdUs5?=
 =?utf-8?B?NFZ3NHJaZUlhckp0TTNCREhGRUJxaFVlYjZVcUVURnF6WTdMTEQxa2NwVTRG?=
 =?utf-8?B?TVk4TTRhRGVFcUlXd1FmU0xURUJGZm02Sm0wOTBCRUZDeHF4QzIwSnZoMi9o?=
 =?utf-8?B?RW9HQnI0RzQzRHNzZ2hTdmlSY2Vld0xkOFUveUQ4Skp3NjQyWExvclJoU0sv?=
 =?utf-8?B?Yy91eE9iUllYcjEyZ2Jab1lWLzFNRnFJRlQ5M0NOSS9BR2VpQlFiWjBaZWxx?=
 =?utf-8?B?cWZMMUN0VzdlcWNrSTNCVlgvYnlwSy8wZ1VLbjkwcllQTW9UdGphZkZIRVVK?=
 =?utf-8?B?Z2lWaEJDMkRwUFBKdGxtRWdVVE1hTjQ5V21iRGR4bUdzWHc0ZWdxSmpXeThZ?=
 =?utf-8?B?L282aHdCTzdCdzVTbnNiQ3FqaUR6YWpTMHJUbFhPczRkWEtQZUhoUjJyb3Iw?=
 =?utf-8?B?Y2Zja3NrbnFyNXJNR0F3ODBGZDdlWkxsT0g3MVlVUXhGdHZIOG1ZK2F5T3F6?=
 =?utf-8?B?Y3NPQ3hKRVVXNU95UjhiQmJQcDFaZlhRNVAzRUpnUVl0S2R6bnJrSUJhTTlR?=
 =?utf-8?B?dUMxcjFKY3BNSUlXekZLLy9SSis5ZGk5bzJYNXdKdVNPampjTFFOTE5lbVQ4?=
 =?utf-8?B?U2ZIekFIUytmanFOSllYMHpxTTVrZXQzZzQxMEtaUmdqL3hXQUE4c05zc0VF?=
 =?utf-8?B?aUUxQXBOaHFZRGplUUpOOFZOOXJiMTlBQXZZc1R3YXMrNlNZQkZpL2VtRS9j?=
 =?utf-8?B?OURyRmQ3V3U3TmVpdW1NeGpxdWRGeUo5SUVnc1pkL096dHdqVVB1WXc1akF1?=
 =?utf-8?B?K204SzQ4djVTQU41TWV2RmZvMlk5dlZQN3kzWVFzSlFaVmYrZzltMEJKVnJ1?=
 =?utf-8?B?NXJnY2lHSW80R3RuZ1gzcSs2MGdYK2dFTUFtV3dVeVd4cUxMWUgwYTJMcXBQ?=
 =?utf-8?B?NTRvSjRFUWpKYXJYZ29STVZhNWFraWh5ZEx1YW1SZWVCcFgrMWNzbmp4RStv?=
 =?utf-8?B?TGNnaVlDRjcweHdubk9zZWF2aDBZOTRKR3dsVVVLNmJPL0NaS1RvME45QTRH?=
 =?utf-8?B?LytSN3dWVi9MbTJCVm02SDNCUzFhU0U0SlY5aTh0TndoYmJvUGhiOENZWkUy?=
 =?utf-8?B?eEdSa3NzRTlWMHFMdlEySHg4ZVF1NmI4WEFONDYvbVQvdmd2ZkNEcDNyazhV?=
 =?utf-8?B?bWg1U0EzYU94UXVxNXNaUTRWSWdKRE5KZkFXdUwzclRPSkdQeFdySEZ2NmYz?=
 =?utf-8?B?QmRvdm1PMXZXOTQwS2dWQnh5M0xlZW1TYlFQRWhqYm5QVEJTOXkzUFRZYnVI?=
 =?utf-8?B?VHJYRHhDT1d1NXN5Vkk2TzlaWi9iYzFrMlM3ZFV4RnJqQ0hLdSt1ZWFxK1dZ?=
 =?utf-8?B?R0duYTFtZWJ3bHlyTzQwTmJjT0VNRE5KZ3RFdVJKN1NmMkowQU9zY1d5UXEv?=
 =?utf-8?B?Kyt4Yjg1SkI0QW8zaFlIeWM1cmVlVmtycXcvTjN3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <18F29A7608613A4E85053527578C2D58@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81410dcd-d50c-455f-eb00-08d8c3767a9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2021 10:21:30.1099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r+CvvNhpbLK48vu1Rju2IvyLfoAP9MpQYbCp2zR2roOCsmozw1EurIPfCj9lI33RYTF1mviKsGDKFUp9hzClso5NQTf78DA1HplfZIWp+Pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5927
X-OriginatorOrg: citrix.com

SGkgYWxsLA0KDQpQTEVBU0UgTk9URSBORVcgQ0FMTElOIERFVEFJTFMgQkVMT1cuDQoNClRoZSBw
cm9wb3NlZCBhZ2VuZGEgaXMgaW4gaHR0cHM6Ly9jcnlwdHBhZC5mci9wYWQvIy8yL3BhZC9lZGl0
L2UyY0dXUU1kdnJYdDg2ZHZlenV6SjlTMi8gYW5kIHlvdSBjYW4gZWRpdCB0byBhZGQgaXRlbXMu
ICBBbHRlcm5hdGl2ZWx5LCB5b3UgY2FuIHJlcGx5IHRvIHRoaXMgbWFpbCBkaXJlY3RseS4NCg0K
QWdlbmRhIGl0ZW1zIGFwcHJlY2lhdGVkIGEgZmV3IGRheXMgYmVmb3JlIHRoZSBjYWxsOiBwbGVh
c2UgcHV0IHlvdXIgbmFtZSBiZXNpZGVzIGl0ZW1zIGlmIHlvdSBlZGl0IHRoZSBkb2N1bWVudC4N
Cg0KTm90ZSB0aGUgZm9sbG93aW5nIGFkbWluaXN0cmF0aXZlIGNvbnZlbnRpb25zIGZvciB0aGUg
Y2FsbDoNCiogVW5sZXNzLCBhZ3JlZWQgaW4gdGhlIHBlcnZpb3VzIG1lZXRpbmcgb3RoZXJ3aXNl
LCB0aGUgY2FsbCBpcyBvbiB0aGUgMXN0IFRodXJzZGF5IG9mIGVhY2ggbW9udGggYXQgMTYwMCBC
cml0aXNoIFRpbWUgKGVpdGhlciBHTVQgb3IgQlNUKQ0KKiBJIHVzdWFsbHkgc2VuZCBvdXQgYSBt
ZWV0aW5nIHJlbWluZGVyIGEgZmV3IGRheXMgYmVmb3JlIHdpdGggYSBwcm92aXNpb25hbCBhZ2Vu
ZGENCg0KKiBUbyBhbGxvdyB0aW1lIHRvIHN3aXRjaCBiZXR3ZWVuIG1lZXRpbmdzLCB3ZSdsbCBw
bGFuIG9uIHN0YXJ0aW5nIHRoZSBhZ2VuZGEgYXQgMTY6MDUgc2hhcnAuICBBaW0gdG8gam9pbiBi
eSAxNjowMyBpZiBwb3NzaWJsZSB0byBhbGxvY2F0ZSB0aW1lIHRvIHNvcnQgb3V0IHRlY2huaWNh
bCBkaWZmaWN1bHRpZXMgJmMNCg0KKiBJZiB5b3Ugd2FudCB0byBiZSBDQydlZCBwbGVhc2UgYWRk
IG9yIHJlbW92ZSB5b3Vyc2VsZiBmcm9tIHRoZSBzaWduLXVwLXNoZWV0IGF0IGh0dHBzOi8vY3J5
cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9EOXZHemloUHh4QU9lNlJGUHowc1JDZisvDQoNCkJl
c3QgUmVnYXJkcw0KR2VvcmdlDQoNCg0KDQo9PSBEaWFsLWluIEluZm9ybWF0aW9uID09DQojIyBN
ZWV0aW5nIHRpbWUNCjE2OjAwIC0gMTc6MDAgVVRDDQpGdXJ0aGVyIEludGVybmF0aW9uYWwgbWVl
dGluZyB0aW1lczogaHR0cHM6Ly93d3cudGltZWFuZGRhdGUuY29tL3dvcmxkY2xvY2svbWVldGlu
Z2RldGFpbHMuaHRtbD95ZWFyPTIwMjAmbW9udGg9MTEmZGF5PTUmaG91cj0xNiZtaW49MCZzZWM9
MCZwMT0xMjM0JnAyPTM3JnAzPTIyNCZwND0xNzkNCg0KDQojIyBEaWFsIGluIGRldGFpbHMNCldl
YjogaHR0cHM6Ly9tZWV0LmppdC5zaS9YZW5Qcm9qZWN0Q29tbXVuaXR5Q2FsbA0KDQpEaWFsLWlu
IGluZm8gYW5kIHBpbiBjYW4gYmUgZm91bmQgaGVyZToNCg0KaHR0cHM6Ly9tZWV0LmppdC5zaS9z
dGF0aWMvZGlhbEluSW5mby5odG1sP3Jvb209WGVuUHJvamVjdENvbW11bml0eUNhbGw=


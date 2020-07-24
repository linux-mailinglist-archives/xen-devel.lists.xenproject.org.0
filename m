Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE4B22BEC3
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 09:15:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyrul-0002TC-1P; Fri, 24 Jul 2020 07:14:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fd0P=BD=epam.com=prvs=5474228b71=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1jyruj-0002T4-LO
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 07:14:41 +0000
X-Inumbo-ID: 57259a2a-cd7d-11ea-a378-12813bfff9fa
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57259a2a-cd7d-11ea-a378-12813bfff9fa;
 Fri, 24 Jul 2020 07:14:41 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06O7EaAj009807; Fri, 24 Jul 2020 07:14:36 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
 by mx0a-0039f301.pphosted.com with ESMTP id 32eupgmavu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 07:14:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6KLaYHbO0nBtXsX3j6xu8n2JpO3HOAi5ODDhj2CSKvck+XYd0M7jqVv2j4SkPCfQ7WJcEIl65HPXBi4PtT8g+blmplye05iS3+WQZg7VKkF+jqMMK6F6E/nFUjZ1+avEeFHeXWJLTdR7zIiY4s24Svo9+0gJGuUEHymi6uiResp3SlQZ3lYGpYSb0BJHtUTyU3012zDJ8kaRY7R4J55O4lD+OOZBqk5gzBzebtrxuX7MPDtIcfVRK1dltNN1g5lkOiSsWsb/Nr6pg4j22zN6f0iFairJd6TykK76V1g+wR5AQqeZ02EKT94Xgc4IkE/XVW+Q2blUmBxE8CyR5G/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaPlPIsLFbKKSO8c+y8J4uKk+JzkywTrpPFdOKOwC/Q=;
 b=nvsbpIpli7HLQNy/2ybcXZfWDP4NhxLzS+x/fEw2qbF6BApTQ6PkI/23deBMvGy2F7cYQWJ1u2ga8gyOQDv+JmqRXCeSq5I7JrxBa8xsCrwtH7UFs60kOdaeJmYVPNBp5IQeT1fGaATzzO0u2bCOjmv0GOZ/SFr8+a8kYzIa7MeCpOROuyY/WXP/6JA2KMbadTcRYZ4e0QSQLtu3o3dZcGY0h0hR2hKpSx55BppLSDTSO3A0rwDWz/0f+eqXZCRmShIbPtiM8A84SFCMepbuU6HYbF49OobgNkiEBphNdlCp43DFeaskKxZ0KsaDLVk8M36xdEVORpEKFeV/qdLSrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaPlPIsLFbKKSO8c+y8J4uKk+JzkywTrpPFdOKOwC/Q=;
 b=SOobmYTF4wl3fUwraLNBOL4DXbGx3jq8xYmwrxIwx4oCXQvePrj3x+FtnVGPiNFPEnCwbUh7zAUZdoyFgxqKkwK79TLIRFOJ6TLerZBIJoNXhaHG5Us8wryACes/19Y4ndewklG3qVbIcGXcphuFLWUrqLxcLZnqPVNVtQa1yzzK+uTrt8rzORUx4PnWgPbR6DLWbura6ZXmOhbayJLfIe1iJudDGYNEC+fpKqQZZ/8H7Qt/g8psUu/nZclA5U1ahEe8aGqmY1kLNWkA6XQKvqjuoHmHTpQJ/O8EXH+T41JOle3Knnc0KBrPrUI7uz63awDPktzUyZi+4bUR9YMOEg==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5699.eurprd03.prod.outlook.com (2603:10a6:208:173::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Fri, 24 Jul
 2020 07:14:33 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508%7]) with mapi id 15.20.3216.023; Fri, 24 Jul 2020
 07:14:33 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Rahul Singh
 <rahul.singh@arm.com>
Subject: Re: [RFC PATCH v1 2/4] xen/arm: Discovering PCI devices and add the
 PCI devices in XEN.
Thread-Topic: [RFC PATCH v1 2/4] xen/arm: Discovering PCI devices and add the
 PCI devices in XEN.
Thread-Index: AQHWYYoU5xC9fc1Hm02eNWNLg1aFFw==
Date: Fri, 24 Jul 2020 07:14:32 +0000
Message-ID: <81cad0cd-731d-e1d5-cacd-d64f2c0781b6@epam.com>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <666df0147054dda8af13ae74a89be44c69984295.1595511416.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2007231337140.17562@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2007231337140.17562@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07f81523-a845-4605-060d-08d82fa136e7
x-ms-traffictypediagnostic: AM0PR03MB5699:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB5699CD13DC08CD225D8DEF90E7770@AM0PR03MB5699.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GNAWQ8/DYN9xC69buMadr4dQ+K51xeE4YQJvksve9iTjdL6E9QedmOX7r2rpwA13rsaBUtT2VZfrBdMmhEoE7OFgNx5/emG3ugQmVkPcg5h4wVyO0DpBZvZoj17mCPkaNvn4dsxzWFTJHJfYVsEKy9jhcsAifNO36OWySSblHcL0VsrmNkGJkkrmneW1KQLJSdmdefgTCHMtIIjQaU4nCHnt03LHk6jjCuTS8ArKgxMmdLQjrPw9HkwcUJSWHR9DKPteUFKHd88iF5Rn18JH5U0iObtdlygx1DVoAfy6Wo8zpZJBX2ctBhotXV+c/+SimBKrT8FhKSYMKXYcA3PBnmHPs4ltkCg7nh4kNa5AjNRswWRFJVM5niwzcLv07YEQucQdQiXtd1zhl2Kt95Qy7g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(54906003)(966005)(110136005)(31686004)(31696002)(2616005)(8676002)(4326008)(6512007)(71200400001)(86362001)(8936002)(36756003)(6486002)(5660300002)(83380400001)(478600001)(316002)(91956017)(76116006)(2906002)(66946007)(26005)(64756008)(66556008)(53546011)(66446008)(6506007)(66476007)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: y18mEKe8TvZR4wiFAGvEGCgq/tGkWNv+97vT3ZKsG+XK5VrojBxvB+k2HvgQkaBmFFJSoJCpYxDiLss2uKMGsRRDqHcXpLs+2CLleUryKjU66Tppren2iS5byFPGxsDqmMzSiQxoMyVRVxSsLfg0sC/whVQhS2yB0KsldMofurPAAFTiW/egcnlCNIOm7x/cbouKxUnZ/bUqqh29poeTTn5yxGeRFVVGORIZi3Q4AY2HERpgEWMcUErI4i7xOqqDrWiNmZ9qbotkXGp8NqjA3qfKR/3eTUWkuiogJehnzBPNA7hG/1Oo/sGVEHIEo15+aCaqIo726CgjSqFUcfuJtFaktU9gJqJUWSaD0E4/ivJNxhWDvcs7nMdgmo/iZ6hdypAH2QfNoJ4sbGQqyP4Nx1a6IGu5kowu6c211u0zp3RkaBMTv6hAOhcSZuOKTm1cN+9FyHC9PS/rYdLFGZzrloe5BZdsRG/nLwGsBy85GK0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <722FAF729FD8E9408EBB0EDB9D9E6CBB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f81523-a845-4605-060d-08d82fa136e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2020 07:14:32.9060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dky/P0TNl3Qtz3eFL+/Xbe7gWKLeTdVSdK1GdH3dre2ue/7QXt6iUYUSQJzhS6X2NUk4TpnyReBJ5mh+9IvAnIWgFY2nNzwUXddzas/AzdNfiietJ/SdEk7jn3qhRAoE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5699
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_01:2020-07-24,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007240053
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
Cc: Julien Grall <julien@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "nd@arm.com" <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiA3LzIzLzIwIDExOjQ0IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIFRo
dSwgMjMgSnVsIDIwMjAsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4gSGFyZHdhcmUgZG9tYWluIGlz
IGluIGNoYXJnZSBvZiBkb2luZyB0aGUgUENJIGVudW1lcmF0aW9uIGFuZCB3aWxsDQo+PiBkaXNj
b3ZlciB0aGUgUENJIGRldmljZXMgYW5kIHRoZW4gd2lsbCBjb21tdW5pY2F0ZSB0byBYRU4gdmlh
IGh5cGVyDQo+PiBjYWxsIFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZCB0byBhZGQgdGhlIFBDSSBk
ZXZpY2VzIGluIFhFTi4NCj4+DQo+PiBDaGFuZ2UtSWQ6IEllODdlMTk3NDE2ODk1MDNiNGI2MmRh
OTExYzhkYzJlZTMxODU4NGFjDQo+IFNhbWUgcXVlc3Rpb24gYWJvdXQgQ2hhbmdlLUlkDQo+DQo+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4+
IC0tLQ0KPj4gICB4ZW4vYXJjaC9hcm0vcGh5c2Rldi5jIHwgNDIgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
cGh5c2Rldi5jIGIveGVuL2FyY2gvYXJtL3BoeXNkZXYuYw0KPj4gaW5kZXggZTkxMzU1ZmUyMi4u
Mjc0NzIwZjk4YSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9waHlzZGV2LmMNCj4+ICsr
KyBiL3hlbi9hcmNoL2FybS9waHlzZGV2LmMNCj4+IEBAIC05LDEyICs5LDQ4IEBADQo+PiAgICNp
bmNsdWRlIDx4ZW4vZXJybm8uaD4NCj4+ICAgI2luY2x1ZGUgPHhlbi9zY2hlZC5oPg0KPj4gICAj
aW5jbHVkZSA8YXNtL2h5cGVyY2FsbC5oPg0KPj4gLQ0KPj4gKyNpbmNsdWRlIDx4ZW4vZ3Vlc3Rf
YWNjZXNzLmg+DQo+PiArI2luY2x1ZGUgPHhzbS94c20uaD4NCj4+ICAgDQo+PiAgIGludCBkb19w
aHlzZGV2X29wKGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQ0KPj4g
ICB7DQo+PiAtICAgIGdkcHJpbnRrKFhFTkxPR19ERUJVRywgIlBIWVNERVZPUCBjbWQ9JWQ6IG5v
dCBpbXBsZW1lbnRlZFxuIiwgY21kKTsNCj4+IC0gICAgcmV0dXJuIC1FTk9TWVM7DQo+PiArICAg
IGludCByZXQgPSAwOw0KPj4gKw0KPj4gKyAgICBzd2l0Y2ggKCBjbWQgKQ0KPj4gKyAgICB7DQo+
PiArI2lmZGVmIENPTkZJR19IQVNfUENJDQoNCkluIHRoZSBjb3ZlciBsZXR0ZXIgeW91IHdlcmUg
c2F5aW5nICJ3ZSBhcmUgbm90IGVuYWJsaW5nIHRoZSBIQVNfUENJIGFuZCBIQVNfVlBDSSBmbGFn
cyBmb3IgQVJNIi4NCg0KSXMgdGhpcyBzdGlsbCB2YWxpZD8NCg0KPj4gKyAgICAgICAgY2FzZSBQ
SFlTREVWT1BfcGNpX2RldmljZV9hZGQ6DQo+PiArICAgICAgICAgICAgew0KPj4gKyAgICAgICAg
ICAgICAgICBzdHJ1Y3QgcGh5c2Rldl9wY2lfZGV2aWNlX2FkZCBhZGQ7DQo+PiArICAgICAgICAg
ICAgICAgIHN0cnVjdCBwY2lfZGV2X2luZm8gcGRldl9pbmZvOw0KPj4gKyAgICAgICAgICAgICAg
ICBub2RlaWRfdCBub2RlID0gTlVNQV9OT19OT0RFOw0KPj4gKw0KPj4gKyAgICAgICAgICAgICAg
ICByZXQgPSAtRUZBVUxUOw0KPj4gKyAgICAgICAgICAgICAgICBpZiAoIGNvcHlfZnJvbV9ndWVz
dCgmYWRkLCBhcmcsIDEpICE9IDAgKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+
PiArDQo+PiArICAgICAgICAgICAgICAgIHBkZXZfaW5mby5pc19leHRmbiA9ICEhKGFkZC5mbGFn
cyAmIFhFTl9QQ0lfREVWX0VYVEZOKTsNCj4+ICsgICAgICAgICAgICAgICAgaWYgKCBhZGQuZmxh
Z3MgJiBYRU5fUENJX0RFVl9WSVJURk4gKQ0KPj4gKyAgICAgICAgICAgICAgICB7DQo+PiArICAg
ICAgICAgICAgICAgICAgICBwZGV2X2luZm8uaXNfdmlydGZuID0gMTsNCj4+ICsgICAgICAgICAg
ICAgICAgICAgIHBkZXZfaW5mby5waHlzZm4uYnVzID0gYWRkLnBoeXNmbi5idXM7DQo+PiArICAg
ICAgICAgICAgICAgICAgICBwZGV2X2luZm8ucGh5c2ZuLmRldmZuID0gYWRkLnBoeXNmbi5kZXZm
bjsNCj4+ICsgICAgICAgICAgICAgICAgfQ0KPj4gKyAgICAgICAgICAgICAgICBlbHNlDQo+PiAr
ICAgICAgICAgICAgICAgICAgICBwZGV2X2luZm8uaXNfdmlydGZuID0gMDsNCj4+ICsNCj4+ICsg
ICAgICAgICAgICAgICAgcmV0ID0gcGNpX2FkZF9kZXZpY2UoYWRkLnNlZywgYWRkLmJ1cywgYWRk
LmRldmZuLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnBkZXZfaW5mbywg
bm9kZSk7DQo+PiArDQo+PiArICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4gKyAgICAgICAgICAg
IH0NCj4+ICsjZW5kaWYNCj4+ICsgICAgICAgIGRlZmF1bHQ6DQo+PiArICAgICAgICAgICAgZ2Rw
cmludGsoWEVOTE9HX0RFQlVHLCAiUEhZU0RFVk9QIGNtZD0lZDogbm90IGltcGxlbWVudGVkXG4i
LCBjbWQpOw0KPj4gKyAgICAgICAgICAgIHJldCA9IC1FTk9TWVM7DQo+PiArICAgIH0NCj4gSSB0
aGluayB3ZSBzaG91bGQgbWFrZSB0aGUgaW1wbGVtZW50YXRpb24gY29tbW9uIGJldHdlZW4gYXJt
IGFuZCB4ODYgYnkNCj4gY3JlYXRpbmcgeGVuL2NvbW1vbi9waHlzZGV2LmM6ZG9fcGh5c2Rldl9v
cCBhcyBhIHNoYXJlZCBlbnRyeSBwb2ludCBmb3INCj4gUEhZU0RFVk9QIGh5cGVyY2FsbHMgaW1w
bGVtZW50YXRpb25zLiBTZWUgZm9yIGluc3RhbmNlOg0KPg0KPiB4ZW4vY29tbW9uL3N5c2N0bC5j
OmRvX3N5c2N0bA0KPg0KPiBhbmQNCj4NCj4geGVuL2FyY2gvYXJtL3N5c2N0bC5jOmFyY2hfZG9f
c3lzY3RsDQo+IHhlbi9hcmNoL3g4Ni9zeXNjdGwuYzphcmNoX2RvX3N5c2N0bA0KPg0KPg0KPiBK
YW4sIEFuZHJldywgUm9nZXIsIGFueSBvcGluaW9ucz8NCj4NCj4NCkkgdGhpbmsgd2UgY2FuIGFs
c28gaGF2ZSBhIGxvb2sgYXQgWzFdIGJ5IEp1bGllbi4gVGhhdCBpbXBsZW1lbnRhdGlvbiwNCg0K
SU1PLCBoYWQgc29tZSB0aG91Z2h0cyBvbiBtYWtpbmcgQXJtL3g4NiBjb2RlIGNvbW1vbiB3aGVy
ZSBwb3NzaWJsZQ0KDQoNClsxXSBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cGVv
cGxlL2p1bGllbmcveGVuLXVuc3RhYmxlLmdpdDthPXNob3J0bG9nO2g9cmVmcy9oZWFkcy9kZXYt
cGNpDQo=

